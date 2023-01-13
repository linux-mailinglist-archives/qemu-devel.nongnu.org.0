Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CCB669EF0
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:00:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGNIw-00020A-9e; Fri, 13 Jan 2023 11:53:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pGNIa-0001nb-I1; Fri, 13 Jan 2023 11:53:07 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pGNIW-0003Kr-8Y; Fri, 13 Jan 2023 11:52:58 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BF22BB82195;
 Fri, 13 Jan 2023 16:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B2BC433EF;
 Fri, 13 Jan 2023 16:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673628769;
 bh=lkY+RTiBNroZSdLRO5ccPrGIEH7+n5ZCrjWpwDr4vwE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o9kya8BuRUuHs77LU8jN0tJopo+1SPCfEuyc5lEK7+RVlLx4iG8PiEIFKXcU8gBDG
 t2a+cVsKVdGV9ycaZT1S5ih1JvQ5dh6cOFJuxrvlYYpx+RIqxeEeBjrrW28qNXVisZ
 YjzXWy4CvlnvJ9IydUiZo/igAWzMbf8neK0X6BLfFbRP7FhYxQgxBhnp0MZXdbQO+K
 CD+w/NaeSI93tyy7mnnErpEXNFG8by/wXCwcn2LcQh5An+5JLQbCcy3y8fUSnVj9yv
 WKIvnPP1OssnKPeR0h8qklIDp78ikyEENNEJwu8JQb/wuef7M8RuIxq2yrSCArTv/T
 SzPGexlnF+mUg==
Date: Fri, 13 Jan 2023 09:52:46 -0700
From: Keith Busch <kbusch@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>, t@kbusch-mbp.dhcp.thefacebook.com
Cc: Klaus Jensen <its@irrelevant.dk>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <Y8GMXpVZRqoHiTOi@kbusch-mbp.dhcp.thefacebook.com>
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8EcOFE52X5KbzO7@cormorant.local>
 <CAFEAcA9y0E=EZwmetyvymvt64BpQxAnKMHs0E=BBH9_3OfMwFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9y0E=EZwmetyvymvt64BpQxAnKMHs0E=BBH9_3OfMwFA@mail.gmail.com>
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

On Fri, Jan 13, 2023 at 12:32:29PM +0000, Peter Maydell wrote:
> On Fri, 13 Jan 2023 at 08:55, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > +CC qemu pci maintainers
> >
> > Michael, Marcel,
> >
> > Do you have any comments on this thread? As you can see one solution is
> > to simply deassert prior to asserting, the other is to reintroduce a
> > pci_irq_pulse(). Both seem to solve the issue.
> 
> Both seem to be missing any analysis of "this is what is
> happening, this is where we differ from hardware, this
> is why this is the correct fix". We shouldn't put in
> random "this seems to happen to cause the guest to boot"
> fixes, please.

It looks like these are being treated as edge instead of level
interrupts so the work-around is to create more edges. I would
definitely prefer a real fix, whether that's in the kernel or CPU
emulation or somewhere else, but I'm not sure I'll have time to see it
to completion.

FWIW, x86 seems to handle legacy IRQs with NVMe as expected. It's
actually easy enough for the DEASSERT to take so long that kernel
reports the irq as "spurious" because it's spinning too often on the
level.

