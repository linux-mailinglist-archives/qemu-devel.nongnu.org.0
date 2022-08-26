Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22CF5A2C01
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 18:08:50 +0200 (CEST)
Received: from localhost ([::1]:42514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbt3-0004fj-4J
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 12:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oRbfN-0007cc-6D; Fri, 26 Aug 2022 11:54:41 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:33016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oRbfL-0003mZ-EN; Fri, 26 Aug 2022 11:54:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFBD460A14;
 Fri, 26 Aug 2022 15:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D87C433C1;
 Fri, 26 Aug 2022 15:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661529275;
 bh=30txFETwLlGT4y8dD5q/XXc+q5iVRXL1uSIrbdp12j4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fcAwWrx4BckpYxFtwvMVImb9EyJUjg75R1jnrnDRO7fcJV3UyunlH4DXigOkI4V+A
 R+Sc2OBrJYDV9XFD8YLtK9kpGAVhfGV/4mmVJrMHmXnTpZosulYWT89bEiagpndzye
 Y1HAYEgOBH3nsVzI1zJz0QH3bPuc8FBF0+XET0uUh9WZ7O1rTAf311Xup2QpFK9UJn
 NIw4u/gdX998QqrT6DxxvPy14wEFKbHsp/Vtfp+n+vTaLFfwriPcobpTchF5EZazeJ
 UDeF7m4tNcwUJATkkS4R9wUzjJqHdOBdMlgzdTs17cqm8b94PLW6pUvpIPSu7n2w7f
 nugyXIsGAqY6A==
Date: Fri, 26 Aug 2022 09:54:32 -0600
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org,
 stefanha@gmail.com, Klaus Jensen <k.jensen@samsung.com>,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH v2 2/3] hw/nvme: use KVM irqfd when available
Message-ID: <YwjsuPTNd/1pOdjF@kbusch-mbp.dhcp.thefacebook.com>
References: <20220826151206.3148942-1-fanjinhao21s@ict.ac.cn>
 <20220826151206.3148942-3-fanjinhao21s@ict.ac.cn>
 <Ywjn7QOb9EyK1oJc@kbusch-mbp.dhcp.thefacebook.com>
 <YwjqkTgIEcCZJ3Be@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwjqkTgIEcCZJ3Be@apples>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=kbusch@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Fri, Aug 26, 2022 at 05:45:21PM +0200, Klaus Jensen wrote:
> On Aug 26 09:34, Keith Busch wrote:
> > On Fri, Aug 26, 2022 at 11:12:04PM +0800, Jinhao Fan wrote:
> > > Use KVM's irqfd to send interrupts when possible. This approach is
> > > thread safe. Moreover, it does not have the inter-thread communication
> > > overhead of plain event notifiers since handler callback are called
> > > in the same system call as irqfd write.
> > > 
> > > Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > 
> > No idea what's going on here... This one is causing the following assert
> > failure with --enable-kvm:
> > 
> >   qemu-system-x86_64: ../accel/kvm/kvm-all.c:1781: kvm_irqchip_commit_routes: Assertion `ret == 0' failed.
> > 
> > I find it calls KVM_SET_GSI_ROUTING ioctl with gsi set to KVM_IRQ_ROUTING_MSI,
> > and linux kernel returns EINVAL in that case. It's never set that way without
> > this patch. Am I the only one seeing this?
> 
> Argh, sorry, I threw that patch together a bit too quickly. I was just
> so pumped because I believed I had solved the issue hehe.
> 
> Are you missing the ioeventfd=on and irq-eventfd=on parameters by any
> chance? Without those I'm also getting an assertion, but a different one

I had not enabled those yet. This was purely a regrsession test with my
previously working paramaters for a sanity check.

If I enable those new nvme parameters, then it is successful.

