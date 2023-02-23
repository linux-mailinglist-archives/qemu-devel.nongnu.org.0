Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2176A11D8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:20:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJ06-0001QE-GL; Thu, 23 Feb 2023 16:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJ04-0001Py-3d
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:19:36 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJ02-0008Ak-4j
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:19:35 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso411663wmp.4
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 13:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tjSoRdgLS7gWCmY4bwgHo3rZmCnGYsFzhr9fWs8f/x8=;
 b=nblLqYDtWIDflt9n8AxV+OCVw8rQ+3hwn7NhRG0+Bs1dIO24P2emNr4UcxzgINI9Ip
 +xLs1v2e8SurdELcZLDJk8iuCZQj6RvBSK+GmZfxaW+qr1qfPlbGtVZuAJFqXYRC7Ubq
 +OQOGLY2fYSvfxCqxIXE32DMOHgc2BIJ35MhMB9XG6kAVAuZZqLfpHSUM9u8tVwO/nzA
 G2keJS1MrZD1Fsrc5wrgwIliG5DnBOAijlgM/TQjHN/4DiKvQQ92aScGK1k6Td8Tl2Ia
 375uW0cYHizcysA1Q/UkeZ/PvcdCaAI5Shjk4JeGhci+EGwBOMaMK863WPMDskXy1bZ6
 t5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tjSoRdgLS7gWCmY4bwgHo3rZmCnGYsFzhr9fWs8f/x8=;
 b=iSWmg4mAen3szfpHMNmIQMCGbtRVwT3tmJp/wS2OC5NheVeISLSuUZp0SCjOLGz4tH
 QDkwmQiMgM/kGv56IlocWQkxYEmuUXwk+nwOIslz8BZAGTt8zJp9Wm+qb4D7J2A2aJRT
 wDHGWWx+uBj5otDq3w5v+XTsUVPdo7/+Kn6y36mUNDpSQ4xN8lEGcBHG3Gvaenre6t2k
 YVgRBLPh/iylJvIeYhd69Mr62Pvtsy4UPMDWt/Ru76Q0nEFjcGw2T7sNnH2sy3YZKf7S
 NfMti8rYB9b6VomH3y8mleQQf9kS/++a1ImUKfuOXW2jLJ4fgIp8sU2626soNnhaMitu
 Jg1g==
X-Gm-Message-State: AO0yUKU3syBzL+VS77SZ7xkYlKPO6v4ViTnmo+ThIvF9bM2bGk8tAwQ4
 RrEvOzvNIJ9PYCYRSDm6L1LVRA==
X-Google-Smtp-Source: AK7set/MY/Vitzq6/2+UqR4Cmus0Qgf8ojOKxrl4Bzq0g6WZ36YXIIacKefu5l45ssVgNVElg3l1sQ==
X-Received: by 2002:a05:600c:30d3:b0:3d5:365b:773e with SMTP id
 h19-20020a05600c30d300b003d5365b773emr5124869wmn.39.1677187172348; 
 Thu, 23 Feb 2023 13:19:32 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c1d0400b003db0ad636d1sm568326wms.28.2023.02.23.13.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 13:19:31 -0800 (PST)
Message-ID: <c6cb2c08-65c1-5cde-f67e-9e073e01e222@linaro.org>
Date: Thu, 23 Feb 2023 22:19:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/5] dump: Include missing "cpu.h" header for
 tswap32/tswap64() declarations
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Steffen Eiden <seiden@linux.ibm.com>
References: <20221216215519.5522-1-philmd@linaro.org>
 <20221216215519.5522-2-philmd@linaro.org>
 <039803d2-24aa-e22f-a154-7ca07e781852@linaro.org>
 <1562d9eb-abfd-ed25-e169-404a619df47c@linaro.org>
 <4727f0a2-680b-cff4-16ad-f7904f1cd086@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <4727f0a2-680b-cff4-16ad-f7904f1cd086@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 23/2/23 19:01, Richard Henderson wrote:
> On 2/23/23 00:09, Philippe Mathieu-Daudé wrote:
>>>> +#include "cpu.h"
>>>
>>> Does it work to include "exec/cpu-all.h" instead?
>>
>> We get:
>>
>> include/exec/cpu-all.h:110:5: warning: 'TARGET_LONG_SIZE' is not 
>> defined, evaluates to 0 [-Wundef]
>> #if TARGET_LONG_SIZE == 4
>>      ^
>>
>> TARGET_LONG_SIZE is defined in "exec/cpu-defs.h" which is
>> target specific. If I add "exec/cpu-defs.h" to "exec/cpu-all.h"
>> I get:
>>
>> In file included from ../../dump/dump.c:18:
>> include/exec/cpu-all.h:439:8: error: incomplete definition of type 
>> 'struct ArchCPU'
>>      cpu->parent_obj.env_ptr = &cpu->env;
>>      ~~~^
>>
>> Is it worth extracting the few tswapX() declarations to "exec/tswap.h"?
> 
> That's probably worthwhile, using cpu-param.h directly, perhaps, rather 
> than pulling in the rest of cpu stuff?

TARGET_BIG_ENDIAN is only defined for target-specific objects, so this
as is it will never work (dump.o must be compiled for each target).

For heterogeneous emulation we need to pass a CPU[Arch]State* to
get the endianness of the CPU. As of today the endianness isn't
runtime, so this field doesn't exist in the common CPUState (some
arch might have some equivalent field).


This file uses tswap() 4 times in the same function: get_note_sizes(),
so I could extract it to a dump-target.c unit.
I have no clue what that file is for, but this particularity is odd.

Looking further, we have in "hw/core/cpu.h":

   int (SysemuCPUOps::write_elf32/64_note)(WriteCoreDumpFunction, ...

but no ReadCoreDumpFunction equivalent.

