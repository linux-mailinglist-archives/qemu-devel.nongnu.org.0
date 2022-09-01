Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7219B5A8D6B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 07:36:46 +0200 (CEST)
Received: from localhost ([::1]:53386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTcsf-00053M-9m
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 01:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTcoJ-0002iF-IM
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 01:32:15 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTcoH-0008TM-PP
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 01:32:15 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e20so20787518wri.13
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 22:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=xPo/HJqcbs7hKHmUufBbugonBYbl+DgQMOTTWkJxnSI=;
 b=oT3yubyJzA/K/Z9hxiTZuHjAfIqkld4yg4yaTt6SY24eJhUbZteEiQOCOfEUcp4NkC
 tgvBeOg+Hcobpi/hZi9unTLH+dsWyZ+7mjlw7QtFdb1OE1o91N+kaqFFrZWndHoodXt1
 E59uef7WHM1/92ffd5jCp/gWkNysQaENgXR6inW9lLAeNBlBbSOoQPaSk92ogtRZsWqH
 +vodjweF95XKtcuTwtso3XMrHhaDXO/Dp5mz7HJuxkOamkybzhHvUsa8X81gXceE/rd0
 BWbXoECchMsuEe5FOFdHkmyL5PbPAYrRa2gkrRVoiG/jy7Z5Dxg6I92pKAbSMl9XNaEt
 Vqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=xPo/HJqcbs7hKHmUufBbugonBYbl+DgQMOTTWkJxnSI=;
 b=uMiKc2hRbT54Yg673CdIb/sw7+Ole0yWvY+lvLm+cNZ05RZHSh3Gr7IajcpKmBsT0h
 UHWLGecbSGDrwEZ3flww4+TIlRdl0gRII/EMF6pPGYVYTOES4W1vbXNEK7mEkkv/aBYH
 gmnmhvI71Cu3KDOp8i0HEZd7/YpyqF+TwSE7OcNBx2AUBVJJ8deW3Tc810XQh2vd2VYb
 LOGjzIBZtX0bVx1nRq8416VbPQ/fi6pKwHW0wM2hsunQJM/VzPGWs2KzcWpNdxK0zy24
 aOcpwRhh6cwCyIyvMtN0/KWjzR6e8WJCg86A6aEJ3zF9zyyuVeOvvU3SuQmX96Min7UG
 e9xw==
X-Gm-Message-State: ACgBeo1BRHgJkuPS+Gpz1K/u3rol+2ST6iYs+n4cM8uBxJEpPtoHBSI7
 prmw0v5a5Kl7jDgPMUi79Zr61yHIt/dgHauKlLo=
X-Google-Smtp-Source: AA6agR5DqUowQjKNgWusZog1Ki1U+4W4FJ447/2q4jzD7FMLNodIpnYAF1uiBxLldSVYXGGrZpcd9g==
X-Received: by 2002:a5d:48d1:0:b0:225:3ee8:e5b8 with SMTP id
 p17-20020a5d48d1000000b002253ee8e5b8mr12835745wrs.105.1662010331250; 
 Wed, 31 Aug 2022 22:32:11 -0700 (PDT)
Received: from [192.168.30.105] ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a5d4346000000b0022520aba90asm13445397wrr.107.2022.08.31.22.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 22:32:10 -0700 (PDT)
Message-ID: <d2e49911-4aed-5031-f430-71d4e15b130e@linaro.org>
Date: Thu, 1 Sep 2022 06:32:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC] hw/registerfields: add `FIELDx_1CLEAR()` macro
Content-Language: en-US
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>,
 alistair@alistair23.me
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>
References: <20220901010220.495112-1-wilfred.mallawa@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220901010220.495112-1-wilfred.mallawa@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/22 02:02, Wilfred Mallawa wrote:
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> 
> Adds a helper macro that implements the `rw1c`
> behaviour.
> 
> Ex:
>    uint32_t data = FIELD32_1CLEAR(val, REG, FIELD);
> 
> if the specified `FIELD` is set (single/multi bit all fields)
> then the respective field is cleared and returned to `data`.
> 
> If ALL bits of the bitfield are not set, then no change and
> val is returned.
> 
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Why do these operations need to go into hw/registerfields.h?
It's not a common operation, since we've never needed it so far.



r~

> ---
>   include/hw/registerfields.h | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
> index 1330ca77de..5a804f72e3 100644
> --- a/include/hw/registerfields.h
> +++ b/include/hw/registerfields.h
> @@ -115,6 +115,34 @@
>                     R_ ## reg ## _ ## field ## _LENGTH, _v.v);              \
>       _d; })
>   
> +/* Get the max value (uint) discribed by `num_bits` bits */
> +#define MAX_N_BITS(num_bits) ((1 << (num_bits)) - 1)
> +
> +/*
> + * Clear the specified field in reg_val if
> + * all field bits are set, else no changes made. Implements
> + * single/multi-bit `rw1c`
> + */
> +#define FIELD8_1CLEAR(reg_val, reg, field)                                \
> +    ((FIELD_EX8(reg_val, reg, field) ==                                   \
> +      MAX_N_BITS(R_ ## reg ## _ ## field ## _LENGTH)) ?                   \
> +      FIELD_DP8(reg_val, reg, field, 0x00) : reg_val)
> +
> +#define FIELD16_1CLEAR(reg_val, reg, field)                               \
> +    ((FIELD_EX16(reg_val, reg, field) ==                                  \
> +      MAX_N_BITS(R_ ## reg ## _ ## field ## _LENGTH)) ?                   \
> +      FIELD_DP16(reg_val, reg, field, 0x00) : reg_val)
> +
> +#define FIELD32_1CLEAR(reg_val, reg, field)                               \
> +    ((FIELD_EX32(reg_val, reg, field) ==                                  \
> +      MAX_N_BITS(R_ ## reg ## _ ## field ## _LENGTH)) ?                   \
> +      FIELD_DP32(reg_val, reg, field, 0x00) : reg_val)
> +
> +#define FIELD64_1CLEAR(reg_val, reg, field)                               \
> +    ((FIELD_EX64(reg_val, reg, field) ==                                  \
> +      MAX_N_BITS(R_ ## reg ## _ ## field ## _LENGTH)) ?                   \
> +      FIELD_DP64(reg_val, reg, field, 0x00) : reg_val)
> +
>   #define FIELD_SDP8(storage, reg, field, val) ({                           \
>       struct {                                                              \
>           signed int v:R_ ## reg ## _ ## field ## _LENGTH;                  \


