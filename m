Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7838B33283D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:13:16 +0100 (CET)
Received: from localhost ([::1]:34030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJd6p-0005Tn-H1
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJd5R-00048I-DH
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:11:49 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:40269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJd5N-0007WE-SC
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:11:49 -0500
Received: by mail-ot1-x330.google.com with SMTP id b8so12898110oti.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5d6h/oI05GGkXzLRzzB+ytQLWVabxb3ZgNJ5byndeWY=;
 b=Ksa8GLJud2pA4O7d1v5uF/NlR0JQU0Z5rJ6KWtpJcNf0Wts7CudaoUyjbox3TyUie5
 u9cIn5m+GeK0sKvhJJQ0fwJwsJX55HKFCiN/EgEjdNv4MpLNQX59DX2VDxTh1DW+EJS/
 3o4sBaEe5U/O9+JsGHkkOQeSPY/maKr61g9zHmH6T0ITr1I5WdUJ9LivlnonEw15y6a5
 yOoFIL33mEXc9iylCovoMq+9NAlNLjtJqu+AXK/tiYXJbfwuZdqkqHpSl64oYIIAp8YO
 GiIdfWgu0g5qP1BI5Xi+Gjg2dctziMO3+ymiLaK190nwexXKIckIQGZqenBWB04QASY0
 vV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5d6h/oI05GGkXzLRzzB+ytQLWVabxb3ZgNJ5byndeWY=;
 b=Nc/CTfMatbJGjKyTQSpUxgQXtBdzAGQks/uqmCgUfup/hgUNV5kFm+O+GN60Ax8C8K
 3CC0AyhYcREe77fSLNhs1GvNqYmWYXae4UyEpcAPJ4oITmcfjS5THf+kKNRVbsmSp36X
 52L0n6aMmwF/dv/EgjsFcwBywnidYUadAPJA6wBxdsY0KrEZvbKOIgoUx7gAUPNQu+9F
 zcoaVFbkKRMFU323H8EOCvQEnNmoqth36Gu8aupsyWKCtsoA3GD9zy6osZ0SmyeCCzAt
 Q/kyjl3WMnbsh+5X5uwGyJcXejFRrhLvIWotOE+pr1AGpFoPeqq7x1JqTQrUAdZFCouX
 NJhg==
X-Gm-Message-State: AOAM530zol0XwESF/aicbW/f0BkX2M52zLzH/HttRHyn5C/+/27vKWGv
 kLa2m3t0ZYhfIE3A7C6EX5X15g==
X-Google-Smtp-Source: ABdhPJy72fkbiuw81RhmCfcG90mseFPomxXWmLKFJG9OwsCacar53MSPgNPG7GjVL6vbo1CmVjpY/Q==
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr22561066otk.367.1615299103757; 
 Tue, 09 Mar 2021 06:11:43 -0800 (PST)
Received: from [192.168.3.43] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j19sm3111437oie.6.2021.03.09.06.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 06:11:43 -0800 (PST)
Subject: Re: [PATCH] target/mips: Use gen_load_gpr[_hi]() when possible
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210308131604.460693-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b8a3d08e-7fb1-55fc-402b-cf1f313d0eb3@linaro.org>
Date: Tue, 9 Mar 2021 06:11:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210308131604.460693-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 5:16 AM, Philippe Mathieu-Daudé wrote:
> Use gen_load_gpr[_hi]() instead of open coding it.
> 
> Patch generated using the following spatch script:
> 
>    @gen_load_gpr@
>    identifier reg_idx;
>    expression tcg_reg;
>    @@
>    -if (reg_idx == 0) {
>    -    tcg_gen_movi_tl(tcg_reg, 0);
>    -} else {
>    -    tcg_gen_mov_tl(tcg_reg, cpu_gpr[reg_idx]);
>    -}
>    +gen_load_gpr(tcg_reg, reg_idx);
> 
>    @gen_load_gpr_hi@
>    identifier reg_idx;
>    expression tcg_reg;
>    @@
>    -if (reg_idx == 0) {
>    -    tcg_gen_movi_i64(tcg_reg, 0);
>    -} else {
>    -    tcg_gen_mov_i64(tcg_reg, cpu_gpr_hi[reg_idx]);
>    -}
>    +gen_load_gpr_hi(tcg_reg, reg_idx);
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

