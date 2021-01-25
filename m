Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3193029CC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:16:12 +0100 (CET)
Received: from localhost ([::1]:37794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46PJ-0005CW-F8
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:16:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l46LA-0002Km-DK; Mon, 25 Jan 2021 13:11:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:47704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l46L6-0007xQ-7E; Mon, 25 Jan 2021 13:11:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECBDB22583;
 Mon, 25 Jan 2021 18:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611598306;
 bh=va805WlqBFG9KeYdmLAGOcJb5nLjILX/ab8wgza6Sr8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cYhm5M2KrnO4DgDFOVs87XUDJ53+jHxXl3kzd7VwImEfjeqGvYKzuu57WdaBhuQE4
 1xOpx/YbL1Fz0q2dMj6QAyBCeYO3RwhqrTKdEEynbfVXFcziFHcxTiPKJ4D6saG8gL
 nfqtUOHqBVhm+PKY8szI0L3Mq9Ip2HFongRiyJGO2HyTpc1FAh0GOmlK43TkUwfQa5
 AgfyOwhePtlCVXcF/xhIHFMo592l6NTePRz3En0jiWRl8Mr3GRe33THlylgMXgBzRZ
 L6+ogipoAYsofdhvXtJBZulIZzjlp3V2C3LuosukxqnRJvnuX5tONXX59DtJIo89K7
 JgqHUkrta62ow==
Date: Mon, 25 Jan 2021 10:11:43 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH V6 4/6] hw/block/nvme: support for multi-controller in
 subsystem
Message-ID: <20210125181143.GA1732086@dhcp-10-100-145-180.wdc.com>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
 <20210124025450.11071-5-minwoo.im.dev@gmail.com>
 <YA8H9GTfBNPZFdqo@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YA8H9GTfBNPZFdqo@apples.localdomain>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 25, 2021 at 07:03:32PM +0100, Klaus Jensen wrote:
> On Jan 24 11:54, Minwoo Im wrote:
> > We have nvme-subsys and nvme devices mapped together.  To support
> > multi-controller scheme to this setup, controller identifier(id) has to
> > be managed.  Earlier, cntlid(controller id) used to be always 0 because
> > we didn't have any subsystem scheme that controller id matters.
> > 
> > This patch introduced 'cntlid' attribute to the nvme controller
> > instance(NvmeCtrl) and make it allocated by the nvme-subsys device
> > mapped to the controller.  If nvme-subsys is not given to the
> > controller, then it will always be 0 as it was.
> > 
> > Added 'ctrls' array in the nvme-subsys instance to manage attached
> > controllers to the subsystem with a limit(32).  This patch didn't take
> > list for the controllers to make it seamless with nvme-ns device.
> > 
> > Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> > ---
> >  hw/block/nvme-subsys.c | 21 +++++++++++++++++++++
> >  hw/block/nvme-subsys.h |  4 ++++
> >  hw/block/nvme.c        | 29 +++++++++++++++++++++++++++++
> >  hw/block/nvme.h        |  1 +
> >  4 files changed, 55 insertions(+)
> > 
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index b525fca14103..7138389be4bd 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -4481,6 +4484,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
> >      id->psd[0].enlat = cpu_to_le32(0x10);
> >      id->psd[0].exlat = cpu_to_le32(0x4);
> >  
> > +    if (n->subsys) {
> > +        id->cmic |= NVME_CMIC_MULTI_CTRL;
> > +    }
> 
> Since multiple controllers show up with a PCIe port of their own, do we
> need to set bit 0 (NVME_CMIC_MULTI_PORT?) as well? Or am I
> misunderstanding that bit?

AIUI, if you report this MULTI_PORT bit, then each PCI device in the
subsystem needs to report a different "Port Number" in their PCIe Link
Capabilities register. I don't think we can manipulate that value from
the nvme "device", but I also don't know what a host should do with this
information even if we could. So, I think it's safe to leave it at 0.

