Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4688D54C5A3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 12:14:31 +0200 (CEST)
Received: from localhost ([::1]:41780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Q2f-00083r-UV
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 06:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1o1Q0J-0006Ku-Qy
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 06:12:04 -0400
Received: from ssh.movementarian.org ([139.162.205.133]:47102
 helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1o1Q0D-00067O-Rv
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 06:12:02 -0400
Received: from movement by movementarian.org with local (Exim 4.94.2)
 (envelope-from <movement@movementarian.org>)
 id 1o1Q07-001Jlt-Ij; Wed, 15 Jun 2022 11:11:51 +0100
Date: Wed, 15 Jun 2022 11:11:51 +0100
From: John Levon <levon@movementarian.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Keith Busch <kbusch@kernel.org>, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <YqmwZ/FGIROp5ds7@movementarian.org>
References: <YqIDyjxrZnkeMfcE@kbusch-mbp.dhcp.thefacebook.com>
 <YqIXIiQr+dpksBh6@movementarian.org> <YqItnbgtw7BNPBZH@apples>
 <D9A53959-6A31-4105-B0A9-37B8180D973C@ict.ac.cn>
 <Yqeo4EKtQJq8XRm+@kbusch-mbp.dhcp.thefacebook.com>
 <0CC03CA7-1BC5-4FDF-92BA-4256778AD113@ict.ac.cn>
 <YqisK8iYANhY/mCm@kbusch-mbp.dhcp.thefacebook.com>
 <Yqmc2vKXcMl4Xsme@apples> <YqmhO0+5rggd/V5T@movementarian.org>
 <YqmnTmxpYOeupgnt@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqmnTmxpYOeupgnt@apples>
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

On Wed, Jun 15, 2022 at 11:33:02AM +0200, Klaus Jensen wrote:

> > BTW I'm surprised that this patch has just this:
> > 
> > +static void nvme_update_sq_eventidx(const NvmeSQueue *sq)
> > +{
> > +    pci_dma_write(&sq->ctrl->parent_obj, sq->ei_addr, &sq->tail,
> > +                  sizeof(sq->tail));
> > +}
> > 
> > Isn't this racy against the driver? Compare
> > https://github.com/spdk/spdk/blob/master/lib/nvmf/vfio_user.c#L1317
> > 
> > thanks
> > john
> 
> QEMU has full memory barriers on dma read/write, so I believe this is
> safe?

But don't you need to re-read the tail still, for example:


driver 			device

			eventidx is 3

write 4 to tail
			read tail of 4
write 5 to tail
read eventidx of 3
nvme_dbbuf_need_event (1)

			set eventidx to 4
			go to sleep

at (1), our tail update of 4->5 doesn't straddle the eventidx, so we don't send
any MMIO, and the device won't wake up. This is why the above code checks the
tail twice for any concurrent update.

regards
john



