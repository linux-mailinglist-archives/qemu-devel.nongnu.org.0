Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3054DE1D3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 20:34:39 +0100 (CET)
Received: from localhost ([::1]:46348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVIMw-0003J5-Dn
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 15:34:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nVI9r-0006l1-Cj; Fri, 18 Mar 2022 15:21:08 -0400
Received: from mga17.intel.com ([192.55.52.151]:1694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nVI9p-0002He-QE; Fri, 18 Mar 2022 15:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647631265; x=1679167265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qf0+gZwqBaGid7Rc0z6pMhaGt3s0fB+Vly/Nksw5jmQ=;
 b=Mco6gxEwCoESr8Eg9C59IMi+aMrDgleXX5pS0/wx1eOrDhOTH7HYgrIv
 xaY0Iw+r4B3pEZgvAh5/CAMAgr6T401e+5/3tPMaQ0xXRArd3DhO3LvRO
 IaWs8sfKgGI1CA59YRL+E9/sgpsHxG811pp5pZFuw9Qnz0TonvvtkDYEt
 dLSXFnU4jRgNAwHKDFAq3I42R0LxlgRpr/+QUQe+h8jFsr8CYTIdEJ59o
 ddTfdN6O4jXyNcbKuBl3qcPKNsmeaFFeq8Ft126ZVE3kAQZVN13amaCWe
 OmXtyvOTWslrp80yZ7jhzR+yEl583BXk5Zc2+jDfPGlq8CAVedfQsSdJd g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="237817016"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="237817016"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 12:21:04 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="541994400"
Received: from lmaniak-dev.elements.local ([10.55.249.72])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 12:21:00 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/12] hw/nvme: Update the initalization place for the AER
 queue
Date: Fri, 18 Mar 2022 20:18:18 +0100
Message-Id: <20220318191819.1711831-12-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318191819.1711831-1-lukasz.maniak@linux.intel.com>
References: <20220318191819.1711831-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, lukasz.maniak@linux.intel.com,
 stefanha@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 k.jensen@samsung.com, armbru@redhat.com, f4bug@amsat.org, kbusch@kernel.org,
 its@irrelevant.dk, hreitz@redhat.com, xypron.glpk@gmx.de,
 lukasz.gieryk@linux.intel.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

This patch updates the initialization place for the AER queue, so it’s
initialized once, at controller initialization, and not every time
controller is enabled.

While the original version works for a non-SR-IOV device, as it’s hard
to interact with the controller if it’s not enabled, the multiple
reinitialization is not necessarily correct.

With the SR/IOV feature enabled a segfault can happen: a VF can have its
controller disabled, while a namespace can still be attached to the
controller through the parent PF. An event generated in such case ends
up on an uninitialized queue.

While it’s an interesting question whether a VF should support AER in
the first place, I don’t think it must be answered today.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 247c09882dd..b0862b1d96c 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6326,8 +6326,6 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
     nvme_set_timestamp(n, 0ULL);
 
-    QTAILQ_INIT(&n->aer_queue);
-
     nvme_select_iocs(n);
 
     return 0;
@@ -6987,6 +6985,7 @@ static void nvme_init_state(NvmeCtrl *n)
     n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
+    QTAILQ_INIT(&n->aer_queue);
 
     list->numcntl = cpu_to_le16(max_vfs);
     for (i = 0; i < max_vfs; i++) {
-- 
2.25.1


