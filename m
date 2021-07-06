Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1701A3BDEAD
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 23:01:52 +0200 (CEST)
Received: from localhost ([::1]:54528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0sCR-0002XJ-IN
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 17:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0sBa-0001sZ-JY
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 17:00:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0sBY-0003Ou-Le
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 17:00:54 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i8so484877wrp.12
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 14:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vYxsdmAyghYumPePVw5y4N4QenRkflWJMtfPuE+Kel8=;
 b=BA8II9+QI0yNYkAnpE64iSoNY2kNdih4U5z8wQvb2pQcjWOzQxNs93x93jQyMtm2vx
 5aFvJ3ddBNsjMfaXhrtNtL3FxpkI8ahp0Sc4q/ZTs9+ReDiotvjk2nsExppFUh0FBsRG
 lzJsLswsaxct5oaO0Bgg1qZNACeXDQ0scbPMqs2UVfaWDtUxzFFWRicPujszi0ivCm8y
 oA8i04qIM10+PQeaMqLeuzjRZkOmCn7mHyVFDfIybAcLN8OL9pPcNtHGlNITtV8IVzdZ
 CRmuFP8cXJNdKenKTacJ5dXCnowKFUmOJPntrhyxnVDfSwb2Gx8P0d1WFZOa7JUl1Soj
 be7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vYxsdmAyghYumPePVw5y4N4QenRkflWJMtfPuE+Kel8=;
 b=JvRq68Y7DH+9jnLYpk+UuT7dtkWY878IaYKTZlyRSq3/PMypCuYVZBaLH5hmSKOdkW
 hr40wU/aXDgWUyXjFXQ7evdY47rZidsTjiF7tmVnE8KPOnpNuby4IITzC9RV8he5W4GM
 4vCboS1EM86afa2hmCnhKXIUqwGEy6Hge2RzbZETvXDVOn+wuoyF2A+8MOpbBQ9kGOW+
 bqxI3o/1TFm8GAAdsmrnEB7RjcKsOaEA+2Q9mpRwpXAFt6tN1kV5h07GB47cFT+7JVdi
 kb/xygCgFFXMVpfn4a4Ria33PC9HJA3c6t/OaPYde/gMQj78yB1RJsmv2vskNoitvnve
 ijgA==
X-Gm-Message-State: AOAM530AufkZxWKdmvluyDnqJ8c5rLF8O8ZgMNOyqbrwCW6cvsJTRhyu
 U+I3Qlc7gxAXcQHo4iG19Xg=
X-Google-Smtp-Source: ABdhPJw5LydQpPJDX8sReFWrEs0zsgFrNZVRPcTEMeGwkgKAUnf+y48lwSzHWtjxChhtKX8DPwhCVg==
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr23954875wrv.209.1625605250639; 
 Tue, 06 Jul 2021 14:00:50 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t11sm18319840wrz.7.2021.07.06.14.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 14:00:50 -0700 (PDT)
Subject: Re: [PATCH 1/4] dp8393x: don't force 32-bit register access
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 jasowang@redhat.com, laurent@vivier.eu, fthain@linux-m68k.org
References: <20210705214929.17222-1-mark.cave-ayland@ilande.co.uk>
 <20210705214929.17222-2-mark.cave-ayland@ilande.co.uk>
 <c6b30e8a-59fa-b66a-97ad-4bb3421b542c@amsat.org>
 <456653aa-7f5d-7848-77e4-07c8ef5e15c2@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e67e4320-92af-cdeb-b23f-6c5f3b973011@amsat.org>
Date: Tue, 6 Jul 2021 23:00:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <456653aa-7f5d-7848-77e4-07c8ef5e15c2@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/21 9:22 PM, Mark Cave-Ayland wrote:
> On 06/07/2021 18:18, Philippe Mathieu-Daudé wrote:
>> On 7/5/21 11:49 PM, Mark Cave-Ayland wrote:
>>> Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" set
>>> .impl.min_access_size
>>> and .impl.max_access_size to 4 to try and fix the Linux jazzsonic
>>> driver which uses
>>> 32-bit accesses.
>>>
>>> The problem with forcing the register access to 32-bit in this way is
>>> that since the
>>> dp8393x uses 16-bit registers, a manual endian swap is required for
>>> devices on big
>>> endian machines with 32-bit accesses.
>>>
>>> For both access sizes and machine endians the QEMU memory API can do
>>> the right thing
>>> automatically: all that is needed is to set .impl.min_access_size to
>>> 2 to declare that
>>> the dp8393x implements 16-bit registers.
>>>
>>> Normally .impl.max_access_size should also be set to 2, however that
>>> doesn't quite
>>> work in this case since the register stride is specified using a
>>> (dynamic) it_shift
>>> property which is applied during the MMIO access itself. The effect
>>> of this is that
>>> for a 32-bit access the memory API performs 2 x 16-bit accesses, but
>>> the use of
>>> it_shift within the MMIO access itself causes the register value to
>>> be repeated in both
>>> the top 16-bits and bottom 16-bits. The Linux jazzsonic driver
>>> expects the stride to be
>>> zero-extended up to access size and therefore fails to correctly
>>> detect the dp8393x
>>> device due to the extra data in the top 16-bits.
>>>
>>> The solution here is to remove .impl.max_access_size so that the
>>> memory API will
>>> correctly zero-extend the 16-bit registers to the access size up to
>>> and including
>>> it_shift. Since it_shift is never greater than 2 than this will
>>> always do the right
>>> thing for both 16-bit and 32-bit accesses regardless of the machine
>>> endian, allowing
>>> the manual endian swap code to be removed.
>>
>> Removing .impl.max_access_size means now it has default, which is 4.
>> See access_with_adjusted_size:
>>
>> static MemTxResult access_with_adjusted_size(hwaddr addr,
>>                                        uint64_t *value,
>>                                        unsigned size,
>>                                        unsigned access_size_min,
>>                                        unsigned access_size_max,
>>      ...
>>      if (!access_size_min) {
>>          access_size_min = 1;
>>      }
>>      if (!access_size_max) {
>>          access_size_max = 4;
>>      }
>>
>> called as:
>>
>>      access_with_adjusted_size(addr, &data, size,
>>                                mr->ops->impl.min_access_size,
>>                                mr->ops->impl.max_access_size,
>>                                memory_region_write_with_attrs_accessor,
>>                                mr, attrs);
>>
>> So if you don't mind I'll keep .impl.max_access_size = 4 and update
>> the comment.
> 
> As per the comment, the removal of .impl.max_access_size was to imply
> that the ultimate limit is determined by a dynamic property more than
> the hard-coded limit i.e if you wanted to increase the stride you would
> increase it_shift first and then adjust the .impl.max_access_size to
> match accordingly.
> 
> At this point we're probably heading into personal preference territory,
> so if you are happy to merge this via mips-next then I'm happy for you
> to make the final decision :)

No, I'll take your patch. I missed the it_shift use, and I plan to kill
it next dev cycle because I'm tired by its misuses. Probably with a
new memory device similar to:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg795421.html

$ git grep -w it_shift | wc -l
50

Doable.

>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Fixes: 3fe9a838ec ("dp8393x: Always use 32-bit accesses")
>>> ---
>>>   hw/net/dp8393x.c | 14 +++++++++-----
>>>   1 file changed, 9 insertions(+), 5 deletions(-)

