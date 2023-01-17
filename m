Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96B266E315
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:07:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHoUa-00052G-Cq; Tue, 17 Jan 2023 11:07:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pHoTO-0004eP-8W; Tue, 17 Jan 2023 11:06:06 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pHoTJ-0002cg-2N; Tue, 17 Jan 2023 11:06:05 -0500
Received: by mail-oi1-x231.google.com with SMTP id s66so25622467oib.7;
 Tue, 17 Jan 2023 08:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=Vqe2awhsOiuy9AyNPpvJ0a+YmpPZRYtxmL79wj217Lg=;
 b=LxA2fNAJzJqc2ZPC1iDNRKCva61BCwRKbIHv232B7K6OIIVHbOE9EumZRrF/ip0XHz
 CrpBq7shPgoiTzfChjRn+JhH1v+cgHBiwjSRa4lTavhe733sk3tI9dLA/yhAGPt0bpQk
 2rW+dSCcZ+vwg6vaE57bf/rdlDX8eZDjhL1x0l2rg2gk5u/cOZAphgndpteS0YUzMD00
 RTmjiL7Fi/5tMO4DvSBv2V91Xi4BSzE+2jbr5TbK1ByzC0GYUGkNzggRdvwwJqcQ39Mz
 Bpcov3vlpXn8LjHtv2HSSsPWhdW3x7ZgMA+gJgHhunBGKBIgOAtPodnvoPt2ohg0kolH
 dDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vqe2awhsOiuy9AyNPpvJ0a+YmpPZRYtxmL79wj217Lg=;
 b=Q/9wA9x+2JBF0C3w0VwEtc7E9h49lBaSFUWUWkGrQa7CJik0tTUxm/5Gz/Iw2q71fQ
 aM4vqYfZxnRBzo3UxONjXIBHVR1wCz3QT3MO9ld92nFimDwspAooUdFGyKt1WCB36ADp
 8m6wX+NeJH8IKFAwfUGO1YLKMHqqYBATMJNXhWvewJMPVtHZKTD8ppm+6INYrreqqYzm
 RgIlAnvCXt8u8Khgqw9vvxT5oESGsEQXQxzrMs3WSDEftc7hOci5ZSvJhk0ypiEAzzxp
 LNsWdRPqC/ZZxvJ2rcCUvBsyQJk2cR2XYOPLzdtWhfGw75Tzv2S20Zp3r65qzhFltamp
 wTYQ==
X-Gm-Message-State: AFqh2ko9R1vKuZs/31EDBLUhRNuo4f8n6vCVOdV8VW0Vbyg8kQqIfEOF
 rnmu2ni1Ymynq7Ftg30GoCI=
X-Google-Smtp-Source: AMrXdXuu49pmZp5zzLMiRnctE9uqswGtnT222UhRv1DiISpkyaY1JiAHFqoxzALh0DjajIA3MFcwOA==
X-Received: by 2002:a54:4592:0:b0:364:b798:9ab3 with SMTP id
 z18-20020a544592000000b00364b7989ab3mr1570387oib.36.1673971552924; 
 Tue, 17 Jan 2023 08:05:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a056808008400b0035028730c90sm14807814oic.1.2023.01.17.08.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 08:05:52 -0800 (PST)
Date: Tue, 17 Jan 2023 08:05:50 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <20230117160550.GA3091262@roeck-us.net>
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8W+H6T9DOZ08SoF@cormorant.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8W+H6T9DOZ08SoF@cormorant.local>
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

On Mon, Jan 16, 2023 at 10:14:07PM +0100, Klaus Jensen wrote:
[ ... ]
> 
> I noticed that the Linux driver does not use the INTMS/INTMC registers
> to mask interrupts on the controller while processing CQEs. While not
> required by the spec, it is *recommended* in setups not using MSI-X to
> reduce the risk of spurious and/or missed interrupts.
> 
> With the patch below, running 100 boot iterations, no timeouts were
> observed on QEMU emulated riscv64 or mips64.
> 
> No changes are required in the QEMU hw/nvme interrupt logic.
> 

Yes, but isn't that technically similar to dropping the
interrupt request and raising it again, or in other words
pulsing the interrupt ?

I still don't understand why the (level triggered) interrupt
pin would require pulsing in the first place.

Thanks,
Guenter

> 
> diff --git i/drivers/nvme/host/pci.c w/drivers/nvme/host/pci.c
> index b13baccedb4a..75f6b87c4c3f 100644
> --- i/drivers/nvme/host/pci.c
> +++ w/drivers/nvme/host/pci.c
> @@ -1128,6 +1128,27 @@ static inline int nvme_poll_cq(struct nvme_queue *nvmeq,
>  }
> 
>  static irqreturn_t nvme_irq(int irq, void *data)
> +{
> +       struct nvme_queue *nvmeq = data;
> +       struct nvme_dev *dev = nvmeq->dev;
> +       u32 mask = 1 << nvmeq->cq_vector;
> +       irqreturn_t ret = IRQ_NONE;
> +       DEFINE_IO_COMP_BATCH(iob);
> +
> +       writel(mask, dev->bar + NVME_REG_INTMS);
> +
> +       if (nvme_poll_cq(nvmeq, &iob)) {
> +               if (!rq_list_empty(iob.req_list))
> +                       nvme_pci_complete_batch(&iob);
> +               ret = IRQ_HANDLED;
> +       }
> +
> +       writel(mask, dev->bar + NVME_REG_INTMC);
> +
> +       return ret;
> +}
> +
> +static irqreturn_t nvme_irq_msix(int irq, void *data)
>  {
>         struct nvme_queue *nvmeq = data;
>         DEFINE_IO_COMP_BATCH(iob);
> @@ -1602,12 +1623,13 @@ static int queue_request_irq(struct nvme_queue *nvmeq)
>  {
>         struct pci_dev *pdev = to_pci_dev(nvmeq->dev->dev);
>         int nr = nvmeq->dev->ctrl.instance;
> +       irq_handler_t handler = pdev->msix_enabled ? nvme_irq_msix : nvme_irq;
> 
>         if (use_threaded_interrupts) {
>                 return pci_request_irq(pdev, nvmeq->cq_vector, nvme_irq_check,
> -                               nvme_irq, nvmeq, "nvme%dq%d", nr, nvmeq->qid);
> +                               handler, nvmeq, "nvme%dq%d", nr, nvmeq->qid);
>         } else {
> -               return pci_request_irq(pdev, nvmeq->cq_vector, nvme_irq,
> +               return pci_request_irq(pdev, nvmeq->cq_vector, handler,
>                                 NULL, nvmeq, "nvme%dq%d", nr, nvmeq->qid);
>         }
>  }
> 
> 



