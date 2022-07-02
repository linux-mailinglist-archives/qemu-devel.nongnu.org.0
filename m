Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95332563D9A
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 03:50:31 +0200 (CEST)
Received: from localhost ([::1]:49626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7SHF-0001Od-RK
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 21:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1o7SFv-0000EL-8g
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 21:49:07 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41924 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1o7SFs-0000Sv-NO
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 21:49:07 -0400
Received: from [10.20.42.170] (unknown [10.20.42.170])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv+Pno79ii4sCAA--.8113S3;
 Sat, 02 Jul 2022 09:48:24 +0800 (CST)
Message-ID: <9db0a8ae-8412-339d-f5ff-0c4264678897@loongson.cn>
Date: Sat, 2 Jul 2022 09:48:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] hw/intc: loongarch_pch_msi: Fix msi vector convertion
Content-Language: en-US
From: maobibo <maobibo@loongson.cn>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>, 
 qemu-devel@nongnu.org
References: <20220701030740.2469162-1-maobibo@loongson.cn>
In-Reply-To: <20220701030740.2469162-1-maobibo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxv+Pno79ii4sCAA--.8113S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWFW5try7GF4rAF4DGrWxJFb_yoW5uFW5pF
 Zrur45tr48Jw4DXFZ7K34UZr95GFn7GFyIvF4akryxCrW3Arn8W3WkJrZrWF4UKw4kGryq
 vw18G3Zrua1UGaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUva14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
 026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
 JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
 vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280
 aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
 uYvjfU5WlkUUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Add to peter.maydell@linaro.org

在 2022/7/1 11:07, Mao Bibo 写道:
> Loongarch pch msi intc connects to extioi controller, the range of irq number
> is 64-255. Here adds irqbase property for loongarch pch msi controller, we can
> get irq offset from view of pch_msi controller with the method:
>   msi vector (from view of upper extioi intc) - irqbase
> 
> Signed-off-by: Mao Bibo <maobibo@loongson.cn>
> ---
>  hw/intc/loongarch_pch_msi.c         | 22 ++++++++++++++++++++--
>  hw/loongarch/loongson3.c            |  1 +
>  include/hw/intc/loongarch_pch_msi.h |  2 ++
>  3 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/loongarch_pch_msi.c b/hw/intc/loongarch_pch_msi.c
> index 74bcdbdb48..b36d6d76e4 100644
> --- a/hw/intc/loongarch_pch_msi.c
> +++ b/hw/intc/loongarch_pch_msi.c
> @@ -23,9 +23,14 @@ static uint64_t loongarch_msi_mem_read(void *opaque, hwaddr addr, unsigned size)
>  static void loongarch_msi_mem_write(void *opaque, hwaddr addr,
>                                      uint64_t val, unsigned size)
>  {
> -    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(opaque);
> -    int irq_num = val & 0xff;
> +    LoongArchPCHMSI *s = (LoongArchPCHMSI *)opaque;
> +    int irq_num;
>  
> +    /*
> +     * vector number is irq number from upper extioi intc
> +     * need subtract irq base to get msi vector offset
> +     */
> +    irq_num = (val & 0xff) - s->irq_base;
>      trace_loongarch_msi_set_irq(irq_num);
>      assert(irq_num < PCH_MSI_IRQ_NUM);
>      qemu_set_irq(s->pch_msi_irq[irq_num], 1);
> @@ -58,11 +63,24 @@ static void loongarch_pch_msi_init(Object *obj)
>      qdev_init_gpio_in(DEVICE(obj), pch_msi_irq_handler, PCH_MSI_IRQ_NUM);
>  }
>  
> +static Property loongarch_msi_properties[] = {
> +    DEFINE_PROP_UINT32("msi_irq_base", LoongArchPCHMSI, irq_base, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void loongarch_pch_msi_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, loongarch_msi_properties);
> +}
> +
>  static const TypeInfo loongarch_pch_msi_info = {
>      .name          = TYPE_LOONGARCH_PCH_MSI,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(LoongArchPCHMSI),
>      .instance_init = loongarch_pch_msi_init,
> +    .class_init    = loongarch_pch_msi_class_init,
>  };
>  
>  static void loongarch_pch_msi_register_types(void)
> diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
> index bd20ebbb78..403dd91e11 100644
> --- a/hw/loongarch/loongson3.c
> +++ b/hw/loongarch/loongson3.c
> @@ -267,6 +267,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
>      }
>  
>      pch_msi = qdev_new(TYPE_LOONGARCH_PCH_MSI);
> +    qdev_prop_set_uint32(pch_msi, "msi_irq_base", PCH_MSI_IRQ_START);
>      d = SYS_BUS_DEVICE(pch_msi);
>      sysbus_realize_and_unref(d, &error_fatal);
>      sysbus_mmio_map(d, 0, LS7A_PCH_MSI_ADDR_LOW);
> diff --git a/include/hw/intc/loongarch_pch_msi.h b/include/hw/intc/loongarch_pch_msi.h
> index f668bfca7a..6d67560dea 100644
> --- a/include/hw/intc/loongarch_pch_msi.h
> +++ b/include/hw/intc/loongarch_pch_msi.h
> @@ -17,4 +17,6 @@ struct LoongArchPCHMSI {
>      SysBusDevice parent_obj;
>      qemu_irq pch_msi_irq[PCH_MSI_IRQ_NUM];
>      MemoryRegion msi_mmio;
> +    /* irq base passed to upper extioi intc */
> +    unsigned int irq_base;
>  };


