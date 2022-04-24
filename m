Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAC350D26E
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 16:52:27 +0200 (CEST)
Received: from localhost ([::1]:33408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nidb8-0005cQ-Hu
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 10:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nidZu-0004R3-S6; Sun, 24 Apr 2022 10:51:10 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:36006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nidZi-0007py-Io; Sun, 24 Apr 2022 10:51:00 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nidYf-000Aec-JV; Sun, 24 Apr 2022 15:49:53 +0100
Message-ID: <3ce8410f-e908-f2e3-78e9-d858970ad190@ilande.co.uk>
Date: Sun, 24 Apr 2022 15:50:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220421065155.31276-1-mark.cave-ayland@ilande.co.uk>
 <20220421065155.31276-4-mark.cave-ayland@ilande.co.uk>
 <20220421132746.GA1500162@fam-dell>
 <e6d29d64-fe3b-8d4b-3985-146c11bfd537@ilande.co.uk>
 <1f26c28f-dd80-cadb-d308-56c9a91bea2f@linaro.org>
 <d98967a-4521-591f-f7b-d6c12eed353a@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <d98967a-4521-591f-f7b-d6c12eed353a@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 3/6] scsi-disk: add MODE_PAGE_APPLE quirk for Macintosh
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, pbonzini@redhat.com, laurent@vivier.eu,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/04/2022 23:00, BALATON Zoltan wrote:

> On Thu, 21 Apr 2022, Richard Henderson wrote:
>> On 4/21/22 08:29, Mark Cave-Ayland wrote:
>>>> You need (1 << SCSI_DISK_QUIRK_MODE_PAGE_APPLE) instead.
>>>
>>> Doh, you're absolutely right. I believe the current recommendation is to use the 
>>> BIT() macro in these cases.
> 
> I think it's not a recommendation (as in code style) but it often makes things 
> simpler by reducing the number of parenthesis so using it is probably a good idea for 
> readability. But if you never need the bit number only the value then you could 
> define the quirks constants as that in the first place. (Otherwise if you want bit 
> numbers maybe make it an enum.)
> 
>> We probably need to fix BIT() to use 1ULL.
>>
>> At present it's using 1UL, to match the other (unfortunate) uses of unsigned long 
>> within bitops.h.  The use of BIT() for things unrelated to bitops.h just bit a 
>> recent risc-v pull request, in that it failed to build on all 32-bit hosts.
> 
> There's already a BIT_ULL(nr) when ULL is needed but in this case quirks was declared 
> uint32_t so probably OK with UL as well. (Was this bitops.h taken from Linux? Keeping 
> it compatible then may be a good idea to avoid confusion.)

It seems there is still a bit of discussion around using BIT() here, so for v2 I'll 
add the shift directly with (1 << x). Then if the BIT() macro becomes suitable for 
more general use it can easily be updated as a separate patch later.


ATB,

Mark.

