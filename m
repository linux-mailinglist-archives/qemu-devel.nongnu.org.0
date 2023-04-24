Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFC26EC6D6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 09:16:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqqQ2-00024W-7H; Mon, 24 Apr 2023 03:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqqPt-00024E-Vr
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 03:15:20 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqqPq-0007gg-W5
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 03:15:16 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2fa0ce30ac2so3689735f8f.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 00:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682320513; x=1684912513;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wVxCUSS+12vVV+NOer+tRZF+C6fe+FYqLmKVrTS/lEQ=;
 b=BDNdFJ28qMHQWb4f9jQW5eJ8iDiDK/qJ3d/9HcKyoM3eeiRCi3QvTgR/KhIUD0uVDg
 ytGPBJxDsKw7KvSbxt/T5hlA9GYOEx3MfQCZUxCXMt9dNpLh3S8qK/v69KLKf54Ood9+
 Tqr1esZ5ec8Qksx+34x2YcNEVQV37Bwf/m1x34S92f7b3fxfycJenGF+rUBFXQFJigIs
 Gg5c0EvhPEJWSl0qZElPfC2tHgbtKTBIpANPYCYBHPQsfjQaw0wZuNANvvfT352EiApt
 3eY0F24z6YQsp82E+l4F3ManCX9k4q38JqWCVorGit8fj/Kw5MZ8oRZp3XNqeTnvqnUo
 QasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682320513; x=1684912513;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wVxCUSS+12vVV+NOer+tRZF+C6fe+FYqLmKVrTS/lEQ=;
 b=iISBdBNid/d1/9ewcpur6xvE6U3yyRKlmB5thEVvX4sCqOZ30cRSxeg0qkuzdU6F8G
 Duk+DkFUNlSF+2yrQl3+pTMqmwA4gVxjsGPSkc3GFFLHfjIlfM0+f2dKtO/YLGKvmKb+
 vIptYE2xp77o9Ne0B6N/h3mM/3Gf8ENBELGSgiS7vCWbwiipNSxa5J8np/Ezly7A5yNQ
 nT6pmFyNveoYK/eyMx6d4doWqrX6MPix6mDxzObsv5LrfP6W0b/PvV1szaWCnxiDfYYX
 L1cIc/pcBVR6zv5aUGPKDzu7Xn8jds6P8d9uwg0un0gX3Z3/Tuu1l9dLL6O93tuFtcu2
 tiJQ==
X-Gm-Message-State: AAQBX9cr9weekj9Z1RBYfx+wsZdUo8Wj88LuF0RClfstiMqLumYdD7/t
 xahQ+JYXR2gP1W9mYicsMZHFDg==
X-Google-Smtp-Source: AKy350awwUxDI1YDHfzySKBp98yWsgQssdHd7wz/p4vdVnZO1JW0Tt/c25BufIsjSTKA2OWA7uU9rw==
X-Received: by 2002:a5d:5960:0:b0:2f9:9f6f:e4d with SMTP id
 e32-20020a5d5960000000b002f99f6f0e4dmr7667998wri.39.1682320513351; 
 Mon, 24 Apr 2023 00:15:13 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 i3-20020adff303000000b002f4cf72fce6sm10161244wro.46.2023.04.24.00.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 00:15:13 -0700 (PDT)
Message-ID: <691b8b09-6bc5-82db-f4c3-103fd98c406a@linaro.org>
Date: Mon, 24 Apr 2023 08:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 14/44] target/loongarch: Implement
 vmul/vmuh/vmulw{ev/od}
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-15-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420080709.3352575-15-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/20/23 09:06, Song Gao wrote:
> @@ -972,6 +972,33 @@ void tcg_gen_mulsu2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 arg1, TCGv_i32 arg2)
>       }
>   }
>   
> +void tcg_gen_mulus2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 arg1, TCGv_i32 arg2)
> +{
> +    if (TCG_TARGET_REG_BITS == 32) {
> +        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
> +        TCGv_i32 t1 = tcg_temp_ebb_new_i32();
> +        TCGv_i32 t2 = tcg_temp_ebb_new_i32();
> +        tcg_gen_mulu2_i32(t0, t1, arg1, arg2);
> +        /* Adjust for negative input for the signed arg2.  */
> +        tcg_gen_sari_i32(t2, arg2, 31);
> +        tcg_gen_and_i32(t2, t2, arg1);
> +        tcg_gen_sub_i32(rh, t1, t2);
> +        tcg_gen_mov_i32(rl, t0);
> +        tcg_temp_free_i32(t0);
> +        tcg_temp_free_i32(t1);
> +        tcg_temp_free_i32(t2);
> +    } else {
> +        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
> +        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
> +        tcg_gen_extu_i32_i64(t0, arg1);
> +        tcg_gen_ext_i32_i64(t1, arg2);
> +        tcg_gen_mul_i64(t0, t0, t1);
> +        tcg_gen_extr_i64_i32(rl, rh, t0);
> +        tcg_temp_free_i64(t0);
> +        tcg_temp_free_i64(t1);
> +    }
> +}
> +
>   void tcg_gen_ext8s_i32(TCGv_i32 ret, TCGv_i32 arg)
>   {
>       if (TCG_TARGET_HAS_ext8s_i32) {
> @@ -2634,6 +2661,22 @@ void tcg_gen_mulsu2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 arg1, TCGv_i64 arg2)
>       tcg_temp_free_i64(t2);
>   }
>   
> +void tcg_gen_mulus2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 arg1, TCGv_i64 arg2)
> +{
> +    TCGv_i64 t0 = tcg_temp_ebb_new_i64();
> +    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
> +    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
> +    tcg_gen_mulu2_i64(t0, t1, arg1, arg2);
> +    /* Adjust for negative input for the signed arg2.  */
> +    tcg_gen_sari_i64(t2, arg2, 63);
> +    tcg_gen_and_i64(t2, t2, arg1);
> +    tcg_gen_sub_i64(rh, t1, t2);
> +    tcg_gen_mov_i64(rl, t0);
> +    tcg_temp_free_i64(t0);
> +    tcg_temp_free_i64(t1);
> +    tcg_temp_free_i64(t2);
> +}

You don't need these.
Just reverse the operands to the existing tcg_gen_mulsu2_*.


r~

