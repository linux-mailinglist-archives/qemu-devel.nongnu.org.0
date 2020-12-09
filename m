Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79B62D4493
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:43:28 +0100 (CET)
Received: from localhost ([::1]:59082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0gh-0007u1-Q1
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0dr-0006Ta-51
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:40:33 -0500
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:42560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0do-0007tI-74
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:40:30 -0500
Received: by mail-oo1-xc44.google.com with SMTP id x203so425854ooa.9
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WKFOENw8A5xtmXCt+rAgDzz6Fdp2Pf3iFT5DzK7HPYE=;
 b=F1GhL4khRy9cORR9Dl+CnhFY8g7Wdap7T7xgKAbmBTbAOO6kRH/0Zc0jIUSP6BzekM
 3iOo7fyA47Hm6bo/wefLU2qO0HOGJovB7nwGEYrb92ulNlc75RxltMX1Irng02NWCaY1
 YGHVIN57tJw0FU7CDGyHE+nY7nlH8xV1aBzImJjyzyRRRnX5jMVix75yTXjvuDp4KO8b
 KCQTPNJf6FxV0iOLcrtWM9d8QzWo5qKhUyM3KM+Mh8PRgV7qTnOfbjNCsrSiIf09xodk
 KpPclKAvjnJfvIz9t8opt6ST7RDRTgaoqJbn0WfV0w7cIaE0TqEEM0N5cQcCv10qD6/7
 KNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WKFOENw8A5xtmXCt+rAgDzz6Fdp2Pf3iFT5DzK7HPYE=;
 b=V/SFNunQu04fzLhRu+XiOEKc4fqaMJU4K1DPFI3iMqpTGu5wHNokvSgad8KSo2aTAC
 RJZljA2Tu6R+DV2eGhXxgJwQNovn1ghem/LMag24UJNXbXi8XsOCGT2fcrbiVszeTnWj
 057MMlzLYJYK0RyYraYG8BJP3jak+Vt3oaFUBqVtj9JxLik0couwuGN2liM7qg34J8aE
 NrzOMKbmSYOHzB0SvkHae/wJYW6SQvYSaLmSrafWaRQBf7Wmi1fDluYy4hAqt/1JyDOR
 gWDeqe9Hd8LqoHP9MsJjB19E1iXaki5u15X5olsEefULjC+lTdA5seWvEGvG3lk0Lw9R
 ze8w==
X-Gm-Message-State: AOAM5317m8IFaqK76mhxMm8+22DpdDRxUFR5/8k5bHLXq3GnuzBm41JG
 Mw4bRj4RNWWS07oqqkVDxzjetQ==
X-Google-Smtp-Source: ABdhPJyG1ZrL4yr6p9nMqwJbbXLaPHvksyqRpiAyMbkZg7Bz6qyq23WfihWvXSHJEDUICrrC+++Vrg==
X-Received: by 2002:a4a:abc9:: with SMTP id o9mr2111343oon.1.1607524826316;
 Wed, 09 Dec 2020 06:40:26 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l1sm337146ooi.48.2020.12.09.06.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 06:40:25 -0800 (PST)
Subject: Re: [PATCH 13/13] target/mips: Convert Rel6 LL/SC opcodes to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208203704.243704-1-f4bug@amsat.org>
 <20201208203704.243704-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <41eeb758-0ac1-9d5f-cb44-bf41ac8a51d9@linaro.org>
Date: Wed, 9 Dec 2020 08:40:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208203704.243704-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc44.google.com
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

On 12/8/20 2:37 PM, Philippe Mathieu-Daudé wrote:
> LL/SC opcodes have been removed from the Release 6.
> Add a single decodetree entry for the opcodes, triggering
> Reserved Instruction if ever used.
> 
> Remove unreachable check_insn_opc_removed() calls.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/isa-mips32r6.decode | 2 ++
>  target/mips/translate.c         | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

