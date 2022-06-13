Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC1554A122
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 23:17:03 +0200 (CEST)
Received: from localhost ([::1]:52630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0rQk-00060W-1K
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 17:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1o0rP7-0004eW-JZ
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 17:15:21 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:40146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1o0rP5-0008Iy-OC
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 17:15:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF87F6132A;
 Mon, 13 Jun 2022 21:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7CEC34114;
 Mon, 13 Jun 2022 21:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655154916;
 bh=hKVVXkwxpzinz0XcLgsvJGlovpmA+zdO1EHpmtW117M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K+3C/bEE7s/aH6bhwTipR+3qfx+BnkvqLWr+zzKW+mEEPjdlaMRonX+2plC3/Hfyf
 OS1erwmS7WKL/l+ezUs5U4IB4d9YePz5x8KzL30ktvIl7zzvwxc5jmdvzrVwMIimy/
 bJfTGWrOrrpZlHBjHCVjYa063ArAUc3l7IwjXjcqwlUO6CLYnCaL+0Ib0Dc0PRWYRX
 DwceXqj9+bMvUAfM/XY/1WQvVtu767t9gnZnLajlJlWqFO28QHpymJsaI/DtlwD94L
 iDviHsN5O6Zu5+EPlRHNc01+8bmiSU5988a3WjJcPl2cGUStpp6+CC9DuOFWggmr5V
 fd+/TDcTWuy3w==
Date: Mon, 13 Jun 2022 15:15:12 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: Klaus Jensen <its@irrelevant.dk>, John Levon <levon@movementarian.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <Yqeo4EKtQJq8XRm+@kbusch-mbp.dhcp.thefacebook.com>
References: <20220608013659.472500-1-fanjinhao21s@ict.ac.cn>
 <20220608013659.472500-2-fanjinhao21s@ict.ac.cn>
 <YqEMwsclktptJvQI@apples>
 <YqIDyjxrZnkeMfcE@kbusch-mbp.dhcp.thefacebook.com>
 <YqIXIiQr+dpksBh6@movementarian.org> <YqItnbgtw7BNPBZH@apples>
 <D9A53959-6A31-4105-B0A9-37B8180D973C@ict.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9A53959-6A31-4105-B0A9-37B8180D973C@ict.ac.cn>
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

On Sun, Jun 12, 2022 at 07:40:55PM +0800, Jinhao Fan wrote:
> 
> > On Jun 10, 2022, at 1:27 AM, Klaus Jensen <its@irrelevant.dk> wrote:
> > 
> > I'm ok with following the concensus here, but we all agree that this is
> > a blatant spec violation that ended up manifesting itself down the
> > stack, right?
> > 
> > So... if QEMU wants to be compliant here, I guess we could ask the
> > kernel to introduce a quirk for *compliant* controllers. Now, THAT would
> > be a first! Not sure if I am being serious or not here ;)
> 
> Hi all,
> 
> Is this our final decision?

What a mess...

The spec should have gone into more details on initializing the shadow and
event buffers if they really intended it to be run on a live queue.

Anyway, the following hack on top of your patch should allow the host to use
admin shadow queues, and also remain backward compatible for the "broken"
hosts, like Linux and SPDK.

---
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index a0a9208c0f..03d84feecf 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4267,7 +4267,7 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
     }
     sq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, sq);
 
-    if (sqid && n->dbbuf_dbs && n->dbbuf_eis) {
+    if (n->dbbuf_dbs && n->dbbuf_eis) {
         sq->db_addr = n->dbbuf_dbs + 2 * sqid * stride;
         sq->ei_addr = n->dbbuf_eis + 2 * sqid * stride;
     }
@@ -4632,7 +4632,7 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
     cq->head = cq->tail = 0;
     QTAILQ_INIT(&cq->req_list);
     QTAILQ_INIT(&cq->sq_list);
-    if (cqid && n->dbbuf_dbs && n->dbbuf_eis) {
+    if (n->dbbuf_dbs && n->dbbuf_eis) {
         cq->db_addr = n->dbbuf_dbs + (2 * cqid + 1) * stride;
         cq->ei_addr = n->dbbuf_eis + (2 * cqid + 1) * stride;
     }
@@ -5805,7 +5805,7 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
     n->dbbuf_dbs = dbs_addr;
     n->dbbuf_eis = eis_addr;
 
-    for (i = 1; i < n->params.max_ioqpairs + 1; i++) {
+    for (i = 0; i < n->params.max_ioqpairs + 1; i++) {
         NvmeSQueue *sq = n->sq[i];
         NvmeCQueue *cq = n->cq[i];
 
@@ -5813,12 +5813,16 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
             /* Submission queue tail pointer location, 2 * QID * stride */
             sq->db_addr = dbs_addr + 2 * i * stride;
             sq->ei_addr = eis_addr + 2 * i * stride;
+            pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
+                    sizeof(sq->tail));
         }
 
         if (cq) {
             /* Completion queue head pointer location, (2 * QID + 1) * stride */
             cq->db_addr = dbs_addr + (2 * i + 1) * stride;
             cq->ei_addr = eis_addr + (2 * i + 1) * stride;
+            pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
+                    sizeof(cq->head));
         }
     }
 
@@ -6479,8 +6483,10 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
         trace_pci_nvme_mmio_doorbell_cq(cq->cqid, new_head);
 
         start_sqs = nvme_cq_full(cq) ? 1 : 0;
-        if (!cq->db_addr) {
         cq->head = new_head;
+        if (cq->db_addr) {
+            pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
+                    sizeof(cq->head));
         }
         if (start_sqs) {
             NvmeSQueue *sq;
@@ -6538,9 +6544,25 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
 
         trace_pci_nvme_mmio_doorbell_sq(sq->sqid, new_tail);
 
-        if (!sq->db_addr) {
         sq->tail = new_tail;
+        if (sq->db_addr) {
+            /*
+             * The spec states "the host shall also update the controller's
+             * corresponding doorbell property to match the value of that entry
+             * in the Shadow Doorbell buffer."
+             *
+             * Since this context is currently a VM trap, we can safely enforce
+             * the requirement from the device side in case the host is
+             * misbehaving.
+             *
+             * Note, we shouldn't have to do this, but various drivers
+             * including ones that run on Linux, are not updating Admin Queues,
+             * so we can't trust reading it for an appropriate sq tail.
+             */
+            pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
+                    sizeof(sq->tail));
         }
+
         timer_mod(sq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
     }
 }
--

