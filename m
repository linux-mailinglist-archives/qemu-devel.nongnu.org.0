Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2475541F6DB
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 23:24:00 +0200 (CEST)
Received: from localhost ([::1]:44566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWQ0d-0002kX-8J
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 17:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWPto-0001iX-LU
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 17:16:57 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:46258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWPtd-0007v7-Rc
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 17:16:52 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9F119748F5C;
 Fri,  1 Oct 2021 23:16:42 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7E2B9746398; Fri,  1 Oct 2021 23:16:42 +0200 (CEST)
Message-Id: <cover.1633122670.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [RFC PATCH 0/4] Misc OHCI patches
Date: Fri, 01 Oct 2021 23:11:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This is a first attempt to make some progress with the problems found
with OHCI especially when trying to pass through a usb sound card on
mac99. This does not go all the way to allow multiple async packets on
different endpoints yet but as a first step just try to fix the
interaction and potential breakage of pending async packet by
isochronous transfers. Plus some small clean ups I've found while
trying to make sense of this device model.

Posted as RFC because it's unfinfished and untested as there seems to
be some regression with mac99 so it does not boot for me for some
reason I haven't debugged yet. Hope Howard can test it and see if it
changes any of the traces seen before.

BALATON Zoltan (4):
  usb/ohci: Move cancelling async packet to ohci_stop_endpoints()
  usb/ohci: Move USBPortOps related functions together
  usb/ohci: Merge ohci_async_cancel_device() into ohci_child_detach()
  usb/ohci: Don't use packet from OHCIState for isochronous transfers

 hw/usb/hcd-ohci.c | 281 ++++++++++++++++++++++------------------------
 1 file changed, 136 insertions(+), 145 deletions(-)

-- 
2.21.4


