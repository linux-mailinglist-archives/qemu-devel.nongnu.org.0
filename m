Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD802D74B9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 12:35:35 +0100 (CET)
Received: from localhost ([::1]:52980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knghy-0006iD-Ir
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 06:35:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kngei-00052K-OR
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 06:32:12 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:40593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kngeg-0006aj-Qs
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 06:32:12 -0500
Received: by mail-ed1-x541.google.com with SMTP id h16so8979967edt.7
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 03:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qtlDBXZozdDzlj7thgBSAXPUA0+sOcgdC7iCLa3VOkM=;
 b=i6JZsAh+2Mp+DLXv2539yyUHpU+6X2ephw2fGZlb1yc6BBlpRic3kFAiLH5ZCP2Tuf
 HrUfiQX6PX4cdRKTnD45exR+YyP/11ABGIkclo6iyfKGLC6ld12lam2FjHrFFbHSoXBJ
 SQI2WEjwoWz8Iqjb7ECj20RVIFQuPHG3TCMGhv+DB3QOO4XrHJetkK4ZZVJUJxBVX/5s
 tMrxWMnkHtUBgUe8pKKtqzp+wjV3XwcAJq78rKxAL2/gVjdm6KOBz/9dAAVhfunYCwO9
 O6I1MhTU7hyQzs2U+s8Etjd9KbRdR7pkzU6Fi0qCqKpsNXWGCFtPP5m/MCa/pGFVGeFS
 V7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qtlDBXZozdDzlj7thgBSAXPUA0+sOcgdC7iCLa3VOkM=;
 b=GbE5PWMiyKEfCWCPge3roKspPS9IBxXULRhHzkxc93XXeUSu9uKCb9jom+k/7ORr4Z
 JOeEwJjKN1YAXMvo2DFs00G5MSw7XaIc7htoTAShVoo96CthlsU05Ez0HxNIc9SYmJa1
 oTilxvoXQ+FyTBeW6cHnlBQUTFQAgTiaUT35tSQkGUlICWK09GN4um1JVnfbxvTWXXG7
 x9y0VHuC3JlvSnhEnNvEBIuaU9CoWg2OOY9Tb4uf/STrSYJT9JP1eilPHUiQCbMtiT3K
 lwvmMqBq41o5UxVi3PGgauJP0JZLejtcDqwhAwZcuHZHiQwdeJaHw6Vf/ttnDTD8ELNh
 txBg==
X-Gm-Message-State: AOAM531IVZwdxJFM+/iB6UwxSqJvkXh0pejuHlBgREYJ/6V8uqt7wWbq
 +7UfDr9V38EVMkzSU9qrUTg=
X-Google-Smtp-Source: ABdhPJz6xX7FJKVJn6hnYqzJHPsZB3dWmCCbEpnG2edIUbV+eiTCASM/2rB1S64tkdDv6sI1/lk3OA==
X-Received: by 2002:a50:b761:: with SMTP id g88mr11525740ede.387.1607686329264; 
 Fri, 11 Dec 2020 03:32:09 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n20sm6554326ejo.83.2020.12.11.03.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 03:32:08 -0800 (PST)
Subject: Re: [PATCH V17 4/6] hw/mips: Add Loongson-3 boot parameter helpers
To: Huacai Chen <chenhuacai@gmail.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <1604636510-8347-1-git-send-email-chenhc@lemote.com>
 <1604636510-8347-5-git-send-email-chenhc@lemote.com>
 <e85cc640-e5f4-bec1-2e3a-b5a57abe21c7@amsat.org>
 <CAAhV-H7ALVV=3Gj4iq4TVqL+czm3kK+F_uKvxGTJB-wonpGRHw@mail.gmail.com>
 <215f01d5-3fad-1dc6-bb1b-e8face969e23@amsat.org>
 <CAAhV-H6d1gDGKha=D+TNg-vwTL_5+9ON+x9GCE0QsrQktby01A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1e7b7abd-cd4a-8f2a-2957-acd90884e0fd@amsat.org>
Date: Fri, 11 Dec 2020 12:32:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6d1gDGKha=D+TNg-vwTL_5+9ON+x9GCE0QsrQktby01A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x541.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <zltjiangshi@gmail.com>, David Hildenbrand <david@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 3:46 AM, Huacai Chen wrote:
> Hi, Rechard and Peter,
> 
> On Wed, Dec 2, 2020 at 5:32 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 12/2/20 2:14 AM, Huacai Chen wrote:
>>> Hi, Phillippe,
>>>
>>> On Tue, Nov 24, 2020 at 6:25 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>
>>>> On 11/6/20 5:21 AM, Huacai Chen wrote:
>>>>> Preparing to add Loongson-3 machine support, add Loongson-3's LEFI (a
>>>>> UEFI-like interface for BIOS-Kernel boot parameters) helpers first.
>>>>>
>>>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
>>>>> Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>> ---
>>>>>  hw/mips/loongson3_bootp.c | 165 +++++++++++++++++++++++++++++++
>>>>>  hw/mips/loongson3_bootp.h | 241 ++++++++++++++++++++++++++++++++++++++++++++++
>>>>>  hw/mips/meson.build       |   1 +
>>>>>  3 files changed, 407 insertions(+)
>>>>>  create mode 100644 hw/mips/loongson3_bootp.c
>>>>>  create mode 100644 hw/mips/loongson3_bootp.h
>>>>>
>>>>> diff --git a/hw/mips/loongson3_bootp.c b/hw/mips/loongson3_bootp.c
>>>>> new file mode 100644
>>>>> index 0000000..3a16081
>>>>> --- /dev/null
>>>>> +++ b/hw/mips/loongson3_bootp.c
>>>>> @@ -0,0 +1,165 @@
>>>>> +/*
>>>>> + * LEFI (a UEFI-like interface for BIOS-Kernel boot parameters) helpers
>>>>> + *
>>>>> + * Copyright (c) 2018-2020 Huacai Chen (chenhc@lemote.com)
>>>>> + * Copyright (c) 2018-2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>> + *
>>>>> + * This program is free software: you can redistribute it and/or modify
>>>>> + * it under the terms of the GNU General Public License as published by
>>>>> + * the Free Software Foundation, either version 2 of the License, or
>>>>> + * (at your option) any later version.
>>>>> + *
>>>>> + * This program is distributed in the hope that it will be useful,
>>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>>>>> + * GNU General Public License for more details.
>>>>> + *
>>>>> + * You should have received a copy of the GNU General Public License
>>>>> + * along with this program. If not, see <https://www.gnu.org/licenses/>.
>>>>> + */
>>>>> +
>>>>> +#include "qemu/osdep.h"
>>>>> +#include "qemu/units.h"
>>>>> +#include "qemu/cutils.h"
>>>>> +#include "cpu.h"
>>>>> +#include "hw/boards.h"
>>>>> +#include "hw/mips/loongson3_bootp.h"
>>>>> +
>>>>> +#define LOONGSON3_CORE_PER_NODE 4
>>>>> +
>>>>> +static struct efi_cpuinfo_loongson *init_cpu_info(void *g_cpuinfo, uint64_t cpu_freq)
>>>>> +{
>>>>> +    struct efi_cpuinfo_loongson *c = g_cpuinfo;
>>>>> +
>>>>> +    stl_le_p(&c->cputype, Loongson_3A);
>>>>> +    stl_le_p(&c->processor_id, MIPS_CPU(first_cpu)->env.CP0_PRid);
>>>>
>>>> Build failing with Clang:
>>>>
>>>> FAILED: libqemu-mips64el-softmmu.fa.p/hw_mips_loongson3_bootp.c.o
>>>> hw/mips/loongson3_bootp.c:35:15: error: taking address of packed member
>>>> 'processor_id' of class or structure 'efi_cpuinfo_loongson' may result
>>>> in an unaligned pointer value [-Werror,-Waddress-of-packed-member]
>>>>     stl_le_p(&c->processor_id, MIPS_CPU(first_cpu)->env.CP0_PRid);
>>>>               ^~~~~~~~~~~~~~~
>>>> 1 error generated.
>>> We cannot reproduce it on X86/MIPS with clang...
>>
>> You can reproduce running the Clang job on Gitlab-CI:
>>
>> https://wiki.qemu.org/Testing/CI/GitLabCI
>>
>>> And I found that
>>> stl_le_p() will be __builtin_memcpy(), I don't think memcpy() will
>>> cause unaligned access. So, any suggestions?

My understanding is the compiler is complaining for the argument
passed to the caller, with no knowledge of the callee implementation.

Which makes me wonder if these functions are really inlined...

Do we need to use QEMU_ALWAYS_INLINE for these LDST helpers?

I see Richard used it in commit 80d9d1c6785 ("cputlb: Split out
load/store_memop").

>>
>> I'll defer this question to Richard/Peter who have deeper understanding.
> Any sugguestions? Other patches are updated, except this one.

Searching on the list, I see Marc-André resolved that by
using a copy on the stack:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg614482.html

> 
> Huacai
>>
>>>
>>> Huacai
> 

