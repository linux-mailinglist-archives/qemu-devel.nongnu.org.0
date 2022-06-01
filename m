Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0023C53AE7C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 23:23:51 +0200 (CEST)
Received: from localhost ([::1]:54214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwVok-0004kP-VB
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 17:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwVhI-0007io-Rd; Wed, 01 Jun 2022 17:16:08 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:37436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwVhH-0006O7-9U; Wed, 01 Jun 2022 17:16:08 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-f3381207a5so4403398fac.4; 
 Wed, 01 Jun 2022 14:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ikiJGIYY6SHGA9nKiz+MpLBLyh8uJgTkxcb1tf7NZkY=;
 b=lmwlGICQttVzYYsb3qJ6uBpuJUUHZh0ZIULi8kw6ap09G+x4SCL0Sb47Q6nuB8SqNJ
 NZeMvyf9qmZbvCOBgkC16T6QrHrqpSv5I8gDYQ1XubmxcbbTBMBPmJzo4AbQUyx8Ijy1
 w7umjxyo0jrLeS/Q+kSZvcmaoRrH8tu620/xKMdXX9Da6gttwriujMiLib3US9+WbE/C
 uAW3zLQLlyVoMUTCu7MO+erz6GSgBiYARivlihQL1t4sKDeZ0wHwK/V7butB1mKAzCAP
 b4LuAgkDSD4FpDIPeiKGkl7zfiDXB8IkSp2gy6dHRXQZmN/G6EcfgRNcKKw2tRU7EYg6
 bN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ikiJGIYY6SHGA9nKiz+MpLBLyh8uJgTkxcb1tf7NZkY=;
 b=aSdy4XP6UvLtQuYvcrixLlVRUXL8UVpdsG23jrOQtaNUl5keC6X5FYnFPYVEaBKSHC
 4HV3PD7VNbG1Jd6GPzjJU9KuS4HCy8+JUyRirQhL155q4LGl71XYVeEfZkkFYThNOpIl
 LZJyFQnzL8ZRpwcrkFYyKi5igFpbilCMTqTP2OJpdp58u8Lb+iPVhS6hJGey2O9vvmT9
 +7XrUefiW8k1I1fUuNT2vDHyki2SdyiMr6WZsA89kipGFjkoPJCVvKmHJZ6kNUvZ9QTg
 ZFRO9G2x5bXySAsHBHdA5FEs5S8hnv/P2QgO/5owvCUvQbrccgtYfN+u49ana1j8rgzb
 qWVw==
X-Gm-Message-State: AOAM533PV22FEx03YSe8xwbzwYHaiBWWnJZwegj8r7qCaNOHZCxt13BM
 cREUDs0uile56bovbnqmQhkFAyS3kA/icBsYjuI=
X-Google-Smtp-Source: ABdhPJyUjIOls+CnmwyGpgZuSPX+HxZb6cwqm2IrbC9VOUATACkPJUv+EaiUM2qrStVsHjJD9N8IN8UpZkZzFpV2u5U=
X-Received: by 2002:a05:6870:2047:b0:e9:1b34:fbe with SMTP id
 l7-20020a056870204700b000e91b340fbemr18174188oad.64.1654118165767; Wed, 01
 Jun 2022 14:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220601172353.3220232-1-fkonrad@xilinx.com>
 <20220601172353.3220232-5-fkonrad@xilinx.com>
In-Reply-To: <20220601172353.3220232-5-fkonrad@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Jun 2022 07:15:39 +1000
Message-ID: <CAKmqyKO00+TZfTzSXBMbbxwZY0f095tRyEVFzjZQdQZj-Eosdg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] xlnx-zynqmp: fix the irq mapping for the display
 port and its dma
To: frederic.konrad@xilinx.com
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Sai Pavan Boddu <saipava@xilinx.com>,
 Edgar Iglesias <edgari@xilinx.com>, fkonrad@amd.com, 
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 2, 2022 at 3:29 AM <frederic.konrad@xilinx.com> wrote:
>
> From: Frederic Konrad <fkonrad@amd.com>
>
> When the display port has been initially implemented the device driver wasn't
> using interrupts.  Now that the display port driver waits for vblank interrupt
> it has been noticed that the irq mapping is wrong.  So use the value from the
> linux device tree and the ultrascale+ reference manual.
>
> Signed-off-by: Frederic Konrad <fkonrad@amd.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-zynqmp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 375309e68e..383e177a00 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -60,10 +60,10 @@
>  #define SERDES_SIZE         0x20000
>
>  #define DP_ADDR             0xfd4a0000
> -#define DP_IRQ              113
> +#define DP_IRQ              0x77
>
>  #define DPDMA_ADDR          0xfd4c0000
> -#define DPDMA_IRQ           116
> +#define DPDMA_IRQ           0x7a
>
>  #define APU_ADDR            0xfd5c0000
>  #define APU_IRQ             153
> --
> 2.25.1
>
>

