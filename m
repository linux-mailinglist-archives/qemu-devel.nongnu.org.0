Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F5358196C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 20:10:02 +0200 (CEST)
Received: from localhost ([::1]:39436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGP0L-0004Rb-PU
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 14:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1oGOxt-00028m-LG
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:07:29 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:50578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1oGOxr-0007bJ-M2
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:07:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C138A612B8;
 Tue, 26 Jul 2022 18:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71F1C433C1;
 Tue, 26 Jul 2022 18:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658858844;
 bh=A+aQYuazoGioEylxPwpKbZqwPLhlM+M/LO9Kzyj9VXY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uc4sGWPzi2LU6GYsm0d/AXesKLbpL8RBpJtURoOneudtREXn1zvO6SByKyY/U9Dfe
 hUWzBlipBp0oYXqYgC2lM5nX445kb4lHs7blqxntLlScYhexbaJLNWPnt+Av/j8yA+
 8cbSXgvtv2BBdpZRNlsqbGq4RleXNbwKBxKx+ck90TQNCQtvgL9Sg23g4xGQ9RjQyR
 yKGSR+mx5QDWWTT0yha8XFDHvVU2nLLvuKes2iYonXoWi41ejhCjJRo3CQqkrTD9Au
 gfbncF9hOlwpyiGyLlkMuYXETdb8ieML8cEhkDCgaYtLli1tbKWW32j+P8A0z2QQPm
 Z8JzdSFxdMNHQ==
Date: Tue, 26 Jul 2022 12:07:20 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, its@irrelevant.dk
Subject: Re: [PATCH] hw/nvme: Add iothread support
Message-ID: <YuAtWPjAu2j+ttvo@kbusch-mbp.dhcp.thefacebook.com>
References: <20220720090053.309229-1-fanjinhao21s@ict.ac.cn>
 <E29F6EF6-F2BF-41F4-B04E-E6D901D64078@ict.ac.cn>
 <Yt/+GfYPyeM4gFdq@kbusch-mbp.dhcp.thefacebook.com>
 <2606E835-E12F-4AE2-8CBC-7267016AAB7B@ict.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2606E835-E12F-4AE2-8CBC-7267016AAB7B@ict.ac.cn>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=kbusch@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jul 26, 2022 at 11:32:57PM +0800, Jinhao Fan wrote:
> at 10:45 PM, Keith Busch <kbusch@kernel.org> wrote:
> 
> > On Tue, Jul 26, 2022 at 04:55:54PM +0800, Jinhao Fan wrote:
> >> Hi Klaus and Keith,
> >> 
> >> I just added support for interrupt masking. How can I test interrupt
> >> masking?
> > 
> > Are you asking about MSI masking? I don't think any drivers are using the
> > feature, so you'd need to modify one to test it. I can give you some pointers
> > if you are asking about MSI.
> 
> Thanks Keith,
> 
> Do I understand correctly: qemu-nvme only supports MSI-X and pin-based
> interrupts. So MSI masking here is equivalent with MSI-X masking.

It looks like qemu's nvme only supports MSI-x. I could have sworn it used to
support MSI, but I must be thinking of an unofficial fork.

I was mainly asking about MSI masking as it relates to nvme controller's
IVMS/IVMC registers. I don't think any driver is making use of these, and those
don't apply to MSI-x; just MSI and legacy.

At the PCIe level, masking MSI vectors is in Config space. Writing to Config
space is too slow to do per-interrupt, so NVMe created the IVMS/IVMC registers
to get around that.

> If the above is correct, I think I am asking about MSI masking.
> 
> BTW, a double check on ctrl.c seems to show that we only support disabling
> interrupt at CQ creation time, which is recorded in the cq->irq_enabled.
> This is different from my prior understanding that interrupts can be
> disabled at runtime by a call like Linux irq_save(). Therefore I doubt
> whether qemu-nvme supported "interrupt masking" before. How do you
> understand qemu-nvme’s interrupt masking support?

MSI-x uses MMIO for masking, so there's no need for an NVMe specific way to
mask these interrupts. You can just use the generic PCIe methods to clear the
vector's enable bit. But no NVMe driver that I know of is making use of these
either, though it should be possible to make linux start doing that.
 
The CQ irq_enabled field is there so the user can create a pure polling queue.
That's a fixed property of the queue that can't be re-enabled without
destroying and recreating.

The linux irq_save only disables local CPU interrupts from most sources. All
pci devices are unaware of this and can still send their interrupt messages to
the CPU, but the CPU won't context switch to the irq handler until after
irqrestore is called.

