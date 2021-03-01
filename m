Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924EB327677
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 04:49:44 +0100 (CET)
Received: from localhost ([::1]:58468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGZZ1-0003tJ-DU
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 22:49:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZY0-0003Hq-1y
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 22:48:40 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZXw-0007sx-E6
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 22:48:39 -0500
Received: by mail-pf1-x42c.google.com with SMTP id q20so10563753pfu.8
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 19:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MLshKv5jexDJ7qDnJ3Pg+1o/G6nYTxL/ZZ4kOisLSdk=;
 b=Dhc7AzPm+vJKrF/QV6jD15Ie8fC9THlUA0+H29FqHY9IMD8y5WHsLDvO/f2vOyRpoB
 5yoJjYdo4V4U3s782soX0QbstpFDRZ3x8mfFEBi44sGm/Y8w7WsTBt5YgHZgll+U7anI
 NrHMz0AqnYJ2X0GbbKetJ35bO3ICzhblB7Z4/p9yYJvzmmgCJMQzfsuu0QPaNZzDSOkw
 tAKd525uiWU9niO2wPLDuwpe7dEWc6FNr0EWqi80bUcENid8thrBQSUeoJ0KYEuK6jNr
 B8mgaAfikGPoo52mnR8gh4GQDetOJqqfYbIf4shb/Gi0JwUXIA4CGwnvtME8QcV3/OEz
 +Fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MLshKv5jexDJ7qDnJ3Pg+1o/G6nYTxL/ZZ4kOisLSdk=;
 b=TP7MydBM7oqpyZcJQAiR8gg87dep8N4L8GLZbrOldrumBgJ7+Ebf4Yply9KNfzlZQO
 KZLXIGy14lrrPT4v4dRp+ESC6knhAw1UUhVLw9u5Lp/uDfEvhCvnJmsf5fRG4RHrb+8N
 aMu8HNq55lCwP5CTaMmqM12IrsGkONuVrcLhExhcTaQL6i702W0RCXdIp/mLWm5ULq7S
 bIEFyU3+2dAKcFLv0IXumft606i+gQJ5ZeUQeF7DfVk7AFCRS8vBR/tSSyWXKYo+U/qR
 zBY0VU1UuYS/QDk+W6pcPUAiqSeAavJXjfTnr7PvJV6e0h6g9icLKE1RaYytzQ8owRN4
 SbBg==
X-Gm-Message-State: AOAM531rK/U5Oi9ZAc44Zshb2cdvna2WK4+Af0QHmYXNqK8AanhGfIPz
 vLRT0vgMl9+Pd3AOEOYuJM9RQg==
X-Google-Smtp-Source: ABdhPJzz10BBhBiSxUGQyxN/9yk4CxBYmOKS6K4IIbXQuAUkoDhgTspdmFVd0QwEKgRCP8LbpVTE6A==
X-Received: by 2002:a62:7a88:0:b029:1ee:174:7c22 with SMTP id
 v130-20020a627a880000b02901ee01747c22mr13008953pfc.35.1614570514682; 
 Sun, 28 Feb 2021 19:48:34 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 72sm15330317pfv.5.2021.02.28.19.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 19:48:34 -0800 (PST)
Subject: Re: [PATCH v2 11/24] hw/arm/mps2-tz: Correct wrong interrupt numbers
 for DMA and SPI
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b6b5a8f2-1ed1-24eb-5feb-040c75b45c50@linaro.org>
Date: Sun, 28 Feb 2021 19:48:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> On the MPS2 boards, the first 32 interrupt lines are entirely
> internal to the SSE; interrupt lines for devices outside the SSE
> start at 32.  In the application notes that document each FPGA image,
> the interrupt wiring is documented from the point of view of the CPU,
> so '0' is the first of the SSE's interrupts and the devices in the
> FPGA image itself are '32' and up: so the UART 0 Receive interrupt is
> 32, the SPI #0 interrupt is 51, and so on.
> 
> Within our implementation, because the external interrupts must be
> connected to the EXP_IRQ[0...n] lines of the SSE object, we made the
> get_sse_irq_in() function take an irqno whose values start at 0 for
> the first FPGA device interrupt.  In this numbering scheme the UART 0
> Receive interrupt is 0, the SPI #0 interrupt is 19, and so on.
> 
> The result of these two different numbering schemes has been that
> half of the devices were wired up to the wrong IRQs: the UART IRQs
> are wired up correctly, but the DMA and SPI devices were passing
> start-at-32 values to get_sse_irq_in() and so being mis-connected.
> 
> Fix the bug by making get_sse_irq_in() take values specified with the
> same scheme that the hardware manuals use, to avoid confusion.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 24 +++++++++++++++++-------
>   1 file changed, 17 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


