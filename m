Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D26954C48A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 11:24:16 +0200 (CEST)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1PG2-0001x1-S0
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 05:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1o1Ozi-0006qY-8B
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 05:07:25 -0400
Received: from ssh.movementarian.org ([139.162.205.133]:47100
 helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1o1Ozd-0006j2-7Y
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 05:07:19 -0400
Received: from movement by movementarian.org with local (Exim 4.94.2)
 (envelope-from <movement@movementarian.org>)
 id 1o1OzT-001IUL-G1; Wed, 15 Jun 2022 10:07:07 +0100
Date: Wed, 15 Jun 2022 10:07:07 +0100
From: John Levon <levon@movementarian.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Keith Busch <kbusch@kernel.org>, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <YqmhO0+5rggd/V5T@movementarian.org>
References: <20220608013659.472500-2-fanjinhao21s@ict.ac.cn>
 <YqEMwsclktptJvQI@apples>
 <YqIDyjxrZnkeMfcE@kbusch-mbp.dhcp.thefacebook.com>
 <YqIXIiQr+dpksBh6@movementarian.org> <YqItnbgtw7BNPBZH@apples>
 <D9A53959-6A31-4105-B0A9-37B8180D973C@ict.ac.cn>
 <Yqeo4EKtQJq8XRm+@kbusch-mbp.dhcp.thefacebook.com>
 <0CC03CA7-1BC5-4FDF-92BA-4256778AD113@ict.ac.cn>
 <YqisK8iYANhY/mCm@kbusch-mbp.dhcp.thefacebook.com>
 <Yqmc2vKXcMl4Xsme@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yqmc2vKXcMl4Xsme@apples>
X-Url: http://www.movementarian.org/
Received-SPF: pass client-ip=139.162.205.133;
 envelope-from=movement@movementarian.org; helo=movementarian.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jun 15, 2022 at 10:48:26AM +0200, Klaus Jensen wrote:

> > By the way, I noticed that the patch never updates the cq's ei_addr value. Is
> > that on purpose?
> 
> Yeah, I also mentioned this previously[1] and I still think we need to
> update the event index. Otherwise (and my testing confirms this), we end
> up in a situation where the driver skips the mmio, leaving a completion
> queue entry "in use" on the device until some other completion comes
> along.

Hmm, can you expand on this a little bit? We don't touch cq eventidx this in
SPDK either, on the basis that mmio exits are expensive, and we only ever need
to look at cq_head when we're checking for room when posting a completion - and
in that case, we can just look directly at shadow cq_head value.

Can you clarify the exact circumstance that needs an mmio write when the driver
updates cq_head?

BTW I'm surprised that this patch has just this:

+static void nvme_update_sq_eventidx(const NvmeSQueue *sq)
+{
+    pci_dma_write(&sq->ctrl->parent_obj, sq->ei_addr, &sq->tail,
+                  sizeof(sq->tail));
+}

Isn't this racy against the driver? Compare
https://github.com/spdk/spdk/blob/master/lib/nvmf/vfio_user.c#L1317

thanks
john

