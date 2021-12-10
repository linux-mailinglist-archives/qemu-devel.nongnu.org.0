Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75B8470393
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 16:13:55 +0100 (CET)
Received: from localhost ([::1]:34746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvhaq-0004pD-8x
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 10:13:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvhZ2-0003Rj-Nr
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:12:00 -0500
Received: from [2a00:1450:4864:20::436] (port=45915
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvhYz-0005SR-Cc
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:11:58 -0500
Received: by mail-wr1-x436.google.com with SMTP id o13so15384996wrs.12
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 07:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=icOKEq1DRrDRHaEvq1ebU+n2GcFZOdjpYZ4AInfNr4Q=;
 b=uoNpk9ZnEeBsuBKSThjY3y0jnb70NKuKdXRInU8nm1ISK0ORbBwMoVCsJTzQK9Lj6k
 mzp5QUPLZq/rImnAGe2w+brdFjPsC3DkU36B/GfJRkZ2HWo0+RUROt19IGgfT73gURL4
 i4gkx78GIyloBCr326KTxVIhKnvhGURZUWRMqByNrOZ5LXvSbf+i02Tk1a7nytSnleJD
 lB4mSOgLWKjKMvPLPMNSyD2lW3LRDQzpk25YgdHd5xkmrYKDL+YaeJL22NNIIEinEIzg
 s2S1mbOTC3Zj0oqWWb0b0X1tpY/ZExHIcrXnewB+t2ZMHTTjB8zcA92EUpuOb/P+Qcmh
 A2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=icOKEq1DRrDRHaEvq1ebU+n2GcFZOdjpYZ4AInfNr4Q=;
 b=NlUg/uibXTOVGy8jZGxQoDZEkfd8d+KkhIL5dTtC7vVbjzHNI9L9UXHnF/bRlKHP4C
 wYkrMMXJVVCV96NIuloQbz71p8t7ZcwvkssrByAJlbI4gsLzcJQcK+iVUJ3Crf066zBk
 FBUhIgL5zeemKP8UtLgEwGwlk1AFEHqGpZfqDevHvbTvZKC7RhhMGfbiHNQ6CsQz4OL1
 9oiWD2+cTbFlYg4jqEakTxGLkHgmsVAsz6IrIhmgxyrROYKyxw/HC+izA4cp5i54/Ywe
 z0vU4O7OyM+nNC85p/4not8f43G9QR/nBlI3IDpSNg6zNg3ysiGkSp7r6Q0U0dzJde+b
 rH0w==
X-Gm-Message-State: AOAM5304fwxaGKQwH5LTBzZZLZUxAQK6ZP3nFCIxRPcUAuFSmiGUR0Ps
 xPtBPle2gDdpxisagmWU1Cot+RzsjWWlzHMicijJdQ==
X-Google-Smtp-Source: ABdhPJzxTAQSxAxFopZHUwzfpduPD0Tq2NpqW58rmBa0Evp9j4+ewtZO7zIZ+lGFkNVTCk3xEBeZcCdC/NSpIATlA5M=
X-Received: by 2002:adf:f64b:: with SMTP id x11mr14946867wrp.4.1639149114293; 
 Fri, 10 Dec 2021 07:11:54 -0800 (PST)
MIME-Version: 1.0
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
 <20211201154023.13931-2-francisco.iglesias@xilinx.com>
In-Reply-To: <20211201154023.13931-2-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Dec 2021 15:11:41 +0000
Message-ID: <CAFEAcA9=cHr4NhVc_gnbM83fEEVXduJ1iyfYXSYk6PUu0grW8g@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] hw/misc: Add a model of Versal's PMC SLCR
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Dec 2021 at 15:40, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> Add a model of Versal's PMC SLCR (system-level control registers).
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> +static void xlnx_versal_pmc_iou_slcr_realize(DeviceState *dev, Error **errp)
> +{
> +    XlnxVersalPmcIouSlcr *s = XILINX_VERSAL_PMC_IOU_SLCR(dev);
> +
> +    qdev_init_gpio_out(dev, s->sd_emmc_sel, 2);
> +    qdev_init_gpio_out(dev, &s->qspi_ospi_mux_sel, 1);
> +    qdev_init_gpio_out(dev, &s->ospi_mux_sel, 1);

Could we use named GPIOs for these? That would be clearer
in the code that wires them up than having to remember what
unnamed gpio lines 0,1,2,3 do.

(Also, I don't see anywhere in the board code in patch 2
that wires these GPIO lines up. Did I miss it?)

> +#ifndef XILINX_VERSAL_PMC_IOU_SLCR_H
> +#define XILINX_VERSAL_PMC_IOU_SLCR_H

For a complicated device like this which has multiple IRQs
and GPIOs, I would suggest having a comment here which
defines the "QEMU interface", which is just a list
of all the sysbus MMIO regions, QOM properties, named and
unnamed GPIO inputs and outputs, sysbus IRQs, etc, which the
device has (basically, anything that code creating one of these
devices might want to configure or wire up). There's an
example in include/hw/misc/tz-ppc.h (or grep in include/ for
"QEMU interface" for others).

> +
> +#include "hw/register.h"
> +
> +#define TYPE_XILINX_VERSAL_PMC_IOU_SLCR "xlnx.versal-pmc-iou-slcr"
> +
> +#define XILINX_VERSAL_PMC_IOU_SLCR(obj) \
> +     OBJECT_CHECK(XlnxVersalPmcIouSlcr, (obj), TYPE_XILINX_VERSAL_PMC_IOU_SLCR)

Don't define cast macros by hand, please. Prefer
OBJECT_DECLARE_SIMPLE_TYPE() (which will also do the
typedef for you, so you don't need it on the struct).

> +
> +#define XILINX_VERSAL_PMC_IOU_SLCR_R_MAX (0x828 / 4 + 1)
> +
> +typedef struct XlnxVersalPmcIouSlcr {
> +    SysBusDevice parent_obj;
> +    MemoryRegion iomem;
> +    qemu_irq irq_parity_imr;
> +    qemu_irq irq_imr;
> +    qemu_irq sd_emmc_sel[2];
> +    qemu_irq qspi_ospi_mux_sel;
> +    qemu_irq ospi_mux_sel;
> +
> +    uint32_t regs[XILINX_VERSAL_PMC_IOU_SLCR_R_MAX];
> +    RegisterInfo regs_info[XILINX_VERSAL_PMC_IOU_SLCR_R_MAX];
> +} XlnxVersalPmcIouSlcr;
> +
> +#endif /* XILINX_VERSAL_PMC_IOU_SLCR_H */

Otherwise this patch looks OK.

-- PMM

