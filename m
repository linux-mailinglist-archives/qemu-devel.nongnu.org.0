Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A67458DC33
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 18:36:55 +0200 (CEST)
Received: from localhost ([::1]:45106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLSDp-00084p-QE
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 12:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1oLRzM-0000Zo-4R
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 12:21:52 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:50698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1oLRzK-0002nR-7P
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 12:21:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BAFD1B81625;
 Tue,  9 Aug 2022 16:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F9CC433D6;
 Tue,  9 Aug 2022 16:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660062102;
 bh=QnTWRqMr+1f7sYGXemRuf3Ckbh+fi7afd1fsR1S5RDw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h9+UyQx2c/62Xy7WVjF8pcDWyWoN59ZKH/QGT1KWAXGTnvnfgZmfryKUZFPlp7TYJ
 3AOsBh6qQy1pGGDrT+FvY8pb7yVIEH5IN0fz5Gfh6LFFWBOJYYsmSstD9uZ2Dh6vVR
 MJqu/z8xBovPxkvCKlDY3aehrplS00CGyzuT+kNfCa68N91vtPMDAMhEVw4GNVsk4u
 SAJyRS/UBqVQujNF/vGUo/GV1nP0ZdZI5ETYVYwc3wzKOhxkYgz7ci3iQMchwfJdpw
 BJswsJsS+t5fBBBjtjX93vhuKT+FvfytDIl9dLAxEK+51HusgudS08DfRNMIFtwzgT
 eGc8Vem2Pc9lA==
Date: Tue, 9 Aug 2022 10:21:39 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, its@irrelevant.dk
Subject: Re: [RFC] hw/nvme: Use irqfd to send interrupts
Message-ID: <YvKJk2dYiwomexFv@kbusch-mbp.dhcp.thefacebook.com>
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
 <851FC42E-DA19-4142-9AA6-39E2E384F618@ict.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <851FC42E-DA19-4142-9AA6-39E2E384F618@ict.ac.cn>
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

On Mon, Aug 08, 2022 at 10:23:03AM +0800, Jinhao Fan wrote:
> at 12:35 PM, Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:
> 
> > static void nvme_irq_assert(NvmeCtrl *n, NvmeCQueue *cq)
> > {
> >     if (cq->irq_enabled) {
> >         if (msix_enabled(&(n->parent_obj))) {
> > +            /* Initialize CQ irqfd */
> > +            if (!cq->irqfd_enabled && n->params.ioeventfd && cq->cqid != 0) {
> > +                int ret = nvme_init_cq_irqfd(cq);
> > +                if (ret == 0) {
> > +                    cq->irqfd_enabled = true;
> > +                }
> > +            }
> > +
> 
> Another question:
> 
> In this version I left irqfd initialization to the first assertion of an
> irq. But I think it is better to initialize irqfd at cq creation time so we
> won’t bother checking it at each irq assertion. However if I put these code
> in nvme_init_cq(), irqfd does not work properly. After adding some
> tracepoints I found the MSI messages in MSI-X table changed after
> nvme_init_cq(). Specifically, the `data` field does not seem correct at the
> time when nvme_init_cq() is called.
> 
> Keith, you must be familiar with how the nvme driver initializes CQs. Could
> you give some information on when I can safely use the contents in the MSI-X
> table?

The driver will create the cq with an allocated vector, but it's not activated
until after the driver wires it up to a handler. I think that's what you're
observing with the incomplete MSIx table entry on creation.

