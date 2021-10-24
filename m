Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF64438B25
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 19:56:28 +0200 (CEST)
Received: from localhost ([::1]:37986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mehjP-0001VF-Vd
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 13:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mehi5-00009V-Ms
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 13:55:07 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:46794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mehi4-0004KY-5d
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 13:55:05 -0400
Received: by mail-pg1-x52e.google.com with SMTP id m21so8615919pgu.13
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 10:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4SvR5APgV/TTwoiBsKvKffotG/Fe8CfUkGEIn5FGcH8=;
 b=rgN0ZF/8bsGhBMBJ2+sLKgSS0IbcumGrHqy+R81mMr6DyRNaD+2nEgenM9WjSF9xnA
 BwSnb2SOddtthKSGSIAoNhKTzm2DlcLTIZhP0W885KeTemKm83btav07ybqAMTmVL9fy
 wtQMnWORSVKLMOw35ATBivROWcybQBczDSjU8VeWu3F3NQGdtl6Szp5Br/TFOwzR3kfi
 qXopI5TRFAMlgrvgIPNTjo5vN1XIZQ07EE2EiFjH9Yh256oa5sdy27xO8LFd/wyClDHH
 qxDrZYm9YwCfdKod3Y4kOhiOTYHd2KUvxvdkCHRVufazQ6Exv36Ofe8Ui3MSin4HwzQr
 Phzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4SvR5APgV/TTwoiBsKvKffotG/Fe8CfUkGEIn5FGcH8=;
 b=3mRzLXEGuQg2osdotX+Q3I3IB/py9Q0xN+3J24K3FPrfdQ5mBWyjH7oAf25hBQR2BZ
 E7nU1LArCHORRnouT4TgB92lugIzgEdpPRyFA5gJG3aOYVQAI0p1bekl7dhWY30qyqsd
 bwPNMMWrORvov7yghiT7iFY5xjqW0RGFqEFR8sFUzeAeeFay+aGBCooB9Xxq8xd1ssLJ
 YvgvmeB9UUH7h62K0BuCapa+6bC9HadaFOw20P5dtav+tWiKcZb1dUSn1S+vt31nQQyX
 nVgaPWRo6KFk+Wgosb9Liiz2OAUVbqvLwuVASUw1s7UEp5sI59UvQHG2a8Ab6EBvaTkw
 wLMw==
X-Gm-Message-State: AOAM531t3dfsmTsPOpHqZTwkAtOWCZjisVPuzWvMNPbxJLATAIEopwJt
 x/V8UBK/ckXsZrMB7lK1JYKMGw==
X-Google-Smtp-Source: ABdhPJz80S8Imgp5pAxI2MoyZRECs0OoJERzLm/a9AkVTEu1kMUS0sy8p987TVp2GxaGRcdbJog0IA==
X-Received: by 2002:a05:6a00:1883:b0:44c:e073:f2ce with SMTP id
 x3-20020a056a00188300b0044ce073f2cemr13083744pfh.37.1635098102700; 
 Sun, 24 Oct 2021 10:55:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c4sm6039468pfl.53.2021.10.24.10.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 10:55:02 -0700 (PDT)
Subject: Re: [PATCH 23/33] target/mips: Convert MSA 3R instruction format to
 decodetree (part 2/4)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-24-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <04e840a7-d768-4bdd-5a3c-633bee80eab0@linaro.org>
Date: Sun, 24 Oct 2021 10:55:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-24-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
> +static bool trans_msa_3r(DisasContext *ctx, arg_msa_r *a,
> +                         void (*gen_msa_3r_b)(TCGv_ptr, TCGv_i32,
> +                                              TCGv_i32, TCGv_i32),
> +                         void (*gen_msa_3r_h)(TCGv_ptr, TCGv_i32,
> +                                              TCGv_i32, TCGv_i32),
> +                         void (*gen_msa_3r_w)(TCGv_ptr, TCGv_i32,
> +                                              TCGv_i32, TCGv_i32),
> +                         void (*gen_msa_3r_d)(TCGv_ptr, TCGv_i32,
> +                                              TCGv_i32, TCGv_i32))

Use a table, like before.

> +{
> +    TCGv_i32 twd = tcg_const_i32(a->wd);
> +    TCGv_i32 tws = tcg_const_i32(a->ws);
> +    TCGv_i32 twt = tcg_const_i32(a->wt);

tcg_constant_i32.

Check for NULL and return false, then do check_msa_access.

r~

