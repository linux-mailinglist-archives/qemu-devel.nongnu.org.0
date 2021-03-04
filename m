Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EDB32DB3E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:37:29 +0100 (CET)
Received: from localhost ([::1]:53724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuiu-0001qO-34
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuZZ-0003dx-V2; Thu, 04 Mar 2021 15:27:49 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuZY-0001ix-17; Thu, 04 Mar 2021 15:27:49 -0500
Received: by mail-wm1-x336.google.com with SMTP id m1so10936261wml.2;
 Thu, 04 Mar 2021 12:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sc7t1qfwYs9nhEVsjbIblSWqBYzD08FF17LKGQ95SSo=;
 b=e5Pea3luIoHrjbUbIcyMlu1CIxn/gHnuSpX29XSCFRaaELJyYFx/2cczdpP4Ab1JHl
 /m9b3kWNx27cFdfuXrkTGzEjsW+Q/41iRBmlHrv6b9E9oGIA3Z2g855X9u3UWff1L7FV
 0vYjansH3LrpFbdeZA/UxIOyipf+3oR4klhfTSJhBBTZZDVihLwtyTTIfzBPH4J8adZG
 zpoq9DUBHT1IKM69gbMwpgYZf5KSof3o4YGxUzjdAqtZusgq5o/4sRMH6w8Nyafp0S2J
 EBJsnCwoiL3fApZBYe1dn+Utj7nNwqgB2IgtZgDMjM7pmcXUAjUQv6B2QDkwpyypAjFm
 S6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sc7t1qfwYs9nhEVsjbIblSWqBYzD08FF17LKGQ95SSo=;
 b=IYlzo7IJm6L/0k39vp34CqUbYFINGGnv64+k5SPv9AYskndfFGnpD3lRoXmeqkKdXd
 3QQN+VyTqUv20bOp4kJfg3TFADviEx7QsKD6APiheeyUeTmLZmYVJhW+0+sJxeojRtlN
 bURs/RPWHk+dCcpKZMV+feN3sO2jf11E7GxjdDM2BWtfQEQhCzrqbRDaLB8pvzzs2HEm
 UZDUnEj3CjU1quAyfdfXYiyT/SzboKfb624a8CfBJPuRBWO3pNISckVkoLOqo6Pa+INZ
 c7vKzAl8PZWcw07dwHmxo0y2nk2Iy+HzD2tB3ZAV3MO5aj2XhIiB30bQLFM9WZvpS+ru
 KlzQ==
X-Gm-Message-State: AOAM530LrFG7FxV2fnMNLpSRsTT9aBRf6B7LsXfIAvlpVLDpSSAVkIBK
 Rjh7ga+SV+PWM4NSDRa/ggQkipu5/b4=
X-Google-Smtp-Source: ABdhPJxkHjYSF8oZ/bItZz69g9JtHpwttzE2XfTuISkVssvrEUPKiHjuH02dmM07qlRcuA0i4w9pLA==
X-Received: by 2002:a05:600c:6d4:: with SMTP id
 b20mr5685624wmn.142.1614889666014; 
 Thu, 04 Mar 2021 12:27:46 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j20sm804044wmp.30.2021.03.04.12.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:27:45 -0800 (PST)
Subject: Re: [PATCH 40/44] hw/arm/mps2-tz: Support running APB peripherals on
 different clock
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-41-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d896c237-0f70-ac33-e884-e6548db5b9c5@amsat.org>
Date: Thu, 4 Mar 2021 21:27:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-41-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 2/19/21 3:46 PM, Peter Maydell wrote:
> The AN547 runs the APB peripherals outside the SSE-300 on a different
> and slightly slower clock than it runs the SSE-300 with.  Support
> making the APB peripheral clock frequency board-specific.  (For our
> implementation only the UARTs actually take a clock.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

