Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4069E43D876
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 03:20:25 +0200 (CEST)
Received: from localhost ([::1]:49988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfu5g-0002T2-3M
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 21:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfu3B-0001Pm-4l
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 21:17:49 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:40450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfu39-0006Rz-27
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 21:17:48 -0400
Received: by mail-pg1-x534.google.com with SMTP id l186so4728893pge.7
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 18:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=erN9jX02oR/oPE/aO3CyXsOg2hUB6blYy9Nukrz1qw0=;
 b=IZdryRibBktWR0UOio/j43OwHtXFrcydqD0v9rAefJFrMvpD6nEbmaCaKZfTotHgHA
 j0Ua5GuhnY74cDIihuAyVTFv0kkL48OAUwYI6emkZaVOBBJY9PvseCYaXVGB/v9EXqwn
 s7DaB75aUslqw6IasWXVcuG5l3mXg7yYtssl2Aw3VSjClKEOKDD1g46hzZdMoQzOUr8K
 Vwv8ZJcTjwlNul8lEWZcDvHaAtlNdLHAbQFZYaaAawuIPqvBkalvxguJ4nOH67tkyU2r
 M6IqbiremkUvzdNpkqubhE53t49G0jIyTOo95q4nQwa45TOBfnhw6sXDfzHmTTcmrSpJ
 Q3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=erN9jX02oR/oPE/aO3CyXsOg2hUB6blYy9Nukrz1qw0=;
 b=foADmtKS9eftsG8jah+ObqIIbUN0Yta9Z0oKbIRfD/Yn91UUmBnrbgJNQ1dEf7Cqsr
 zSN1bYc7LNsyyTKIam9kbPeim3cSrIX2nkeALMr9Ao8SJVaxZ0F/LstbEwGY21yj1fIs
 mgrlTYeyPVVzNMQhD4zvKVf8AmvQTtVWEb5K5RIVCh4i43U3hwsAchNFWSLKlx0VPM90
 BoIimfwwJO/12u7hGrePhBpvpEI1/0mOgwAKrOxYB7nQsfulQbrB6DFbJRIZ7KNsSUnM
 BYqjI0vHaRnFNIntwMcUcP/V2QyfmZEgZpTcrGe+zEv617XyNnoCNgr6Vv9GrcT41wf0
 Od9g==
X-Gm-Message-State: AOAM533LMJKOzjQXkz+vSyWMUUYvQr+THteZWbMsCtIV1AfGTMO2+soA
 o6XdNVA0haqPpTFpNr9grjRR9A==
X-Google-Smtp-Source: ABdhPJy3Ii4woqp94gh4skThCPkNsFVDHuwH/tMHgRlgU0/4v4oamLrvW/tk5XcoNE8hTjcZbhdtbQ==
X-Received: by 2002:a05:6a00:16c6:b029:32d:e190:9dd0 with SMTP id
 l6-20020a056a0016c6b029032de1909dd0mr1193133pfc.70.1635383865388; 
 Wed, 27 Oct 2021 18:17:45 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h3sm1163157pfi.207.2021.10.27.18.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 18:17:44 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] target/arm: Introduce store_cpu_field_constant()
 helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027045607.1261526-1-f4bug@amsat.org>
 <20211027045607.1261526-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <267b4bdc-8311-cc18-afeb-5e98aea5a3ea@linaro.org>
Date: Wed, 27 Oct 2021 18:17:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027045607.1261526-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 9:56 PM, Philippe Mathieu-Daudé wrote:
> -static inline void store_cpu_offset(TCGv_i32 var, int offset)
> +static inline void store_cpu_offset(TCGv_i32 var, int offset, bool is_temp)
>   {
>       tcg_gen_st_i32(var, cpu_env, offset);
> -    tcg_temp_free_i32(var);
> +    if (is_temp) {
> +        tcg_temp_free_i32(var);
> +    }
>   }

You don't need to change the function interface; tcg_constant_* is ignored by free.

> +#define store_cpu_field_constant(val, name) \
> +    store_cpu_offset(tcg_constant_i32(val), offsetof(CPUARMState, name), false)

But this could become simply

     tcg_gen_st_i32(tcg_constant_i32(val), cpu_env,
                    offsetof(CPUARMState, name))

without the wrapper inline.


r~

