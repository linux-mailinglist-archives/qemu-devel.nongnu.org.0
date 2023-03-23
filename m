Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203776C6C05
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 16:15:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfMdH-0005IJ-91; Thu, 23 Mar 2023 11:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pfMdE-0005I3-Sj
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 11:13:36 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pfMdC-0004r6-S5
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 11:13:36 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-17683b570b8so22956073fac.13
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679584413;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gJ8bw3EyFwneqT58w0E1LrBibonFaHQPNW5baLOjgD8=;
 b=ghM+5hNyBJNf7pKuO6IJVnGd82sZiaob266Tt+MKvDwqH6TuLgfuk7hiLX6je7Lk5O
 lbGnbFMpKd8ZDkq19ycOZV/olBVS57+jrt62Mw0UEw5Dl9QCKfHrSfm453zpPJJoW0Am
 h2OkT/mv+rDEbdvgxzo6AXlYUjkUFaMGln7UOC3dXLvMLQeaiJtWwz9AfIjYV16zAeru
 2n9uRFPMlEOwkKC61LYVReM2zhyeaZOJUmkSsGcc/VJ8iObOzPgReqyxKxl3KuMcRT1V
 XZPJCF/LwwoKD6FTl79c1M7B2B6IQBsZM23IZ2+N4lhfjKfALnDYflEOpFnpLt95c8Rb
 IU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679584413;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gJ8bw3EyFwneqT58w0E1LrBibonFaHQPNW5baLOjgD8=;
 b=GcuGFp0fqtP1byK7yEaFTOS5llelRGQnGaIKRB8Lq/9raJeQt8IxHmyn8U0YNTQI61
 pLpWM+YhE34dF0veTA4GRATsqCauWNC5flX7xNKAANOM9uMOfVgbsasCAj4kcW/W4y+c
 rzS7GCaR5IyQnz+wWMxgcJvos5/Vkr0+AcdYfy07DSIoIjywREIyKzyNcD16Rzm0jtHF
 9TwfngC2hAGB2SfKSEPGloeE9tW/sMi4xQgl+My5N6UiGsRDzErC3tqeQ3t6ESh3UWB7
 AiW0++NVgJ+0zvkhgfVvn+aG32cI6EImFMWz9Kl2GOo7zrWmzHG8Voy6j2SByyVr6mxA
 YcPw==
X-Gm-Message-State: AAQBX9fCtfmEaAAnX+TMDo8ZPRQ3BsJE8eN25yDl/5gGvJVqRKWDOVJC
 Bzm4BM+NkLMCZJVHQ99JrCxSCg==
X-Google-Smtp-Source: AKy350aEjgrs7L2/+04QpHxBOMGAFmV0K0X1kHCDOOjqXfPEQuAhi4Va04uyMUQzlLT9vmYdmgpLbA==
X-Received: by 2002:a05:6870:390d:b0:177:845f:3877 with SMTP id
 b13-20020a056870390d00b00177845f3877mr2560260oap.11.1679584412839; 
 Thu, 23 Mar 2023 08:13:32 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a05687050c700b0016e8726f0d4sm6346186oaf.3.2023.03.23.08.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 08:13:32 -0700 (PDT)
Message-ID: <15d643ae-fad0-fb19-c9f2-bb586cbd3317@ventanamicro.com>
Date: Thu, 23 Mar 2023 12:13:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: QMP command dumpdtb crash bug
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <87jzz82d6o.fsf@pond.sub.org>
 <0f671d7f-5862-cf59-2ef2-be347c044a0b@ventanamicro.com>
 <87355vy4sq.fsf@pond.sub.org>
 <CAFEAcA8Yy2-z-J7yjjUxv4ZTg06fEsUt3HVkwNJWYiMBsqkWcA@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAFEAcA8Yy2-z-J7yjjUxv4ZTg06fEsUt3HVkwNJWYiMBsqkWcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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



On 3/23/23 10:38, Peter Maydell wrote:
> On Thu, 23 Mar 2023 at 13:29, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Peter, Daniel offers two ways to fix this bug (see below).  Got a
>> preference?
> 
> Not freeing seems the correct thing. As Daniel says, this
> should have been a prerequisite for implementing the
> command in the first place (you need to change the lifecycle
> of the fdt blob from "delete when done with in the arm boot code"
> to "delete on machine finalize"). It looks like somehow we added
> the command but missed out on getting all of the prerequisite
> patches in. (File under "need to be cautious about applying partial
> patchsets", I guess.)

Yeah, I'm at fault here. I should've been more insistent about acking
the ARM patch. All other patches that we left behind was optional, meaning
that the machine wouldn't implement the command but nothing bad would happen,
but the ARM patch was kind of mandatory because arm_load_dtb() is
freeing ms->fdt without assigning it to NULL.

> 
> Did anything else from that initial patchset get omitted?

Searching the ML I see that I sent a message saying that I pushed patches 1,
6 and 8-15 via ppc-next. This means that these patches got left behind:

  2  hw/core: free ms->fdt in machine_finalize()
  3  hw/arm: do not free machine->fdt in arm_load_dtb()
  4  hw/mips: set machine->fdt in boston_mach_init()
  5  hw/microblaze: set machine->fdt in microblaze_load_dtb()
  7  hw/ppc: set machine->fdt in ppce500_load_device_tree()
15  hw/xtensa: set machine->fdt in xtfpga_init()


Patch 2 was suggested by Phil and changes the common code to free ms->fdt
during machine_finalize(). Can be re-sent I guess.

All other patches, aside from patch 3 from ARM, are optional because the
machine isn't freeing ms->fdt or anything like that.


I'll rebase and re-sent patch 3 as a bug fix. I'll re-sent the hw/core patch
as well for 8.1.


Daniel


> 
> thanks
> -- PMM

