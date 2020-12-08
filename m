Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42672D354E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:36:55 +0100 (CET)
Received: from localhost ([::1]:42302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkfG-0004U2-Ta
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjDs-0002Iz-B1; Tue, 08 Dec 2020 15:04:32 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjDo-00062i-0T; Tue, 08 Dec 2020 15:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607458837; x=1638994837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mWK+22Kmhk/Y80IP57/JzcVDNviZIN9jOWB1YrTJ4pg=;
 b=Lftq/VJsyioi3Bac2zHj1xSyniHvo8s0RSJ79d0/SStzENiFSXAhRPmd
 MDZVxKBUk4nrQVdSS3c6Swyx1ctEW0N9pbdbN0XtUk5meIvs2foGxUHO3
 oWe/3Yy3kIr2QPg2fLFoYNl692JAFdXOefR3j/aoXyCHzvjv8zUtoXPxH
 j1Ym59tBGgoW/Ou/grKOME+N6apcHYkw7h3WMOgop4FaMAk42MRQzpgay
 83ZXGGsXqransxIx3ENrR9sXmJ3r+vp9gWRKCuu4/ZJXoEg0VaSlp/iWJ
 /i5Ki7rba/mVtsgAmYZIA7Elw2dSz1T7QoOrUrb+XZ9gdS41nqfNfGtiG Q==;
IronPort-SDR: nWgMqC3gDqfL2sRf8WIjyhuBvHL6KctuSknhiCmy4sJB2wRAcmreZSTZhCWQGh4cZUBfNLRuSj
 g+gCMqPi1QxF+B0t26KUONnJj3y0Rm37vVmDNug/oQB8mtqbwtxtUIExEYeeZnrza10SacAa1v
 q4Cq/Kl7PuYaMRzeft0jLdcdMR1vA+yQPdyAggVDwlT66WPBZunjKSyS6h1QsmESaFeXWIkmmp
 cy0BCAd+SN7SPWzQSmC542N/CdL5TqBj2EDjk08ohWbgcmjWJBbtfyGhMZrNOlPpJd100EN3Gp
 4ps=
X-IronPort-AV: E=Sophos;i="5.78,403,1599494400"; d="scan'208";a="258433442"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 04:20:18 +0800
IronPort-SDR: 2UdwTTShbnNWx2H1fwBEL/aKww5aV5ZlBZsVyI0q+rEQ4wVVByb3FwMh/0uTphPb0g6n/iWfai
 jv9iAIa3+aq6g4+o+aIXLecQaeOmrztzg=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 11:48:15 -0800
IronPort-SDR: MESOnBAxpJpue1WUIHSosTKTg+Vro/fn3hDXktJ+0NHEF9gG0P/JJcY3baxBn4VmuxwDXoJASh
 SfR8dvtXAsZw==
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 12:04:14 -0800
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v11 01/13] hw/block/nvme: Process controller reset and
 shutdown differently
Date: Wed,  9 Dec 2020 05:03:58 +0900
Message-Id: <20201208200410.27900-2-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
References: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=604abd949=dmitry.fomichev@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Controller reset ans subsystem shutdown are handled very much the same
in the current code, but some of the steps should be different in these
two cases.

Introduce two new functions, nvme_reset_ctrl() and nvme_shutdown_ctrl(),
to separate some portions of the code from nvme_clear_ctrl(). The steps
that are made different between reset and shutdown are that BAR.CC is not
reset to zero upon the shutdown and namespace data is flushed to
backing storage as a part of shutdown handling, but not upon reset.

Suggested-by: Klaus Jensen <its@irrelevant.dk>
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme-ns.h |  2 +-
 hw/block/nvme-ns.c |  2 +-
 hw/block/nvme.c    | 24 ++++++++++++++++++------
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 44bf6271b7..ed3d7e65d5 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -73,6 +73,6 @@ typedef struct NvmeCtrl NvmeCtrl;
 
 int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
-void nvme_ns_flush(NvmeNamespace *ns);
+void nvme_ns_shutdown(NvmeNamespace *ns);
 
 #endif /* NVME_NS_H */
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 847069a66e..9b95e2ed33 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -130,7 +130,7 @@ void nvme_ns_drain(NvmeNamespace *ns)
     blk_drain(ns->blkconf.blk);
 }
 
-void nvme_ns_flush(NvmeNamespace *ns)
+void nvme_ns_shutdown(NvmeNamespace *ns)
 {
     blk_flush(ns->blkconf.blk);
 }
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 59990e00bc..10acb7e7f0 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2197,6 +2197,20 @@ static void nvme_clear_ctrl(NvmeCtrl *n)
     n->aer_queued = 0;
     n->outstanding_aers = 0;
     n->qs_created = false;
+}
+
+static void nvme_ctrl_reset(NvmeCtrl *n)
+{
+    nvme_clear_ctrl(n);
+    n->bar.cc = 0;
+}
+
+static void nvme_ctrl_shutdown(NvmeCtrl *n)
+{
+    NvmeNamespace *ns;
+    int i;
+
+    nvme_clear_ctrl(n);
 
     for (i = 1; i <= n->num_namespaces; i++) {
         ns = nvme_ns(n, i);
@@ -2204,10 +2218,8 @@ static void nvme_clear_ctrl(NvmeCtrl *n)
             continue;
         }
 
-        nvme_ns_flush(ns);
+        nvme_ns_shutdown(ns);
     }
-
-    n->bar.cc = 0;
 }
 
 static int nvme_start_ctrl(NvmeCtrl *n)
@@ -2374,12 +2386,12 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             }
         } else if (!NVME_CC_EN(data) && NVME_CC_EN(n->bar.cc)) {
             trace_pci_nvme_mmio_stopped();
-            nvme_clear_ctrl(n);
+            nvme_ctrl_reset(n);
             n->bar.csts &= ~NVME_CSTS_READY;
         }
         if (NVME_CC_SHN(data) && !(NVME_CC_SHN(n->bar.cc))) {
             trace_pci_nvme_mmio_shutdown_set();
-            nvme_clear_ctrl(n);
+            nvme_ctrl_shutdown(n);
             n->bar.cc = data;
             n->bar.csts |= NVME_CSTS_SHST_COMPLETE;
         } else if (!NVME_CC_SHN(data) && NVME_CC_SHN(n->bar.cc)) {
@@ -2990,7 +3002,7 @@ static void nvme_exit(PCIDevice *pci_dev)
 {
     NvmeCtrl *n = NVME(pci_dev);
 
-    nvme_clear_ctrl(n);
+    nvme_ctrl_shutdown(n);
     g_free(n->cq);
     g_free(n->sq);
     g_free(n->aer_reqs);
-- 
2.28.0


