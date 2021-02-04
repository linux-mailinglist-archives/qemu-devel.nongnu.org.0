Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31D730EFD6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 10:41:31 +0100 (CET)
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7b8k-0000K2-V2
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 04:41:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7b75-00081b-F4
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:39:48 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7b73-0007nh-81
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:39:46 -0500
Received: by mail-ej1-x633.google.com with SMTP id w2so4119357ejk.13
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 01:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lMzMUTE95Zvm1LcdwzO14KO7oyZtwSiA18dFVFZtzHU=;
 b=ka1wm/4STWtoFd0u/ri0qDAb2gHRAB5DC797yYgsTBjNa6LEsTPmlT7peYoIu5C9z8
 rnwWtz+Rraw7E8PyAsJmzzbgz6ZLHuZ6RgqZP4DLPW2VKSw2qCy+lqYNZVYqf2VpSH+i
 3N70KdzKduICn/AcMSVl72svWR0XZb+mxrPyjFydgrqC93uvigwUrrqY8Tx16EbrhDAc
 M1OsPyXNWXGHnXIvdCsmYYUebLPjRCynQR5tD3reZi5GdF66mHU4peMnXNeei2U1cb+w
 tgCRuid0qNtHnXlBN5a7O1cNUqqactTCCMCRG+f6JxZR96uFoTQZaK71XuchH6qIFLhA
 P5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:subject:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lMzMUTE95Zvm1LcdwzO14KO7oyZtwSiA18dFVFZtzHU=;
 b=UaZH/pAjXL7X4KkI4N1Ynipc1WW1M30grshjO4lcxgGHxJr4O9oM0dpP+fM1umgKXK
 sxkjrlzvRH78I2hk3VE1sNoPMzAa/73TwkCN1Abu8S5xpTRiBrTAfyAgVJvh3YdLtoLx
 ZhLYBookt/AWrXnmFsE7Hu0iWsDrnp1uGMKuLquyY6Li4fP/6xPOhtw3MYluKfe1HMQo
 tjhtJDFEryC09CSwVXuDYwFFj46i2wAhGHqs+GXVEqSeioLIC1OfOTvnU6YMOzBqwdol
 94bUvv1SQyp2amuT+ITk2P8jFQUPlvMOsloNcwkQTXrC2oyEs+eIGIrj9/Ci9s32g6tx
 qTvQ==
X-Gm-Message-State: AOAM533QPKz2tbvOP/kGIWLGBaR+CXrqcCZiLAGNBjV2YPR6GkwPg2Ts
 6yk0Pczhlfe9m3E2KgKg1QQ=
X-Google-Smtp-Source: ABdhPJzvtGtdEFN/lkikszs4o3YPZlF8J0kz3wJ/UrXI9UUWsEAoUvRyzRd3/o6i7ma1631Prg5AqQ==
X-Received: by 2002:a17:906:70d4:: with SMTP id
 g20mr7282729ejk.361.1612431583113; 
 Thu, 04 Feb 2021 01:39:43 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id u21sm2207696ejj.120.2021.02.04.01.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 01:39:42 -0800 (PST)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: Re: [PULL 16/21] hw/timer: Refactor NPCM7XX Timer to use CLK clock
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
 <20210112165750.30475-17-peter.maydell@linaro.org>
Message-ID: <d1811f65-b08e-57c6-d0a7-5c498f8eb3ff@amsat.org>
Date: Thu, 4 Feb 2021 10:39:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112165750.30475-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.178,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Hao Wu <wuhaotsh@google.com>, Tyrone Ting <kfting@nuvoton.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Tue, Jan 12, 2021 at 6:20 PM Peter Maydell <peter.maydell@linaro.org>
wrote:
>
> From: Hao Wu <wuhaotsh@google.com>
>
> This patch makes NPCM7XX Timer to use a the timer clock generated by the
> CLK module instead of the magic number TIMER_REF_HZ.
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Message-id: 20210108190945.949196-3-wuhaotsh@google.com
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/npcm7xx_clk.h    |  6 -----
>  include/hw/timer/npcm7xx_timer.h |  1 +
>  hw/arm/npcm7xx.c                 |  5 ++++
>  hw/timer/npcm7xx_timer.c         | 39 +++++++++++++++-----------------
>  4 files changed, 24 insertions(+), 27 deletions(-)

Is that a spurious error (building with Clang)?

Running test qtest-arm/npcm7xx_timer-test
ERROR:../tests/qtest/npcm7xx_timer-test.c:475:test_periodic_interrupt:
assertion failed (tim_read(td, TISR) == tim_timer_bit(td)): (0x00000000
== 0x00000004)
ERROR:../tests/qtest/npcm7xx_timer-test.c:476:test_periodic_interrupt:
'qtest_get_irq(global_qtest, tim_timer_irq(td))' should be TRUE
FAIL 155 qtest-arm/npcm7xx_timer-test
/arm/npcm7xx_timer/tim[2]/timer[2]/periodic_interrupt
make: *** [Makefile.mtest:1033: run-test-127] Error 1

