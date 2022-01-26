Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1439B49D260
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 20:13:50 +0100 (CET)
Received: from localhost ([::1]:40728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCnjp-0005j9-63
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 14:13:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1nCnbF-00009y-Lg
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 14:04:57 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1nCnbD-0002ua-3B
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 14:04:57 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id E415DC60912;
 Wed, 26 Jan 2022 20:04:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1643223890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zaXUWsO/xoxgRsM55cRiSGXU7nkjuV6MNiLiyDpkaN4=;
 b=cFnGZVti/FH83KuCtaLar1KJC7scYqwKSvUWG4p3DW2J44MwvDu3kNiB+t1g3kz/6N/cBa
 H61XRNoWhba3tua5zBYVhn/He54FucFxUmCKZCwyOUYynCpdFCQmrJeNCcqmiRnXB9T7Ll
 xtTSZ1xhPCZQP6rBIrVm5tWyllZQ/BxblqQdk1rUPBCxvvbsLvwFh0GgPaLDyuy7fjVp2b
 NzVn1nZmtrRwOdGaNCLfzA7rQXW1TZDWHIAu50jx/K8swtqqOcyNhIlze7KJcNNnnp1PRt
 WlwWG/VcrL1WLdKSDOqUn+GrDS9yFI14za9Qorg+boZ8yI+hgL+8DPmWqZ9mOQ==
Date: Wed, 26 Jan 2022 20:04:50 +0100
From: Luc Michel <luc@lmichel.fr>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v7 05/10] hw/dma/xlnx_csu_dma: Support starting a read
 transfer through a class method
Message-ID: <YfGbUktBqo6Y8CFo@sekoia-pc.home.lmichel.fr>
References: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
 <20220121161141.14389-6-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220121161141.14389-6-francisco.iglesias@xilinx.com>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 frasse.iglesias@gmail.com, alistair@alistair23.me, qemu-devel@nongnu.org,
 alistair23@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16:11 Fri 21 Jan     , Francisco Iglesias wrote:
> An option on real hardware when embedding a DMA engine into a peripheral
> is to make the peripheral control the engine through a custom DMA control
> (hardware) interface between the two. Software drivers in this scenario
> configure and trigger DMA operations through the controlling peripheral's
> register API (for example, writing a specific bit in a register could
> propagate down to a transfer start signal on the DMA control interface).
> At the same time the status, results and interrupts for the transfer might
> still be intended to be read and caught through the DMA engine's register
> API (and signals).
> 
> This patch adds a class 'read' method for allowing to start read transfers
> from peripherals embedding and controlling the Xilinx CSU DMA engine as in
> above scenario.
> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/dma/xlnx_csu_dma.h | 19 +++++++++++++++++--
>  hw/dma/xlnx_csu_dma.c         | 17 +++++++++++++++++
>  2 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
> index 28806628b1..922ab80eb6 100644
> --- a/include/hw/dma/xlnx_csu_dma.h
> +++ b/include/hw/dma/xlnx_csu_dma.h
> @@ -51,7 +51,22 @@ typedef struct XlnxCSUDMA {
>      RegisterInfo regs_info[XLNX_CSU_DMA_R_MAX];
>  } XlnxCSUDMA;
>  
> -#define XLNX_CSU_DMA(obj) \
> -    OBJECT_CHECK(XlnxCSUDMA, (obj), TYPE_XLNX_CSU_DMA)
> +OBJECT_DECLARE_TYPE(XlnxCSUDMA, XlnxCSUDMAClass, XLNX_CSU_DMA)
> +
> +struct XlnxCSUDMAClass {
> +    SysBusDeviceClass parent_class;
> +
> +    /*
> +     * read: Start a read transfer on a Xilinx CSU DMA engine
> +     *
> +     * @s: the Xilinx CSU DMA engine to start the transfer on
> +     * @addr: the address to read
> +     * @len: the number of bytes to read at 'addr'
> +     *
> +     * @return a MemTxResult indicating whether the operation succeeded ('len'
> +     * bytes were read) or failed.
> +     */
> +    MemTxResult (*read)(XlnxCSUDMA *s, hwaddr addr, uint32_t len);
> +};
>  
>  #endif
> diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
> index 896bb3574d..095f954476 100644
> --- a/hw/dma/xlnx_csu_dma.c
> +++ b/hw/dma/xlnx_csu_dma.c
> @@ -472,6 +472,20 @@ static uint64_t addr_msb_pre_write(RegisterInfo *reg, uint64_t val)
>      return val & R_ADDR_MSB_ADDR_MSB_MASK;
>  }
>  
> +static MemTxResult xlnx_csu_dma_class_read(XlnxCSUDMA *s, hwaddr addr,
> +                                           uint32_t len)
> +{
> +    RegisterInfo *reg = &s->regs_info[R_SIZE];
> +    uint64_t we = MAKE_64BIT_MASK(0, 4 * 8);
> +
> +    s->regs[R_ADDR] = addr;
> +    s->regs[R_ADDR_MSB] = (uint64_t)addr >> 32;
> +
> +    register_write(reg, len, we, object_get_typename(OBJECT(s)), false);
> +
> +    return (s->regs[R_SIZE] == 0) ? MEMTX_OK : MEMTX_ERROR;
> +}
> +
>  static const RegisterAccessInfo *xlnx_csu_dma_regs_info[] = {
>  #define DMACH_REGINFO(NAME, snd)                                              \
>      (const RegisterAccessInfo []) {                                           \
> @@ -696,6 +710,7 @@ static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
> +    XlnxCSUDMAClass *xcdc = XLNX_CSU_DMA_CLASS(klass);
>  
>      dc->reset = xlnx_csu_dma_reset;
>      dc->realize = xlnx_csu_dma_realize;
> @@ -704,6 +719,8 @@ static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
>  
>      ssc->push = xlnx_csu_dma_stream_push;
>      ssc->can_push = xlnx_csu_dma_stream_can_push;
> +
> +    xcdc->read = xlnx_csu_dma_class_read;
>  }
>  
>  static void xlnx_csu_dma_init(Object *obj)
> -- 
> 2.11.0
> 

-- 

