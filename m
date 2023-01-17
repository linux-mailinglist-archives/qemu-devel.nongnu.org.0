Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D375466E320
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:11:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHoWy-0006ho-AQ; Tue, 17 Jan 2023 11:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pHoWo-0006T4-DF; Tue, 17 Jan 2023 11:09:38 -0500
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pHoWm-00038D-Lg; Tue, 17 Jan 2023 11:09:38 -0500
Received: by mail-oo1-xc34.google.com with SMTP id
 b10-20020a4a9fca000000b004e6f734c6b4so8090788oom.9; 
 Tue, 17 Jan 2023 08:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=eyJpE3KWQYn/ymHW3x9YOT3A5+fVcqbK/X3WriJMynY=;
 b=TKzxUzP9aWkBrGHz2stDEPf8q/102GWOXg1DuFkL8F3B1BePjzooAzvsS8ZM+L0xIm
 vM6On96C98KnABu6573OknqcsDs14rGl17HCkHjbYkuZ6nehItNSDscztxMgafbHJdWq
 wyEMD2MUjutpKC8bXzvDrOmbC24skj2LJ+bQji9B4XQP3lDjPtW9Qov3QlSl024Z1W9L
 s8EvKNPiy5wiM8VhNSPOF0ZSWDmG6p2r8qTCtPBA9DdYd6y3GtDKBiPURCXVojsn8Jmi
 33FI46a1U4JPwmBbIL3ciryFpbSLrU32v9POCSHQ657fKvPal36KudX1aItdOTfShGS2
 sclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eyJpE3KWQYn/ymHW3x9YOT3A5+fVcqbK/X3WriJMynY=;
 b=uRNmf375ZlmZ65JqWamNTZIxlN7+wev7DOGKcL2zyQBw3+HqMRVcmAsCH6ZY2BaWOm
 +u/hGDHpx7hZwcbvUBz2+Oyv1s6vPsVkynb0nKIiz8BCW4YQr0mfz3gIpgtPsDlIJrwt
 u2CTlnNlv1RmGnsFM7rnCL9mQCCdyjZDxdO6077jiPwsxgn0MeVZgLgzCHfwrlVXaeeH
 g2RxtlEOK8z8NQNH8qwm9S2mJ/McCL3XA9+FspAcliE0I/3IU4rmAZgaUt0iJYLBgID0
 l99Ym1+H+rkKMDUx2p6lIs2hPpcv0xbAxiNjD8BpaOkomIF4J5SLQgVAv+VqhbTOLTtd
 XjQA==
X-Gm-Message-State: AFqh2ko8ce2cCHqBDZzy4LWs2mGqlK8vNNrmqDycdZEl4VRxtU/VtAwn
 TzRoqfnz4c/deRV+2rUP9JY=
X-Google-Smtp-Source: AMrXdXviCxf8DNsXD+PpjJZ4mm8n4XqJ9ruIkFLOBN+9gmjZRPym9NR4Nyw462Lpp227wxTlWbWKhg==
X-Received: by 2002:a4a:d302:0:b0:4f2:b68d:31aa with SMTP id
 g2-20020a4ad302000000b004f2b68d31aamr1705139oos.1.1673971775030; 
 Tue, 17 Jan 2023 08:09:35 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a4ae08f000000b004f1f6b25091sm12989560oos.41.2023.01.17.08.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 08:09:34 -0800 (PST)
Date: Tue, 17 Jan 2023 08:09:33 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Keith Busch <kbusch@kernel.org>
Cc: Klaus Jensen <its@irrelevant.dk>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <20230117160933.GB3091262@roeck-us.net>
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8W+H6T9DOZ08SoF@cormorant.local> <Y8Yq5faCjAKzMa9O@kbusch-mbp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8Yq5faCjAKzMa9O@kbusch-mbp>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=groeck7@gmail.com; helo=mail-oo1-xc34.google.com
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

On Mon, Jan 16, 2023 at 09:58:13PM -0700, Keith Busch wrote:
> On Mon, Jan 16, 2023 at 10:14:07PM +0100, Klaus Jensen wrote:
> > I noticed that the Linux driver does not use the INTMS/INTMC registers
> > to mask interrupts on the controller while processing CQEs. While not
> > required by the spec, it is *recommended* in setups not using MSI-X to
> > reduce the risk of spurious and/or missed interrupts.
> 
> That's assuming completions are deferred to a bottom half. We don't do
> that by default in Linux nvme, though you can ask the driver to do that
> if you want.
>  
> > With the patch below, running 100 boot iterations, no timeouts were
> > observed on QEMU emulated riscv64 or mips64.
> >
> > No changes are required in the QEMU hw/nvme interrupt logic.
> 
> Yeah, I can see why: it forces the irq line to deassert then assert,
> just like we had forced to happen within the device side patches. Still,
> none of that is supposed to be necessary, but this idea of using these
> registers is probably fine.

There is still no answer why this would be necessary in the first place,
on either side. In my opinion, unless someone can confirm that the problem
is seen with real hardware, we should assume that it happens on the qemu
side and address it there.

Guenter

> 
> >  static irqreturn_t nvme_irq(int irq, void *data)
> > +{
> > +       struct nvme_queue *nvmeq = data;
> > +       struct nvme_dev *dev = nvmeq->dev;
> > +       u32 mask = 1 << nvmeq->cq_vector;
> > +       irqreturn_t ret = IRQ_NONE;
> > +       DEFINE_IO_COMP_BATCH(iob);
> > +
> > +       writel(mask, dev->bar + NVME_REG_INTMS);
> > +
> > +       if (nvme_poll_cq(nvmeq, &iob)) {
> > +               if (!rq_list_empty(iob.req_list))
> > +                       nvme_pci_complete_batch(&iob);
> > +               ret = IRQ_HANDLED;
> > +       }
> > +
> > +       writel(mask, dev->bar + NVME_REG_INTMC);
> > +
> > +       return ret;
> > +}
> 
> If threaded interrupts are used, you'll want to do the masking in
> nvme_irq_check(), then clear it in the threaded handler instead of doing
> both in the same callback.
> 
> > +static irqreturn_t nvme_irq_msix(int irq, void *data)
> >  {
> >         struct nvme_queue *nvmeq = data;
> >         DEFINE_IO_COMP_BATCH(iob);
> > @@ -1602,12 +1623,13 @@ static int queue_request_irq(struct nvme_queue *nvmeq)
> >  {
> >         struct pci_dev *pdev = to_pci_dev(nvmeq->dev->dev);
> >         int nr = nvmeq->dev->ctrl.instance;
> > +       irq_handler_t handler = pdev->msix_enabled ? nvme_irq_msix : nvme_irq;
> > 
> >         if (use_threaded_interrupts) {
> >                 return pci_request_irq(pdev, nvmeq->cq_vector, nvme_irq_check,
> > -                               nvme_irq, nvmeq, "nvme%dq%d", nr, nvmeq->qid);
> > +                               handler, nvmeq, "nvme%dq%d", nr, nvmeq->qid);
> >         } else {
> > -               return pci_request_irq(pdev, nvmeq->cq_vector, nvme_irq,
> > +               return pci_request_irq(pdev, nvmeq->cq_vector, handler,
> >                                 NULL, nvmeq, "nvme%dq%d", nr, nvmeq->qid);
> >         }
> >  }
> > 
> > 
> 
> 

