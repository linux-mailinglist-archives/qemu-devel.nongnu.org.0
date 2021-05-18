Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E903875E1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:59:05 +0200 (CEST)
Received: from localhost ([::1]:43834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwVE-000277-5H
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwTQ-0007jk-4X
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:57:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwTO-00014E-6j
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:57:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621331829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJmeFbOf8YpBzau3rncSEE+bwpXAlYxubWBC7SzJP00=;
 b=KrPa6vAlmZyGybNvWb5US3+cZl4FsGVex2NFS0zBoRKL2y2gqFLcia5wBruH3T0uiiZJIX
 UufAyNb91B+iT1xL+vjMK9u5R6I8rySdJrP/T5iFVg+B/hjtKzLV+83N588qrNn717E7uB
 pv/73DGe3tNITPSH0527E7U5XaeQhF0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-bEAePl76NtaNlnSCMmnp_A-1; Tue, 18 May 2021 05:57:07 -0400
X-MC-Unique: bEAePl76NtaNlnSCMmnp_A-1
Received: by mail-wm1-f70.google.com with SMTP id
 g206-20020a1c39d70000b029016ac627fbe9so221589wma.9
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LJmeFbOf8YpBzau3rncSEE+bwpXAlYxubWBC7SzJP00=;
 b=Sno+z0klfP8jAn1e7mIaCrmc55dxTPeqblsLqmxQ1cSu1YdgcSsHnJ2EIJ0xjIBePj
 o6vXKonOckPHFYGzvXzk2YMFJPSHmCn6rUOHkj2LB/qR+wuJEBGCQHdMHlz2BFelojX4
 Hgge+XCItZ6LEKheCUemcVLAwhDqmuuLIiZTIx2nlKbYWrQ9wCzaMbf+fDejsKED+s4h
 VO94V9qATH2rxB3ofaO3KoIIRqCSRwki+IsVcvWe7faQfCFLocjWYE4qEPkxXqs79B0h
 sssNA7Coqm+9ZXru7bFoOxbDi0ZjdHib/jiH04hjXePoAQaWwrHs6aJBVSNwd2oTZ46o
 8Orw==
X-Gm-Message-State: AOAM5326GPbuTNMt75fv4xcxZFZ++L5QKySsvcUDAeOuNalxqgagx25k
 iqAF+pDR4crzOI+ybz+6pJUKwsYuOEnvkdXhlbCrGuM6vKth0yhQxjknydzPNxYpIZemABd23LT
 hA9L9KNvEupLwsW0=
X-Received: by 2002:a05:600c:4998:: with SMTP id
 h24mr3982899wmp.10.1621331826148; 
 Tue, 18 May 2021 02:57:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyEpYnnDcbfRbDIHEzpYbb6xCFX4/JoLPLw+DwZ6uS2SlhLgK7VlqkCCDCLlXvmR42qEtR+g==
X-Received: by 2002:a05:600c:4998:: with SMTP id
 h24mr3982881wmp.10.1621331825972; 
 Tue, 18 May 2021 02:57:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f15sm4722675wrs.47.2021.05.18.02.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:57:05 -0700 (PDT)
Subject: Re: [PATCH v2 36/50] target/i386: Tidy svm_check_intercept from tcg
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-37-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1a34adc3-2721-90ca-0990-aa55b8f4eddd@redhat.com>
Date: Tue, 18 May 2021 11:57:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-37-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> The param argument to helper_svm_check_intercept_param is always 0;
> eliminate it and rename to helper_svm_check_intercept.  Fold
> gen_sve_check_intercept_param into gen_svm_check_intercept.
       ^^^

Too much ARM lately. :)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/helper.h                |  2 +-
>   target/i386/tcg/sysemu/svm_helper.c |  5 ++---
>   target/i386/tcg/translate.c         | 16 ++++------------
>   3 files changed, 7 insertions(+), 16 deletions(-)
> 
> diff --git a/target/i386/helper.h b/target/i386/helper.h
> index f794d1c7c7..86484a4ec4 100644
> --- a/target/i386/helper.h
> +++ b/target/i386/helper.h
> @@ -107,7 +107,7 @@ DEF_HELPER_2(inl, tl, env, i32)
>   
>   #ifndef CONFIG_USER_ONLY
>   DEF_HELPER_FLAGS_4(bpt_io, TCG_CALL_NO_WG, void, env, i32, i32, tl)
> -DEF_HELPER_3(svm_check_intercept_param, void, env, i32, i64)
> +DEF_HELPER_2(svm_check_intercept, void, env, i32)
>   DEF_HELPER_4(svm_check_io, void, env, i32, i32, i32)
>   DEF_HELPER_3(vmrun, void, env, int, int)
>   DEF_HELPER_1(vmmcall, void, env)
> diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
> index 79c73d67af..b431016e72 100644
> --- a/target/i386/tcg/sysemu/svm_helper.c
> +++ b/target/i386/tcg/sysemu/svm_helper.c
> @@ -506,10 +506,9 @@ void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
>       }
>   }
>   
> -void helper_svm_check_intercept_param(CPUX86State *env, uint32_t type,
> -                                      uint64_t param)
> +void helper_svm_check_intercept(CPUX86State *env, uint32_t type)
>   {
> -    cpu_svm_check_intercept_param(env, type, param, GETPC());
> +    cpu_svm_check_intercept_param(env, type, 0, GETPC());
>   }
>   
>   void helper_svm_check_io(CPUX86State *env, uint32_t port, uint32_t param,
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 8a02c5a373..12ef2cf064 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -197,7 +197,7 @@ STUB_HELPER(clgi, TCGv_env env)
>   STUB_HELPER(invlpga, TCGv_env env, TCGv_i32 aflag)
>   STUB_HELPER(set_dr, TCGv_env env, TCGv_i32 reg, TCGv val)
>   STUB_HELPER(stgi, TCGv_env env)
> -STUB_HELPER(svm_check_intercept_param, TCGv_env env, TCGv_i32 t, TCGv_i64 p)
> +STUB_HELPER(svm_check_intercept, TCGv_env env, TCGv_i32 type)
>   STUB_HELPER(svm_check_io, TCGv_env env, TCGv_i32 port, TCGv_i32 p, TCGv_i32 a)
>   STUB_HELPER(vmload, TCGv_env env, TCGv_i32 aflag)
>   STUB_HELPER(vmmcall, TCGv_env env)
> @@ -2423,9 +2423,8 @@ static inline int svm_is_rep(int prefixes)
>       return ((prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) ? 8 : 0);
>   }
>   
> -static inline void
> -gen_svm_check_intercept_param(DisasContext *s, target_ulong pc_start,
> -                              uint32_t type, uint64_t param)
> +static void gen_svm_check_intercept(DisasContext *s, target_ulong pc_start,
> +                                    uint32_t type)
>   {
>       /* no SVM activated; fast case */
>       if (likely(!GUEST(s))) {
> @@ -2433,14 +2432,7 @@ gen_svm_check_intercept_param(DisasContext *s, target_ulong pc_start,
>       }
>       gen_update_cc_op(s);
>       gen_jmp_im(s, pc_start - s->cs_base);
> -    gen_helper_svm_check_intercept_param(cpu_env, tcg_const_i32(type),
> -                                         tcg_const_i64(param));
> -}
> -
> -static inline void
> -gen_svm_check_intercept(DisasContext *s, target_ulong pc_start, uint64_t type)
> -{
> -    gen_svm_check_intercept_param(s, pc_start, type, 0);
> +    gen_helper_svm_check_intercept(cpu_env, tcg_constant_i32(type));
>   }
>   
>   static inline void gen_stack_update(DisasContext *s, int addend)
> 


