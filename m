Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3FE311E6F
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 16:30:06 +0100 (CET)
Received: from localhost ([::1]:36518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8PXB-0005yL-GM
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 10:30:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l8PVl-00054S-AW
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 10:28:37 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l8PVh-0003md-8s
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 10:28:36 -0500
Received: by mail-ej1-x634.google.com with SMTP id p20so17745927ejb.6
 for <qemu-devel@nongnu.org>; Sat, 06 Feb 2021 07:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HwMjgbftjKDi2lbeG286xdsTw24hvQxNd7Rs4rv2iv8=;
 b=Khc1pVdPRsKuwsbSCsuJLrc9Twh6wj429fSqcVWVi/FzUt+DDW2BjDGPQ7gtyuH7b5
 ISeEnmiwd+YdtZ8zWPTZDaQG0Z/catkcyjIsVu9BGpOU627IVmjWCtyw3bcYy1gNybPj
 TbiMsikTMYY2MDsGJQwKlPYGaTUWuO8DkDqcWEHZQiNoJvljzFg23L4vlZd3/MgExQVQ
 CX3b7kzmLUXElfUURKrKxVlZ03ULNVzhPQE3R2SWp4KsLKNV8/jNiI1MHv0DbF9SgGEN
 RD6zr7JT+IxCd6rh2VbhspIAZ4d+v3s2GiqvwUhNCEVVXsPvzhiVOj0HJukf8ZAqIngc
 pJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HwMjgbftjKDi2lbeG286xdsTw24hvQxNd7Rs4rv2iv8=;
 b=sybqHULSmar/KAAScbZPB/LI0Ti/OE8lihDkDOQGUrAeb6JJPxLbhWVAX0WyZHHOqo
 ojpn7xD+UpHnXnuJlg7DwqItSx+Rxht54wq8wWxpTdDlVNGuUeIH5LItb3dm+uuD5mZb
 41/FdsZs73zWoKMayAWur6gwlOvgT1LK5sdbAmaiYUm1Zf1mccru9ChmlsZSRQyxDyA9
 6WaEhDgLPRB5UVRBIXy05cVujaRf3lQ9aeb59mL2X8X3sy3fVYKOtUsAWeoDWyXEY1MU
 zfs3GJoXjPnO9USbtO0TrP+91g/ERr4CJ1BGyf7+LBN6oKVdNFsf65DitIiLKEotxqC5
 eOlA==
X-Gm-Message-State: AOAM533kbSiurH9A2RVJ8Xv7Qb0e1P9ApxsdSD5AYlxF8JkmL3XYRjDF
 FTkvyU+JYGODv1vWmVikZ4VDYDb5JJ1WmH7SRO2/Tw==
X-Google-Smtp-Source: ABdhPJxSWUVS7+NYPldNWKmmbNw2MO490EAmPpuxcHktVykwlSkXhDZjUBPJrD52pfJYKAJrjXkhDQJ6rFJmcw09xuk=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr9575707ejd.250.1612625311619; 
 Sat, 06 Feb 2021 07:28:31 -0800 (PST)
MIME-Version: 1.0
References: <1612622294-37297-1-git-send-email-bmeng.cn@gmail.com>
 <1612622294-37297-3-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1612622294-37297-3-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 6 Feb 2021 15:28:20 +0000
Message-ID: <CAFEAcA-VWeAPSTFKJ6dZ4-M7OYdqyw1wwBgzpNuasPYRzMvRWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/ssi: xilinx_spips: Implement basic QSPI DMA support
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 6 Feb 2021 at 14:38, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
> is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
> crash. This is observed when testing VxWorks 7.
>
> Add a basic implementation of QSPI DMA functionality.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

> +static size_t xlnx_zynqmp_gspips_dma_push(XlnxZynqMPQSPIPS *s,
> +                                          uint8_t *buf, size_t len, bool eop)
> +{
> +    hwaddr dst = (hwaddr)s->regs[R_GQSPI_DMA_ADDR_MSB] << 32
> +                 | s->regs[R_GQSPI_DMA_ADDR];
> +    uint32_t size = s->regs[R_GQSPI_DMA_SIZE];
> +    uint32_t mlen = MIN(size, len) & (~3); /* Size is word aligned */
> +
> +    if (size == 0 || len <= 0) {
> +        return 0;
> +    }
> +
> +    cpu_physical_memory_write(dst, buf, mlen);
> +    size = xlnx_zynqmp_gspips_dma_advance(s, mlen, dst);
> +
> +    if (size == 0) {
> +        xlnx_zynqmp_gspips_dma_done(s);
> +        xlnx_zynqmp_qspips_update_ixr(s);
> +    }
> +
> +   return mlen;
> +}

> @@ -861,7 +986,7 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
>          recv_fifo = &s->rx_fifo;
>      }
>      while (recv_fifo->num >= 4
> -           && stream_can_push(rq->dma, xlnx_zynqmp_qspips_notify, rq))
> +           && xlnx_zynqmp_gspips_dma_can_push(rq))
>      {
>          size_t ret;
>          uint32_t num;
> @@ -874,7 +999,7 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
>
>          memcpy(rq->dma_buf, rxd, num);
>
> -        ret = stream_push(rq->dma, rq->dma_buf, num, false);
> +        ret = xlnx_zynqmp_gspips_dma_push(rq, rq->dma_buf, num, false);
>          assert(ret == num);
>          xlnx_zynqmp_qspips_check_flush(rq);
>      }

This seems to be removing the existing handling of DMA to the
TYPE_STREAM_SINK via the stream_* functions -- that doesn't look
right. I don't know any of the details of this device, but if it
has two different modes of DMA then we need to support both of them,
surely ?

If the device really should be doing its own DMA memory
accesses, please don't use cpu_physical_memory_write() for
this. The device should take a TYPE_MEMORY_REGION link property,
and the board code should set this to tell the device what
its view of the world that it is doing DMA to is. Then the
device in its realize method calls address_space_init() to create
an AddressSpace for this MemoryRegion, and does memory accesses
using functions like address_space_read()/address_space_write()/
address_space_ld*()/etc. (Examples in hw/dma, eg pl080.c.)
Note that the address_space* functions have a return value
indicating whether the access failed, which you should handle.
(The pl080 code doesn't do that, but that's because it's older code.)

thanks
-- PMM

