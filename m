Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB8C345229
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 22:59:34 +0100 (CET)
Received: from localhost ([::1]:34892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOSaD-0005t5-Cj
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 17:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOSY8-0004Yr-Oo
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 17:57:24 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:38534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOSY7-0006kV-61
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 17:57:24 -0400
Received: by mail-qk1-x731.google.com with SMTP id c3so12320636qkc.5
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 14:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8r0SGdjIcTSJeUVWLtaWdIG9yYWJO5U5+afdk4ZdFU0=;
 b=umFj2My1PxKkX4NOLT5HOa7mgn6inyH9I79KGX76+TZVdxB6sI5uice/5ypaqeVpDh
 y5BvKYXsEqSWBWgPNLf521fgNCW975MJ8MmqkVvqdXKXB1tdkVgKjFXH6F6Nj6lU/bof
 1N8NV23Bd5lu6SIa5RSqW8N2dKesZNCv+KaKUSG/YANjRFACEitgSqrVb74IOosPa1YL
 ppJu9QOBzSxnqvp10IJv9+kytAJwUgjixWhu0Le65/m6QOosYK+C6Wqn3DyFUCbwRNIQ
 R1tugmVPpaoIybiqY7DY6Lhrq7SVZlP7BmxyF5lyPuU/JYZahAlDZcuJEXjnLc9XfGRo
 Fxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8r0SGdjIcTSJeUVWLtaWdIG9yYWJO5U5+afdk4ZdFU0=;
 b=gAYjy1g97DFJmWWS307waFSkjcFdrqHHICYmgv2LzOrheSDFF3a0KgeHognf34GbV6
 J24Q0fJsRJtMyMyhv+GL7+oOt0FbwX66pjfzqL66mnMctPK/nDlV7RC2UxiO8cg28ulQ
 uN57G/4mzhvYYkmLHQO8Krlca8d5MyHVJgxG93/vyaK/+4Mvxf0bGho7xRLX7pkayLQq
 lMx1gGaH8YBM0+hc1IAVscBwKV+PIgh//9ju1ORdK0/Wx2ocUDYoIAcLUzBB0N0Ux9+L
 3V4+il5C9hjjsyh9D3flM4Y2rgIjiq9X4JYE5pUDOmMnXYVA2KlRJA5iElJBcL6Pw570
 BAgQ==
X-Gm-Message-State: AOAM530duEMy64yrQPoa1C3yDo32euVU5qptdW2i3wJBeyhxqfjs7N1p
 crSYmdn5SwBnO3ZrGpphNxq2Iw==
X-Google-Smtp-Source: ABdhPJy9pg/HzB6XprEMdQgW7w0u0AA7deKpbWQWvEVOzJCwqeeE+TSL3u50mBWn+wIoY8MC6WYeYQ==
X-Received: by 2002:a05:620a:244f:: with SMTP id
 h15mr2193250qkn.235.1616450242072; 
 Mon, 22 Mar 2021 14:57:22 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id k127sm12210385qkc.88.2021.03.22.14.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 14:57:21 -0700 (PDT)
Subject: Re: [PATCH v2] target/riscv: Prevent lost illegal instruction
 exceptions
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org
References: <20210322121609.3097928-1-georg.kotheimer@kernkonzept.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a0b7172c-0559-0c90-6491-c58dda430b1b@linaro.org>
Date: Mon, 22 Mar 2021 15:57:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210322121609.3097928-1-georg.kotheimer@kernkonzept.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 6:16 AM, Georg Kotheimer wrote:
> When decode_insn16() fails, we fall back to decode_RV32_64C() for
> further compressed instruction decoding. However, prior to this change,
> we did not raise an illegal instruction exception, if decode_RV32_64C()
> fails to decode the instruction. This means that we skipped illegal
> compressed instructions instead of raising an illegal instruction
> exception.
> 
> Instead of patching decode_RV32_64C(), we can just remove it,
> as it is dead code since f330433b363 anyway.
> 
> Signed-off-by: Georg Kotheimer<georg.kotheimer@kernkonzept.com>
> ---
>   target/riscv/translate.c | 179 +--------------------------------------
>   1 file changed, 1 insertion(+), 178 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

