Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D673951B8
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 17:27:33 +0200 (CEST)
Received: from localhost ([::1]:41960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnNLf-0005bT-KY
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 11:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lnNKH-0004sI-Cr
 for qemu-devel@nongnu.org; Sun, 30 May 2021 11:26:05 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:39666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lnNKD-0001lx-Cz
 for qemu-devel@nongnu.org; Sun, 30 May 2021 11:26:05 -0400
Received: by mail-pf1-x431.google.com with SMTP id k15so792920pfp.6
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 08:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N9+cBpEzJflWQ8A0ypBa2hr64LnufNqxV6MY02CX/AI=;
 b=m3AKF7A/c0FWUXI0bKKUIhJJNtwC88uPpDMF8uH/nfogLouDpacLw5OBc5kUQdhm6L
 AnHY43kcgr3m0VqXly2Thltp6G/UVyhz4zmj9bw5nhV8nP+pPWWeBlM+Hbi2hnDgDwMG
 ZK0jOwjgO9J6LBAVyF/hFBpTRZO2Txccwh9lNkjYx+GeHs94fvN7WcAEXhkbbi4J0oOI
 GA6FU+Cj8+ptNOk/2T9APCYHu4PLvmQBZB6SNTP/2d65CVlK6MOsfVTvC5Q6Jv2JYp11
 h5z66QFuKQ7+vndHKNJx8hfzTWPat1FZzzisx9fU6WmzUGC0zai8IDo1bnJr7xGsfGbl
 usRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N9+cBpEzJflWQ8A0ypBa2hr64LnufNqxV6MY02CX/AI=;
 b=N8Bjx1vnlc/ZA9Equ+zVjorwFwU0p0KGekXwhQqgm9d5qmdqp655CxJBYB+LjYwBkg
 4nvqf8Gs1dNyHcZnGFCzI0USh2h2R5AEjv/VOS5sVUGQC3vgMkPOMVTU01r99tZVXDaV
 kq5+ouAIXQJoFwItMlqbNwDf51ugIkSl+dhJINhlEV4B7z9ubf0amlSR94oABLkSsanp
 P1eAOlzy0bSywitYHD2bpp5b0pQvf4qyzpPG+UC29yrQNrYUudmcLBfdZj4i3ad6S+bG
 ljGmAKFfbtWs7Y3bIkPR65V90rytw+WY9mZLZa04NJObvCiE2WzMZ/H24t4hwsfcAwg+
 smEw==
X-Gm-Message-State: AOAM531vy2g2k14MDbJ9cqpZmU14iR4LoZoa7kQnS/H/uT5CSDAwOWm6
 zR+tNZsOlvuV1MXY0N/XG95GuQ==
X-Google-Smtp-Source: ABdhPJy5WtGhJU0A0phuLhmtvhvhWTxfNbtT8fj7059HYgUXtr79ZqATEXVyXBX3AENvjvT0BpzsrQ==
X-Received: by 2002:a65:6642:: with SMTP id z2mr3777056pgv.388.1622388359614; 
 Sun, 30 May 2021 08:25:59 -0700 (PDT)
Received: from [192.168.172.34] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178])
 by smtp.gmail.com with ESMTPSA id j2sm8833338pji.34.2021.05.30.08.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 May 2021 08:25:59 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Fix TCG temporary leaks in
 gen_pool32a5_nanomips_insn()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210530094538.1275329-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4c3d2a7e-648a-6dc4-482f-c047bc49f473@linaro.org>
Date: Sun, 30 May 2021 08:25:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210530094538.1275329-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.618,
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

On 5/30/21 2:45 AM, Philippe Mathieu-Daudé wrote:
> Fix a pair of TCG temporary leak when translating nanoMIPS SHILO opcode.
> 
> Fixes: 3285a3e4445 ("target/mips: Add emulation of DSP ASE for nanoMIPS")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

