Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A64EE9B9
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 10:28:01 +0200 (CEST)
Received: from localhost ([::1]:53942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naCdU-0007NO-PZ
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 04:28:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1naCOE-0000t1-3A; Fri, 01 Apr 2022 04:12:17 -0400
Received: from [2a00:1450:4864:20::136] (port=40614
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1naCOB-0005ni-UD; Fri, 01 Apr 2022 04:12:13 -0400
Received: by mail-lf1-x136.google.com with SMTP id t25so3429840lfg.7;
 Fri, 01 Apr 2022 01:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ok/eFYSyMIDWPLR3+wbpOx70tluoiUodTB6IQ/klXpo=;
 b=d2os131eEvCGwYyjVrtk0LZUIB96KKJmbOYOedihQL4ojFdIU/rdjLSAuYtEBKzlN6
 R5kx46T2mdjtf9bs7kRvHes3241h3ewkb3hkd3GpAasSeGKZliclpUrUV2/ncQYe9/zy
 vX7nKiEUJQWxZBANOajy6Rvx7rU4lPB6hK7XQTdWhWgSa2BdgSuY7EUjSJaSx49Buqpb
 /I1KQM3hbR/dSRfviilSxq7NqxTZTXo3bY9SycXgcCo+Ja61+k8/3WgKFNfALj6NhvT4
 5KPYi7SM0uqTi9JulRQxNyLEh4Rag44asEsexCdVlCFaoYhvdlBySrZeBejUyijAAZ/8
 RM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ok/eFYSyMIDWPLR3+wbpOx70tluoiUodTB6IQ/klXpo=;
 b=sbXTt2maGjFJ/Vi3VFys62hI5IFtU9D3lqevukc3HL9+jfDBh0tFZuogccakVOATCf
 aBa5Xq9uQ+c2v4HdichTZgfhiSbltdIUwoHNGbECKpT55sZ/SnNRSpb07Jh1Anw/bRz5
 uDdId+gTS9Z9Hh0mOMchJPHIoRkbLRJ9XKZmFl2tFNmk1f8Ji0+ufTwZ6F7OD2oovCoa
 nw7exYuXpwmvSy3OqgAgdxIy8tN0xzdSMbrrgj8+pcQrD1Cq0e+lqCREJ0t7crplxwta
 uR37W+qyrXq4g9OOUtw7xvooy45QK4nTe4fnGaNo4TgMhDfJzqhmMN68borHT1z+ECeB
 JwOg==
X-Gm-Message-State: AOAM532flmGqiFr9CD4bQE5Z5KDS3GvRyPZQeQ6qISJpaEsPD+cHlUCt
 U0WCl8mmNRcpDyL6ScZ5ntQ=
X-Google-Smtp-Source: ABdhPJwrUnd5oM6YMQ19F1whJEU47Jr3eCoEoLVNtoF5tNgFQ5mBpSQQp3gR07QOrtstlkW2YDLXUw==
X-Received: by 2002:a05:6512:3dab:b0:44a:247:2d8 with SMTP id
 k43-20020a0565123dab00b0044a024702d8mr13067548lfv.628.1648800729385; 
 Fri, 01 Apr 2022 01:12:09 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a2e3c15000000b0024af39be634sm138445lja.28.2022.04.01.01.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 01:12:08 -0700 (PDT)
Date: Fri, 1 Apr 2022 10:12:07 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 2/2] hw/arm/xlnx-zynqmp: Connect 4 TTC timers
Message-ID: <20220401081206.GB18849@fralle-msi>
References: <20220331222017.2914409-1-edgar.iglesias@gmail.com>
 <20220331222017.2914409-3-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331222017.2914409-3-edgar.iglesias@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -1006
X-Spam_score: -100.7
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-100.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 asifsiddiqui120@gmail.com, edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com,
 alistair@alistair23.me, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org, francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2022 Apr 01] Fri 00:20:17, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Connect the 4 TTC timers on the ZynqMP.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  include/hw/arm/xlnx-zynqmp.h |  4 ++++
>  hw/arm/xlnx-zynqmp.c         | 22 ++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 9d9a9d0bf9..85fd9f53da 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -41,6 +41,7 @@
>  #include "hw/or-irq.h"
>  #include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
>  #include "hw/misc/xlnx-zynqmp-crf.h"
> +#include "hw/timer/cadence_ttc.h"
>  
>  #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
>  OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
> @@ -84,6 +85,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
>  #define XLNX_ZYNQMP_MAX_RAM_SIZE (XLNX_ZYNQMP_MAX_LOW_RAM_SIZE + \
>                                    XLNX_ZYNQMP_MAX_HIGH_RAM_SIZE)
>  
> +#define XLNX_ZYNQMP_NUM_TTC 4
> +
>  /*
>   * Unimplemented mmio regions needed to boot some images.
>   */
> @@ -128,6 +131,7 @@ struct XlnxZynqMPState {
>      qemu_or_irq qspi_irq_orgate;
>      XlnxZynqMPAPUCtrl apu_ctrl;
>      XlnxZynqMPCRF crf;
> +    CadenceTTCState ttc[XLNX_ZYNQMP_NUM_TTC];
>  
>      char *boot_cpu;
>      ARMCPU *boot_cpu_ptr;
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 5bfe285a19..375309e68e 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -68,6 +68,9 @@
>  #define APU_ADDR            0xfd5c0000
>  #define APU_IRQ             153
>  
> +#define TTC0_ADDR           0xFF110000
> +#define TTC0_IRQ            36
> +
>  #define IPI_ADDR            0xFF300000
>  #define IPI_IRQ             64
>  
> @@ -316,6 +319,24 @@ static void xlnx_zynqmp_create_crf(XlnxZynqMPState *s, qemu_irq *gic)
>      sysbus_connect_irq(sbd, 0, gic[CRF_IRQ]);
>  }
>  
> +static void xlnx_zynqmp_create_ttc(XlnxZynqMPState *s, qemu_irq *gic)
> +{
> +    SysBusDevice *sbd;
> +    int i, irq;
> +
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_TTC; i++) {
> +        object_initialize_child(OBJECT(s), "ttc[*]", &s->ttc[i],
> +                                TYPE_CADENCE_TTC);
> +        sbd = SYS_BUS_DEVICE(&s->ttc[i]);
> +
> +        sysbus_realize(sbd, &error_fatal);
> +        sysbus_mmio_map(sbd, 0, TTC0_ADDR + i * 0x10000);
> +        for (irq = 0; irq < 3; irq++) {
> +            sysbus_connect_irq(sbd, irq, gic[TTC0_IRQ + i * 3 + irq]);
> +        }
> +    }
> +}
> +
>  static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
>  {
>      static const struct UnimpInfo {
> @@ -721,6 +742,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>      xlnx_zynqmp_create_efuse(s, gic_spi);
>      xlnx_zynqmp_create_apu_ctrl(s, gic_spi);
>      xlnx_zynqmp_create_crf(s, gic_spi);
> +    xlnx_zynqmp_create_ttc(s, gic_spi);
>      xlnx_zynqmp_create_unimp_mmio(s);
>  
>      for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
> -- 
> 2.25.1
> 

