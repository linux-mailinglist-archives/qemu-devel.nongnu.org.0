Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1269438B22
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 19:53:52 +0200 (CEST)
Received: from localhost ([::1]:35000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mehgu-0007nJ-1x
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 13:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mehfo-0005dZ-2z
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 13:52:45 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:41585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mehfl-0002mU-8w
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 13:52:43 -0400
Received: by mail-pf1-x431.google.com with SMTP id y7so8542697pfg.8
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 10:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H8zi+z+MmAuMPOCnJeKAyh+HwdTnYLheV210vNBZ6/Y=;
 b=vF4I++gfwc136pD0adD51NK5cR/9aQudoJX/SjwQs3FgIf2M/LWldXL5R3Njp8+40R
 0xZ/viTbWeccU6jdhaJ20H/kLsaPkLUyj2vxnWiQp9/R7KCIIsdRk3TfBYpBwBQWCNVS
 H2QGP58HHjVoE+dUcsdcWVf6UUH4z9b1oRKN9Ql830gdvWx54MhCgm5CsJ4g04TmmM0+
 IxwOm85+gXpUlUv2pE6K1ihZFVrORcIguH68HCKT3eqlDN66DJ6P6kbZfJHSyggsvCB3
 uUs+5lMTW79Dk6BvU/yhYfXmEI4ALVgvY209Ey4b626U8SkRerK6d4INILOwFJoxAvvT
 bv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H8zi+z+MmAuMPOCnJeKAyh+HwdTnYLheV210vNBZ6/Y=;
 b=nKGb2QTKNLLUmca+5d7A9E84/FfpWNou3/Vmngt8I9XPEf9zrBPLGNu6HO1W8V7c2b
 YVGeHxEmNOiASrPlHX7O7l1SW9+pQOQSf/JCOcrnw3mnv0L2/TzTvWCE75dyXo4zA/wU
 1fvYIsjZeP8doo/6xDHjXK48090kMFQ1axlNcyUEo2AAGx6t+SHVstUBMzf1GbcxUtNm
 QaIb11ycga/9xPBC4cSwa+RUNcMsljKJt18ObxjjX6L5tYii0d0TwQ6z0/WF7g0XUnD5
 FJaDPesuFthS8edU92OXNNDt70bkuXNdf1jtd9UbVPKKPmKv0lrMMLKTPSUMDz1+tJnN
 Ce3w==
X-Gm-Message-State: AOAM5326XCEJoNtcEURzm/YnhN7lKQog5FZG+y4YmEKrDB9MsZnopvev
 NKIcs0alqpdGkfw5JHM7tvTeDA==
X-Google-Smtp-Source: ABdhPJy8z+u2IFmnVQ99YeoyJWrZS1QTQ73Q7LRqBzTlehhbAsfg6VTxZemUCs0p55iS+K7nPuKkJA==
X-Received: by 2002:a62:e51a:0:b0:44d:67bd:53ab with SMTP id
 n26-20020a62e51a000000b0044d67bd53abmr13577317pff.86.1635097959826; 
 Sun, 24 Oct 2021 10:52:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k10sm4500560pff.160.2021.10.24.10.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 10:52:39 -0700 (PDT)
Subject: Re: [PATCH 22/33] target/mips: Convert MSA 3R instruction format to
 decodetree (part 1/4)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-23-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65fa8116-4a1a-eecf-4ee9-fc6ed2896f89@linaro.org>
Date: Sun, 24 Oct 2021 10:52:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-23-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> +static bool trans_msa_3r_df(DisasContext *ctx, arg_msa_r *a,
> +                            void (*gen_msa_3r_df)(TCGv_ptr, TCGv_i32, TCGv_i32,
> +                                                  TCGv_i32, TCGv_i32))
> +{
> +    TCGv_i32 tdf = tcg_constant_i32(a->df);
> +    TCGv_i32 twd = tcg_const_i32(a->wd);
> +    TCGv_i32 tws = tcg_const_i32(a->ws);
> +    TCGv_i32 twt = tcg_const_i32(a->wt);
> +
> +    gen_msa_3r_df(cpu_env, tdf, twd, tws, twt);

Missing check_msa_access.

r~


