Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887CE4095A0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:43:10 +0200 (CEST)
Received: from localhost ([::1]:37002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnAq-0000ar-G4
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPn9G-0007SB-F4
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:41:30 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPn9E-00029A-RH
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:41:30 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d6so15068382wrc.11
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0C9PruM91VOTSET6OeIFLazCxKShfm+0QO6UKbSRiCo=;
 b=n5h3O+FoeaR6Tte1Pkl7qeuypdvZvEdZWSwGM3UZjWzatfR3L4lJA8c7LI9lfxzr7U
 YdVeIqnPOc2wJ/2vVGg/kW5xmDXzdBNyNXL6AkwNIQZObE4M6fR5Qsj7RQxRXOgtT+Eo
 Bkunt9LGhxbNJwDG3LvqGrkhg8skexgJGlXUZiDMYONXp4PJiAtad1g6uc8Oz6RvXjH3
 GINo8AdmpByHa1fJQQMpDjtLXLLBzncVQNs1bf8rv2ZC253y8xW7lhY+pJudmrGWB3GN
 tjsx2Fcny8zomfY8y9/DeQsUB7ohtIJ6ahFyAR8MQmkV3WATtTTMLJRIBEgcK6IAByUO
 m+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0C9PruM91VOTSET6OeIFLazCxKShfm+0QO6UKbSRiCo=;
 b=5cXhni7b4F5f+hU/IUreqMxq/wzZrq2SSmGbOO1jHD5ygvCZhbjODy/tkXbXnHMZyO
 t0acJdIprcbMnh5AWXGx4hWYFDWmxIkZkJMLfWn5p8UXJ8A6svkJWkMO991nndY9kYtL
 C10ppDjvR4Ttr0yp3moZOs/hxxgS/GnXE21/bhm3iIk2UvMEPaSGcTFlbZsb+Qc54wh9
 YalKi4823KIERIh7eo3sKRCgCTs7Sfh8Cl7fbNL3NZQImty2aWAg8/9OdyI7ZBTcNq5Q
 sJQtb2hzksGuI33eotcwUcXKIMk9z5QA7LzsnwWuY7HNN+10UlFQlGKAXcJ48Y56jLgE
 dMqA==
X-Gm-Message-State: AOAM533BT+DBfE+1POOIq84tJBiBtBD5E6XYnTQFfbWEaCEu3p6zgCl7
 J4QnHuKE+tj1a7JQTbzk2K5Ya0Wy+IUnQrb5yvvorg==
X-Google-Smtp-Source: ABdhPJzgSmhAGCKnszrkEupvh+/l1V5UI//R2M8hPQ+Wn5h8QhYira/9WPHmPAeq8r7mL/8thVBgGyPJua5yXpI/018=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr12673217wrr.376.1631544085814; 
 Mon, 13 Sep 2021 07:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210907232555.3268967-1-wuhaotsh@google.com>
 <20210907232555.3268967-4-wuhaotsh@google.com>
In-Reply-To: <20210907232555.3268967-4-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 15:40:35 +0100
Message-ID: <CAFEAcA9N4pD2mZAzwQKe55Q9io5kvO5577GJaQ74eiTajZVzbQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm: Attach MMC to quanta-gbs-bmc
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>, Patrick Venture <venture@google.com>,
 Shengtan Mao <stmao@google.com>, Bin Meng <bin.meng@windriver.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Sept 2021 at 00:26, Hao Wu <wuhaotsh@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  hw/arm/npcm7xx_boards.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index e5a3243995..7205483280 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -27,6 +27,10 @@
>  #include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/units.h"
> +#include "sysemu/blockdev.h"
> +#include "sysemu/sysemu.h"
> +#include "sysemu/block-backend.h"
> +
>

Stray extra blank line. Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

