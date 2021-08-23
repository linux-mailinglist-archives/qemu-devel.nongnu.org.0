Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945063F4FFE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:57:38 +0200 (CEST)
Received: from localhost ([::1]:54586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIECX-0005Dl-Mj
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIE8w-0006VC-AO
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:53:54 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:45570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIE8u-0004KF-FU
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:53:53 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 f11-20020a17090aa78b00b0018e98a7cddaso492008pjq.4
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 10:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q+h/x74JtFUThCdww41Tri4lzyYoBCJcKF5wdDHWkUg=;
 b=jWjFdy4fGqkC5LdqXkdDOSuJxb8Fp3wR+HX2ciwVlXd4HMGGKVlr0+Cr2tbZ9aZvI8
 OwTBXs9fAMFoSNqFME4cFKv5WI92zqInRJeUU98C38RbS/tKA0ANUGTk5SpBVsHTJH5j
 35BCUbluEHno4/ONMJK/TIFqyNE43YFcuae8MkeVhW34QGwisAPIzl7OYFQJkTuWQEon
 3EyPWdxxXXpoyWGmwUWmlynUybKSa/053aymhuNfe6QrZ1eqP7zi3k3D+ZqupMdOpVfX
 /m3BXito+amDKbEmlkzU+lnR+a8EI6BxCvY9TaJUCdr1heblyc1s/RFQ5iTRC5tMHgpX
 xZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q+h/x74JtFUThCdww41Tri4lzyYoBCJcKF5wdDHWkUg=;
 b=r9Z+zORMfGGf9+F72/Dxb8P2kzE19MUuLcmuqmCyK/hBjWYEs1BCXz11b6BsmHPcig
 Iv5yhoJfLn/uERPhuhGykPvbb1PjiYrbeFVSVNab6E+Sj6atuOz24VF7EP1i8K4WthCq
 z+Md5C9fn0/YV123e6HXJ3vqGjAfHRU1U49HeQzAG13+sIy+wTH/82GvAfC3YzgsCYzl
 Wy4PxvnEvqTQdWA6iQAoFE4+ZhkbyjyWwjtL91q5BYxhxdiV40fU1XOOBi1oB3IE++65
 lKziVqFlttIXKGR5aFhiojcChTTEWoibpRWYFpRaH/kxbeRJvHH6QReeT6HA7BldsnV+
 q8dA==
X-Gm-Message-State: AOAM532USRvp1BrwqzlzqJM0wSo7HVBBcFujxXA9yG9qV8RUUh/waj62
 wbCwPcDemvnlyaLe8XSXjw6LVg==
X-Google-Smtp-Source: ABdhPJwaWCZ7496cC3RTYP1TRKbOpkFERMOvEHM/1PWZtKYIPGcGi4UXRzUGPN1tPgeObkTO2md5Lw==
X-Received: by 2002:a17:90b:188f:: with SMTP id
 mn15mr9538686pjb.154.1629741230639; 
 Mon, 23 Aug 2021 10:53:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u123sm15957256pfb.123.2021.08.23.10.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 10:53:50 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] target/arm/cpu64: Replace kvm_supported with
 sve_vq_supported
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20210823160647.34028-1-drjones@redhat.com>
 <20210823160647.34028-4-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b06b7b44-1021-d2f6-5d22-767fc8422507@linaro.org>
Date: Mon, 23 Aug 2021 10:53:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823160647.34028-4-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
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
Cc: peter.maydell@linaro.org, philmd@redhat.com, ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:06 AM, Andrew Jones wrote:
> Now that we have an ARMCPU member sve_vq_supported we no longer
> need the local kvm_supported bitmap for KVM's supported vector
> lengths.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   target/arm/cpu64.c | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index eb9318c83b74..557fd4757740 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -265,14 +265,17 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>        * any of the above.  Finally, if SVE is not disabled, then at least one
>        * vector length must be enabled.
>        */
> -    DECLARE_BITMAP(kvm_supported, ARM_MAX_VQ);
>       DECLARE_BITMAP(tmp, ARM_MAX_VQ);
>       uint32_t vq, max_vq = 0;
>   
> -    /* Collect the set of vector lengths supported by KVM. */
> -    bitmap_zero(kvm_supported, ARM_MAX_VQ);
> +    /*
> +     * CPU models specify a set of supported vector lengths which are
> +     * enabled by default.  Attempting to enable any vector length not set
> +     * in the supported bitmap results in an error.  When KVM is enabled we
> +     * fetch the supported bitmap from the host.
> +     */
>       if (kvm_enabled() && kvm_arm_sve_supported()) {
> -        kvm_arm_sve_get_vls(CPU(cpu), kvm_supported);
> +        kvm_arm_sve_get_vls(CPU(cpu), cpu->sve_vq_supported);
>       } else if (kvm_enabled()) {
>           assert(!cpu_isar_feature(aa64_sve, cpu));
>       }

I think this whole stanza should now be moved into kvm_arm_get_host_cpu_features, where we 
detect sve and fetch ID_AA64ZFR0_EL1.

As a separate patch, since this one is simply the variable rename.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

