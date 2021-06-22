Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA41D3B0563
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 14:59:54 +0200 (CEST)
Received: from localhost ([::1]:53554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvg0P-00071g-Of
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 08:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvfyp-0002zF-VI
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:58:16 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvfyn-000398-M3
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:58:15 -0400
Received: by mail-wm1-x32e.google.com with SMTP id n23so12758025wms.2
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QwtKLFx0NQNdda1i4Apeheehv9hNKgW+ZIQVnaCIjys=;
 b=SS9YHXvF/u+6fl+KTs1niZgdTqVONR1i8+VvUpHLtIrNXl38KNyBMBNxTOIBCvIgmG
 FY7/J4S7CxeXj/AnZpgptfpP/ShKmhoLyOK6YFGr1DWhjznBidi2R/7wzX6zv7ziAva7
 H1RRE5x7aifbd8Tlhl//Cn5qsKCpH067hJX4v/cQBeagv2YoPFDphFVtGpVY/xMmCBNx
 rDRm0KBdi9kT9ayqhTdJfD62WH8jnIrxCxgGOZhNLunnsvexJx70HQeIxV4oXrt3+gBp
 6L0+uxGOZ91ZTATLJT/okCvTKXMRKOedn+GTD2kSlA8AOhVg3coadHyD2io+H/bKwcpw
 w93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QwtKLFx0NQNdda1i4Apeheehv9hNKgW+ZIQVnaCIjys=;
 b=OVce5Ben0h1F5DouQL8XNPOih4rs8UMt+jPlifvhfnaXbI0e8Uijj7k+8DAUv5KMHI
 HN1W8xMGYkHUf07v9B8uB6v9ePeOhu9tJGNYaMcGt9pFUDsYux9LB2QS/7B3aSyI53qA
 heqm7P5PVwD/elnVla5pxUuVAEU8LJpw9RPqj+jQXSKpPx+XhRjwUgp98wbCRWjif9lM
 MhBOp0NZ8bfBiFTUIj5Uj6GvD/TbnFCthCq2PLpAbeKx5gHFvmKnpGeb1K/dVJumaJWa
 btLgqn2xuZKrbIrJsx3Mbhvp+rM5XVxr3bwZ0JW/Su8aKIwuwK6rkmRzja6LtgDQWr+H
 jWag==
X-Gm-Message-State: AOAM531hLjdqw+7GhJhf8A+KenGwFLnBmt46ccVldPkX0imKbN4YHEJB
 wS8S4oLLDUoVtUameMtYoY4=
X-Google-Smtp-Source: ABdhPJwZQUwH+lxqjb6+L3SoNOeLf0WFWPSK20+cLLYpxdh5XP/78WkUuWZVXRq/PAuZc2uDuNhliQ==
X-Received: by 2002:a05:600c:1c87:: with SMTP id
 k7mr4246814wms.168.1624366692116; 
 Tue, 22 Jun 2021 05:58:12 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p13sm20197951wrt.89.2021.06.22.05.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 05:58:11 -0700 (PDT)
Subject: Re: [PULL 16/21] hw/timer: Refactor NPCM7XX Timer to use CLK clock
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Hao Wu <wuhaotsh@google.com>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
 <20210112165750.30475-17-peter.maydell@linaro.org>
 <d1811f65-b08e-57c6-d0a7-5c498f8eb3ff@amsat.org>
 <CAGcCb13FAMS6q0jPfc4uJS+03HtO1OO7z3c5UQ_41=rUiBPSKg@mail.gmail.com>
 <a20af976-b428-06ae-4d55-ca81f977065b@amsat.org>
Message-ID: <69b0c07f-55ad-81da-a7ff-29907389664f@amsat.org>
Date: Tue, 22 Jun 2021 14:58:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a20af976-b428-06ae-4d55-ca81f977065b@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 12:54 PM, Philippe Mathieu-Daudé wrote:
> On 2/4/21 11:37 PM, Hao Wu wrote:
>> I don't see this error. It could be some error in the clock that the
>> timer module does not get a correct clock input.
>> How do you reproduce this?
> 
> I got it only once, can not reproduce, but it happened on our CI too:
> https://gitlab.com/qemu-project/qemu/-/jobs/1006073367#L4430

Again earlier today:
https://gitlab.com/qemu-project/qemu/-/jobs/1364690563#L3996

ERROR:../tests/qtest/npcm7xx_timer-test.c:475:test_periodic_interrupt:
assertion failed (tim_read(td, TISR) == tim_timer_bit(td)): (0x00000000
== 0x00000010)
**
ERROR:../tests/qtest/npcm7xx_timer-test.c:476:test_periodic_interrupt:
'qtest_get_irq(global_qtest, tim_timer_irq(td))' should be TRUE
FAIL 179 qtest-arm/npcm7xx_timer-test
/arm/npcm7xx_timer/tim[2]/timer[4]/periodic_interrupt

> 
>>
>> On Thu, Feb 4, 2021 at 1:39 AM Philippe Mathieu-Daudé <f4bug@amsat.org
>> <mailto:f4bug@amsat.org>> wrote:
>>
>>     Hi,
>>
>>     On Tue, Jan 12, 2021 at 6:20 PM Peter Maydell
>>     <peter.maydell@linaro.org <mailto:peter.maydell@linaro.org>>
>>     wrote:
>>     >
>>     > From: Hao Wu <wuhaotsh@google.com <mailto:wuhaotsh@google.com>>
>>     >
>>     > This patch makes NPCM7XX Timer to use a the timer clock generated
>>     by the
>>     > CLK module instead of the magic number TIMER_REF_HZ.
>>     >
>>     > Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com
>>     <mailto:hskinnemoen@google.com>>
>>     > Reviewed-by: Tyrone Ting <kfting@nuvoton.com
>>     <mailto:kfting@nuvoton.com>>
>>     > Signed-off-by: Hao Wu <wuhaotsh@google.com
>>     <mailto:wuhaotsh@google.com>>
>>     > Message-id: 20210108190945.949196-3-wuhaotsh@google.com
>>     <mailto:20210108190945.949196-3-wuhaotsh@google.com>
>>     > Reviewed-by: Peter Maydell <peter.maydell@linaro.org
>>     <mailto:peter.maydell@linaro.org>>
>>     > Signed-off-by: Peter Maydell <peter.maydell@linaro.org
>>     <mailto:peter.maydell@linaro.org>>
>>     > ---
>>     >  include/hw/misc/npcm7xx_clk.h    |  6 -----
>>     >  include/hw/timer/npcm7xx_timer.h |  1 +
>>     >  hw/arm/npcm7xx.c                 |  5 ++++
>>     >  hw/timer/npcm7xx_timer.c         | 39
>>     +++++++++++++++-----------------
>>     >  4 files changed, 24 insertions(+), 27 deletions(-)
>>
>>     Is that a spurious error (building with Clang)?
>>
>>     Running test qtest-arm/npcm7xx_timer-test
>>     ERROR:../tests/qtest/npcm7xx_timer-test.c:475:test_periodic_interrupt:
>>     assertion failed (tim_read(td, TISR) == tim_timer_bit(td)): (0x00000000
>>     == 0x00000004)
>>     ERROR:../tests/qtest/npcm7xx_timer-test.c:476:test_periodic_interrupt:
>>     'qtest_get_irq(global_qtest, tim_timer_irq(td))' should be TRUE
>>     FAIL 155 qtest-arm/npcm7xx_timer-test
>>     /arm/npcm7xx_timer/tim[2]/timer[2]/periodic_interrupt
>>     make: *** [Makefile.mtest:1033: run-test-127] Error 1
>>
> 

