Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684C6672C49
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 00:08:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIHVm-0005xW-Ab; Wed, 18 Jan 2023 18:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pIHVj-0005wp-SI; Wed, 18 Jan 2023 18:06:27 -0500
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pIHVh-0006Dw-N4; Wed, 18 Jan 2023 18:06:27 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6BC3FCE1BDD;
 Wed, 18 Jan 2023 23:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC18C433D2;
 Wed, 18 Jan 2023 23:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674083179;
 bh=lcb6GuRijycbENkRa5NSzL13WIRCluuTeRxRDSMoH70=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GUs/RS0YfEksCw/lMycxmQD8QBJcOIEewwLUJn18ThIi5l6sbs2/PLfDzq5Jux59B
 kupEKhhbateTuZVedVk/dlRNgTZmkgLuPmA8UDaPholhxb/CkGdhhTgsEpxesrnK12
 0ZoMWsMz/SViA+CQfj1b7oEfQxaKw4eV/cjh1jBvlKXU54bbc2Pcnxp4ZsmDXZbxNf
 kdD2mr+njM1zyEBC34ZkL+ErzAW/lwajXdWTexKYNaOc+np8D9eSlhnuLSGGWPUxZR
 uj1VVkqsB6ddtWtBhKpS9XuclnzPMTvWYJpmN6930tcqt+MmGiO6SGm6N9Z4S8ysr/
 x4wQOK0iqpxag==
Date: Wed, 18 Jan 2023 16:06:16 -0700
From: Keith Busch <kbusch@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Klaus Jensen <its@irrelevant.dk>,
 Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <Y8h7aOuVfCb+RsAP@kbusch-mbp>
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8W+H6T9DOZ08SoF@cormorant.local> <Y8Yq5faCjAKzMa9O@kbusch-mbp>
 <20230117160933.GB3091262@roeck-us.net>
 <CAFEAcA9pS7P=SvKsOtRHPtkrNAD8LF2ZpFJ870G3B-rhWYap4g@mail.gmail.com>
 <20230117192115.GA2958104@roeck-us.net>
 <CAFEAcA_T8QqSg4SzszP+wR3pR1P1WTZg4f7mHHBGRw4UrTw+DQ@mail.gmail.com>
 <Y8gfQXPYdHKd1v4I@kbusch-mbp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8gfQXPYdHKd1v4I@kbusch-mbp>
Received-SPF: pass client-ip=2604:1380:40e1:4800::1;
 envelope-from=kbusch@kernel.org; helo=sin.source.kernel.org
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

On Wed, Jan 18, 2023 at 09:33:05AM -0700, Keith Busch wrote:
> On Wed, Jan 18, 2023 at 03:04:06PM +0000, Peter Maydell wrote:
> > On Tue, 17 Jan 2023 at 19:21, Guenter Roeck <linux@roeck-us.net> wrote:
> > > Anyway - any idea what to do to help figuring out what is happening ?
> > > Add tracing support to pci interrupt handling, maybe ?
> > 
> > For intermittent bugs, I like recording the QEMU session under
> > rr (using its chaos mode to provoke the failure if necessary) to
> > get a recording that I can debug and re-debug at leisure. Usually
> > you want to turn on/add tracing to help with this, and if the
> > failure doesn't hit early in bootup then you might need to
> > do a QEMU snapshot just before point-of-failure so you can
> > run rr only on the short snapshot-to-failure segment.
> > 
> > https://translatedcode.wordpress.com/2015/05/30/tricks-for-debugging-qemu-rr/
> > https://translatedcode.wordpress.com/2015/07/06/tricks-for-debugging-qemu-savevm-snapshots/
> > 
> > This gives you a debugging session from the QEMU side's perspective,
> > of course -- assuming you know what the hardware is supposed to do
> > you hopefully wind up with either "the guest software did X,Y,Z
> > and we incorrectly did A" or else "the guest software did X,Y,Z,
> > the spec says A is the right/a permitted thing but the guest got confused".
> > If it's the latter then you have to look at the guest as a separate
> > code analysis/debug problem.
> 
> Here's what I got, though I'm way out of my depth here.
> 
> It looks like Linux kernel's fasteoi for RISC-V's PLIC claims the
> interrupt after its first handling, which I think is expected. After
> claiming, QEMU masks the pending interrupt, lowering the level, though
> the device that raised it never deasserted.

I'm not sure if this is correct, but this is what I'm coming up with and
appears to fix the problem on my setup. The hardware that sets the
pending interrupt is going clear it, so I don't see why the interrupt
controller is automatically clearing it when the host claims it.

---
diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index c2dfacf028..f8f7af08dc 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -157,7 +157,6 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
             uint32_t max_irq = sifive_plic_claimed(plic, addrid);
 
             if (max_irq) {
-                sifive_plic_set_pending(plic, max_irq, false);
                 sifive_plic_set_claimed(plic, max_irq, true);
             }
 
--

