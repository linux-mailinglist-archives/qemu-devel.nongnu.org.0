Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747412E7CFD
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 23:38:15 +0100 (CET)
Received: from localhost ([::1]:52266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuk6g-0004XU-4x
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 17:38:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kuk57-0003iD-CM
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 17:36:37 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:46752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kuk55-0000Ws-8p
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 17:36:37 -0500
Received: by mail-pf1-x434.google.com with SMTP id s21so10344053pfu.13
 for <qemu-devel@nongnu.org>; Wed, 30 Dec 2020 14:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OyjdfDwERMLG6x3pGPpeUjZ/46ETxripnbSBpTFfDDI=;
 b=e8WHeLkOtC4ZwG4iVT7m4A4qXDUyLx1QsbzvQ5PmuXsX2kw8gqhkb4JR68Ghs4ClRP
 mZIhU68YbQp0a2nYnIezX2zUgfdUo+GomjbE4oHCfNQzTDD5wU4MwzA3hNRZ1vsc2BU1
 4V28pMQ2raaGx/PeDWa1LSRpHlyLHi0amCJZvu1310U9iWWDZt5/IpD6+R2BDtPIUs1u
 okY+RuPMhSFtcroxZwZP4lgDCo4bmV7m5/17QAH4nw/e//VzapRyPZhUfns0arV37UuI
 3/pER4aigq11ZC2Dkc5T3XMMUkMCRkpLWDqTVTbnu9f5dwG6Ge354N0lOj1SQQhUHydU
 qqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OyjdfDwERMLG6x3pGPpeUjZ/46ETxripnbSBpTFfDDI=;
 b=c0W96MOJwyCFEjsWqKVuuiYsyRR8R/0SfsCDhDAK1MVQvn0qZOXQwvFSwMVX3M2z8C
 X3vvmUedNl+TRHcwqI5Es+Pk74V36lrF2abDrBDsC85mn8I1amT88hVK2gzPmKFbflrj
 FcO53NRllWridukKmPL/EGFzN08XMIByEK2GnhpR9zHsAmw8JXJUeYv4KQCpXqUmi8UZ
 U1TgiqOCJJJiGuw3TzeD5d7cAuGhooUvEFV+wZ22tR9Ea+4W8z0NrQ2MajforURYrCHo
 dAbRnP5x2BG/ZgZLIbFOLQFlbr309RH93rP1PPGYRSxShOGPU+TC4U1Dg/HlWeUTvb1P
 lNjw==
X-Gm-Message-State: AOAM531oWYwkW+HuwlzO1Oc2cJArX3ZJ6MjOHDBhgKGHmkQjzW2qkd8I
 Qts9F8g68F4KdXh/FZGVgdnAPGKihn+CJQ==
X-Google-Smtp-Source: ABdhPJz2IQHG2bVou+LN1mnu7nmZEnGOYWjghXZllyOaroVEQUH02p3qwaMBw7IeG9ugA5XELUty/Q==
X-Received: by 2002:a62:864e:0:b029:1ab:e82c:d724 with SMTP id
 x75-20020a62864e0000b02901abe82cd724mr47315218pfd.9.1609367793402; 
 Wed, 30 Dec 2020 14:36:33 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 jz20sm8088039pjb.4.2020.12.30.14.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Dec 2020 14:36:32 -0800 (PST)
Subject: Re: [PATCH 2/3] target/arm: ARMv8.4-TTST extension
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <7884934.NyiUUSuA9g@basile.remlab.net>
 <20201218143321.102872-2-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3505851a-caa0-698d-49da-49beca168a54@linaro.org>
Date: Wed, 30 Dec 2020 14:36:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218143321.102872-2-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.399,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 6:33 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> This adds for the Small Translation tables extension in AArch64 state.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.h    |  5 +++++
>  target/arm/helper.c | 13 ++++++++++---
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 39abb2a36b..604b9cdd0e 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3991,6 +3991,11 @@ static inline bool isar_feature_aa64_uao(const ARMISARegisters *id)
>      return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, UAO) != 0;
>  }
>  
> +static inline bool isar_feature_aa64_st(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, ST) != 0;
> +}
> +
>  static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
>  {
>      return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b927e53ab0..c3a186db35 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10851,7 +10851,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint32_t level,
>              if (level == 0 && pamax <= 42) {
>                  return false;
>              }
> -            if (level == 3) {
> +            if (level == 3 && !cpu_isar_feature(aa64_st, cpu)) {
>                  return false;
>              }
>              break;

As mentioned vs patch 1, I think this hunk should be handled differently.

> @@ -10946,7 +10946,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>  {
>      uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
>      bool epd, hpd, using16k, using64k;
> -    int select, tsz, tbi;
> +    int select, tsz, tbi, max_tsz;
>  
>      if (!regime_has_2_ranges(mmu_idx)) {
>          select = 0;
> @@ -10981,7 +10981,14 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>              hpd = extract64(tcr, 42, 1);
>          }
>      }
> -    tsz = MIN(tsz, 39);  /* TODO: ARMv8.4-TTST */
> +
> +    if (cpu_isar_feature(aa64_st, env_archcpu(env))) {
> +        max_tsz = 48 - using64k;
> +    } else {
> +        max_tsz = 39;
> +    }
> +
> +    tsz = MIN(tsz, max_tsz);
>      tsz = MAX(tsz, 16);  /* TODO: ARMv8.2-LVA  */
>  
>      /* Present TBI as a composite with TBID.  */
> 

But the rest of the patch looks good.


r~

