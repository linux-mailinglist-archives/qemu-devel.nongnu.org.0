Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B774A5EE47A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 20:41:15 +0200 (CEST)
Received: from localhost ([::1]:58538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odbze-0004DN-IF
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 14:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odaNR-00076Y-ES
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:57:42 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odaNK-00039O-LC
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:57:40 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so2237181pjl.0
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 09:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Y12cOkq5R8jLp/uWtco0suDCBLICFaZHPewkEbXD1uM=;
 b=d/kt9TO5gdDZdhocMADgmyYovEBUkTB2vVgmI2spbYmSZA0d8O2HXVsXEYP/oKitAa
 oC4ZdngGNxPEwJVLJQtnDBUVv71ezfDzNKBy+7I/xaLSv9S226P5BLoSdGNRv/mFxNCI
 s0tXZ2GfV47Q0oyDq472y1bY0ICPSCrMuCcL1qDj6I3gdk2j4Og0KKdV+b3S/XsYzvmI
 aQDK5fQspZXXfPQxtbcXjXSyCRNu7clnicGNYxRoNeyn8f2uhRRj9yzDMkdnTd8e8sMa
 BlFZp6KyNKKIHEBELU0XCvSobyjtr03M1Us8NIHF5B3uI40MhtHGLSmjtC7zqZFMRRaT
 nClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Y12cOkq5R8jLp/uWtco0suDCBLICFaZHPewkEbXD1uM=;
 b=q0xirRyfzWx//8c9VCFI/Mcp/eKm3m6wfNEqk7nioinXe0mheKDz7ZcVnigGOmmN/Y
 mif6zFHzPHllj3ws1Bznw2lPgEJMtBvUwNkFQv1hNC+3SCPb8k9PWQRW74Hca6WALmTY
 rmWALSlxutyMl5djnyzn+NDs6aslO4wtHOcZ8etGvViOad3WZdaB05UG8UiapBYjXWD9
 lty1/+HFZT9VmiU7FGtbinGCRuTd2XTw6k7HGzUpK2hJ83/Dnth2YQQB0mYbZlSjhJsX
 oWVC27FBwiGGkZjaPuJBRDJtKLOmjxbGTLrI+OVff1pD7DgvdWzjl6nCH6zlNCSoH+dg
 Mhkw==
X-Gm-Message-State: ACrzQf3dUlyr+gg8TwJtRg44ZAIB8wqlF3For3cQUSzZrRaGFO46O/QM
 fScPv34qiAAovUAq6IdNjZTCVA==
X-Google-Smtp-Source: AMsMyM4o+zkfsuHDi/QxpXLgCULwe1qF4HZ3cAujckadSyK/O4lwKZtNiBh8eoB+1gal+k1Hf37yag==
X-Received: by 2002:a17:903:234c:b0:178:1a7c:28a5 with SMTP id
 c12-20020a170903234c00b001781a7c28a5mr745084plh.32.1664384253215; 
 Wed, 28 Sep 2022 09:57:33 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a17090341c600b00174fa8cbf31sm3963859ple.303.2022.09.28.09.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 09:57:32 -0700 (PDT)
Message-ID: <2cee7eb4-3b5b-d8a9-3cf6-a53e739e4705@linaro.org>
Date: Wed, 28 Sep 2022 09:57:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 06/15] target/arm: ensure m-profile helpers set
 appropriate MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 9/27/22 07:14, Alex Bennée wrote:
> There are a number of helpers for M-profile that deal with CPU
> initiated access to the vector and stack areas. While it is unlikely
> these coincided with memory mapped IO devices it is not inconceivable.
> Embedded targets tend to attract all sorts of interesting code and for
> completeness we should tag the transaction appropriately.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/m_helper.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
> index 5ee4ee15b3..d244e9c1c5 100644
> --- a/target/arm/m_helper.c
> +++ b/target/arm/m_helper.c
> @@ -184,7 +184,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
>       CPUState *cs = CPU(cpu);
>       CPUARMState *env = &cpu->env;
>       MemTxResult txres;
> -    GetPhysAddrResult res = {};
> +    GetPhysAddrResult res = { .attrs = MEMTXATTRS_CPU(cs) };
>       ARMMMUFaultInfo fi = {};
>       bool secure = mmu_idx & ARM_MMU_IDX_M_S;
>       int exc;

Surely this is redundant with the initialization by get_phys_page()?


r~

