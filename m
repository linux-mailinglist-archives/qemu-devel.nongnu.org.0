Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4165F69D337
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:50:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBEq-0004j8-6s; Mon, 20 Feb 2023 13:50:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBED-0004LF-SA
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:49:43 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBEB-0005rH-W8
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:49:33 -0500
Received: by mail-pl1-x62d.google.com with SMTP id p1so488703plg.7
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MyqN/991YvXvjBMmxSpqD+Zg/swWdcPq/AR4aAx3GgA=;
 b=Qn/E9e1N8LjqAZLWziM7+N2oe/tCL7fCffEu5sUQPp0McVG1HHCDQu1kEHiBLkcUiq
 KH+X559lp4thEX4mCc6HcLjMgdDqP9+JrZy0uWhHEewnBisk4cUKNLTRApXKUlKP5Ff5
 gJ+hYMZ7b5A0QIDslhq0iODrbvXeRKp0wV9p979jYSJ6V6aLXIMYJhyKMlLBzSMrtYan
 5RcODmc9fZAYwsBHBXX85z1jlnxybDgL6Q4aRQqdHD63zSceF7XJVM6fBgctd3xOmlJD
 9kOtbZHv/6lmbCK50ZpiRBcQ61OmzRQvhlEpOte7g2Xn7oA2Q05MfZN0HUgF6ivs8W43
 guLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MyqN/991YvXvjBMmxSpqD+Zg/swWdcPq/AR4aAx3GgA=;
 b=qqvcKP/LJ1rlbASo1rBw2lAz9XPNDhFp+LTyQWGpCRNam6dkTZaX/NXFcNgxhXF7No
 DAUOsuk1cJwJpuE29X99Ziq2FrIeOL5/hvGg1H+hppyr21gYch97FbCX2BHF7hHYqK1J
 o7/kmFXUCbm1AHQhu6uEWGNuDk68FRwvohyybkX9KfBbCtYQuE64S0im/XZWHf1aY6vs
 LTy60azQsjQoMEs6NUlvhELBqce+NFJnoVjYg4d2FEN3APrD2QGuIE21OHmYe+vmyDxU
 8rf+tojgMOMgZQIuES8M9Lokj9At3u/i/wa/gYRUAil0jSStEi6y1ZHvn4NoGdpH4ws1
 7Xhw==
X-Gm-Message-State: AO0yUKXP0mHWT0a9/As23aBRO4sWeA6H6lJC4tmjbi8qDrRFUlfFn+oY
 swYNrbhxY56Vlg/OPiJz3UFcYQ==
X-Google-Smtp-Source: AK7set+vyA+2rDny6W9bBYArBiu/90O9fOp3u3C0FymkXKNQ6/xvx5UtQRtnDvHouiRw6Fip/NFmUg==
X-Received: by 2002:a05:6a20:54a4:b0:c7:8644:a9ff with SMTP id
 i36-20020a056a2054a400b000c78644a9ffmr3232203pzk.57.1676918970321; 
 Mon, 20 Feb 2023 10:49:30 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 a10-20020a65654a000000b005022111ab31sm953422pgw.71.2023.02.20.10.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 10:49:29 -0800 (PST)
Message-ID: <5565c71f-b573-6b03-f4bd-f8c35230be86@linaro.org>
Date: Mon, 20 Feb 2023 08:49:25 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/8] hw/gpio/max7310: Simplify max7310_realize()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220115114.25237-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/20/23 01:51, Philippe Mathieu-Daudé wrote:
> Since &I2C_SLAVE(dev)->qdev == dev, no need to go back and
> forth with QOM type casting. Directly use 'dev'.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/gpio/max7310.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

