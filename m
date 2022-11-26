Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4E86396EE
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Nov 2022 16:52:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyxS9-0000cO-Eo; Sat, 26 Nov 2022 10:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oyxS5-0000ZK-Rw
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 10:50:50 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oyxS3-0002u0-0f
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 10:50:49 -0500
Received: by mail-pf1-x42c.google.com with SMTP id o1so2061652pfp.12
 for <qemu-devel@nongnu.org>; Sat, 26 Nov 2022 07:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pqkmubz7TCsr9uHFloWZYKW0ubK/Kxfqwcl387aKS4Q=;
 b=cJ9M/7NH6L0MEduSF7iMB+5yjN2T5T3MiN1Ow0VyQ9EOY9orDmN3t769XOeGehZQVl
 nUBhw6PYCiXbQ6OUSQccDBpB8XKdPx0vdAyNeQ07KODbGOZFWX0fV5EAeDYBqfwqtahU
 9ny0nHe9g+KaPiz7cwpMMxo5J9YPINKCoeo8yODZ477VeLStiFTHDxO22UUAkrU88tCR
 PIB/cAfNu0h9FCDo64ZsWOiKXRF8Pt8nO1QihSpcr71kQ4cOU3wxPHcqVXmPTbWLAhUH
 KW25w9khHXJYej4ziHOLubQQW44sy3SZYbB1ZydtfLTEwqVHJK5FKKmnp0QGTq6rEY9S
 b/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pqkmubz7TCsr9uHFloWZYKW0ubK/Kxfqwcl387aKS4Q=;
 b=6lnMK1gfXTap4ymgG+phYnGoo7oXnWZ3iNrokxqTNVrVSautdFyDLAqU4vN4YWg/6T
 +DI5DTpljx+fbiT3eXzxg7BLUt5NKp2ep4RqHDfY6jsAZcrPWM8xi2I/lf7hjQ9G48wy
 OqwDSq+bq4hpU0coLQSmflLCYAXzOBe94JuvimwA49ArcESXVAFGIjzq1MQWQhG+eG47
 iZlAELKs7O13VNOo5SOjJfOA5eZKzIc9QyAHGZN2N2vMlZ+NebcM7Q0x/cUie2TMW7e8
 pT2PZTw1nOw1bDNwJa4dkvLayRF/YX4qb8Pry6D4vhhSNKDJK4IC5xZ9QCl+Wcqo3hdd
 PbwA==
X-Gm-Message-State: ANoB5pl4YIq8qL5mG7xT6DLoA8obhYN1Ri1zlm/m8LaGKAZwnYNBV7ly
 ewbfc7kuAx+gToMftCRKS+959A==
X-Google-Smtp-Source: AA0mqf5wanUyPvoChBpBx+OLUjV5wEUW72RHMpYOAlElN8D5rjjFTRTXJr/LW/0okYPrS7T5v4ufdw==
X-Received: by 2002:a63:d34e:0:b0:477:650a:705c with SMTP id
 u14-20020a63d34e000000b00477650a705cmr20164064pgi.588.1669477844851; 
 Sat, 26 Nov 2022 07:50:44 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:7304:c42a:77cc:cf66?
 ([2602:47:d48a:1201:7304:c42a:77cc:cf66])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902c11100b0017a032d7ae4sm5515108pli.104.2022.11.26.07.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 07:50:44 -0800 (PST)
Message-ID: <6c3b8aef-f589-8e51-fbc2-8daf318bc764@linaro.org>
Date: Sat, 26 Nov 2022 07:50:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 00/19] Convert most CPU classes to 3-phase reset
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/24/22 03:50, Peter Maydell wrote:
> Peter Maydell (19):
>    hw/core/cpu-common: Convert TYPE_CPU class to 3-phase reset
>    target/arm: Convert to 3-phase reset
>    target/avr: Convert to 3-phase reset
>    target/cris: Convert to 3-phase reset
>    target/hexagon: Convert to 3-phase reset
>    target/i386: Convert to 3-phase reset
>    target/loongarch: Convert to 3-phase reset
>    target/m68k: Convert to 3-phase reset
>    target/microblaze: Convert to 3-phase reset
>    target/mips: Convert to 3-phase reset
>    target/nios2: Convert to 3-phase reset
>    target/openrisc: Convert to 3-phase reset
>    target/ppc: Convert to 3-phase reset
>    target/riscv: Convert to 3-phase reset
>    target/rx: Convert to 3-phase reset
>    target/sh4: Convert to 3-phase reset
>    target/sparc: Convert to 3-phase reset
>    target/tricore: Convert to 3-phase reset
>    target/xtensa: Convert to 3-phase reset

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

