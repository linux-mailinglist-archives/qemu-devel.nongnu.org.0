Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C684C04AF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:35:48 +0100 (CET)
Received: from localhost ([::1]:59138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMdl5-0003Fj-Bt
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:35:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdfz-0006U7-N1
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:30:31 -0500
Received: from [2607:f8b0:4864:20::102b] (port=52914
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdfw-0000S4-2n
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:30:31 -0500
Received: by mail-pj1-x102b.google.com with SMTP id v4so974446pjh.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bMs5ZtLp5Cd+GTryDT+acsE4iIk0utzFp5o3fKnDeWM=;
 b=gUmFkr8rUd/v86VuOIMiXzbIS2eSx6nTVSV90xTLLGt85z/LWOZS2tm+I+K8Igpuf4
 Kh7Y9HzIIPlfsJuoGwAgPXPKt/hjLCA6BjFMJNlGYthNBfrolueRWP/dM+cWQbzt8i6/
 EXYmhdJ7GHbLjvGLrXNFSRgDU772Etld5WupO9TWghtq0TnNQ9j1e8HXWvEGhA2EzmbT
 EEYMnHymJY6m1omBjXG8bgcD1HhMKfFhfurjMJ0YAlwJEUNhS3/ZxfWQeSGBOdrdAaXb
 AQyjXfxjsF2zwrU81AJJ5GTOTo5BMNWEOtUBd69lI6AcJ0KO9fVc7kVht6xIlGBSD8hs
 mPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bMs5ZtLp5Cd+GTryDT+acsE4iIk0utzFp5o3fKnDeWM=;
 b=EN32JuZeaPEhmRop7NJ5sSj0voBs8a84WPLt4TkDLhhcvDsl8aTHx4ckaxsQB/di3Z
 7bpS5aUHfb6ME6WYFZj6Kd440NOG97ltP2WXxg8QVLlcgAPaxK7LIepU7z7rjqTAx1V0
 uqo1JSSuI3LxCXN9THGK+gV7IdYDOQjOjOcWQGhj5sB9UZl+4wXP+QNGyII7yIggCvmT
 M+7ht/7Icst6xKHzBO4dq0xk5rAED4IaUo+jl391zHb00EwjKgJQ6cininLSqZPWIkr5
 qUF63bisOl7yuqy4njoYsnHi+4Hmjgnp3T3m6+Gzi7Dun31mj+RuttjbX1HnwcjoEIky
 L/VQ==
X-Gm-Message-State: AOAM530DaEnOXr0jzUmzfpMfeirKj5QxwJSd1Yjd3TkkqfHoXcLq7fmi
 Lnk5ZX+6xj8D8f+SmmafBQh38w==
X-Google-Smtp-Source: ABdhPJxfC6IwKfHQReDz/VhptJfcyS7YJRFUPDUzbSeqodasy13sRbnDAWHmQecGR/Bfovl37qzu/Q==
X-Received: by 2002:a17:90b:4ad2:b0:1b8:e050:c7e3 with SMTP id
 mh18-20020a17090b4ad200b001b8e050c7e3mr6319557pjb.83.1645569024440; 
 Tue, 22 Feb 2022 14:30:24 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id d13sm17794243pfj.205.2022.02.22.14.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 14:30:23 -0800 (PST)
Message-ID: <9111db3b-f238-7780-a5dd-4350721146b3@linaro.org>
Date: Tue, 22 Feb 2022 12:30:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 24/47] target/ppc: move vrl[bhwd]nm/vrl[bhwd]mi to
 decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-25-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-25-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> +static void gen_vrlnm_vec(unsigned vece, TCGv_vec vrt, TCGv_vec vra,
> +                          TCGv_vec vrb)
> +{
> +    TCGv_vec mask, n = tcg_temp_new_vec_matching(vrt);
> +
> +    /* Create the mask */
> +    mask = do_vrl_mask_vec(vece, vrb);
> +
> +    /* Extract n */
> +    tcg_gen_dupi_vec(vece, n, (8 << vece) - 1);
> +    tcg_gen_and_vec(vece, n, vrb, n);
> +
> +    /* Rotate and mask */
> +    tcg_gen_rotlv_vec(vece, vrt, vra, n);

Note that rotlv does the masking itself:

/*
  * Expand D = A << (B % element bits)
  *
  * Unlike scalar shifts, where it is easy for the target front end
  * to include the modulo as part of the expansion.  If the target
  * naturally includes the modulo as part of the operation, great!
  * If the target has some other behaviour from out-of-range shifts,
  * then it could not use this function anyway, and would need to
  * do it's own expansion with custom functions.
  */

> +static bool do_vrlnm(DisasContext *ctx, arg_VX *a, int vece)
> +{
> +    static const TCGOpcode vecop_list[] = {
> +        INDEX_op_cmp_vec, INDEX_op_rotlv_vec, INDEX_op_sari_vec,
> +        INDEX_op_shli_vec, INDEX_op_shri_vec, INDEX_op_shrv_vec, 0
> +    };

Where is sari used?



r~

