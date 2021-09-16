Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D51140DCAF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:28:54 +0200 (CEST)
Received: from localhost ([::1]:36284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsNh-0001m4-92
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mQsGp-0000Bx-So; Thu, 16 Sep 2021 10:21:47 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:43738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mQsGo-0005Fo-3R; Thu, 16 Sep 2021 10:21:47 -0400
Received: by mail-oi1-x231.google.com with SMTP id w19so9238303oik.10;
 Thu, 16 Sep 2021 07:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=g3fH0kitaRvXNz+rFG1iJUIiYAoVOGco0OLNKw0onqw=;
 b=NJhri5f7VkDjs/JtBW9yBxQZjokFbEN2fK1rQJttQBomGW7t50+Wj/Bqds/1vfqZbP
 FZtgCb3qjW6hRb+YYAHmNlzqg6Y23gKuSsEwecHL/iaTTtI2qDY6zDhSXq0HAzvd/fqf
 6pEGrnDVY6ZQkZReBKuLlSeUOao3FcWSBFNF2U17eORJMdWdbU4s1ps1iCh1Qw5RywJG
 MqrAGP4ZhSH/7X0jP/BMHS+nWBkx6/rKO6kVfPYcl+VEzYN4rDjOGxlnHG9QBJmv3wTF
 3Llx0ZiTL2GlObtpql3jMvqcg3Wq5PbvCPg+nUyFaMiXfSJxGlCd47CUQ5OnjEOj23RT
 r8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=g3fH0kitaRvXNz+rFG1iJUIiYAoVOGco0OLNKw0onqw=;
 b=fH+Yqgo9WYr4VIUQp+LovgFzCBNV2fMYBRGthjpuJOWVDrA/odJVtqTgUnEroESB1/
 CZMWOdW30hU+ChcZwPKjnhhGVuv3/jHr6ZJoWvsKaf0FArLtsCm9ZafpbnPwjTv3U3vw
 3/E5jiA1p027Y0edPF/OYuQmmoAAolFERS3XuLPZYn9ovlZhdoaFBgF275cBTQA0dRBL
 hsQxufP9TCrtwvbaY67fQrOfoqz0XvYYzU7uYxb81ffqNl8GRJSUmpxABMfEhLtDz/+K
 MDxv1/CFsLoO24h4sEFwemqQJ1tHuOuC0srzn5X44vzZMBT4tZTUvjKcqeLSo0EyQMag
 TWBA==
X-Gm-Message-State: AOAM5310PJVgKFx7yUHTvbtJieduDT3yydAGcLDsHD//WNEX9cer4vjX
 U3Z3BTWXmTiai1ggk2tGJx0=
X-Google-Smtp-Source: ABdhPJw6VeZUDvA/yCQPLhBiZx3tilzLq9IYDejFls22Q2VJnQReNFM9izt9g8y3mxNM3DQ8ViHnsw==
X-Received: by 2002:a05:6808:3099:: with SMTP id
 bl25mr63983oib.44.1631802103800; 
 Thu, 16 Sep 2021 07:21:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f17sm794655otl.24.2021.09.16.07.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 07:21:42 -0700 (PDT)
Date: Thu, 16 Sep 2021 07:21:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Cheng, Xuzhou" <Xuzhou.Cheng@windriver.com>
Subject: Re: [PATCH] hw/ssi: imx_spi: Improve chip select handling
Message-ID: <20210916142140.GA252836@roeck-us.net>
References: <CAFEAcA_cAp6kWTE6Lpx6QF1zfTYfQXiOPgdfkztS3iuJkRB0xQ@mail.gmail.com>
 <b5e43e87-c1bd-3265-298e-346413a22a82@roeck-us.net>
 <CAEUhbmWN1=j=hPntg1j6aOv-AZNDm1UrDFB364Qqf0SAccyJew@mail.gmail.com>
 <c49b65a2-fa3e-c180-5fdf-a0a64cb91a32@amsat.org>
 <e08467c0-bd69-81d3-93d3-13b8fc812453@roeck-us.net>
 <CAEUhbmX9JxE+VxSL8BWGd_XKD-WJ0r5d5MKsbdVgPiJkZd5Y3w@mail.gmail.com>
 <CAEUhbmVfFRdbtu7yWUauO6sd0QNhoH6tuTAFA2PMxZp5P7+awA@mail.gmail.com>
 <PH0PR11MB5205AE78D6C5DFFFA767183B97D49@PH0PR11MB5205.namprd11.prod.outlook.com>
 <8b86d434-a2e6-8122-0a88-dc9a15fbfe87@roeck-us.net>
 <PH0PR11MB5205684F9CDEC890187D09D997DC9@PH0PR11MB5205.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR11MB5205684F9CDEC890187D09D997DC9@PH0PR11MB5205.namprd11.prod.outlook.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 16, 2021 at 10:21:16AM +0000, Cheng, Xuzhou wrote:
> > diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> > index 189423bb3a..7a093156bd 100644
> > --- a/hw/ssi/imx_spi.c
> > +++ b/hw/ssi/imx_spi.c
> > @@ -167,6 +167,8 @@  static void imx_spi_flush_txfifo(IMXSPIState *s)
> >      DPRINTF("Begin: TX Fifo Size = %d, RX Fifo Size = %d\n",
> >              fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s->rx_fifo));
> >  
> > +    qemu_set_irq(s->cs_lines[imx_spi_selected_channel(s)], 0);
> > +
> >      while (!fifo32_is_empty(&s->tx_fifo)) {
> >          int tx_burst = 0;
> >  
> > @@ -385,13 +387,6 @@  static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
> >      case ECSPI_CONREG:
> >          s->regs[ECSPI_CONREG] = value;
> >  
> > -        burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
> > -        if (burst % 8) {
> > -            qemu_log_mask(LOG_UNIMP,
> > -                          "[%s]%s: burst length %d not supported: rounding up to next multiple of 8\n",
> > -                          TYPE_IMX_SPI, __func__, burst);
> > -        }
> > -
> >          if (!imx_spi_is_enabled(s)) {
> >              /* device is disabled, so this is a soft reset */
> >              imx_spi_soft_reset(s);
> > @@ -404,9 +399,11 @@  static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
> >  
> >              /* We are in master mode */
> >  
> > -            for (i = 0; i < ECSPI_NUM_CS; i++) {
> > -                qemu_set_irq(s->cs_lines[i],
> > -                             i == imx_spi_selected_channel(s) ? 0 : 1);
> > +            burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH);
> > +            if (burst == 0) {
> > +                for (i = 0; i < ECSPI_NUM_CS; i++) {
> > +                    qemu_set_irq(s->cs_lines[i], 1);
> > +                }
> >              }
> 
> I got some free time in the past days to investigate this issue. Guenter is right, the Linux imx-spi driver does not work on QEMU.
> 
> The reason is that the state of m25p80 machine loops in STATE_READING_DATA state after receiving RDSR command, the new command is ignored. Before sending a new command, the CS line should be pulled to high, this make the state of m25p80 back to IDLE.
> 
> I have same point with Guenter, it's that set CS to 1 when burst is zero. But i don't think it is necessary to set CS to 0 in imx_spi_flush_txfifo(). I will send a new patch to fix this issue.
> 

Thanks a lot for looking into this. If you have a better solution than mine, by
all means, please go for it. As I mentioned in my patch, I didn't really like
it, but I was unable to find a better solution.

> BTW, the Linux driver uses DMA mode when transfer length is greater than the FIFO size, But QEMU imx-spi model doesn't support DMA now.

Does it have practical impact ? Obviously my tests were somewhat limited (I was
happy to get Linux booting from flash), but I don't recall seeing a problem.

Thanks,
Guenter

