Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BB26ECC3B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 14:44:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqvYU-00022d-5F; Mon, 24 Apr 2023 08:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqvYR-00022E-UY
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 08:44:27 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqvYQ-0007V9-Fa
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 08:44:27 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f178da21b2so45829535e9.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 05:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682340265; x=1684932265;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jWVEW4uESxyb2PKJ77ovPkBHc7ZhGyW0t1TF+mr0xJw=;
 b=u/bverxBFsmb+eQRGN67m9y14TquvN3bqN49aAfvRhWN18OvS8O8JL4BEC18JCqo7x
 ljMMC/pWfdxu1+Pge0EwgWFA1zpneXgOyBgfMNS/ZJJQzX7fb3Gby0u5v+4zeRxQYa9T
 ytbtzd0DYjxI+gW+nDEsPakrfAqR0g7bPSWu6HYH1lvquRYu84HYh17o20++wu6+9OCs
 jkkN+ykiSW0qJ5437y6tYBpHS8wR7GgNnQLoJl2DOuPC5i1TzfJb32iXvm9oFCjLBiLv
 K1ttrQ5gL6pP/YjIRxcey/Xtb71y3JugCR4wdP4tEKEG6zgtK1l/nZw6Zb1hSISIPPOF
 bXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682340265; x=1684932265;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jWVEW4uESxyb2PKJ77ovPkBHc7ZhGyW0t1TF+mr0xJw=;
 b=GQWrSa/BxKxXPiN3JA27qApJ/YrYMfEVMF+akwZSTyHi6U5yC4TCDdwSS5fG26sp6t
 XODhdIdeI3+XUR9JMKUHJuI3Wc4pG+j3iRwdJCCA0L75CFUmknUm+DHDcL4PdtGxzLHG
 0jcXaS9iTq05Wfnt593oA493IxvCPntYNbOsW1ph6ap35anUDqRV825CWEZwnzuY1iTw
 YfvlSWUwNjNAfa6YfDNGOSCW3IF4amABVvrJ+Q1uigZYx38XavfqiQR47ug3oJ6JftR4
 +TJlGVbyROtKsDJE6acVZKYaoZZhgDSKqOGu4jj1RHKkO0p2Ux2K5syI3YdsJPbJo/os
 xkpw==
X-Gm-Message-State: AAQBX9cLkES32f6z2wJ7nB8qyClLnQBfNncB81NMX21HO0LtHD897/Ig
 cZMgsAwmZ6qgjevZVrHTMuyi49n2fkTwjIibeWtYYQ==
X-Google-Smtp-Source: AKy350Z40DbehPX3cpxr0fMGGdEPA7ijBc1QqzWD7ptHEJv6/wlclBmgD9wkVGT3fzoDrd2RZptDPw==
X-Received: by 2002:a1c:7908:0:b0:3f1:6ead:e389 with SMTP id
 l8-20020a1c7908000000b003f16eade389mr7777281wme.30.1682340264646; 
 Mon, 24 Apr 2023 05:44:24 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b003ee5fa61f45sm15546895wmq.3.2023.04.24.05.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 05:44:24 -0700 (PDT)
Message-ID: <005598db-125a-01c6-9ca8-c9321c3aa99f@linaro.org>
Date: Mon, 24 Apr 2023 13:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 14/44] target/loongarch: Implement
 vmul/vmuh/vmulw{ev/od}
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-15-gaosong@loongson.cn>
 <691b8b09-6bc5-82db-f4c3-103fd98c406a@linaro.org>
 <14bbe700-0611-f2ed-556a-9aa4a12d318b@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <14bbe700-0611-f2ed-556a-9aa4a12d318b@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
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

On 4/24/23 12:25, Song Gao wrote:
>> You don't need these.
>> Just reverse the operands to the existing tcg_gen_mulsu2_*.
>>
>>
> Ok, I'm just trying to unify  "u * s " to the macros VMUL_Q and VMADD_Q.

Then create local wrappers:

void tcg_gen_mulus2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 arg1, TCGv_i64 arg2)
{
     tcg_gen_mulsu2_i64(rl, rh, arg2, arg1);
}


r~


