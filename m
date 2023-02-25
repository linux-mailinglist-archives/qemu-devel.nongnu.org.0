Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C145F6A28B8
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 11:06:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVrRI-0004V2-UR; Sat, 25 Feb 2023 05:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrRG-0004SM-N1
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 05:05:58 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrRF-00081E-47
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 05:05:58 -0500
Received: by mail-wr1-x430.google.com with SMTP id bv17so1593207wrb.5
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 02:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Athv/HWH3PgNsK86NyuJZbTlt52/a98VfzQx20sMzg=;
 b=G/jeV9iHKacMNExvQrwu4ORWlXr9Q+Kcfjd9dDfEHqOdYCKW6JhgGMnY7C0pMntn9E
 rKdxUHUUabjqnAfyObPiPkgxEFMmKlFWBiYnZYCWv8BvizLhOY2EORucprcfGTqwukTz
 UCId9lWPQhiI3PQdUs8Nlkyl9CnLFRQx9ULP5rw7CeRYQPAnhOuiM4atBGQIewcIX7d3
 YlV7zkPy3VJCS3UskRGf0K5UpaRyBSpJF0/T8RjerPdvcKK1FVpf1UduF0r6H89Z6vU4
 RtsBqZMJIke2TYSscMUglkiqFmctq2fH1oFfvW8p5TBhwJ7rcTwc7++DReK7xMnM3mSx
 QUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Athv/HWH3PgNsK86NyuJZbTlt52/a98VfzQx20sMzg=;
 b=myBtz2bkYSvcvkigDt1T3KO1wUgbu3SLWAN4ZkAXPynF5a0vCHWus+IQ6F46rvuT1C
 ggee/CLmw0DeoVK/eBO/8IFif2N6sc+wZZuP1MMWbX2/7AUu/AwtjgxlIVIXCIQGT4zj
 Rud/GdGSsdY/01M3fzj05D0HQ7X3yJrps2v/w8QhSTpcEAVNEqAm2vYFWCmvOZws1uNy
 7PALAf8EqE58RwsI5EWR0lr7AQQ9/F5pJPolF1IWSjRW9hqEv/wa+MiDXHpYbeA0d4jj
 AuBwzx36ePaelZtd+/0BySGKVo5Md7IQA1Bz40BqEKKxqoTqdwJMPg2slixWngk/ONin
 FXFA==
X-Gm-Message-State: AO0yUKWtzAPj8atVuYN68IClGypNw2+yosO4oIIOc8uTI+3Thi5w44FU
 m9XaPUzWG3NjNkTd6MrbU6XEOQ==
X-Google-Smtp-Source: AK7set8sZwrC4EL+LEpvqp+IhULbY96YRQAseXs1dDBfpfsXocQl3zsIcna0JbgcgVpOqAjlOo++LQ==
X-Received: by 2002:adf:dccc:0:b0:2c7:1070:e3c2 with SMTP id
 x12-20020adfdccc000000b002c71070e3c2mr8487045wrm.66.1677319554550; 
 Sat, 25 Feb 2023 02:05:54 -0800 (PST)
Received: from [192.168.136.175] (120.red-95-127-35.staticip.rima-tde.net.
 [95.127.35.120]) by smtp.gmail.com with ESMTPSA id
 w13-20020adfd4cd000000b002c7066a6f77sm1316462wrk.31.2023.02.25.02.05.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 02:05:54 -0800 (PST)
Message-ID: <93fb111c-818e-d644-d132-41b6d0cd0fb9@linaro.org>
Date: Sat, 25 Feb 2023 11:05:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 20/30] target/arm: Don't use tcg_temp_local_new_*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
 <20230225085945.1798188-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230225085945.1798188-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 25/2/23 09:59, Richard Henderson wrote:
> Since tcg_temp_new_* is now identical, use those.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/translate-sve.c | 6 +++---
>   target/arm/translate.c     | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 02150d93e8..718a5bce1b 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c


> @@ -4342,7 +4342,7 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
>           tcg_temp_free_i64(t0);
>       } else {
>           TCGLabel *loop = gen_new_label();
> -        TCGv_ptr tp, i = tcg_const_local_ptr(0);
> +        TCGv_ptr tp, i = tcg_const_ptr(0);

Can we directly switch to tcg_constant_ptr(NULL)?

>           gen_set_label(loop);
>   
> @@ -4427,7 +4427,7 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
>           tcg_temp_free_i64(t0);
>       } else {
>           TCGLabel *loop = gen_new_label();
> -        TCGv_ptr tp, i = tcg_const_local_ptr(0);
> +        TCGv_ptr tp, i = tcg_const_ptr(0);

Ditto.


