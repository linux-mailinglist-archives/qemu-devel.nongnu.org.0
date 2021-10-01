Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA0E41E5D3
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 03:32:56 +0200 (CEST)
Received: from localhost ([::1]:59060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW7Py-0003wJ-Vu
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 21:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mW7OT-0002cr-HE
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 21:31:21 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:21300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mW7OQ-0007Tv-QP
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 21:31:20 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2ABB67462D3;
 Fri,  1 Oct 2021 03:31:12 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 036D9745953; Fri,  1 Oct 2021 03:31:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0054A7457EE;
 Fri,  1 Oct 2021 03:31:11 +0200 (CEST)
Date: Fri, 1 Oct 2021 03:31:11 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: OHCI/usb pass through
Message-ID: <771189a-95c4-5144-ba7-478d28dfd5ef@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

We're trying to find out why passing through an usb sound card fails with 
MacOS/OS X on mac99 and came across some things in OHCI that I don't 
understand so some help from those who know more about USB handling in 
QEMU or OHCI would be needed.

From traces Howard collected we see that a packet is submitted to libusb 
which does not complete immediately so it gets recorded as async but never 
seems to complete afterwards. Meanwhile some isochronous traffic is 
happening on a different endpoint but it is then rejected with too many 
pending packets due to the waiting async packet and things seem to stop at 
this point.

There is a comment in hw/usb/hcd-ohci.c:1031 in ohci_service_td() that 
says this is something that is not modelled correctly as it should allow 
active packets per endpoint while we only have one packet per controller 
(but maybe there are other problems than this too). The problem seems to 
be that currently we have this active packet recorded in OHCIState in 
these fields:

[...]
     /* Active packets.  */
     uint32_t old_ctl;
     USBPacket usb_packet;
     uint8_t usb_buf[8192];
     uint32_t async_td;
     bool async_complete;

     void (*ohci_die)(struct OHCIState *ohci);
} OHCIState;

Then everything in hcd-ohci seems to reuse ohci->usb_packet and I wonder 
if it can happen that it's overwritten while an async packet is still 
using it. It seems to be reset calling usb_packet_setup() in two places: 
ohci_service_td() and ohci_service_iso_td(). While ohci_service_td() 
checks for ohci->async_td, ohci_service_iso_td() doesn't seem to so maybe 
it can break the pending async packet if an isochronous request comes in 
while the other endpoint is waiting for the async packet. If so maybe when 
the completion is called it won't notice because ohci->usb_packet is 
already a different packet overwritten by ohci_service_iso_td(). Did I 
miss some other checks elsewhere that prevent this from happening? (I 
don't know how USB is handled in QEMU or how OHCI works so it could be I'm 
not understing this correctly.)

In any case to both fix the device model and to avoid this possible 
problem described above it seems we would need to ditch the packet and 
async_td fields from OHCIState and move them to the endpoint to allow one 
active packet per endpoint. We can get the endpoint from a packet and from 
ohci so I wonder if we can get the active packet from ep->queue (and how 
to do that) and then can we find out if it's waiting by checking if this 
packet's status is USB_PACKET_ASYNC so we don't need to keep track of 
these in OHCIState. I don't understand this code enough to try to do it 
but maybe some hints could help.

Thanks,
BALATON Zoltan

