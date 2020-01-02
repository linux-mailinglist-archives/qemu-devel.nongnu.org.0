Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D092512E857
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jan 2020 16:54:14 +0100 (CET)
Received: from localhost ([::1]:42306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1in2nd-0004yQ-Uu
	for lists+qemu-devel@lfdr.de; Thu, 02 Jan 2020 10:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53883)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1in2mV-0004S5-7C
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 10:53:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1in2mT-0006VG-Ar
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 10:53:02 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:16130)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1in2mT-0006Dc-1a
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 10:53:01 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 04B127475F6;
 Thu,  2 Jan 2020 16:52:51 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C8393745953; Thu,  2 Jan 2020 16:52:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C66C77456F8;
 Thu,  2 Jan 2020 16:52:50 +0100 (CET)
Date: Thu, 2 Jan 2020 16:52:50 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 66/86] ppc:ppc440_bamboo/sam460ex: drop RAM size fixup
In-Reply-To: <20200102124749.03a0368d@redhat.com>
Message-ID: <alpine.BSF.2.21.99999.352.2001021642080.6073@zero.eik.bme.hu>
References: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
 <1577797450-88458-67-git-send-email-imammedo@redhat.com>
 <alpine.BSF.2.21.99999.352.2001011235410.5612@zero.eik.bme.hu>
 <20200102124749.03a0368d@redhat.com>
User-Agent: Alpine 2.21.99999 (BSF 352 2019-06-22)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Jan 2020, Igor Mammedov wrote:
> On Wed, 1 Jan 2020 12:54:37 +0100 (CET)
> BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> On Tue, 31 Dec 2019, Igor Mammedov wrote:
>>> If user provided non-sense RAM size, board will complain and
>>> continue running with max RAM size supported.
>>> Also RAM is going to be allocated by generic code, so it won't be
>>> possible for board to fix things up for user.
>>>
>>> Make it error message and exit to force user fix CLI,
>>> instead of accepting non-sense CLI values.
>>>
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>> ---
>>> include/hw/ppc/ppc4xx.h |  9 ++++-----
>>> hw/ppc/ppc440_bamboo.c  | 11 ++++-------
>>> hw/ppc/ppc4xx_devs.c    | 26 ++++++++++++++++----------
>>> hw/ppc/sam460ex.c       |  5 ++---
>>> 4 files changed, 26 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
>>> index 7d82259..1a28127 100644
>>> --- a/include/hw/ppc/ppc4xx.h
>>> +++ b/include/hw/ppc/ppc4xx.h
>>> @@ -42,11 +42,10 @@ enum {
>>> qemu_irq *ppcuic_init (CPUPPCState *env, qemu_irq *irqs,
>>>                        uint32_t dcr_base, int has_ssr, int has_vr);
>>>
>>> -ram_addr_t ppc4xx_sdram_adjust(ram_addr_t ram_size, int nr_banks,
>>> -                               MemoryRegion ram_memories[],
>>> -                               hwaddr ram_bases[],
>>> -                               hwaddr ram_sizes[],
>>> -                               const ram_addr_t sdram_bank_sizes[]);
>>> +void ppc4xx_sdram_adjust(ram_addr_t ram_size, int nr_banks,
>>> +                         MemoryRegion ram_memories[],
>>> +                         hwaddr ram_bases[], hwaddr ram_sizes[],
>>> +                         const ram_addr_t sdram_bank_sizes[]);
>>
>> With this change this function does not adjust ram size any more so it may
>> need to be renamed, e.g. ppc4xx_sdram_banks or something else.
>>
>> A better patch title may be
>>
>> ppc/{ppc440_bamboo,sam460x}: drop RAM size fixup
>>
>> (or without curly braces at your preference).
> I'll rename and use this subj as you suggest on v2.
>
>> This is inconvenient for the user because it worked whatever number
>> they've given but now they have to do the math. So it suggests that what
>> you're replacing this with may not support all the existing use cases. If
>> that can't be fixed to allow checking and changing ram size (maybe via a
>> callback in board code similar to above adjust function returning adjusted
>> size) it may be OK to drop this convenience for the sake of cleaning up
>> code elsewhere.
>
> There were few boards that did fix up and in all cases it was to cover up
> invalid CLI input.
> Creating callback for fixing user mistake doesn't seems to me justified,
> I'd much prefer to have a hard error and consistent behavior across all
> the boards versus being lax on error checking.
>
> [...]
>
>
>>> @@ -699,10 +698,19 @@ ram_addr_t ppc4xx_sdram_adjust(ram_addr_t ram_size, int nr_banks,
>>>         }
>>>     }
>>>
>>> -    ram_size -= size_left;
>>>     if (size_left) {
>>> -        error_report("Truncating memory to %" PRId64 " MiB to fit SDRAM"
>>> -                     " controller limits", ram_size / MiB);
>>> +        char *s = g_strdup("");
>>> +        for (i = 0; sdram_bank_sizes[i]; i++) {
>>> +            char *t = g_strdup_printf("%s%" PRIi64 "%s", s, sdram_bank_sizes[i],
>>> +                                      sdram_bank_sizes[i + 1] ? " ," : "");
>>> +            g_free(s);
>>> +            s = t;
>>> +        }
>>> +        error_report("Invalid RAM size, unable to fit all RAM into RAM banks"
>>> +                     " (unassigned RAM: %" PRIi64 ")",  size_left);
>>> +        error_report("Supported: %d banks and sizes/bank: %s", nr_banks, s);
>
> Do you have any suggestions how to make error message better?
> (maybe do calculation here and dump all valid -m variants instead of "#bank,size/bank")

Listing the valid values would certainly help users who don't know what 
the constraints of the SoC or SPD ROMs are (which I think most users don't 
have a clue about and we should not expect them to know). I've also seen 
similar concerns in another response for hppa machines so maybe having a 
callback to allow adjusting user input to board constraints is not a bad 
idea. It's not lax error checking but convenience for the average user 
where board has specific constraints and cannot handle any mem size.

Regards,
BALATON Zoltan

