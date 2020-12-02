Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9802CBAD4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:43:30 +0100 (CET)
Received: from localhost ([::1]:40262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPbd-0002D7-0K
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:43:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkOVH-0005wQ-9b
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:32:51 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkOVD-0005Uc-Rq
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:32:51 -0500
Received: by mail-wr1-x442.google.com with SMTP id l1so2746687wrb.9
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 01:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VbttTITo05QWYV0QaJa20qAqdVi7AP0AAEZ6KsV6mvA=;
 b=KATlQrrL9x9eLkppdzaRwmToOppmcTfh2utr/P4g7xGwizaeiwC4TVQ3Mgspqw9hku
 yxeipQsJRl+vESpgKZ1OWJ1SHRvkSlC22OwTygo1VTLlta4uoYCNWoRgQZqdVduK01te
 v38sW7LLRujxqiZBjxhUyBdPp/jJVZOop9cMmxpluh7aZ7KEOqFa+5zqh1PyGCUwdpBc
 hEpWJToJXVsB6XWVmedLcixlhvUAqdl+WK5Gr4fy/ehrEYNsdlM8NafLL7TDPiJ1p7KK
 UGq5Gnp3SrtKjdhedvlQjinScmxFnLkcRiJ8SVf9MVzWpIj5nXQ/DYcCXvPc0SBRp7ro
 56zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VbttTITo05QWYV0QaJa20qAqdVi7AP0AAEZ6KsV6mvA=;
 b=AeD13NPXOaQZxiBtvDEagLYzYUtdufDP6w2lnLPrj7KlqEuXt7paKfdmC/OnaJokLu
 xOdyjzzKHHQXZ7dyxBVf936ZqJZA3LF55TCL3aWipVQXCjy/aw/ky+1W4cdqzhJWYof0
 u95/EyBQf5IUgLxXJjLSMR0HU+U3CYXM7PhjgS/u21cTBdCjDwyJ87cIEQpGr00HZC6e
 5Al/BZk3XulGPlolI7wHKY6ElC+omO5Eo+ksJWgMXoO/0tlvFbO77BSme0lGgH375cTz
 Rt/ZL+2GO6s9X/GOX7VFFr/y4kbo6oDSm1O9OhnHyMymq6BzWuQL+Eeopqa625f3yXZz
 9DHQ==
X-Gm-Message-State: AOAM532Nx3HXAQegy8ydK8mYUInz0hpJCvEc+Du37NJW9J4XWIeDOsA2
 VsJPhGmz2diSVF29HDZ3lsqPmyYgGR4=
X-Google-Smtp-Source: ABdhPJyv3HBotNxiVByAI1J8rOtcbimwujRfjQESjTyw54VUfbIK+CjwWh779rA56IfQ+AJQCEoiKw==
X-Received: by 2002:adf:fd52:: with SMTP id h18mr2251795wrs.90.1606901566272; 
 Wed, 02 Dec 2020 01:32:46 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id a12sm1400200wrq.58.2020.12.02.01.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 01:32:45 -0800 (PST)
Subject: Re: [PATCH V17 4/6] hw/mips: Add Loongson-3 boot parameter helpers
To: Huacai Chen <chenhuacai@gmail.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <1604636510-8347-1-git-send-email-chenhc@lemote.com>
 <1604636510-8347-5-git-send-email-chenhc@lemote.com>
 <e85cc640-e5f4-bec1-2e3a-b5a57abe21c7@amsat.org>
 <CAAhV-H7ALVV=3Gj4iq4TVqL+czm3kK+F_uKvxGTJB-wonpGRHw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <215f01d5-3fad-1dc6-bb1b-e8face969e23@amsat.org>
Date: Wed, 2 Dec 2020 10:32:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7ALVV=3Gj4iq4TVqL+czm3kK+F_uKvxGTJB-wonpGRHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 2:14 AM, Huacai Chen wrote:
> Hi, Phillippe,
> 
> On Tue, Nov 24, 2020 at 6:25 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 11/6/20 5:21 AM, Huacai Chen wrote:
>>> Preparing to add Loongson-3 machine support, add Loongson-3's LEFI (a
>>> UEFI-like interface for BIOS-Kernel boot parameters) helpers first.
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
>>> Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> ---
>>>  hw/mips/loongson3_bootp.c | 165 +++++++++++++++++++++++++++++++
>>>  hw/mips/loongson3_bootp.h | 241 ++++++++++++++++++++++++++++++++++++++++++++++
>>>  hw/mips/meson.build       |   1 +
>>>  3 files changed, 407 insertions(+)
>>>  create mode 100644 hw/mips/loongson3_bootp.c
>>>  create mode 100644 hw/mips/loongson3_bootp.h
>>>
>>> diff --git a/hw/mips/loongson3_bootp.c b/hw/mips/loongson3_bootp.c
>>> new file mode 100644
>>> index 0000000..3a16081
>>> --- /dev/null
>>> +++ b/hw/mips/loongson3_bootp.c
>>> @@ -0,0 +1,165 @@
>>> +/*
>>> + * LEFI (a UEFI-like interface for BIOS-Kernel boot parameters) helpers
>>> + *
>>> + * Copyright (c) 2018-2020 Huacai Chen (chenhc@lemote.com)
>>> + * Copyright (c) 2018-2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> + *
>>> + * This program is free software: you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation, either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>>> + * GNU General Public License for more details.
>>> + *
>>> + * You should have received a copy of the GNU General Public License
>>> + * along with this program. If not, see <https://www.gnu.org/licenses/>.
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qemu/units.h"
>>> +#include "qemu/cutils.h"
>>> +#include "cpu.h"
>>> +#include "hw/boards.h"
>>> +#include "hw/mips/loongson3_bootp.h"
>>> +
>>> +#define LOONGSON3_CORE_PER_NODE 4
>>> +
>>> +static struct efi_cpuinfo_loongson *init_cpu_info(void *g_cpuinfo, uint64_t cpu_freq)
>>> +{
>>> +    struct efi_cpuinfo_loongson *c = g_cpuinfo;
>>> +
>>> +    stl_le_p(&c->cputype, Loongson_3A);
>>> +    stl_le_p(&c->processor_id, MIPS_CPU(first_cpu)->env.CP0_PRid);
>>
>> Build failing with Clang:
>>
>> FAILED: libqemu-mips64el-softmmu.fa.p/hw_mips_loongson3_bootp.c.o
>> hw/mips/loongson3_bootp.c:35:15: error: taking address of packed member
>> 'processor_id' of class or structure 'efi_cpuinfo_loongson' may result
>> in an unaligned pointer value [-Werror,-Waddress-of-packed-member]
>>     stl_le_p(&c->processor_id, MIPS_CPU(first_cpu)->env.CP0_PRid);
>>               ^~~~~~~~~~~~~~~
>> 1 error generated.
> We cannot reproduce it on X86/MIPS with clang...

You can reproduce running the Clang job on Gitlab-CI:

https://wiki.qemu.org/Testing/CI/GitLabCI

> And I found that
> stl_le_p() will be __builtin_memcpy(), I don't think memcpy() will
> cause unaligned access. So, any suggestions?

I'll defer this question to Richard/Peter who have deeper understanding.

> 
> Huacai

