Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F536F2B7D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 01:13:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptGDS-0007U6-5u; Sun, 30 Apr 2023 19:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ptGDO-0007Tc-Lr
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 19:12:22 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ptGDL-0000Ws-Lc
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 19:12:22 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BC22E74635C;
 Mon,  1 May 2023 01:10:05 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 418AC74633D; Mon,  1 May 2023 01:10:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3EE62745706;
 Mon,  1 May 2023 01:10:05 +0200 (CEST)
Date: Mon, 1 May 2023 01:10:05 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Paolo Bonzini <pbonzini@redhat.com>
cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Rene Engel <ReneEngel80@emailn.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
In-Reply-To: <e0a958ec-fa18-0d13-48db-10feea159491@redhat.com>
Message-ID: <795e8b13-f314-aa1e-d908-ce95795cd168@eik.bme.hu>
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
 <a7992420-e2e3-7859-b2de-f9aa88c94945@redhat.com>
 <d03380e9-b6a2-5998-cc72-6443cfdc46b5@eik.bme.hu>
 <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
 <20220119041842-mutt-send-email-mst@kernel.org>
 <20220222094021-mutt-send-email-mst@kernel.org>
 <f9f183c4-b0b8-22c6-57f9-1b6b20e8e5a5@eik.bme.hu>
 <20230220172659-mutt-send-email-mst@kernel.org>
 <f4e755b6-051e-103f-b8bc-2765d277633f@eik.bme.hu>
 <e3a19d91-b9ef-9352-8f60-35432fdf5d1e@redhat.com>
 <c2bdd618-5077-3b3f-12d0-974cf9757692@eik.bme.hu>
 <04f178bb-2407-232f-e843-386bf04b3024@eik.bme.hu>
 <4714e0f2-ccfb-1e9a-149e-aceefef62a9d@redhat.com>
 <e101b894-c722-8def-f591-20fada45795c@redhat.com>
 <48cdc7ae-8e7c-6b6d-76d1-96228ac597c2@eik.bme.hu>
 <CABgObfZLuVgG8pPcF1o517z0wSZTk5SmV8Enn=PC8QmOEVou8w@mail.gmail.com>
 <c2b19806-db0f-54b8-ed41-2e74c19d029e@eik.bme.hu>
 <e0a958ec-fa18-0d13-48db-10feea159491@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello,

Finally could get to write some test script and have somebody with a real 
machine run that so I'm coming back to this with those results.

On Tue, 7 Mar 2023, Paolo Bonzini wrote:
> On 3/7/23 11:01, BALATON Zoltan wrote:
>>>> I'm not sure I follow what you mean so I'd need a patch to see then I can
>>>> test it with the clients I run on pegasos2.
>>> 
>>> Do you have a spec, or pointer to the morphos kernel sources, to figure 
>>> out how the hardware works?
>> 
>> No, that's closed source and only available as a demo iso but it's known to 
>> work on real hardware and freely downloadable so is a good test. (AFAIK 
>> those who developed MorphOS had close connection to those who wrote the 
>> firmware for Pegasos II.) Maybe the VT8231 datasheet or similar parts (we 
>> only emulate VT82C686B and VT8231 in QEMU) has some info on this.
>
> I agree it's a good test, but it's not clear what it means to do sub-word 
> writes to the register.

Looking at the VT8231 data sheet I think it means to set bits related to 
soft-off when it writes 0x28 to upper byte of the control reg. This seems 
pretty obvious.

> For example, in the dump I posted you have:
>
> evt 3 1 write 1      // enable timer
> evt 0 2 read
> evt 0 2 write 1      // just writes again the same value, clearing sts
>
> It's important to note that the comments are just my guess.
>
> Before even looking at the effect of the write, the trace tells us that your 
> patch is incomplete.  With both current QEMU and your patch it would do 
> nothing because addr is not 0 or 2; but since the firmware of your machine 
> does use addr == 3, you need to handle it.  In other words, before looking at 
> this trace, I was wary of accepting your patch because it made no sense to 
> me; but I couldn't exclude that I was missing something.  Now, instead, I am 
> certain it shouldn't be accepted.

Testing on real machine also confirms that the patch was wrong as it 
breaks access to regs even if it happens to fix the unaligned write. Since 
we don't emulate most of it anyway and guests probably don't use it other 
than for power control the breakage does not appeared though.

> I am quite confident that the second guess is correct, because "write the 
> same value that was read" only makes sense for evt_sts and not for evt_en.

You don't have to guess which reg is which, check the data sheet instead:

Power Management I/O-Space Registers
Basic Power Management Control and Status
I/O Offset 1-0 - Power Management Status ................. RWC
I/O Offset 3-2 - Power Management Enable .................. RW
I/O Offset 5-4 - Power Management Control .................RW
I/O Offset 0B-08 - Power Management Timer............... RW

> We learnt something: no matter what bus this device sits on, it does not flip 
> bit 1 of the address for subword writes.  As I mentioned yesterday, we also 
> observe that the load and store use lhbrx and sthbrx.  Assuming this is not a 
> harmless bug in the firmware, this means the device is indeed little endian.
>
> This means that the first write is almost certainly to evt_en.  On a 
> little-endian machine the write would set bit 8 of evt.en (power button), but 
> what about a big-endian machine like yours?  Should it set bit 0 or bit 8? 
> If it's bit 0 (which resides at offset 2 according to the device), who flips 
> the low bit of the address?  Why is bit 0 flipped but not bit 1?
>
> You simply cannot fix the emulation of this machine until you can answer the 
> above questions.  If there is no source and no spec, the two ways to do it 
> are:
>
> - get a real machine, and figure out whether the write to offset 3 
> corresponds to the PM timer or the power button.
>
> - continue the trace up to the point the OS runs, and see if you get some 
> clues similar to the one above that placed evt_sts at offset 2.

So I wrote a script to dump the PM registers of VT8231 with different 
access sizes and compare that to QEMU. The script and results are attached here:
https://osdn.net/projects/qmiga/ticket/47971

The results I think show that:
- VIA chip is little endian and mapped as such on pegasos2
- proposed patch is indeed wrong
- unaligned access is not handled correctly in acpi_pm_cnt_write() which 
now I think is the place where this should be fixed
- QEMU runs the PM timer in 32 bit while the corresponding bit is set to 
24 bit mode (VT8231 has a bit to set this in PCI config reg 0x41), not 
sure if this causes any problem and if QEMU has a 24 bit mode

What do you think?

Regards,
BALATON Zoltan

