Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A39567830
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 22:09:25 +0200 (CEST)
Received: from localhost ([::1]:43118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8orL-0002bU-E0
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 16:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1o8ooa-0000vX-Mq; Tue, 05 Jul 2022 16:06:32 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:38830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1o8ooY-0000Qf-Ly; Tue, 05 Jul 2022 16:06:32 -0400
Received: by mail-qk1-x72a.google.com with SMTP id c137so9584700qkg.5;
 Tue, 05 Jul 2022 13:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=MZ2xy2K+vrN/XA5j+0YELCsIk3fz2p5gCXyJJzwb6Eo=;
 b=hOBVKz36oHllO0/esX6KcPpe98Z2o4Ftelf9kgO1Q11GcZTJe/f8gm2CMfD0zKKfvx
 PPuF7qB6dLDZ1FKd9xKfRynmC4RCKBTh5RkyjQcCU2pHLteWavIQMGkTJic4RDujO7+J
 wNhtqI+czQSPV4jAoETwg+OeGwcVqmJtcVPanbOElWAJxOg89kSEy3zyyn7u29KtsD/R
 DXoKKo6U2J5TGFBPndtBt0veavvzzJ54wB50jYSNgJMw4h2REl0XLFApzQltXrOnTajl
 HPjBVhgRZQzB6anuNrWB3Rna2N0W4dNIyletqLq1Ca67roLGcp2PWY9fHGlF+PxxjOg7
 fRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=MZ2xy2K+vrN/XA5j+0YELCsIk3fz2p5gCXyJJzwb6Eo=;
 b=5fbsi4H+yFq+t33CpVihfY97TGknLWdTYoMnxvkORHInvolBOoC8zM5EbM6QYvWHVG
 VpfQr7+ZGnRsU/L/XUpSC5N2B1SQEyFvW5HUY31WqCg7Yf9b8shBtp218VxYFnAzr1vb
 fB4ASKoXhh6aIP5QBTzfdID8WEpKOfRSKpeCj+2idJBhijtJaFwXLxx1OG5TYP/uF+bN
 hq0hmgRYmqjTNJZVPnoMcpyKC63gOa3u4Kh92CWCQhjt1lfYqW0D4w703A4XnnZabE3j
 Pbflmkw73ezqlnwpLx/tGf9kWit4SJ3E0wWwJY39acdE7iTZRs9rQRVRgOPsfih1dHf1
 dVGg==
X-Gm-Message-State: AJIora/wUS0ifwW7j494jc4KFQTH8v2GSoFgj4jF6PbAV7EXoOnhLRJn
 sjOsqc3FtVMb5NKtiOJoWA==
X-Google-Smtp-Source: AGRyM1s0AyeTKyJDl/5wU/T+H4jgCxHEyYpC9o75UVeNMozYrSt41PAYzh3R+ANtcUSRIVQ9W4yJAA==
X-Received: by 2002:a37:bb06:0:b0:6af:1396:733a with SMTP id
 l6-20020a37bb06000000b006af1396733amr24728135qkf.19.1657051587770; 
 Tue, 05 Jul 2022 13:06:27 -0700 (PDT)
Received: from serve.minyard.net ([47.184.144.75])
 by smtp.gmail.com with ESMTPSA id
 196-20020a3704cd000000b006a6ae9150fesm27266591qke.41.2022.07.05.13.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 13:06:27 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:1895:1b49:2a68:29f7])
 by serve.minyard.net (Postfix) with ESMTPSA id 6C3DC1800BD;
 Tue,  5 Jul 2022 20:06:25 +0000 (UTC)
Date: Tue, 5 Jul 2022 15:06:24 -0500
From: Corey Minyard <minyard@acm.org>
To: Peter Delevoryas <peter@pjd.dev>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Patrick Venture <venture@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/9] hw/i2c/pca954x: Add method to get channels
Message-ID: <20220705200624.GK908082@minyard.net>
References: <20220705191400.41632-1-peter@pjd.dev>
 <20220705191400.41632-2-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220705191400.41632-2-peter@pjd.dev>
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=tcminyard@gmail.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 05, 2022 at 12:13:52PM -0700, Peter Delevoryas wrote:
> I added this helper in the Aspeed machine file a while ago to help
> initialize fuji-bmc i2c devices. This moves it to the official pca954x
> file so that other files can use it.
> 
> This does something very similar to pca954x_i2c_get_bus, but I think
> this is useful when you have a very complicated dts with a lot of
> switches, like the fuji dts.
> 
> This convenience method lets you write code that produces a flat array
> of I2C buses that matches the naming in the dts. After that you can just
> add individual sensors using the flat array of I2C buses.

This is an improvment, I think.  But it really needs to be two patches,
one with the I2C portion, and one with the aspeed portion.

Also, the name is a little misleading, you might want to name it 
pca954x_i2c_create_get_channels

-corey

> 
> See fuji_bmc_i2c_init to understand this point further.
> 
> The fuji dts is here for reference:
> 
> https://github.com/torvalds/linux/blob/40cb6373b46/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>  hw/arm/aspeed.c                  | 29 +++++++++--------------------
>  hw/i2c/i2c_mux_pca954x.c         | 10 ++++++++++
>  include/hw/i2c/i2c_mux_pca954x.h | 13 +++++++++++++
>  3 files changed, 32 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 6fe9b13548..bee8a748ec 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -793,15 +793,6 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>      create_pca9552(soc, 15, 0x60);
>  }
>  
> -static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr,
> -                                 I2CBus **channels)
> -{
> -    I2CSlave *mux = i2c_slave_create_simple(bus, "pca9548", mux_addr);
> -    for (int i = 0; i < 8; i++) {
> -        channels[i] = pca954x_i2c_get_bus(mux, i);
> -    }
> -}
> -
>  #define TYPE_LM75 TYPE_TMP105
>  #define TYPE_TMP75 TYPE_TMP105
>  #define TYPE_TMP422 "tmp422"
> @@ -814,20 +805,18 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
>      for (int i = 0; i < 16; i++) {
>          i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
>      }
> -    I2CBus *i2c180 = i2c[2];
> -    I2CBus *i2c480 = i2c[8];
> -    I2CBus *i2c600 = i2c[11];
>  
> -    get_pca9548_channels(i2c180, 0x70, &i2c[16]);
> -    get_pca9548_channels(i2c480, 0x70, &i2c[24]);
> +    pca954x_i2c_get_channels(i2c[2], 0x70, "pca9548", &i2c[16]);
> +    pca954x_i2c_get_channels(i2c[8], 0x70, "pca9548", &i2c[24]);
>      /* NOTE: The device tree skips [32, 40) in the alias numbering */
> -    get_pca9548_channels(i2c600, 0x77, &i2c[40]);
> -    get_pca9548_channels(i2c[24], 0x71, &i2c[48]);
> -    get_pca9548_channels(i2c[25], 0x72, &i2c[56]);
> -    get_pca9548_channels(i2c[26], 0x76, &i2c[64]);
> -    get_pca9548_channels(i2c[27], 0x76, &i2c[72]);
> +    pca954x_i2c_get_channels(i2c[11], 0x77, "pca9548", &i2c[40]);
> +    pca954x_i2c_get_channels(i2c[24], 0x71, "pca9548", &i2c[48]);
> +    pca954x_i2c_get_channels(i2c[25], 0x72, "pca9548", &i2c[56]);
> +    pca954x_i2c_get_channels(i2c[26], 0x76, "pca9548", &i2c[64]);
> +    pca954x_i2c_get_channels(i2c[27], 0x76, "pca9548", &i2c[72]);
>      for (int i = 0; i < 8; i++) {
> -        get_pca9548_channels(i2c[40 + i], 0x76, &i2c[80 + i * 8]);
> +        pca954x_i2c_get_channels(i2c[40 + i], 0x76, "pca9548",
> +                                 &i2c[80 + i * 8]);
>      }
>  
>      i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
> diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
> index 3945de795c..6b07804546 100644
> --- a/hw/i2c/i2c_mux_pca954x.c
> +++ b/hw/i2c/i2c_mux_pca954x.c
> @@ -169,6 +169,16 @@ I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel)
>      return pca954x->bus[channel];
>  }
>  
> +void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,
> +                              const char *type_name, I2CBus **channels)
> +{
> +    I2CSlave *mux = i2c_slave_create_simple(bus, type_name, address);
> +    Pca954xClass *pc = PCA954X_GET_CLASS(mux);
> +    Pca954xState *pca954x = PCA954X(mux);
> +
> +    memcpy(channels, pca954x->bus, pc->nchans * sizeof(channels[0]));
> +}
> +
>  static void pca9546_class_init(ObjectClass *klass, void *data)
>  {
>      Pca954xClass *s = PCA954X_CLASS(klass);
> diff --git a/include/hw/i2c/i2c_mux_pca954x.h b/include/hw/i2c/i2c_mux_pca954x.h
> index 3dd25ec983..3a676a30a9 100644
> --- a/include/hw/i2c/i2c_mux_pca954x.h
> +++ b/include/hw/i2c/i2c_mux_pca954x.h
> @@ -16,4 +16,17 @@
>   */
>  I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel);
>  
> +/**
> + * Creates an i2c mux and retrieves all of the channels associated with it.
> + *
> + * @bus: the i2c bus where the i2c mux resides.
> + * @address: the address of the i2c mux on the aforementioned i2c bus.
> + * @type_name: name of the i2c mux type to create.
> + * @channels: an output parameter specifying where to return the channels.
> + *
> + * Returns: None
> + */
> +void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,
> +                              const char *type_name, I2CBus **channels);
> +
>  #endif
> -- 
> 2.37.0
> 
> 

