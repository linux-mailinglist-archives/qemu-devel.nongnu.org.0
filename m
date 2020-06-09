Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627F41F4269
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 19:34:55 +0200 (CEST)
Received: from localhost ([::1]:54148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jii9G-00084e-88
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 13:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jihkv-0006xM-6q
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 13:09:45 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:39405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jihku-0000DG-23
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 13:09:44 -0400
Received: by mail-pl1-x642.google.com with SMTP id v24so8276955plo.6
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 10:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Y1hvilM3ehM1O7SDVC1CgZ+cyVVAOKi+IJQuYCb5ono=;
 b=MQHPWlgk9QVf9bLJr0b517ZFhLMXtjgbE+yD+teVWxsByNmNVO3sd7B5JeylRRYXXf
 K/e6CXHSsM4Dw5Wyp0sOqmgV26Pbv2nGgNO7sNUG/gd1ygBdKITbT+XRpGHI7DxSUh+B
 GfS2xC69wwqtvCnpuJ/uUxujA9h6O7IoZumGKIWq12vmLGJgj0/hQqVhWr51yXaBf7J/
 RFi0c/j0chbs8GdWSTPrgTD4VI74TMQh9ehIF7PS6RP9kZll+5sfAk6Ja18N7r/9DMjY
 E0PfgmCqm2W4m9cTBNMk/ElO2eouz2MuPr3Dw40xincSQFht3haSIVFBUQV3Yzk1EuWK
 I5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y1hvilM3ehM1O7SDVC1CgZ+cyVVAOKi+IJQuYCb5ono=;
 b=DmYDbg9iuzE8juhMLC+hUAO7sYALGK2G3xumwI5ufENasrwxM/anfxkTjCOsXrvRKO
 +q9uhe8SGiHuQH5VeecXjYpuGFcK6+4c7/pI141drb7TwOEIHD0beUSo9m1F2HlW0cU2
 YoIB5sc1Zr1BfB04jN272ThwMpG+oc2gUkd1OB1s93lvC1J4wKwqhUey2hCgF8fxdM6i
 Fxow8sYZU5fD7IZtgCGBE341WUvzLsrnXTZVZMreXFwogwQNUJIuMAm/tYbYNsOijkKA
 psiLlv1hOVXFOuOFYHuZfyt3cwqnRvaZWCBKM/2vIqs4WlkZqmes74hM87p6XjuT04Bt
 /3mQ==
X-Gm-Message-State: AOAM533PGxePZ8Sqwa34BZW4EWIoUTpw+0IQSZ4tYujJqKJSzrd7kYIE
 UupUFomYss09m4hQyDZMc+m4cpRyr8o=
X-Google-Smtp-Source: ABdhPJxFZWS6/iR8QdBCSxw/iyC1xT4Zz3T+tJueFUM7eVr2gKjFVnrP1DlJ9oOy+7bp1Pr7kxSt+A==
X-Received: by 2002:a17:90a:ad03:: with SMTP id
 r3mr6002420pjq.104.1591722582203; 
 Tue, 09 Jun 2020 10:09:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id w18sm10582175pfq.121.2020.06.09.10.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 10:09:41 -0700 (PDT)
Subject: Re: [PATCH 1/7] target/arm: Fix missing temp frees in do_vshll_2sh
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200609160209.29960-1-peter.maydell@linaro.org>
 <20200609160209.29960-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4cfdc2ae-4766-841c-5fe8-1b7c09ccbb34@linaro.org>
Date: Tue, 9 Jun 2020 10:09:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609160209.29960-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/20 9:02 AM, Peter Maydell wrote:
> The widenfn() in do_vshll_2sh() does not free the input 32-bit
> TCGv, so we need to do this in the calling code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> ---
>  target/arm/translate-neon.inc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
> index 664d3612607..299a61f067b 100644
> --- a/target/arm/translate-neon.inc.c
> +++ b/target/arm/translate-neon.inc.c
> @@ -1624,6 +1624,7 @@ static bool do_vshll_2sh(DisasContext *s, arg_2reg_shift *a,
>      tmp = tcg_temp_new_i64();
>  
>      widenfn(tmp, rm0);
> +    tcg_temp_free_i32(rm0);
>      if (a->shift != 0) {
>          tcg_gen_shli_i64(tmp, tmp, a->shift);
>          tcg_gen_andi_i64(tmp, tmp, ~widen_mask);
> @@ -1631,6 +1632,7 @@ static bool do_vshll_2sh(DisasContext *s, arg_2reg_shift *a,
>      neon_store_reg64(tmp, a->vd);
>  
>      widenfn(tmp, rm1);
> +    tcg_temp_free_i32(rm1);
>      if (a->shift != 0) {
>          tcg_gen_shli_i64(tmp, tmp, a->shift);
>          tcg_gen_andi_i64(tmp, tmp, ~widen_mask);
> 


