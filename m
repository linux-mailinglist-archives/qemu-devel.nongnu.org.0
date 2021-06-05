Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CD039CACC
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 21:53:16 +0200 (CEST)
Received: from localhost ([::1]:51096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpcM6-00011j-TI
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 15:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpcL1-0008Ne-I7
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 15:52:08 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:39710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpcKy-0005XK-6G
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 15:52:07 -0400
Received: by mail-pf1-x430.google.com with SMTP id k15so9999275pfp.6
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 12:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c/z8EV3TKaWiozZRLB6mGcdwniHbBM/6raYQIT7TJhk=;
 b=vCeijRihD7U3VAPsUZOQXlYFgkybBUVjvx0BrDnMKkuRRbfcPkJAjzZ04zaxuS6fDf
 d5hySfoLFdcZ2Cq1PxWVMSAzzdwI7UkgcVPE/GFBZjRuGc2YBN1Lb89UnZhiLLIa5dqC
 57qvRZE8K9otMG9Qo+p0duTuVaEwyQJ5d6FkVrWkNz18lLSSksLNCUqfd4wF19CNGd/C
 TNH44iPDecgV206ln25OD+egK+qWRXsfM3v8DsA2zNyDppbSyVwEvmwMzrcWpok4ZLAy
 ttJ0kYtDSjeqs/NTNsGiElGmvCOAahMhxdlf0hCNxJgmjVKzoMpH42WDIiBJTC5grlnZ
 yOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c/z8EV3TKaWiozZRLB6mGcdwniHbBM/6raYQIT7TJhk=;
 b=jFyJ3vpXVMR8Pt8HEGKTf/aIOSgaXmFc+Up49zcS864SE+vUay6oH539fl5J7BcTWD
 RfMecbtPiT2qQXsq8+0j3pBXKjosa0kr4UF+bhnTY/Ogpu8n4+zy5DTms1SAvwXXBdck
 ilCrKVwcN6vybZSWoFgH7uR3FtTX8I08Fnq375+FSW3JLvBJ1/M/xttfuZjTBvB6/i9p
 wnfUkeahR4wJETD3NhljwxHvw+GgyieB+B3J/qwstNovo/DL1DVbxEMOtNZJyrSSlPIt
 lvPp18mBTe2nF1BuEHUcG2JvsZITo6YhJtR9u+bmjwZUCMdGDfgA0mYmVpXsP2gSSVl3
 zrQA==
X-Gm-Message-State: AOAM531wJJ/XnwKNlfUkbwdpr0AVQo2g6KTK0HaZVlvX6aiEKs0W61ec
 owgYuJudfNCqkyfqIgGTW1rQuA==
X-Google-Smtp-Source: ABdhPJy4/TU0u0LMfJ11lhT21hcLWpUYJGOwRpGSG7STkzxqq6rzVBr5SOqazTVaakrdVkhmCtPH/g==
X-Received: by 2002:a63:616:: with SMTP id 22mr10955420pgg.291.1622922722404; 
 Sat, 05 Jun 2021 12:52:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 ls13sm7625543pjb.23.2021.06.05.12.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 12:52:02 -0700 (PDT)
Subject: Re: [PATCH v16 73/99] target/arm: cpu-sve: split TCG and KVM
 functionality
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-74-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <33be111f-9e47-0b1d-f4e0-2f02bd73da76@linaro.org>
Date: Sat, 5 Jun 2021 12:52:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-74-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
> +void kvm_sve_get_supported_lens(ARMCPU *cpu, unsigned long *kvm_supported)
> +{
> +    /* Collect the set of vector lengths supported by KVM. */
> +    bitmap_zero(kvm_supported, ARM_MAX_VQ);
> +
> +    if (kvm_arm_sve_supported()) {
> +        kvm_arm_sve_get_vls(CPU(cpu), kvm_supported);
> +    } else {
> +        assert(!cpu_isar_feature(aa64_sve, cpu));
> +    }
> +}
> +
> +void kvm_sve_enable_lens(unsigned long *sve_vq_map,
> +                         unsigned long *sve_vq_init, uint32_t max_vq,
> +                         unsigned long *kvm_supported)
> +{
> +    /*
> +     * For KVM we have to automatically enable all supported unitialized
> +     * lengths, even when the smaller lengths are not all powers-of-two.
> +     */
> +    DECLARE_BITMAP(tmp, ARM_MAX_VQ);
> +
> +    bitmap_andnot(tmp, kvm_supported, sve_vq_init, max_vq);
> +    bitmap_or(sve_vq_map, sve_vq_map, tmp, max_vq);
> +}
> +
> +uint32_t kvm_sve_disable_lens(unsigned long *sve_vq_map,
> +                              unsigned long *sve_vq_init,
> +                              unsigned long *kvm_supported, Error **errp)
> +{
> +    uint32_t max_vq, vq;
> +
> +    /* Disabling a supported length disables all larger lengths. */
> +    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
> +        if (test_bit(vq - 1, sve_vq_init) &&
> +            test_bit(vq - 1, kvm_supported)) {
> +            break;
> +        }
> +    }
> +
> +    max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
> +    bitmap_andnot(sve_vq_map, kvm_supported, sve_vq_init, max_vq);
> +
> +    if (max_vq == 0 || bitmap_empty(sve_vq_map, max_vq)) {
> +        error_setg(errp, "cannot disable sve%d", vq * 128);
> +        error_append_hint(errp, "Disabling sve%d results in all "
> +                          "vector lengths being disabled.\n",
> +                          vq * 128);
> +        error_append_hint(errp, "With SVE enabled, at least one "
> +                          "vector length must be enabled.\n");
> +        return 0;
> +    }
> +
> +    return max_vq;
> +}
> +
> +bool kvm_sve_validate_lens(unsigned long *sve_vq_map, uint32_t max_vq,
> +                           unsigned long *kvm_supported, Error **errp,
> +                           uint32_t sve_max_vq)
> +{
> +    /* Ensure the set of lengths matches what KVM supports. */
> +    DECLARE_BITMAP(tmp, ARM_MAX_VQ);
> +    uint32_t vq;
> +
> +    bitmap_xor(tmp, sve_vq_map, kvm_supported, max_vq);
> +    if (bitmap_empty(tmp, max_vq)) {
> +        return true;
> +    }
> +
> +    vq = find_last_bit(tmp, max_vq) + 1;
> +    if (test_bit(vq - 1, sve_vq_map)) {
> +        if (sve_max_vq) {
> +            error_setg(errp, "cannot set sve-max-vq=%d", sve_max_vq);
> +            error_append_hint(errp, "This KVM host does not support "
> +                              "the vector length %d-bits.\n", vq * 128);
> +            error_append_hint(errp, "It may not be possible to use "
> +                              "sve-max-vq with this KVM host. Try "
> +                              "using only sve<N> properties.\n");
> +        } else {
> +            error_setg(errp, "cannot enable sve%d", vq * 128);
> +            error_append_hint(errp, "This KVM host does not support "
> +                              "the vector length %d-bits.\n", vq * 128);
> +        }
> +    } else {
> +        error_setg(errp, "cannot disable sve%d", vq * 128);
> +        error_append_hint(errp, "The KVM host requires all "
> +                          "supported vector lengths smaller "
> +                          "than %d bits to also be enabled.\n", max_vq * 128);
> +    }
> +    return false;
> +}

Also, I think I mentioned this before in review of a previous version, I 
strongly suspect that aside from kvm_sve_get_supported_lens, the other 
functions will be used without change by all other hw virt systems.

So I think we'll do best, short term, to keep all of this in cpu-sve.c for now. 
  The tcg_enabled() test should elide all of the code that's not needed when 
!CONFIG_TCG.


r~

