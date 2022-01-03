Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A5848389B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 22:42:17 +0100 (CET)
Received: from localhost ([::1]:54256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4V5s-00043j-H2
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 16:42:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4V2J-0002N5-NH
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 16:38:35 -0500
Received: from [2607:f8b0:4864:20::102e] (port=54244
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4V2I-0000WN-4J
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 16:38:35 -0500
Received: by mail-pj1-x102e.google.com with SMTP id mj19so29722946pjb.3
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 13:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0I7XCI61yTJ76Ii81uRxmH9SO5wsJTBXO1PzhBoYFZs=;
 b=exFFNtPpjaIfVxB7Iub8SDF6/3auWaGD83mxUJT0/ZGAXK1GVUMoooAOxwO/lFgJ8F
 boxHCsF4b4fXSManx5LoQUQrTSdWCae7lMk27cuYo+xBAV3EwnJcMm5wPz0157dYwm61
 Tg1C6GnBgo8SBja1kY3JlqDL8Exj2cdiWHprJgfoX5YcPX4X00x626RJvb0b7JnsA3QG
 RO6xoQMtGlD2idL4/jo70Wx8NwsHwzavAGI4v4zVp5u3wKeNbDWW/EbzTP9f+oPo4VtM
 K6e/QnfP6A7EmGiEmveZJo612oE1R7L5IskxMBfaa3WOvIDCZ/pIT8gENOO5Bqb51Jnu
 EZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0I7XCI61yTJ76Ii81uRxmH9SO5wsJTBXO1PzhBoYFZs=;
 b=fEkPmWA8utMs9JivjtCapPPNZbhz9hX7wHuUYHSq0T9/VECwgrfqrd2MayPizAVocE
 HXVFt2AM3YwbGthLoWKl/sMUAJ7CwDSEjGxDsNeHsC4sserRoeFxS96/Q52UqDpdpX1G
 f8kEKKLcioqKhV2N8FlQs1Urdwvb0zhOjteDPBm0hnBSrizcLW88s/+sa9MxfNiAC/NG
 vn1X/fd5/1Dt37CDlD7O/IZWgEa4QDNWXW1GMG55aEe3QOs8xt3bnWIr/eirrvteVQNB
 DFRGpj3K1J8tC5j3MUPdXutiHsXjWWb3FASXH5brfQQf+FQH6HjX4SZOEMM21B7+IH9e
 mfng==
X-Gm-Message-State: AOAM531x/BEauyYO/tNNk0mSASBnB1Su0LyyhqHJ54Gfo4QQk9Ww4TsM
 za3G1WuKD2x7PDdnCNHrWryJjQ==
X-Google-Smtp-Source: ABdhPJyEQCTAQAon5i8yLfRZFdjiKNU7c+zC4j7I8pL5hlBhILEd53kYEmWOVjiQbDiAg4sLlN93wQ==
X-Received: by 2002:a17:90b:3509:: with SMTP id
 ls9mr57646905pjb.5.1641245912655; 
 Mon, 03 Jan 2022 13:38:32 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id q22sm41672931pfk.27.2022.01.03.13.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 13:38:32 -0800 (PST)
Subject: Re: [PATCH v2 4/5] target/ppc: keep ins_cnt/cyc_cnt cleared if
 MMCR0_FC is set
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220103185332.117878-1-danielhb413@gmail.com>
 <20220103185332.117878-5-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0b9b2a07-4b0c-4095-9365-d95139e182fc@linaro.org>
Date: Mon, 3 Jan 2022 13:38:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220103185332.117878-5-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/22 10:53 AM, Daniel Henrique Barboza wrote:
> pmu_update_summaries() is not considering the case where the PMU can be
> turned off (i.e. stop counting all events) if MMCR0_FC is set,
> regardless of the other frozen counter bits state. This use case was
> covered in the late pmc_get_event(), via the also gone pmc_is_inactive(),
> that would return an invalid event if MMCR0_FC was set.
> 
> This use case is exercised by the back_to_back_ebbs_test Linux kernel
> selftests [1]. As it is today, after enabling EBB exceptions, the test
> will report an additional event-based branch being taken and will fail.
> Other tests, such as cycles_test.c, will report additional cycles being
> calculated in the counters because we're not freezing the PMU quick
> enough.
> 
> Fix pmu_update_summaries() by keeping env->ins_cnt and env->cyc_cnt
> cleared when MMCR0_FC is set.
> 
> [1] tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/power8-pmu.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index 7fc7d91109..73713ca2a3 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -40,6 +40,10 @@ void pmu_update_summaries(CPUPPCState *env)
>       int ins_cnt = 0;
>       int cyc_cnt = 0;
>   
> +    if (mmcr0 & MMCR0_FC) {
> +        goto hflags_calc;
> +    }
> +
>       if (!(mmcr0 & MMCR0_FC14) && mmcr1 != 0) {
>           target_ulong sel;
>   
> @@ -71,6 +75,7 @@ void pmu_update_summaries(CPUPPCState *env)
>       ins_cnt |= !(mmcr0 & MMCR0_FC56) << 5;
>       cyc_cnt |= !(mmcr0 & MMCR0_FC56) << 6;
>   
> + hflags_calc:

Good catch, but should be folded into patch 1 to avoid bisection breakage.


r~

