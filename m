Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A799C2D3584
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:46:46 +0100 (CET)
Received: from localhost ([::1]:34948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkon-0004wd-D4
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:46:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmk3x-0001SJ-LT
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:58:21 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmk3u-0006XX-Vr
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:58:21 -0500
Received: by mail-oi1-x242.google.com with SMTP id s2so23774oij.2
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jc2fNaB9iBbLq5Bw09h7LczamNIsg/8yspf7XFHNItc=;
 b=j20tSan1us34zFbkVE8LDVX2U6Gx4TsX3j9SV7SGx6v/7mDIh41+AffJ/2jT2kvuji
 RkcXflbzcaQ+PP7TeOoB5G/8PVNUCEHXPaDtsULnSN7AhG0l9jJtlUdsutwTvuamCltL
 /5qlRedU2TQ42oy3eE8QfFDYhO/X4RsjCevcTDHbsyvTZROMWtRjOFqw5T32t6gA/Y65
 7L6ugqICmuSJF/2xeIejf2Ij4QLXRmrR00YAn2biRlDEE9kSciM6J0vs/AZ0dnugfkcl
 qOuDIoqRcWqRyIxz/OJYSXnWTGnbRzxXvLJC5ShPVlouULyFefydfjrLYYE27jPmH3Ka
 Dxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jc2fNaB9iBbLq5Bw09h7LczamNIsg/8yspf7XFHNItc=;
 b=NE7KlKdLb09zmQDmWzqTOGLKokRWJuJ5KkaqvqUnnNsL5A+8X0yWe7o0ERrXLM65bN
 coenusT/bYQ0iLa43aVju62JVcDcOaI+JvVTuMg28WlGYggftvyO3v0MzX/8F8bMzMCp
 AvUWOoS2sEn1sFNxOqvvPnWRQA+FGXsIMZP+a9TpaoXCLJiU/W+OZa1zwDJxrdx9vh6f
 twDoDgNPbHWWIarjNoKBVeZkdo6338inuZeMsyHzVYw+ICJZ1lYrIsnYHfF3X9U2YQwb
 tXb4LLtyfAdgHMbE/MB84VF9K4wYUxjdjEm7K0zqRu4PBDYm+DdA7eEkAomJClWuSh89
 p0vg==
X-Gm-Message-State: AOAM5309gU4/ek3P+TMURycQxFaysEFaW+QE7vyS+Jy1ZPVGms4/yEcC
 xisGtB/Ngt26+vjmTGIoKBLcCQ==
X-Google-Smtp-Source: ABdhPJxATayP+wdWa+NCw+MKNHI0BQmrRIAPYxjI6psO9Y/LJbDTgwy0r5vNCtksopcluLKkk3H9Cw==
X-Received: by 2002:aca:383:: with SMTP id 125mr4151956oid.122.1607461096750; 
 Tue, 08 Dec 2020 12:58:16 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o21sm2330589otj.1.2020.12.08.12.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 12:58:16 -0800 (PST)
Subject: Re: [PATCH 4/4] target/arm: adjust CPTR_EL2 according to HCR_EL2.E2H
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20201207044655.2312-1-zhiwei_liu@c-sky.com>
 <20201207044655.2312-5-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ca1763f-9676-20f1-b3be-710d2f2ac41b@linaro.org>
Date: Tue, 8 Dec 2020 14:58:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207044655.2312-5-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 10:46 PM, LIU Zhiwei wrote:
> From DDI0487Fc_armv8_arm.pdf, the CPTR_EL2 has two kinds
> of layouts according to HCR_EL2.E2H.
> 
> When HCR_EL2.E2H is 1, fp_exception_el should refer to
> HCR_EL2.FPEN and sve_exception_el should refer to HCR_EL2.ZEN.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/arm/helper.c | 55 +++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 46 insertions(+), 9 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 38cd35c049..6cc9f2bb50 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6147,11 +6147,30 @@ int sve_exception_el(CPUARMState *env, int el)
>       * they will be zero when EL2 is not present.
>       */
>      if (el <= 2 && !arm_is_secure_below_el3(env)) {
> -        if (env->cp15.cptr_el[2] & CPTR_TZ) {
> -            return 2;
> -        }
> -        if (env->cp15.cptr_el[2] & CPTR_TFP) {
> -            return 0;
> +        /* Since we exclude secure first, we may read HCR_EL2 directly. */
> +        if (env->cp15.hcr_el2 & HCR_E2H) {

We have already pulled the correct value into a local variable here: hcr_el2.
No need for the comment.

> +            int zen = extract32(env->cp15.cptr_el[2], 16, 2);
> +            switch (zen) {
> +            case 0:
> +            case 2:
> +                return 2;
> +            case 1:
> +                if (env->cp15.hcr_el2 & HCR_TGE) {

Likewise.

> +                    if (el == 0) {
> +                        return 2;
> +                    }
> +                }
> +                break;
> +            case 3:
> +                break;
> +            }
> +        } else {
> +            if (env->cp15.cptr_el[2] & CPTR_TZ) {
> +                return 2;
> +            }
> +            if (env->cp15.cptr_el[2] & CPTR_TFP) {
> +                return 0;
> +            }
>          }
>      }
>  
> @@ -12635,12 +12654,30 @@ int fp_exception_el(CPUARMState *env, int cur_el)
>       */
>  
>      /* CPTR_EL2 : present in v7VE or v8 */
> -    if (cur_el <= 2 && extract32(env->cp15.cptr_el[2], 10, 1)
> -        && !arm_is_secure_below_el3(env)) {
> +    if ((cur_el <= 2) && !arm_is_secure_below_el3(env)) {
>          /* Trap FP ops at EL2, NS-EL1 or NS-EL0 to EL2 */
> -        return 2;
> +        if ((arm_hcr_el2_eff(env) & HCR_E2H) == HCR_E2H) {

There is a prior use of arm_hcr_el2_eff in this function.  It should be called
once and stored in a local variable, just like in sve_exception_el.

No need for == in testing a single bit.

> +            int fpen = extract32(env->cp15.cptr_el[2], 20, 2);
> +            switch (fpen) {
> +            case 0:
> +            case 2:
> +                return 2;
> +            case 1:
> +                if ((arm_hcr_el2_eff(env) & HCR_TGE) == HCR_TGE) {

Likewise.

> +                    if (cur_el == 0) {
> +                        return 2;
> +                    }
> +                }
> +                break;
> +            case 3:
> +                break;
> +            }
> +        } else {
> +            if (extract32(env->cp15.cptr_el[2], 10, 1)) {

Use CPTR_TFP.

> +                return 2;
> +            }
> +        }
>      }
> -

Whitespace removal.

>      /* CPTR_EL3 : present in v8 */
>      if (extract32(env->cp15.cptr_el[3], 10, 1)) {
>          /* Trap all FP ops to EL3 */
> 

Would you also change this to use CPTR_TFP please?


r~

