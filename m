Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7622E66D580
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 06:00:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHe3Q-0002te-6a; Mon, 16 Jan 2023 23:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pHe3O-0002tS-3g; Mon, 16 Jan 2023 23:58:34 -0500
Received: from sin.source.kernel.org ([145.40.73.55])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pHe3L-0006e8-T6; Mon, 16 Jan 2023 23:58:33 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7A3EACE0E64;
 Tue, 17 Jan 2023 04:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DC7C433F2;
 Tue, 17 Jan 2023 04:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673931496;
 bh=dYVdx+Ww2CfXncIVy08wDRj2+oyhj7B25DQdw626ylc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q/g8he4R219NhQ0PQlHB7xvg4aVNqjy2WT2X9VG71QkP4JgQtZa6p49aJ88btaUTa
 ZBZm3IW43eIMGHncX6ZDOJ4V0MHFovZiUymL0n8gg5nKdTmthUZEjoq0fxxL/rnk/h
 Kio2jMeOT9jNO5UJ0F99Lf5VSxdLBBkh5FRh7IC5FYBIBGDBmDCyM4avqsYbkgz4uL
 YR2EJTM/m7t+1IeSiKk6aV87xQASkxMLxBcsBRRWk4U+dCJlXWjHLhuhWWvuzrR3C2
 GoATeQLKsMz6WL5c547zdWEIcpYab6ODoF4Kf4pG6oNTVfpytdkagl7oo8RX83Yqzb
 kNya7CY+qhhSA==
Date: Mon, 16 Jan 2023 21:58:13 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <Y8Yq5faCjAKzMa9O@kbusch-mbp>
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8W+H6T9DOZ08SoF@cormorant.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8W+H6T9DOZ08SoF@cormorant.local>
Received-SPF: pass client-ip=145.40.73.55; envelope-from=kbusch@kernel.org;
 helo=sin.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Mon, Jan 16, 2023 at 10:14:07PM +0100, Klaus Jensen wrote:
> I noticed that the Linux driver does not use the INTMS/INTMC registers
> to mask interrupts on the controller while processing CQEs. While not
> required by the spec, it is *recommended* in setups not using MSI-X to
> reduce the risk of spurious and/or missed interrupts.

That's assuming completions are deferred to a bottom half. We don't do
that by default in Linux nvme, though you can ask the driver to do that
if you want.
 
> With the patch below, running 100 boot iterations, no timeouts were
> observed on QEMU emulated riscv64 or mips64.
>
> No changes are required in the QEMU hw/nvme interrupt logic.

Yeah, I can see why: it forces the irq line to deassert then assert,
just like we had forced to happen within the device side patches. Still,
none of that is supposed to be necessary, but this idea of using these
registers is probably fine.

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

If threaded interrupts are used, you'll want to do the masking in
nvme_irq_check(), then clear it in the threaded handler instead of doing
both in the same callback.

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



