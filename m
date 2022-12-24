Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC298655AF4
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 19:37:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p99Ny-0006R4-Hc; Sat, 24 Dec 2022 13:36:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p99Nr-0006Qk-S7
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:36:35 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p99Nk-0002tQ-TL
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:36:35 -0500
Received: by mail-pl1-x634.google.com with SMTP id m4so7645377pls.4
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 10:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eH7VE1vI1gSIXwQVuL/ZDllsTJd3EFpB3EO61LtWt1E=;
 b=fuzuNrQg0Pn3BJ3HnVgkfxyIr8FXL/PFcHLLp2GjX8jRKvjAIH0MDH/4LdN5DxOdp1
 mvHa6TMV9+X/dYsP/4/eal76CFYCOGTxfjBil/pkxJv3YRDBKVPdBGGB/dNuWcSkHDhj
 /Tk3YBDoyDJ5SjVRw/5hEhteQzfjLGBEP4qbO7ju5TxHWK3Y9/GHjc8IA0BWSWkPW9P1
 2LoZzVBe0uzW2X8H+CeAvO0jeD7pusO+zcg7oRniNwckIgnucP80jQDnYT7oZcXvdEVh
 TPQG9N+VJABuJqbCcRxgaNUBwZBjA39sohpRidgMpPZlMlMp/ZhaDFLcIYU4oZnGIXnz
 lPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eH7VE1vI1gSIXwQVuL/ZDllsTJd3EFpB3EO61LtWt1E=;
 b=2zKQ8rLe8wtYL5H4GY8ApwaKXIchNR2uIffzcl0D+3KDtTE+A9TRwvgVF2AJXoPpAg
 BnhiIStobAoAw4+cIAweQSv/56kaCdAGlQVLfJHyOWCdxPspLj0tTYDEcLhqCK2t5+p3
 vxcL8lP+zrtPf6pgOPIWpCRYO3Ndh2+dWS0j4VOabaM8te9lgnbkCkxAf2Sy/iSW4irZ
 T31Sq9MiRlkGE1f1mMNw1BNzYqT/f20Tzpk7T9LU0XVkLyP1Ugqz6AgxfO0C0RqLxMpO
 lxXJ5rwbRjzB9S2USoGMdijQfjcY4UFqSpTpOiBE59KBKS9Eaw1uF2FIOQc8i0WtPm95
 3EPA==
X-Gm-Message-State: AFqh2kpoKkrkgHWjeHoytDAY+CxwMDG0/4OcYvPrEUXNkJsUyJZPDJnk
 r0uf2nIOuFbGV97Ou+y9zJi8NA==
X-Google-Smtp-Source: AMrXdXsdzZX6QkZv+Y/Xi1f8SDt5ItMxgHPBW/+kEq5ZU9t026oYlGCd2967aepFYszoMMosrfJEYw==
X-Received: by 2002:a17:90a:598f:b0:21a:1b9b:139c with SMTP id
 l15-20020a17090a598f00b0021a1b9b139cmr15669668pji.47.1671906983787; 
 Sat, 24 Dec 2022 10:36:23 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a17090a2b8300b0021984d697fbsm6375014pjd.20.2022.12.24.10.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 10:36:23 -0800 (PST)
Message-ID: <b4f0b9df-c4f9-2c10-db27-b7a44b4940e9@linaro.org>
Date: Sat, 24 Dec 2022 10:36:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 23/43] target/loongarch: Implement vsll vsrl vsra vrotr
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-24-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-24-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/24/22 00:16, Song Gao wrote:
> +DEF_HELPER_4(vsll_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsll_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsll_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsll_d, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslli_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslli_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslli_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vslli_d, void, env, i32, i32, i32)
> +
> +DEF_HELPER_4(vsrl_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsrl_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsrl_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsrl_d, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsrli_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsrli_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsrli_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsrli_d, void, env, i32, i32, i32)
> +
> +DEF_HELPER_4(vsra_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsra_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsra_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsra_d, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsrai_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsrai_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsrai_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vsrai_d, void, env, i32, i32, i32)
> +
> +DEF_HELPER_4(vrotr_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vrotr_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vrotr_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vrotr_d, void, env, i32, i32, i32)
> +DEF_HELPER_4(vrotri_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vrotri_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vrotri_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vrotri_d, void, env, i32, i32, i32)

These are tcg_gen_gvec_{shl,shr,sar,rotr}{v,i}.


r~

