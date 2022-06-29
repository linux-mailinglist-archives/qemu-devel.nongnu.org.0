Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED43556050C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 17:59:29 +0200 (CEST)
Received: from localhost ([::1]:55910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6a6D-0002Ij-3G
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 11:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1o6a5D-0001XT-Ro
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 11:58:27 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:38060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1o6a5B-000517-I0
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 11:58:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13B10B824F6;
 Wed, 29 Jun 2022 15:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758B1C34114;
 Wed, 29 Jun 2022 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656518300;
 bh=WbrArtd0Cd0L6lyEcfIzoNUYVbUMllrTr0HFLs0Us6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=htN74YRJ5rXYPXcnACCt0nzExsM1HNoC07wUTu8zw1vFtyf/Eop8MMFfkJXhiBdiL
 2Ty7rTomP7URhxydvElQ6HPk5xMnC1eSPxfV9OfTzbKGy1vYN2W+LTEd9drSpOLaas
 SxHv/VpZeaDGiHUkG9AX2o+Mgjp1CX3EDol2stsGmbLQRbHtJ7Z4CetjRo7k3U+aLw
 w7SiF4CLthKLbY43kXxm259SYsTklZB+JK3RCFt/SnbK2P1IhHdxmhXt8rtU+ALyDP
 xKB3SHAoyIInIxdyi5ZU5XrZzI5tG4zUb57MTwh7xsHFrkGXSkiIMGsynEC86Q2g84
 YHvCkhoK3u+6g==
Date: Wed, 29 Jun 2022 09:58:17 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, its@irrelevant.dk
Subject: Re: [PATCH] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <Yrx2mVPEO1MIiU4W@kbusch-mbp.dhcp.thefacebook.com>
References: <20220627104813.2173852-1-fanjinhao21s@ict.ac.cn>
 <8F470FDC-3213-4284-8A85-487ACE690FB7@ict.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8F470FDC-3213-4284-8A85-487ACE690FB7@ict.ac.cn>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=kbusch@kernel.org;
 helo=ams.source.kernel.org
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

On Wed, Jun 29, 2022 at 05:04:25PM +0800, Jinhao Fan wrote:
> Ping~
> 
> > @@ -4271,6 +4343,11 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
> >     if (n->dbbuf_enabled) {
> >         sq->db_addr = n->dbbuf_dbs + (sqid << 3);
> >         sq->ei_addr = n->dbbuf_eis + (sqid << 3);
> > +            
> > +        if (n->params.ioeventfd && sq->sqid != 0) {
> > +            ret = nvme_init_sq_ioeventfd(sq);
> > +            sq->ioeventfd_enabled = ret == 0;
> > +        }
> >     }
> > 
> >     assert(n->cq[cqid]);
> 
> Is this “ret == 0” a correct way for error handling?

That looks correct since we don't need the ioevent is an optional optimization.

I would just suggest making this easier to read. For example, in
nvme_init_sq_ioeventfd(), instead of assigning within a conditional:

    if ((ret = event_notifier_init(&cq->notifier, 0))) {

Do each part separately:

    ret = event_notifier_init(&cq->notifier, 0);
    if (ret) {
 
> I’ve also been wondering whether using irqfd for sending interrupts can
> bring some benefits. I’m not familiar with how QEMU emulates interrupts.
> What do you think of irqfd’s?

Not sure about this mechanism, I'll need to look into it.

