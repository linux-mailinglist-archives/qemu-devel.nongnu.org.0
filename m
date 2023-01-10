Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B72663F9E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 13:00:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFDIJ-0008LO-DX; Tue, 10 Jan 2023 06:59:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1pFDIH-0008L1-5L; Tue, 10 Jan 2023 06:59:53 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1pFDIF-0000ko-JF; Tue, 10 Jan 2023 06:59:52 -0500
Received: by mail-lf1-x12e.google.com with SMTP id bf43so18043899lfb.6;
 Tue, 10 Jan 2023 03:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Enphj4QWUBr4Y3uiQc+tSq3HSn6+RSZVOvkBSMD3ATc=;
 b=ALptHkMS/9xBVwFy8PnDAX7wWpKFyEnkWaUq2eQZljrJqJT4XoaNX+0UBNjkTSPKkT
 dzCTXZtL6DbxNe7pJcKM8mPkMyYb+lBn+yUshDgYxsyRAWUUcyevR5bZbbTTLQ5CN+bI
 Q6Lga43AB8bFVPQkBDhDuz8ryCY39lOq5ZShP4BuCsOloyfFe54RlAbyp6cswe2078vH
 txnYszUKtzadlJgGWAEciQy2xBIPTuLZHfOqGJn4JZ9cTXnebY167ELgHslyX6O1sbEr
 cVtlCRVF5t3fKveP1bShrcTQrxBrLNYZka6s+FjL5dVdbtWQvs32nDoRCa/VPT7+jWTr
 v2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Enphj4QWUBr4Y3uiQc+tSq3HSn6+RSZVOvkBSMD3ATc=;
 b=cRxqBkMmDKc8+Gjj2zg2HUjOlVGhp6xYmLhFEbRIuuAe20Vtjbvbd4KZXQyyOQKfOl
 ImGym/nuBanMsQYbarKK6fVzCWhfSYLHJPnY/jbzbHu86ap/u/zaWh64XqrGXnd6aNFs
 mAYDU4hjXBGOnvJ1+We0fHjSMorPRrTctFqo6R/roMLdFXb9r7UVCTXLAaTn+K0+//Ib
 K4MWLtw7J+ig6l3AMpduTaMDUCjMJ6uQoYQXNCNr1SmqB7hpjqDgjZOXdOQ1uMA0t2zv
 ZzBF0wukl7AY/p1OyrGxBTDT9cFjvtYVjo+VQPxuEpyIab3J66cRkJX1T204X1lS8so+
 rH7w==
X-Gm-Message-State: AFqh2kp3CNUkiXnrbn5Zk63wT7Ek1NRS6o1WIbs2eKzS5gYOpH168YmY
 UcyvdgKt/tpexsoDdIrZEEo=
X-Google-Smtp-Source: AMrXdXvi7ca7kIPJSOlCNg0hK+Gl58zsFW7Nrjgh2L00TllPG7++L0SQY+TbXl4oeEU2wy1jrxOgug==
X-Received: by 2002:a05:6512:3a91:b0:4b5:799b:6c8b with SMTP id
 q17-20020a0565123a9100b004b5799b6c8bmr20557843lfu.56.1673351989016; 
 Tue, 10 Jan 2023 03:59:49 -0800 (PST)
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a056512344b00b004cafd4cc1fdsm2137675lfr.5.2023.01.10.03.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 03:59:48 -0800 (PST)
Date: Tue, 10 Jan 2023 12:59:48 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: Re: [PATCH 13/14] hw/intc/xilinx_intc: Use 'XpsIntc' typedef instead
 of 'struct xlx_pic'
Message-ID: <Y71TNMLD9Q/pxLQO@toto>
References: <20230109140306.23161-1-philmd@linaro.org>
 <20230109140306.23161-14-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230109140306.23161-14-philmd@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Jan 09, 2023 at 03:03:05PM +0100, Philippe Mathieu-Daudé wrote:
> This remove a use of 'struct' in the DECLARE_INSTANCE_CHECKER()
> macro call, to avoid after a QOM refactor:
> 
>   hw/intc/xilinx_intc.c:45:1: error: declaration of anonymous struct must be a definition
>   DECLARE_INSTANCE_CHECKER(struct xlx_pic, XILINX_INTC,


Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>


>                            ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/intc/xilinx_intc.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
> index 4c4397b3d2..6e5012e66e 100644
> --- a/hw/intc/xilinx_intc.c
> +++ b/hw/intc/xilinx_intc.c
> @@ -42,10 +42,10 @@
>  #define R_MAX       8
>  
>  #define TYPE_XILINX_INTC "xlnx.xps-intc"
> -DECLARE_INSTANCE_CHECKER(struct xlx_pic, XILINX_INTC,
> -                         TYPE_XILINX_INTC)
> +typedef struct XpsIntc XpsIntc;
> +DECLARE_INSTANCE_CHECKER(XpsIntc, XILINX_INTC, TYPE_XILINX_INTC)
>  
> -struct xlx_pic
> +struct XpsIntc
>  {
>      SysBusDevice parent_obj;
>  
> @@ -62,7 +62,7 @@ struct xlx_pic
>      uint32_t irq_pin_state;
>  };
>  
> -static void update_irq(struct xlx_pic *p)
> +static void update_irq(XpsIntc *p)
>  {
>      uint32_t i;
>  
> @@ -87,10 +87,9 @@ static void update_irq(struct xlx_pic *p)
>      qemu_set_irq(p->parent_irq, (p->regs[R_MER] & 1) && p->regs[R_IPR]);
>  }
>  
> -static uint64_t
> -pic_read(void *opaque, hwaddr addr, unsigned int size)
> +static uint64_t pic_read(void *opaque, hwaddr addr, unsigned int size)
>  {
> -    struct xlx_pic *p = opaque;
> +    XpsIntc *p = opaque;
>      uint32_t r = 0;
>  
>      addr >>= 2;
> @@ -106,11 +105,10 @@ pic_read(void *opaque, hwaddr addr, unsigned int size)
>      return r;
>  }
>  
> -static void
> -pic_write(void *opaque, hwaddr addr,
> -          uint64_t val64, unsigned int size)
> +static void pic_write(void *opaque, hwaddr addr,
> +                      uint64_t val64, unsigned int size)
>  {
> -    struct xlx_pic *p = opaque;
> +    XpsIntc *p = opaque;
>      uint32_t value = val64;
>  
>      addr >>= 2;
> @@ -154,7 +152,7 @@ static const MemoryRegionOps pic_ops = {
>  
>  static void irq_handler(void *opaque, int irq, int level)
>  {
> -    struct xlx_pic *p = opaque;
> +    XpsIntc *p = opaque;
>  
>      /* edge triggered interrupt */
>      if (p->c_kind_of_intr & (1 << irq) && p->regs[R_MER] & 2) {
> @@ -168,7 +166,7 @@ static void irq_handler(void *opaque, int irq, int level)
>  
>  static void xilinx_intc_init(Object *obj)
>  {
> -    struct xlx_pic *p = XILINX_INTC(obj);
> +    XpsIntc *p = XILINX_INTC(obj);
>  
>      qdev_init_gpio_in(DEVICE(obj), irq_handler, 32);
>      sysbus_init_irq(SYS_BUS_DEVICE(obj), &p->parent_irq);
> @@ -179,7 +177,7 @@ static void xilinx_intc_init(Object *obj)
>  }
>  
>  static Property xilinx_intc_properties[] = {
> -    DEFINE_PROP_UINT32("kind-of-intr", struct xlx_pic, c_kind_of_intr, 0),
> +    DEFINE_PROP_UINT32("kind-of-intr", XpsIntc, c_kind_of_intr, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -193,7 +191,7 @@ static void xilinx_intc_class_init(ObjectClass *klass, void *data)
>  static const TypeInfo xilinx_intc_info = {
>      .name          = TYPE_XILINX_INTC,
>      .parent        = TYPE_SYS_BUS_DEVICE,
> -    .instance_size = sizeof(struct xlx_pic),
> +    .instance_size = sizeof(XpsIntc),
>      .instance_init = xilinx_intc_init,
>      .class_init    = xilinx_intc_class_init,
>  };
> -- 
> 2.38.1
> 

