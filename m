Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7115F7A56
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:12:41 +0200 (CEST)
Received: from localhost ([::1]:41804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogp1i-0008RY-Bd
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ognsv-0000rw-L9; Fri, 07 Oct 2022 09:59:29 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:33493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ognst-0000Tg-Sc; Fri, 07 Oct 2022 09:59:29 -0400
Received: by mail-lf1-x12e.google.com with SMTP id j4so7554258lfk.0;
 Fri, 07 Oct 2022 06:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+TWImL9CpvbptDfjsOz50GyBvr3H40pFIFjnTh3cRNQ=;
 b=jVY2Co2ENLd0DHW9YhWQGFBZe5QynXg1z7YtCXSIq279tIF2s1si5K+6rHYbi1tQrg
 tA4ZQMdx2p5tprGvm8C2IylpAOGM/qIt+7MaWVAPtlxu4Sgb7IJIfqekV0KTQKZtIwv8
 veyF9gLAuJZ6j+j1Zv8+3xu6SC8nSYnl0eSIDBSJEUIeh5QgaRD5Rk/hf+6ywgRxy0+9
 tHE2njuahJaNF62OpkKSq2CLeNtNPW8VhaVHZ2On4hIK6JyVscTm1743bVA7Zo5sCUNY
 ISI/pbWMNsFu0PoDqiVBocQJnUxZFquShOL7NfvJ4s2a+sw3McFRS4BymbUDCB5AMLL2
 NmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+TWImL9CpvbptDfjsOz50GyBvr3H40pFIFjnTh3cRNQ=;
 b=rpG4DLZ6kssX49/Ik3eM0lY4O4TzlwNnZanPmPggBTO/u2lqHWOyv4ZCEO1KUqJa7x
 ejE0n9oktp+QSYTMvPREtYQ6YwDKi7Hu8tIdT+zSFfpGqhuk9cH5oaSIZzcAZUQds0/6
 lWMnQAts3PT9yvBoz02s6kWy+8ymoHkJ8um2Lj5GQwd5Qy77I6uYEENWB7zgTp6sm+Sz
 VE0awUXkDDSjwMMsTcNwvjIQeYnYH+gyKQnh3Wnmq7VgThCVGiKhJNdeQizlSpVF+CEB
 PuR1cZVqoA4Oq66X8MO9irCWz0theFZNQmK+26TVbmh0l0PvvbJBOD7aLU/2+5FbPnIr
 CHBA==
X-Gm-Message-State: ACrzQf3zdFTZwOrqMHGmsPSskB35gp03C4HAzPGe3CqukJbsMrY+TbFJ
 UUuVHFBvxiP8A9Sx2Ggn+X0=
X-Google-Smtp-Source: AMsMyM6Z6+f9v1kw0POhW9ABOMbJZz4L4kBHztP8a3Dli+st/DlS2e+I7wuBF/D68g/vR61Z1nhi3w==
X-Received: by 2002:a05:6512:b17:b0:4a0:13c:9b3f with SMTP id
 w23-20020a0565120b1700b004a0013c9b3fmr1860420lfu.91.1665151165036; 
 Fri, 07 Oct 2022 06:59:25 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a056512360700b0048af4dc964asm309779lfs.73.2022.10.07.06.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 06:59:24 -0700 (PDT)
Date: Fri, 7 Oct 2022 15:59:22 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 3/8] m25p80: Add the mx25l25635e SFPD table
Message-ID: <20221007135921.GB20384@fralle-msi>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-4-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220722063602.128144-4-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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

Hi Cedric,

On [2022 Jul 22] Fri 08:35:57, Cédric Le Goater wrote:
> The SFDP table is 0x80 bytes long. The mandatory table for basic
> features is available at byte 0x30 and an extra Macronix specific
> table is available at 0x60.
> 
> 4B opcodes are not supported.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/block/m25p80_sfdp.h |  3 +++
>  hw/block/m25p80.c      |  3 ++-
>  hw/block/m25p80_sfdp.c | 26 ++++++++++++++++++++++++++
>  3 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
> index d3a0a778ae84..0c46e669b335 100644
> --- a/hw/block/m25p80_sfdp.h
> +++ b/hw/block/m25p80_sfdp.h
> @@ -17,4 +17,7 @@
>  
>  extern uint8_t m25p80_sfdp_n25q256a(uint32_t addr);
>  
> +extern uint8_t m25p80_sfdp_mx25l25635e(uint32_t addr);

We could be without 'extern' in above hdr if we like (also the other patches),
either way:

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> +
> +
>  #endif
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 13e7b28fd2b0..028b026d8ba2 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -232,7 +232,8 @@ static const FlashPartInfo known_devices[] = {
>      { INFO("mx25l6405d",  0xc22017,      0,  64 << 10, 128, 0) },
>      { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
>      { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
> -    { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0) },
> +    { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0),
> +      .sfdp_read = m25p80_sfdp_mx25l25635e },
>      { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
>      { INFO("mx66l51235f", 0xc2201a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
>      { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
> diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
> index 24ec05de79a1..6499c4c39954 100644
> --- a/hw/block/m25p80_sfdp.c
> +++ b/hw/block/m25p80_sfdp.c
> @@ -56,3 +56,29 @@ static const uint8_t sfdp_n25q256a[] = {
>      0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>  };
>  define_sfdp_read(n25q256a);
> +
> +
> +/*
> + * Matronix
> + */
> +
> +/* mx25l25635e. No 4B opcodes */
> +static const uint8_t sfdp_mx25l25635e[] = {
> +    0x53, 0x46, 0x44, 0x50, 0x00, 0x01, 0x01, 0xff,
> +    0x00, 0x00, 0x01, 0x09, 0x30, 0x00, 0x00, 0xff,
> +    0xc2, 0x00, 0x01, 0x04, 0x60, 0x00, 0x00, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xe5, 0x20, 0xf3, 0xff, 0xff, 0xff, 0xff, 0x0f,
> +    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x04, 0xbb,
> +    0xee, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0xff,
> +    0xff, 0xff, 0x00, 0xff, 0x0c, 0x20, 0x0f, 0x52,
> +    0x10, 0xd8, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0x00, 0x36, 0x00, 0x27, 0xf7, 0x4f, 0xff, 0xff,
> +    0xd9, 0xc8, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +};
> +define_sfdp_read(mx25l25635e)
> -- 
> 2.35.3
> 

