Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACB039CACF
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 22:01:28 +0200 (CEST)
Received: from localhost ([::1]:54606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpcU2-0003tp-Rw
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 16:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpcSs-000379-3u
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 16:00:14 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpcSq-0002LM-Gp
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 16:00:13 -0400
Received: by mail-pf1-x436.google.com with SMTP id x73so10018930pfc.8
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 13:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vtabhVWyeExzFJtIzVvcrT5DTtEeC5bdFzWj3cM5iyw=;
 b=Pz6luJi0xY0wGDjLfkUHUoQruUXoJSXD7aJ7WlU/ttkdr/wXgRJvtVRIrt9CQ+q/wt
 i7CwYQRsbz4tEGCemOrWwMYXFWC+atyD7vo2imosvpR4X1yH00nvAq0CnUsQCwkiteYQ
 JyTwhHD7Xk6PcC3OGPPk8qCDoPaI9FqBRqbAg0dcMU5SHP6TstPSv37N48kzQMzfzNXA
 ZEYWXis2Prqm31qG4wDOQNtSFgH5UBSIe8MK4JBbf6ysQu+uHZ57vxnu9V2YvAl47Kup
 1gGscdVJqdbGhTdJJanN+sIMMK6l6rQZmICUmjWTHKcaEE8cJUPsz57vG35a1DdUAU1L
 1Obw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vtabhVWyeExzFJtIzVvcrT5DTtEeC5bdFzWj3cM5iyw=;
 b=V+4Jt3sAtFOxMr+GM4al5vjOxysx7lcXuymw6iPpuFxpZp60tF0M0HN6KDdkLlXYJz
 Mc5rufyKakYT/SdevVCsR8zgTdzdqWXPfOpvcauw9NQjSpnBKigCOOAq5+4St3Pyna+h
 2b96gY2izyYFOc8uJzkLoS62yyoi7BXm4IgA7UWP1ptTz7jAiRkRKSFH88tMddnfi+5f
 jOamaG8VEbcrZtg3qt0TK1kam99lD0zoZbVlfy4LB6BoHjITayw/ziak6SPTrMl/Hsdf
 /PKTCROQb9LX763uoOYLg0Uk5XukOQFh1ubTo/p9pDq99GeptfyQMPlNsOsQHIhu0MRs
 +tDA==
X-Gm-Message-State: AOAM5319jIFaEXaCoHozJ4WTBAVkUl+tMsw4v+3JElH96OEqFRXQqfHe
 hV91hPT1FNq+x6uN4JmbKvtD3g==
X-Google-Smtp-Source: ABdhPJx3YDXhgTWJ0ZgEf2V24HNA5rc53QDgBg9oEcJYXlwU65Qdl0UeVZg24+3uINaAt8IvFYqZFQ==
X-Received: by 2002:a62:860a:0:b029:2ec:81e1:23e4 with SMTP id
 x10-20020a62860a0000b02902ec81e123e4mr9426489pfd.11.1622923210832; 
 Sat, 05 Jun 2021 13:00:10 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 d15sm7668459pjr.47.2021.06.05.13.00.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 13:00:10 -0700 (PDT)
Subject: Re: [PATCH v16 75/99] target/arm: make is_aa64 and arm_el_is_aa64 a
 macro for !TARGET_AARCH64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-76-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <420c1b1e-fc9a-186d-d38e-a8b1482c62ba@linaro.org>
Date: Sat, 5 Jun 2021 13:00:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-76-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
> From: Claudio Fontana <cfontana@suse.de>
> 
> when TARGET_AARCH64 is not defined, it is helpful to make
> is_aa64() and arm_el_is_aa64 macros defined to "false".
> 
> This way we can make more code TARGET_AARCH64-only.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/cpu.h | 37 ++++++++++++++++++++++++-------------
>   1 file changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index b9b9bd8b01..8614948543 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1060,6 +1060,11 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
>   void aarch64_sve_change_el(CPUARMState *env, int old_el,
>                              int new_el, bool el0_a64);
>   
> +static inline bool is_a64(CPUARMState *env)
> +{
> +    return env->aarch64;
> +}
> +
>   /*
>    * SVE registers are encoded in KVM's memory in an endianness-invariant format.
>    * The byte at offset i from the start of the in-memory representation contains
> @@ -1089,7 +1094,10 @@ static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
>   static inline void aarch64_sve_change_el(CPUARMState *env, int o,
>                                            int n, bool a)
>   { }
> -#endif
> +
> +#define is_a64(env) ((void)env, false)

In theory, parenthesis are required around the env expansion.

> +#define arm_el_is_aa64(env, el) ((void)env, (void)el, false)

Likewise.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

