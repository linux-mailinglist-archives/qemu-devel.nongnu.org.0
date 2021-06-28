Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625413B6568
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:25:16 +0200 (CEST)
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxt8N-000535-Cp
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxt6s-00045K-SR
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:23:42 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxt6q-00060D-OY
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:23:42 -0400
Received: by mail-pg1-x532.google.com with SMTP id u14so9287085pga.11
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=EM75SH72X6nzVFHlkR2fXFfltgBEftsK66XNTB1+8h0=;
 b=ObcNXqD1fNMIyJKxT1JmJv8duHRjnyGkbfGN8Kb01YyfOEJH6UouqVEiTqTtCDs8hB
 0jYdXVfK1K/HbovorrxVloFv9mA2YQ0aUwOoxjntDcyN66RBo/FXFqOc45hURjgs13C3
 Vv6AaCeMj6/5pK09VClR6duaeSS31uIra0z65AwDKr8IOnOs7Ojc47EHo8Yzk5h9i3dH
 IbCzkP/V19P1ubZ64kkL6llRuVJVWyCRWYVUHPX1LgzLplQrYO0ThPBZAeFWFuJN4Cba
 p+DI3Kh9UNZHmyc5HReL+V/mkNGNswaNfiir4Yt2QPVt7LO+8JdZ9HgjKA6u7QVsba7y
 Nqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EM75SH72X6nzVFHlkR2fXFfltgBEftsK66XNTB1+8h0=;
 b=arObypwLW+bosTxwqz1A+A6xdNL3L+hzZDYx6XoJ64wTnwgCJRfbZER/iU/3gD9yOp
 t6pXoLPg3Nb94lZcwyhLejikis8HuPC+D+LFioulDHOzf2GUZ7v5gGnhGEMXTEfB/bac
 piah3+AQ0w3Iesz33N8Z+EKU1Yg/ePfoZdG4Aq3nadfcwFb8yr33hwXGzOzA83cRwXob
 lOM6TjAknhKd6T7+gqL3m9C42e0jYbJEd8Y/ghDqCl0wxF4U2xAo+c5ajFbu+/GZ1GQK
 ie6vMc/m+qX1giVwdz9wgOneE6qFAFcm4TG8TS5ZKss72t4SK+KSOMB/CeZWDkBM82WL
 zkeg==
X-Gm-Message-State: AOAM5336paFlIuLcuqxmGX6+t1ajUZyInmyer3pWMAoLGug/V6WjYb7g
 XmZzDarrYwcFMmE2kl4vjzlWSpQbcYnLBw==
X-Google-Smtp-Source: ABdhPJyYvzqQ2PRiluKHBpRjTUNBXOK9daGTjczPeAiu8NjtVxvr3u5j1FMmdpol2+O2SdxdGSzgRw==
X-Received: by 2002:a62:3244:0:b029:308:22b0:52ff with SMTP id
 y65-20020a6232440000b029030822b052ffmr23063528pfy.68.1624893819369; 
 Mon, 28 Jun 2021 08:23:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v11sm26820pjs.13.2021.06.28.08.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:23:39 -0700 (PDT)
Subject: Re: [PATCH 05/18] target/arm: Use dup_const() instead of
 bitfield_replicate()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6518b92-2e56-61f1-0409-7467927a2390@linaro.org>
Date: Mon, 28 Jun 2021 08:23:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Use dup_const() instead of bitfield_replicate() in
> disas_simd_mod_imm().
> 
> (We can't replace the other use of bitfield_replicate() in this file,
> in logic_imm_decode_wmask(), because that location needs to handle 2
> and 4 bit elements, which dup_const() cannot.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a64.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

