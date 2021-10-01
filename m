Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D54541EC53
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 13:37:29 +0200 (CEST)
Received: from localhost ([::1]:40682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWGr2-00080R-4u
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 07:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWGpY-0006a5-UM
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 07:35:56 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:48686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWGpV-0000Cm-Ts
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 07:35:56 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6F5E6748F56;
 Fri,  1 Oct 2021 13:35:49 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4B30A746398; Fri,  1 Oct 2021 13:35:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4967B746399;
 Fri,  1 Oct 2021 13:35:49 +0200 (CEST)
Date: Fri, 1 Oct 2021 13:35:49 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: OHCI/usb pass through
In-Reply-To: <20211001043943.2cxyxjfgmr5duicl@sirius.home.kraxel.org>
Message-ID: <81cbbb94-c4dd-dde2-d98a-7487269169cf@eik.bme.hu>
References: <771189a-95c4-5144-ba7-478d28dfd5ef@eik.bme.hu>
 <20211001043943.2cxyxjfgmr5duicl@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Fri, 1 Oct 2021, Gerd Hoffmann wrote:
>> [...]
>>     /* Active packets.  */
>>     uint32_t old_ctl;
>>     USBPacket usb_packet;
>>     uint8_t usb_buf[8192];
>>     uint32_t async_td;
>>     bool async_complete;
>>
>>     void (*ohci_die)(struct OHCIState *ohci);
>> } OHCIState;
>>
>> Then everything in hcd-ohci seems to reuse ohci->usb_packet and I wonder if
>> it can happen that it's overwritten while an async packet is still using it.
>
> Plausible theory.  That also nicely explains why you need traffic on two
> endpoints at the same time to trigger it.

We've added an assert to check this and Howard could trigger it at least 
once (hope he'll answer with details) so I think that proves this but 
there may be other problems too as it does not work even when the assert 
is not triggered but maybe that's becuase not allowing traffic while an 
async packet is pending. It looks like it starts an interrupt transfer on 
an endpoint while sends iso data to another. I don't know usb audio 
protocol but maybe it's waiting for the iso transfer to finish which won't 
as those packets are now rejected due to too many waiting. Howard has some 
logs but I've only seen excerpts and did not reproduce it myself so I 
don't know exactly. In any case, fixing both of this possible breakage of 
ohci->usb_packet and emulating multiple pending packets correctly should 
improve the OHCI model and maybe get us further or at least prove we have 
more problems to look for.

>> In any case to both fix the device model and to avoid this possible problem
>> described above it seems we would need to ditch the packet and async_td
>> fields from OHCIState and move them to the endpoint to allow one active
>> packet per endpoint.
>
> Either that, or maintain a linked list of packets.

I'd like to avoid duplicating state and keep everyting attached to the 
endpoint so we don't need to keep track of it in ohci. We'd need a packet 
for each endpoint and also make async_td an array then so if instead we 
can get this info from the endpoint that we already have a pointer to, we 
could use that and remove both of these duplicate values from OHCIState so 
I'd try that as it looks less error prone.

>> We can get the endpoint from a packet and from ohci so
>> I wonder if we can get the active packet from ep->queue (and how to do that)
>
> I think ohci never looks beyond the active td so there should never be
> more than one packet on the list.

OK, how to get the packet from that QTAILQ list? If there are multiple 
packets is the active one first or last? How to get that? I could try to 
find the answers in the code but I realy did not want to spend much time 
with it just trying to help Howard so I'd like to ask for some help with 
this.

Regards,
BALATON Zoltan

