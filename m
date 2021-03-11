Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79AD33720E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:07:32 +0100 (CET)
Received: from localhost ([::1]:35166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKK6F-0004d6-CC
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:07:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKK4y-0003v4-0C
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:06:12 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:45385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKK4s-0005Of-IY
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:06:11 -0500
Received: by mail-ej1-x629.google.com with SMTP id mm21so45628959ejb.12
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 04:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h5bMIguoe+D8vNWZVVWbFfeOSJivUwgl76UwADiXiiY=;
 b=VXrEZi21b0Bcf1oJKvvqllU+zjC4bWp43XX31/gSmmdAnd/XfH19l8wygWsJfZyUch
 C4MSrOP3EIdUSQ59eoHciJizv1m5YNnw/98vSEX4/3wIVOidqOXzYlEWr0EUAILHKM6Z
 TGlqFS5LGOLbW5DpLfsxEg3s+V4VtOGb4kD1KMGSEPwK9A8AI4RZ5LtVhR7b80dUfK3q
 n9wLcqhDWk7VruJt407lJLY+gh6pamjfYRjxFmZ4gK9Jf3rpIv7vUhFdv0qz8Oflp4q4
 +Yu6jJYhATtbhTMKXX0bOHEmcwoNOEK4zKO0Xr+Jo0K8Hai/vsX+aLx+KUkNsjcdbIpO
 Z2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h5bMIguoe+D8vNWZVVWbFfeOSJivUwgl76UwADiXiiY=;
 b=LnB0wDmeOFadoaVKCdNVwZbmaPf0Jfu7E7d/Y4Y3jt6D6jnkOnoG+5MO40toOJ20+c
 Jsh1qfg93r+hE00FGuBaatMj/pT9zmhpbkK+si0XCMzCNhEgVjv1fSLgmuhb5pbRCXr8
 4rVMfAXcboKO9ngm+A+sfIcdA8fe9pHhYCJ8tS4iOO1/Pu6AbApjgSVBlY1DTa+aXndE
 8UJc8sHHZnrgheGefN0zY5IXYaZaHSShsBG9wVvTJnur6Yxsss/F+DHi9XHVGGgioem2
 o8kicojSfAjyHXQhl85aAs1UYPw8KH25HgXQOp16TwbdenQ0NIGzb0D5J+QUhbp5i25P
 tEWw==
X-Gm-Message-State: AOAM531HhMxoFjXnXrYvSrHBsh1TgENzt1S4jwx6uCsq7mekwjWlzfcM
 mDhguzZNFz8p5TU5vooM94w+Ijbu6TaJOmjiy4yIZA==
X-Google-Smtp-Source: ABdhPJy+2qnxGUS+c2CgXocCuqHHU6CvwDp6zPfVoFlvMgDuromqUWEqiQ4o5YLTnNZNqgDHUUZ0VAcufxqYkIYCVrU=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr2691468ejz.382.1615464364802; 
 Thu, 11 Mar 2021 04:06:04 -0800 (PST)
MIME-Version: 1.0
References: <20210305183857.3120188-1-wuhaotsh@google.com>
 <20210305183857.3120188-2-wuhaotsh@google.com>
In-Reply-To: <20210305183857.3120188-2-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 12:05:46 +0000
Message-ID: <CAFEAcA_vd3MQAGWgH-4mBvi7qWfeELewAqcj6VD22G3krRhtDQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/misc: Add GPIOs for duty in NPCM7xx PWM
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Mar 2021 at 18:40, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch adds GPIOs in NPCM7xx PWM module for its duty values.
> The purpose of this is to connect it to the MFT module to provide
> an input for measuring a PWM fan's RPM. Each PWM module has
> NPCM7XX_PWM_PER_MODULE of GPIOs, each one corresponds to
> one PWM instance and can connect to multiple fan instances in MFT.
>
> Reviewed-by: Doug Evans <dje@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

