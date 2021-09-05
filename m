Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391CA400EAA
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 10:15:29 +0200 (CEST)
Received: from localhost ([::1]:44490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMnJH-0000bN-W0
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 04:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMnFo-0005si-4V
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 04:11:52 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMnFm-0003FI-2p
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 04:11:51 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b6so4917506wrh.10
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 01:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SD2fP0VM9vv5BuVwWwyDIqG5x8aX5WY+0NG7VDMad6U=;
 b=E1REL/l4BfJwUSo07XWtMamvmuaykY+g+4IkkTAnF1/QAbg2pP8xrUSyz1sAYvY6p8
 XyCFzXwc9X0cQZuUpMk2s7eXqrytWZ5ExnY8idHxX/bOqPF9xL0paEaffdAsMunI6kZv
 Kr6IdV+pTmB9IM/5lo+A9aAcisA4/T0ZKgBvQI5t4Yhk8SemwN6VZ/SC2gvrgyMgAR54
 0z2oD5SXF5q3km4GfEFFbEd9oHK7sihgA4dY/45iW8KVK7AEcBcpYTOz6Q12Ms2+Urim
 MuqgUvvUhliY3gncFnTZ0Jh+BcgJ3hg8jSLj/Ho7BEc29FscjBJJDvrcHbA++PrCMqgc
 vsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SD2fP0VM9vv5BuVwWwyDIqG5x8aX5WY+0NG7VDMad6U=;
 b=dxY0mqsRe5J1nUKny1bdC9Pvd+gV8NoeumWm0AivoMlbzwkkRl7kXPjMTFPihaBD57
 zgJXHp0hou2QGcAlqtAi9pmhB57E3h74fiZV1S1zf4jWSw5fZUyevCzEXsXz5pS0yurR
 xbTWC2HlCI42RVE9TAFB6p8YOU95fzU25qdtWnaM4iswxWky6C9rjsfQxrzUBfN2Bytl
 KHIgxpa342sXWwTFBQaAuqx3+p6bQ5ihax7lra9VjsRB2Y/S2wUuNg7c5+wC+yuKR2c6
 ioFkojtpfItPKEmKBdPkjuq/kAWfhHbTyj2pDmVzTL71IIRcmg4LOCrb7ZUdShkV760I
 ru1g==
X-Gm-Message-State: AOAM532rfvGkMBCkfQMYB/Llm8XsxuTUUPK35JHnJegDAF+sUpFkGgqm
 GJGYC4p+1V3P+Of4iedetrdavg==
X-Google-Smtp-Source: ABdhPJyJTU/URCXz9ZQLEfSGad6zA2mADaOc2mHV3bgT58aL9LeLVNSWgwIVfi1BfAzprwQTvDh1Nw==
X-Received: by 2002:adf:9f4b:: with SMTP id f11mr7432043wrg.337.1630829508314; 
 Sun, 05 Sep 2021 01:11:48 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id l2sm4012303wmi.1.2021.09.05.01.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 01:11:48 -0700 (PDT)
Subject: Re: [PATCH v10 03/16] target/riscv: clwz must ignore high bits (use
 shift-left & changed logic)
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-4-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3e608998-3270-cf41-66b5-32158db99de0@linaro.org>
Date: Sun, 5 Sep 2021 10:11:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210904203516.2570119-4-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/4/21 10:35 PM, Philipp Tomsich wrote:
> Assume clzw being executed on a register that is not sign-extended, such
> as for the following sequence that uses (1ULL << 63) | 392 as the operand
> to clzw:
> 	bseti	a2, zero, 63
> 	addi	a2, a2, 392
> 	clzw    a3, a2
> The correct result of clzw would be 23, but the current implementation
> returns -32 (as it performs a 64bit clz, which results in 0 leading zero
> bits, and then subtracts 32).
> 
> Fix this by changing the implementation to:
>   1. shift the original register up by 32
>   2. performs a target-length (64bit) clz
>   3. return 32 if no bits are set
> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> ---
> 
> Changes in v10:
> - New patch, fixing correctnes for clzw called on a register with undefined
>    (as in: not properly sign-extended) upper bits.

But we have

     return gen_unary(ctx, a, EXT_ZERO, gen_clzw);

should *not* be undefined.  Ah, what's missing is

     ctx->w = true;

within trans_clzw to cause the extend to take effect.

There are a few other "w" functions that are missing that set, though they use EXT_NONE so 
there is no visible bug, it would probably be best to set w anyway.


r~

