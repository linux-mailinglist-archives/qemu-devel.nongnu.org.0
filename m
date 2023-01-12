Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E38E667D0F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:54:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1kK-0006VK-VC; Thu, 12 Jan 2023 12:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pG1jj-00064V-7b; Thu, 12 Jan 2023 12:51:43 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pG1jh-0004Qr-Iu; Thu, 12 Jan 2023 12:51:34 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0D3BAB81F02;
 Thu, 12 Jan 2023 17:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB40C433EF;
 Thu, 12 Jan 2023 17:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673545888;
 bh=fuiP92JrsZ2s4CQJRIqi0YU5hv63kZVBIj5+5NdGYTk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TXLpQFrnceqVIM+7XQk+kAOTakBcGvoWzaAJOwutzWIyftrjlGDC80VxMXLLygLBY
 7sDHz4gnOIpbnmLTgxUr/yXdM3cDEX2scDXdGARXVwOumXKWYaE/G/XxYevlh4yriH
 6iSWmWjFGqsh/ZNwA9tZFrfHPGQkSqLo8LPCAiAHO6kQ02pf0FFV6sUzgOWYoHzayM
 Ed9yaet3cVqfo/lFkVwSSKUKNFfzkQgozUJEIL1hNo8wN5yGO0GOCuK5KUk/Xi5Ocp
 xXoVmHwBj3y4zP5FCOoEM2V1+DEgIu3pr+DZy9J564aMEO3mjIeDJV7KoANbsD746l
 009/IeJvJNEFQ==
Date: Thu, 12 Jan 2023 10:51:25 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <Y8BInYMhWZ/IuW4+@kbusch-mbp.dhcp.thefacebook.com>
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8A2qdbDZPicuZfL@kbusch-mbp.dhcp.thefacebook.com>
 <Y8BHUzcbdQ/SFBY9@cormorant.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8BHUzcbdQ/SFBY9@cormorant.local>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=kbusch@kernel.org;
 helo=ams.source.kernel.org
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

On Thu, Jan 12, 2023 at 06:45:55PM +0100, Klaus Jensen wrote:
> On Jan 12 09:34, Keith Busch wrote:
> > On Thu, Jan 12, 2023 at 02:10:51PM +0100, Klaus Jensen wrote:
> > > 
> > > The pin-based interrupt logic in hw/nvme seems sound enough to me, so I
> > > am wondering if there is something going on with the kernel driver (but
> > > I certainly do not rule out that hw/nvme is at fault here, since
> > > pin-based interrupts has also been a source of several issues in the
> > > past).
> > 
> > Does it work if you change the pci_irq_assert() back to pci_irq_pulse()?
> > While probably not the "correct" thing to do, it has better results in
> > my testing.
> > 
> 
> A simple s/pci_irq_assert/pci_irq_pulse broke the device. However,
> 
> 	diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
> 	index 03760ddeae8c..0fc46dcb9ec4 100644
> 	--- i/hw/nvme/ctrl.c
> 	+++ w/hw/nvme/ctrl.c
> 	@@ -477,6 +477,7 @@ static void nvme_irq_check(NvmeCtrl *n)
> 		 return;
> 	     }
> 	     if (~intms & n->irq_status) {
> 	+        pci_irq_deassert(&n->parent_obj);
> 		 pci_irq_assert(&n->parent_obj);
> 	     } else {
> 		 pci_irq_deassert(&n->parent_obj);
> 
> 
> seems to do the trick (pulse is the other way around, assert, then
> deassert).
> 
> Probably not the "correct" thing to do, but I'll take it since it seems
> to fix it. On a simple boot loop I got the timeout about 1 out of 5. I'm
> on ~20 runs now and have not encountered it.

Yep, that looks good. It's sounding like something with the CPU irq
handling is treating the level interrupt as edge triggered.

