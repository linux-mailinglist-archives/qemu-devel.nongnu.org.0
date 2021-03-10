Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5183F333FD8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 15:02:27 +0100 (CET)
Received: from localhost ([::1]:41352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJzPu-0007mP-9M
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 09:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJzN4-0006Kt-1w
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:59:30 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJzMz-0007bW-9i
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:59:29 -0500
Received: by mail-ej1-x633.google.com with SMTP id bm21so38880827ejb.4
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 05:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0LrANqHdqYx8BSQh+nfnL5xgto1AbhjTeXjKx6Wb0AI=;
 b=jhYbf62YR1BBS7GZM2eag0MEBnwp2XtmOCISQYWP3s14JPe9syhzTK7/RZQVSzWTNG
 hYPZo/DwwxoV88uCjPRAfU7RMYrFMn2Fa7a5TPTJ0Q3q8AAPGfBJ9Q4vTmcMggWWgzxS
 fi33HEzK+cT3eV5Ox9RmPbHgYmBXdaPbfNcFllfXwriFH65TmC++/eufT1HJI6zaNoLt
 LNdhzQl8QJ0wTzTiNaLu3uDO7Ebr+53f9UoqECb51MjBmSTJ1RafkImgcWHlLLeA85Ke
 3UdPqPN37Pn6nd3DAa7JJ88NOvP3eBwC0pJmsdAzXB/fvdZuv4Rf5yL7kdRa+gxvjnag
 yTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0LrANqHdqYx8BSQh+nfnL5xgto1AbhjTeXjKx6Wb0AI=;
 b=fPvB7w4KIpkXymchBbj7IIQrYHp66DcCKX0HfEZk0TI+GNNKCNs0a3lQBbLezIeuPv
 kgGHImmyIokiHvHpx73pAKsU3gOle1BBXUTz94cB0OPxaAdq5wmQCD5Ve4m7DwLibgKk
 SfbLtsxGsjzFDssWY1b2o2GcA5GQurjYzD3Ztq2FnqInQSO9JIVtfkZpq/pdT1Mnmx9v
 Q3/fTugyANV788mG+ks9TmDl9+ZBhqPfkJj28Vlr5UdxvzFHnWSq3G1qSyRa+MDT+t86
 S94mVXeI8xAxxcWe9is4oOI7gVwbxx18kHZsncGL051O31rH9Qg2KIDkY8mshCsERn/d
 kIKg==
X-Gm-Message-State: AOAM531lYiNazOOYSsIAxqAYAOZ3No+2bjOnXy+kxShKuNNpTa3no8Iw
 YzLrSv75iZH7+Hglw45qb9KuwR07g2yuQco/IR4uSA==
X-Google-Smtp-Source: ABdhPJyy1qvaWKrM7oHzaHscY6EBvdEaCB0z9ySaRjEDgQUiS7FmDSB0CgM5kWcjop8pTq+fmc6VTpeJecusfMhF21A=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr3842828ejg.482.1615384763357; 
 Wed, 10 Mar 2021 05:59:23 -0800 (PST)
MIME-Version: 1.0
References: <20210303135254.3970-1-bmeng.cn@gmail.com>
 <20210303135254.3970-2-bmeng.cn@gmail.com>
In-Reply-To: <20210303135254.3970-2-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Mar 2021 13:59:05 +0000
Message-ID: <CAFEAcA814mW91KMVBUhhspXvwCvv_EAQaFkCpu5F8-yNv_noLQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] hw/dma: Implement a Xilinx CSU DMA model
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Mar 2021 at 13:53, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
> is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
> crash. This is observed when testing VxWorks 7.
>
> This adds a Xilinx CSU DMA model and the implementation is based on
> https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c.
> The DST part of the model is verified along with ZynqMP GQSPI model.
>

> +/* len is in bytes */
> +static uint32_t xlnx_csu_dma_read(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
> +{
> +    hwaddr addr = (hwaddr)s->regs[R_ADDR_MSB] << 32 | s->regs[R_ADDR];
> +    MemTxResult result = MEMTX_OK;
> +
> +    if (xlnx_csu_dma_burst_is_fixed(s)) {
> +        uint32_t i;
> +
> +        for (i = 0; i < len && (result == MEMTX_OK); i += s->width) {
> +            uint32_t mlen = MIN(len - i, s->width);
> +
> +            result = address_space_rw(s->dma_as, addr, s->attr,
> +                                      buf + i, mlen, false);
> +        }
> +    } else {
> +        result = address_space_rw(s->dma_as, addr, s->attr, buf, len, false);
> +    }
> +
> +    if (result == MEMTX_OK) {
> +        xlnx_csu_dma_data_process(s, buf, len);
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address 0x%lx for mem read",
> +                      __func__, addr);

Using %lx to print a hwaddr (or other 64-bit values) won't compile
on 32-bit hosts or on OSX. For hwaddr you need to use TARGET_FMT_plx.

I've fixed up these issues in the pullreq.

thanks
-- PMM

