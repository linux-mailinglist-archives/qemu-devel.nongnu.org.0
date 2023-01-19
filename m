Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C35672F35
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 03:46:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIKv3-0006fZ-4X; Wed, 18 Jan 2023 21:44:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pIKv0-0006et-Sj; Wed, 18 Jan 2023 21:44:46 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pIKuz-00040s-78; Wed, 18 Jan 2023 21:44:46 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C7303B81FBE;
 Thu, 19 Jan 2023 02:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB958C433D2;
 Thu, 19 Jan 2023 02:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674096281;
 bh=kaQPZ3vl61qloDRzyxbeymvoxuaByonmR13aIH8Dfxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ktJH/PDK4f2yKzWtYHCEhdRmk7+MzpgVGFIPOWcb7YvVwZzzk8/luAanxtQC5Rkiy
 daEtByBaXM4taF29eyhUaQuZvYmzeVgfRECSQRHJz18f5LG418bfL8KUZe+Rjb0k0Y
 27SJ9DgGsN2k4Uz36N/IIeplGyf4DgELrgT/xtvx/1lb26JbCrrxBFuo1+zqRoDgOG
 +syHMWV9OFanI3ACEFW8oZZVp3QqLDVNQzIRMUDfHP13cyM0GE8HS/R2bcKyeq/Bjz
 cjk7tm8ja/9n4AaxqpdTFxW/ATd2wK5qipKStqxyK9xi4EJvnhMH1BwzhUUQOcH5l/
 YHEfmJd0LKmRA==
Date: Wed, 18 Jan 2023 19:44:38 -0700
From: Keith Busch <kbusch@kernel.org>
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Klaus Jensen <its@irrelevant.dk>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <Y8iulgdgOdVCjuKE@kbusch-mbp>
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8W+H6T9DOZ08SoF@cormorant.local> <Y8Yq5faCjAKzMa9O@kbusch-mbp>
 <20230117160933.GB3091262@roeck-us.net>
 <CAFEAcA9pS7P=SvKsOtRHPtkrNAD8LF2ZpFJ870G3B-rhWYap4g@mail.gmail.com>
 <20230117192115.GA2958104@roeck-us.net>
 <CAFEAcA_T8QqSg4SzszP+wR3pR1P1WTZg4f7mHHBGRw4UrTw+DQ@mail.gmail.com>
 <Y8gfQXPYdHKd1v4I@kbusch-mbp> <Y8h7aOuVfCb+RsAP@kbusch-mbp>
 <CAKmqyKMHs_-RgagMDYE7vn3MHEP2caBc+RERjaK0DNJw4hFYiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKMHs_-RgagMDYE7vn3MHEP2caBc+RERjaK0DNJw4hFYiA@mail.gmail.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=kbusch@kernel.org; helo=ams.source.kernel.org
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

On Thu, Jan 19, 2023 at 10:41:42AM +1000, Alistair Francis wrote:
> On Thu, Jan 19, 2023 at 9:07 AM Keith Busch <kbusch@kernel.org> wrote:
> > ---
> > diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> > index c2dfacf028..f8f7af08dc 100644
> > --- a/hw/intc/sifive_plic.c
> > +++ b/hw/intc/sifive_plic.c
> > @@ -157,7 +157,6 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
> >              uint32_t max_irq = sifive_plic_claimed(plic, addrid);
> >
> >              if (max_irq) {
> > -                sifive_plic_set_pending(plic, max_irq, false);
> >                  sifive_plic_set_claimed(plic, max_irq, true);
> >              }
> >
> 
> This change isn't correct. The PLIC spec
> (https://github.com/riscv/riscv-plic-spec/releases/download/1.0.0_rc5/riscv-plic-1.0.0_rc5.pdf)
> states:
> 
> """
> On receiving a claim message, the PLIC core will atomically determine
> the ID of the highest-priority pending interrupt for the target and
> then clear down the corresponding source’s IP bit
> """
> 
> which is what we are doing here. We are clearing the pending interrupt
> inside the PLIC

Thanks for the link. That's very helpful.

If you're familiar with this area, could you possibly clear up this part
of that spec?

"
On receiving an interrupt completion message, if the interrupt is
level-triggered and the interrupt is still asserted, a new interrupt
request will be forwarded to the PLIC core.
"

Further up, it says the "interrupt gateway" is responsible for
forwarding new interrupt requests while the level remains asserted, but
it doesn't look like anything is handling that, which essentially turns
this into an edge interrupt. Am I missing something, or is this really
not being handled?

