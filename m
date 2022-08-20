Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFFC59AABA
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 04:39:02 +0200 (CEST)
Received: from localhost ([::1]:54606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPEO4-0000OW-L5
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 22:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPEMJ-0006Jh-04
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 22:37:11 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPEMG-0007ki-Dd
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 22:37:10 -0400
Received: by mail-pl1-x635.google.com with SMTP id c2so5534154plo.3
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 19:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=34xPuFrlEP+JXa7JZN4iRJAnoS1o2sXCYjTzW4qOFPw=;
 b=zs2x6qMDerZFafuhf0dh63vzcYNan0wGW11PD4SHeNYJm55+sQn/hgAU/Tmw052uMG
 n75WQX5KkLF4bj/wRcltmhup0FTj1g0ZYes+dxlFdRbMbSqgv96CMZzGspNx/gEe1YO4
 I1kLW0U7yWv8AQ39TCTiwYZZhHg4AHxgEUcmIrmK5dWUc5hXIDhUjVYAeMNRU4UTI87J
 36GrWYQj/von/lXYkuAvJFBdOebjPG+RrVuMczSyb+7BoaSU4Umb2zUqrm8B357tt7F1
 koqAK66hudf1mSd/7vrOdohO83JPGY5F8AfpM7gvGs6a2sbnR4rx5aT4WKeGy9FX6PcA
 vxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=34xPuFrlEP+JXa7JZN4iRJAnoS1o2sXCYjTzW4qOFPw=;
 b=NHYcRWRqzpUDf9cJmVQwhx/gyDR/DTBPVccX0BRRS67JoCCKfRNpDGFRM1tVe2ztzm
 sGE/8Ou2TIadKo/hbijzcYeCgCw+JjgYgCLue89ieWu8x8rGbwn60ZopZvSe3s32uInP
 nSTfKH/suAm2xWQwY+JOq1dJn87HQ6SZeMMo+SRwZtUZD0brCOqJWgp5r9mNDuMPgrHo
 0Pf1LdOGMFbjBPIIXTpEf4f+uXEbE/0A6f34IW7p5FVX6ugZCnWHRm96CzHIltPqQoR4
 B3M4XBKuKCeoBYSxxMSWcDFOXrZpSRFXAGj0YZXeXfpO79FgJJ4SOk0P40Hd3rZVipYK
 xa3A==
X-Gm-Message-State: ACgBeo0dzInN1QA14bL/cOn8+rD5pV1Kvf0QXa/aUQ0RuAwnV1k3pO7i
 rUPl1ZMf6esQht671gRoqD5n7w==
X-Google-Smtp-Source: AA6agR52R5A8uMPmYFtfWL9SyR8hJKCC9/dB/887NXd02xd/J4xyK9rsz8MXEPIyr9bQkm7iKR5qfg==
X-Received: by 2002:a17:902:ef45:b0:170:8b19:4e0f with SMTP id
 e5-20020a170902ef4500b001708b194e0fmr10426904plx.120.1660963026615; 
 Fri, 19 Aug 2022 19:37:06 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:f37:9eb9:ca02:d0cb?
 ([2602:47:d49d:ec01:f37:9eb9:ca02:d0cb])
 by smtp.gmail.com with ESMTPSA id
 e126-20020a621e84000000b00535d094d6ecsm3902435pfe.108.2022.08.19.19.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 19:37:05 -0700 (PDT)
Message-ID: <669d1687-3ffa-0616-a623-239f479ba717@linaro.org>
Date: Fri, 19 Aug 2022 19:37:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] target/arm: Make cpregs 0, c0, c{3-15}, {0-7}
 correctly RAZ in v8
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
 <20220819110052.2942289-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819110052.2942289-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/22 04:00, Peter Maydell wrote:
> In the AArch32 ID register scheme, coprocessor registers with
> encoding cp15, 0, c0, c{0-7}, {0-7} are all in the space covered by
> what in v6 and v7 was called the "CPUID scheme", and are supposed to
> RAZ if they're not allocated to a specific ID register.  For our
> pre-v8 CPUs we get this right, because the regdefs in
> id_pre_v8_midr_cp_reginfo[] cover these RAZ requirements.  However
> for v8 we failed to put in the necessary patterns to cover this, so
> we end up UNDEFing on everything we didn't have an ID register for.
> This is a problem because in Armv8 some encodings in 0, c0, c3, {0-7}
> are now being used for new ID registers, and guests might thus start
> trying to read them.  (We already have one of these: ID_PFR2.)
> 
> For v8 CPUs, we already have regdefs for 0, c0, c{0-2}, {0-7} (that
> is, the space is completely allocated with no reserved spaces).  Add
> entries to v8_idregs[] covering 0, c0, c3, {0-7}:
>   * c3, {0-2} is the reserved AArch32 space corresponding to the
>     AArch64 MVFR[012]_EL1
>   * c3, {3,5,6,7} are reserved RAZ for both AArch32 and AArch64
>     (in fact some of these are given defined meanings in Armv8.6,
>     but we don't implement them yet)
>   * c3, 4 is ID_PFR2 (already defined)
> 
> We then programmatically add RAZ patterns for AArch32 for
> 0, c0, c{4..15}, {0-7}:
>   * c4-c7 are unused, and not shared with AArch64 (these
>     are the encodings corresponding to where the AArch64
>     specific ID registers live in the system register space)
>   * c8-c15 weren't required to RAZ in v6/v7, but v8 extends
>     the AArch32 reserved-should-RAZ space to cover these;
>     the equivalent area of the AArch64 sysreg space is not
>     defined as must-RAZ
> 
> Note that the architecture allows some registers in this space
> to return an UNKNOWN value; we always return 0.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 65 +++++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 60 insertions(+), 5 deletions(-)

This is the thing at the top of H.a page G7-8990, yeah?

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

