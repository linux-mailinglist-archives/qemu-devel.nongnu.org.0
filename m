Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE50366D057
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 21:44:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHWJj-0001MJ-Qe; Mon, 16 Jan 2023 15:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pHWJa-0001M5-0V
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 15:42:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pHWJX-0005FT-Fh
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 15:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673901762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yZOCgO9iNtzbUfQ+j90RAdcMOC/a1OTO5wkk8FjQwIw=;
 b=bp2KWMGgqInElcL23gGw9dnxJg+J0M51bKcR4USdu7mN3/ZqkjlwMPQ30F9Nu633sS88AD
 qdW/L3LmtwALAYxeKkPTkZ8rDKI3FdHy6x8Mc+hZsa0v7cYHvEli+vF/GqGE4dSNPkO92A
 u9fd5g7j3Zxf7JHbiV6Njh4RkXUBCiE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-NyBLjIyBMZWaf1WdZA7m3g-1; Mon, 16 Jan 2023 15:42:39 -0500
X-MC-Unique: NyBLjIyBMZWaf1WdZA7m3g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 941D8802D1B;
 Mon, 16 Jan 2023 20:42:38 +0000 (UTC)
Received: from f37-work.redhat.com (unknown [10.39.194.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1337E492B10;
 Mon, 16 Jan 2023 20:42:36 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, fam@euphon.net, philmd@linaro.org, alxndr@bu.edu,
 zheyuma97@gmail.com, mcascell@redhat.com
Subject: [PATCH] scsi/lsi53c895a: restrict DMA engine to memory regions
 (CVE-2023-0330)
Date: Mon, 16 Jan 2023 21:42:32 +0100
Message-Id: <20230116204232.1142442-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This prevents the well known DMA-MMIO reentrancy problem (upstream issue #556)
leading to memory corruption bugs like stack overflow or use-after-free.

Fixes: CVE-2023-0330
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Reported-by: Zheyu Ma <zheyuma97@gmail.com>
---
 hw/scsi/lsi53c895a.c               | 14 +++++++++----
 tests/qtest/fuzz-lsi53c895a-test.c | 32 ++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index af93557a9a..89c52594eb 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -446,22 +446,28 @@ static void lsi_reselect(LSIState *s, lsi_request *p);
 static inline void lsi_mem_read(LSIState *s, dma_addr_t addr,
                                void *buf, dma_addr_t len)
 {
+    const MemTxAttrs attrs = { .memory = true };
+
     if (s->dmode & LSI_DMODE_SIOM) {
-        address_space_read(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED,
+        address_space_read(&s->pci_io_as, addr, attrs,
                            buf, len);
     } else {
-        pci_dma_read(PCI_DEVICE(s), addr, buf, len);
+        pci_dma_rw(PCI_DEVICE(s), addr, buf, len,
+                      DMA_DIRECTION_TO_DEVICE, attrs);
     }
 }
 
 static inline void lsi_mem_write(LSIState *s, dma_addr_t addr,
                                 const void *buf, dma_addr_t len)
 {
+    const MemTxAttrs attrs = { .memory = true };
+
     if (s->dmode & LSI_DMODE_DIOM) {
-        address_space_write(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED,
+        address_space_write(&s->pci_io_as, addr, attrs,
                             buf, len);
     } else {
-        pci_dma_write(PCI_DEVICE(s), addr, buf, len);
+        pci_dma_rw(PCI_DEVICE(s), addr, (void *) buf, len,
+                      DMA_DIRECTION_FROM_DEVICE, attrs);
     }
 }
 
diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
index 392a7ae7ed..35c02e89f3 100644
--- a/tests/qtest/fuzz-lsi53c895a-test.c
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -8,6 +8,35 @@
 #include "qemu/osdep.h"
 #include "libqtest.h"
 
+/*
+ * This used to trigger a DMA reentrancy issue
+ * leading to memory corruption bugs like stack
+ * overflow or use-after-free
+ */
+static void test_lsi_dma_reentrancy(void)
+{
+    QTestState *s;
+
+    s = qtest_init("-M q35 -m 512M -nodefaults "
+                   "-blockdev driver=null-co,node-name=null0 "
+                   "-device lsi53c810 -device scsi-cd,drive=null0");
+
+    qtest_outl(s, 0xcf8, 0x80000804); /* PCI Command Register */
+    qtest_outw(s, 0xcfc, 0x7);        /* Enables accesses */
+    qtest_outl(s, 0xcf8, 0x80000814); /* Memory Bar 1 */
+    qtest_outl(s, 0xcfc, 0xff100000); /* Set MMIO Address*/
+    qtest_outl(s, 0xcf8, 0x80000818); /* Memory Bar 2 */
+    qtest_outl(s, 0xcfc, 0xff000000); /* Set RAM Address*/
+    qtest_writel(s, 0xff000000, 0xc0000024);
+    qtest_writel(s, 0xff000114, 0x00000080);
+    qtest_writel(s, 0xff00012c, 0xff000000);
+    qtest_writel(s, 0xff000004, 0xff000114);
+    qtest_writel(s, 0xff000008, 0xff100014);
+    qtest_writel(s, 0xff10002f, 0x000000ff);
+
+    qtest_quit(s);
+}
+
 /*
  * This used to trigger a UAF in lsi_do_msgout()
  * https://gitlab.com/qemu-project/qemu/-/issues/972
@@ -120,5 +149,8 @@ int main(int argc, char **argv)
     qtest_add_func("fuzz/lsi53c895a/lsi_do_msgout_cancel_req",
                    test_lsi_do_msgout_cancel_req);
 
+    qtest_add_func("fuzz/lsi53c895a/lsi_dma_reentrancy",
+                   test_lsi_dma_reentrancy);
+
     return g_test_run();
 }
-- 
2.39.0


