Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2313839CAC2
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 21:32:52 +0200 (CEST)
Received: from localhost ([::1]:41766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpc2M-0001dk-CQ
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 15:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpc1C-0000WG-Rl
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 15:31:38 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpc1A-00010Q-Vm
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 15:31:38 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so9365316pjs.2
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 12:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9F2m1DhrSUSIYTdnZmgqh1HCfDmWW6hYno5vOwJhfIA=;
 b=CxdHNK8tOIPMSfMSrpNC999t9tUFpjSlswwsYleBvktU/sokPEx6vtuuBFD2llG2IM
 eZuAeM8oyQlVAPTpKh9+Qi+3UsXutpDLMJGXPsHl5SOtuSrpeyF9igDRCO7dW5zkg0Qm
 bGAQAbQHS7uXS/QseU2HyjDNF3iPoMkKtCbCfGZLDLQZiLqiXsyKvfRMUfEtAYpkwfsT
 iq1eiejCpwSNnjgrgw74PCTwp7SMDL+dp0/ptFOo1fn4EDiubMEv82BPOYtGZjrdwbKd
 Aq0egEVip4Puv+0URBgn12wErxCITPWVBDEmdWhFmSfeng/sqvItTFNnRBWIdwszxGpK
 RI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9F2m1DhrSUSIYTdnZmgqh1HCfDmWW6hYno5vOwJhfIA=;
 b=TKwov4IYRmNwKaJH0nY4EggP8tZEjE2TfwFkb0TtLBXXubYf+UT6dslagJa7/W8bt0
 lOCdtOcVPQfYwVB86BzVHuqq5VdpRcF8LsX4m846xbLv7JRxgKsI6IOYOLrwhhI8LxEJ
 +D/C+AGqEFGJG7XJ2PN00DemrR6h9IXjNjQBUUlAGWgi97x+ToUXGX+6IRsdF728PSF8
 d2wnBT4K0AALctwxwKSKvkKL6IFsBpLkqdQ5d0ubd5XMJl/sxB4sEpTddiBR+9S3DZA7
 erX3hWK7MivvM3DjBa6APNzhQSHkzHccmkzSbh01FhRzTLZKY03QSxwbRz/6RWQKKnYZ
 gv+A==
X-Gm-Message-State: AOAM533MnMMhc2jocuZpzxXC4sKyH1pjOb4mMxDgQWZz4Q1nLuAaxgt1
 GSH9x89iJCw7f4kwGrvawTu4XA==
X-Google-Smtp-Source: ABdhPJwtZCjzbGmeJuPaJsw0BTWevqeBKI3ETk2r/aWngs6A7QZje0ELG2Cp6LOtHVG58Bz/KJJsvQ==
X-Received: by 2002:a17:90b:503:: with SMTP id
 r3mr12019768pjz.195.1622921495168; 
 Sat, 05 Jun 2021 12:31:35 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j9sm7753758pjy.25.2021.06.05.12.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 12:31:34 -0700 (PDT)
Subject: Re: [PATCH v16 73/99] target/arm: cpu-sve: split TCG and KVM
 functionality
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-74-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b55a4a70-8501-5cfe-b525-37e521a575ca@linaro.org>
Date: Sat, 5 Jun 2021 12:31:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-74-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
>       DECLARE_BITMAP(kvm_supported, ARM_MAX_VQ);
> -    DECLARE_BITMAP(tmp, ARM_MAX_VQ);
> -    uint32_t vq, max_vq = 0;
> -
> -    /* Collect the set of vector lengths supported by KVM. */
> -    bitmap_zero(kvm_supported, ARM_MAX_VQ);
> -    if (kvm_enabled() && kvm_arm_sve_supported()) {
> -        kvm_arm_sve_get_vls(CPU(cpu), kvm_supported);
> -    } else if (kvm_enabled()) {
> -        assert(!cpu_isar_feature(aa64_sve, cpu));
> -    }
> +    uint32_t max_vq = 0;
>   
> +    if (kvm_enabled()) {
> +        kvm_sve_get_supported_lens(cpu, kvm_supported);
> +    }

Previously, kvm_supported was always initialized.

I guess this is sort-of a cleanup.  But we've got 4 different checks for kvm 
and tcg.  I think we can actually tidy this up with a set of callbacks.

static bool do_sve_finalize(ARMCPU *cpu, Error **errp,
     void (*get_supported_lens)(ARMCPU *, unsigned long *),
     void (*enable_lens)(unsigned long *vq_map,
                         unsigned long *vq_init,
                         uint32_t max_vq,
                         unsigned long *supported),
     void (*disable_lens)(unsigned long *vq_map,
                          unsigned long *vq_init,
                          unsigned long *supported,
                          Error **errp),
     void (*validate_lens)(unsigned long *vq_map,
                           unsigned long *vq_init,
                           unsigned long *supported,
                           Error **errp, uint32_t max_vq))
{
     ...
}

bool cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
{
     if (kvm_enabled()) {
         return do_sve_finalize(cpu, errp,
                                kvm_sve_get_supported_lens,
                                kvm_sve_enable_lens,
                                kvm_sve_disable_lens,
                                kvm_sve_validate_lens);
     } else if (tcg_enabled()) {
         return do_sve_finalize(cpu, errp,
                                tcg_sve_get_supported_lens,
                                tcg_sve_enable_lens,
                                tcg_sve_disable_lens,
                                tcg_sve_validate_lens);
     } else {
         g_assert_not_reached(); /* ??? */
     }
}

with

void tcg_sve_get_supported_lens(ARMCPU *cpu,
                                 unsigned long *supported)
{
     bitmap_fill(supported, ARM_MAX_VQ);
}

which we can later adjust for, e.g. -cpu a64fx and neoverse-v1, etc, which 
don't support all vq sizes.


r~

