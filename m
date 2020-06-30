Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBCE20F18A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 11:25:59 +0200 (CEST)
Received: from localhost ([::1]:50014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqCWc-0005q6-8U
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 05:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqCMV-0000H7-V1; Tue, 30 Jun 2020 05:15:31 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:36958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqCMU-0004fa-8N; Tue, 30 Jun 2020 05:15:31 -0400
Received: by mail-ed1-x544.google.com with SMTP id g20so15254378edm.4;
 Tue, 30 Jun 2020 02:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6JbCfXsajHq0Efp+J6rZF45pw9jK838vKk6cgYEmk/g=;
 b=Tz0Oa1JS25sDsUBQD12Qc4XPobkRStBU9mT925AHEdbtheS4yRPpwYGKCSuhHmXLAU
 wxyt89YTzK5ORJESJs4ra2c0XtxzIYjHgR4Q7DNDYVZlHZM/9psTHLUCzRmP5Yw6MKUI
 laj3zGOrL8jqtGGNljpPq9cXk7X2x/AFNkHWPYeZwaGh56aJ5Vu6trRFpdxrP7ZYxtHe
 kNmNTyMBcnqDXcjesebmkMlHeX2MjxB4MahNehg2lCyiZnZBPaVQFrC2nKYieBLh7pFV
 J8Rhk9qz9A/Qd5HTo+1Q+vD6I9GSLFOU2YufLn7t5S9M920s1Gp52Tbjb+9/qdQXCvpn
 UFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6JbCfXsajHq0Efp+J6rZF45pw9jK838vKk6cgYEmk/g=;
 b=DOjGR8FeEYe3nR4RWyYggZGH9RjPZ4KsKzZWPmWTicOnmcmkPHpP1URUGucV1xfUcu
 HGWKWeW5GuR1/KZ+VVXlclYbAAsZduRSiS5Feb/OkgyzOYJBxqqs3EqEwBe7hhYzPTrO
 bZkoRrKbbGkR3pT3RjMU7jhyE/7UWP5ltJB112fY6lJb+Og7cFYvYVdWZmFUHsILjpUe
 GoUwbAlYmhjQnwqfFfHeHl3A3sI4uWptGx6rn/VXXPHAa78pneoacz7ZOwZ63phMI+5A
 IBTRPthgtRY9UflQvQGQHwBtSk3aUnTP8gNzkAfJUgxi6Cp9cj143yvMRGO0e4Qwyflt
 d7mA==
X-Gm-Message-State: AOAM532IAl2qR2k3TJXqlxbz/eIgvHZyK4W36yYZO4bvUzghQUUJhyTR
 PgSCkFIO1sQdkflK4Xk0DjM=
X-Google-Smtp-Source: ABdhPJx+Ec0em0PcwZvlMjwdCM4IzXEo6rwSunkKb14GKAXfCCbXPtPHvcnitXVL1frNtvn5jFb41A==
X-Received: by 2002:a50:da44:: with SMTP id a4mr15781466edk.379.1593508528525; 
 Tue, 30 Jun 2020 02:15:28 -0700 (PDT)
Received: from [192.168.1.40] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id u13sm1560626ejx.3.2020.06.30.02.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 02:15:27 -0700 (PDT)
Subject: Re: [PATCH v3 23/26] aspeed: Fix realize error API violation
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200630090351.1247703-1-armbru@redhat.com>
 <20200630090351.1247703-24-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ebd856ff-1df0-09db-21a8-886c79c8647e@amsat.org>
Date: Tue, 30 Jun 2020 11:15:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200630090351.1247703-24-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/30/20 11:03 AM, Markus Armbruster wrote:
> The Error ** argument must be NULL, &error_abort, &error_fatal, or a
> pointer to a variable containing NULL.  Passing an argument of the
> latter kind twice without clearing it in between is wrong: if the
> first call sets an error, it no longer points to NULL for the second
> call.
> 
> aspeed_soc_ast2600_realize() and aspeed_soc_realize() are wrong that
> way: they pass &err to object_property_set_int() and
> object_property_set_bool() without checking it, and then to
> sysbus_realize().  Harmless, because the former can't actually fail
> here.
> 
> Fix by passing &error_abort instead.
> 
> Cc: "Cédric Le Goater" <clg@kaod.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/aspeed_ast2600.c | 5 +++--
>  hw/arm/aspeed_soc.c     | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 4efac02e2b..59a7a1370b 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -383,7 +383,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>      for (i = 0; i < sc->spis_num; i++) {
>          object_property_set_link(OBJECT(&s->spi[i]), OBJECT(s->dram_mr),
>                                   "dram", &error_abort);
> -        object_property_set_int(OBJECT(&s->spi[i]), 1, "num-cs", &err);
> +        object_property_set_int(OBJECT(&s->spi[i]), 1, "num-cs",
> +                                &error_abort);
>          sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), &err);
>          if (err) {
>              error_propagate(errp, err);
> @@ -434,7 +435,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>      /* Net */
>      for (i = 0; i < sc->macs_num; i++) {
>          object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed",
> -                                 &err);
> +                                 &error_abort);
>          sysbus_realize(SYS_BUS_DEVICE(&s->ftgmac100[i]), &err);
>          if (err) {
>              error_propagate(errp, err);
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 03b91bade6..311458aa76 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -333,7 +333,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>  
>      /* SPI */
>      for (i = 0; i < sc->spis_num; i++) {
> -        object_property_set_int(OBJECT(&s->spi[i]), 1, "num-cs", &err);
> +        object_property_set_int(OBJECT(&s->spi[i]), 1, "num-cs",
> +                                &error_abort);
>          sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), &err);
>          if (err) {
>              error_propagate(errp, err);
> @@ -384,7 +385,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>      /* Net */
>      for (i = 0; i < sc->macs_num; i++) {
>          object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed",
> -                                 &err);
> +                                 &error_abort);
>          sysbus_realize(SYS_BUS_DEVICE(&s->ftgmac100[i]), &err);
>          if (err) {
>              error_propagate(errp, err);
> 


