Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C6531A491
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:32:32 +0100 (CET)
Received: from localhost ([::1]:35512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdF1-0002B9-RF
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAd86-0005yw-H9; Fri, 12 Feb 2021 13:25:23 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAd85-00068P-3p; Fri, 12 Feb 2021 13:25:22 -0500
Received: by mail-wr1-x436.google.com with SMTP id g10so346234wrx.1;
 Fri, 12 Feb 2021 10:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B830cyz4lxq4kfSV1EZXB1P1XKfY3XxNI4aNloFrduI=;
 b=YjFBh3N8KmLbavzE1ciyhbcxxziOMcUMEo8UqbIy3Ft0i/3KWXz7ouNTmObEZgHvN8
 f3TDjdsSJ1/cyFX8UtaMqhITktdmfuIu1EtFPz01YnAhQ1YBkA7aaRTygTbyaif2IOgX
 n+4UB16vXUjSXl6WP7d4EPzgZufpjafcXoActWAdsXxEgFAaoz3OyYarvdYqH56T0gjV
 LZ7iPCZwQWORPnURR/zokuN/TEip//+3Oq46LFK6kvdMQPySLLXhmVHqSPmyYeZYtc/T
 k+v66zMyqkQxj+Bupj09A0VibIfgmqCisNDnu0PK0ZwRZay9QkuE77EzFgJY0K91DgR0
 yT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B830cyz4lxq4kfSV1EZXB1P1XKfY3XxNI4aNloFrduI=;
 b=m5t1SqQ+KCCVedMItjrTjCS5TxfOWyirmhAZFPlRGzlE8BaNi8bW9mAFXlOUefT7VG
 GYwSKVj4HyczGNqlOkM7NO4z4XhZrBWbAOamqjyu/zXdW7xhoCrYoJWtCrxlJRDKfL98
 j4gO6UwXhDrXT1CK9edR53UXW07cNix04P18BII8IzGnIXcWuE+ukoQgNUdvjJy7b1Os
 gGwgC7xWb2/3HeubHasycsF2nbg3HBw4Z2JZu1f3L4buKmlk/E1vPa+1iA9hLAaE/lEa
 Z82gUuhdWjvjfKSZAJvL26wVNgYt7E4eLpelAHUYZPPmlE2cLMF5bJ/tuAdbnBMbl1v1
 7bKA==
X-Gm-Message-State: AOAM532eaHETiNx0UE+0GNkWIb3PTQ261fsyagXhTN9c3AHwlNLfuXxQ
 +mt5uUgPka8wdbk1e9j9wEbq9bEOLk8=
X-Google-Smtp-Source: ABdhPJyEwM6nUgRr84x/wMHypwtHEzqqQXtlBKZtyZ7fGDPH6JOzwmamHUC8oX8nkXMAMsFXWSkyXg==
X-Received: by 2002:a5d:4582:: with SMTP id p2mr4870814wrq.126.1613154318886; 
 Fri, 12 Feb 2021 10:25:18 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q15sm11712772wrr.58.2021.02.12.10.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:25:18 -0800 (PST)
Subject: Re: [PATCH 08/24] hw/arm/mps2-tz: Condition IRQ splitting on number
 of CPUs, not board type
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c409d49d-0ad6-859e-89c9-4c91dad6dbfd@amsat.org>
Date: Fri, 12 Feb 2021 19:25:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205170019.25319-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 6:00 PM, Peter Maydell wrote:
> In the mps2-tz board code, we handle devices whose interrupt lines
> must be wired to all CPUs by creating IRQ splitter devices for the
> AN521, because it has 2 CPUs, but wiring the device IRQ directly to
> the SSE/IoTKit input for the AN505, which has only 1 CPU.
> 
> We can avoid making an explicit check on the board type constant by
> instead creating and using the IRQ splitters for any board with more
> than 1 CPU.  This avoids having to add extra cases to the
> conditionals every time we add new boards.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This removes the only current user of mmc->fpga_type, but we're
> going to want it again later in the series.
> ---
>  hw/arm/mps2-tz.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)

Good idea.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

