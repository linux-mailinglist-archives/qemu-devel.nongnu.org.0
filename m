Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155A0553622
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:32:51 +0200 (CEST)
Received: from localhost ([::1]:60596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fs0-0007XJ-T5
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3fqj-0006Z0-EH
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:31:29 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:45697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3fqZ-00077K-Pm
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:31:29 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id n144so21024103ybf.12
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 08:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0d5VSY4EdS+SVp2wVG56KtAveY0Ghlq+Jw8HFnsLMLE=;
 b=CmTBSuADb+ulcWzGdqsQpXAdOijysUO/94USIVgLqN/qN2Br8Up26anqasDUsJ1FTc
 muvExS1ksth8cZdRrWFBro3QXKcaVWioe+Og5884cDyWQD8dsB5GdScE/o3RX5tccSWt
 siC5+rL2A2YrYJyNUDtdrYVOPZTiTdQOAft0VMSKTg9CFAbeAe9+sgVWxfb8vDYqsulL
 Vb0A3yVP4QKUoAG/3H1khn1LYb8haaoQhl2T6FcO6qFTkAl9+RwrBZvAiEl09O2Nuyn3
 WnF8KaLKhAPXV/rFKBWoi9rViBhrIxjx4iioJE4NlzV13a7RrPEG45C+VYpHNPLqIfCh
 KnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0d5VSY4EdS+SVp2wVG56KtAveY0Ghlq+Jw8HFnsLMLE=;
 b=gHTH8PuBDm8d9G1EMrTxdvLXXrOaaRj8dkycqtkgycuqDUiqjOHu12fgEQfsFzGVIM
 7+eGTfcpXopu/D2EqeZYz+WTNjcYDHR5SvwPxlEOxZTQ67sEQhcWehb4/NmMkpAWRl53
 ycO/Dz8igwpNbqMG2OM7RAvUU/TyIkF6JkNKJd/IK786DWA+vOvNPUOSvxflFkznyBzk
 xgVldrqosvlt/5aK/G2+BRM7XE6O5sOsLZ/v8+DXM7bXe844jlKuLkSRbwLub8IP7z0B
 qUPKodVy2SIpW6D7Ox6zKPtbpJR4a9nswO2Nj0FIk0YvJ7QTa/hQHShlbjWDl5JOaBeU
 VgIw==
X-Gm-Message-State: AJIora988xfMAbYfPZebCwTsR6RSm6BeZFqelx5FgTIy+kHHP5SUlY9w
 eHRAZS8/ixibMrra3B1UAOg7eESxOaTajj5kVh7c4w==
X-Google-Smtp-Source: AGRyM1ufQl7HkhkGiwFBjndgA0osmDQ/qllibHtLOiinZayvmMu+ilYKTKBUlqKMDV+Xzq31Gy4BTtJcegb0PuanVa4=
X-Received: by 2002:a05:6902:1505:b0:668:c93b:d1d0 with SMTP id
 q5-20020a056902150500b00668c93bd1d0mr21693580ybu.140.1655825478136; Tue, 21
 Jun 2022 08:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220609135851.42193-1-alxndr@bu.edu>
In-Reply-To: <20220609135851.42193-1-alxndr@bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 16:30:40 +0100
Message-ID: <CAFEAcA-QOqGWzeeQLLK2pH0WwABzXP2ZjFKxLY7d62bWhGRWxw@mail.gmail.com>
Subject: Re: [PATCH v2] memory: prevent dma-reentracy issues
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Mauro Matteo Cascella <mcascell@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, 9 Jun 2022 at 14:59, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> This flag is set/checked prior to calling a device's MemoryRegion
> handlers, and set when device code initiates DMA.  The purpose of this
> flag is to prevent two types of DMA-based reentrancy issues:
>
> 1.) mmio -> dma -> mmio case
> 2.) bh -> dma write -> mmio case
>
> These issues have led to problems such as stack-exhaustion and
> use-after-frees.
>
> Summary of the problem from Peter Maydell:
> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  include/hw/pci/pci.h   | 13 +++++++++++--
>  include/hw/qdev-core.h |  3 +++
>  softmmu/dma-helpers.c  | 12 ++++++++++++
>  softmmu/memory.c       | 15 +++++++++++++++
>  softmmu/trace-events   |  1 +
>  5 files changed, 42 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 44dacfa224..ab1ad0f7a8 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -834,8 +834,17 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
>                                       void *buf, dma_addr_t len,
>                                       DMADirection dir, MemTxAttrs attrs)
>  {
> -    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
> -                         dir, attrs);
> +    bool prior_engaged_state;
> +    MemTxResult result;
> +
> +    prior_engaged_state = dev->qdev.engaged_in_io;
> +
> +    dev->qdev.engaged_in_io = true;
> +    result = dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
> +                           dir, attrs);
> +    dev->qdev.engaged_in_io = prior_engaged_state;
> +
> +    return result;

Why do we need to do something in this pci-specific function ?
I was expecting this to only need changes at the generic-to-all-devices
level.


> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> index 7820fec54c..7a4f1fb9b3 100644
> --- a/softmmu/dma-helpers.c
> +++ b/softmmu/dma-helpers.c
> @@ -288,8 +288,16 @@ static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
>      uint8_t *ptr = buf;
>      dma_addr_t xresidual;
>      int sg_cur_index;
> +    DeviceState *dev;
> +    bool prior_engaged_state;
>      MemTxResult res = MEMTX_OK;
>
> +    dev = sg->dev;
> +    if (dev) {
> +        prior_engaged_state = dev->engaged_in_io;
> +        dev->engaged_in_io = true;
> +    }
> +
>      xresidual = sg->size;
>      sg_cur_index = 0;
>      len = MIN(len, xresidual);
> @@ -302,6 +310,10 @@ static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
>          xresidual -= xfer;
>      }
>
> +    if (dev) {
> +        dev->engaged_in_io = prior_engaged_state;
> +    }

Not all DMA goes through dma_buf_rw() -- why does it need changes?

> +
>      if (residual) {
>          *residual = xresidual;
>      }

thanks
-- PMM

