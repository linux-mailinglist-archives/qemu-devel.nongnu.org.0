Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD56315F79
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:29:21 +0100 (CET)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9j04-00063r-N1
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip4-0001Z7-Um; Wed, 10 Feb 2021 01:17:58 -0500
Received: from ozlabs.org ([203.11.71.1]:47673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip1-0000Ln-0L; Wed, 10 Feb 2021 01:17:58 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gl0ntwz9sW2; Wed, 10 Feb 2021 17:17:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937859;
 bh=m0UzTBFIlniLw6okDxCKohuffYVMR2kGQJPBn0vUYhw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lc+MxiqQ4mCdrbXtzXBkTJREj/9JNCUFH88rGnOGkuDDh+rNhQixLq4OPGQUTpWKm
 9HftH09HsJZm3j04f8bDWboT4XhSaBFIbJdqAL3eL3tZYfoso3DQ/JfkdNxz9lgIqT
 QspjgznTEZUa077nAB+Up86CXdmAKV1VfNUAl+pE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 05/19] ppc/pnv: Add trace events for PCI event notification
Date: Wed, 10 Feb 2021 17:17:21 +1100
Message-Id: <20210210061735.304384-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

On POWER9 systems, PHB controllers signal the XIVE interrupt controller
of a source interrupt notification using a store on a MMIO region. Add
traces for such events.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210126171059.307867-2-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/pnv_xive.c       | 3 +++
 hw/intc/trace-events     | 3 +++
 hw/pci-host/pnv_phb4.c   | 3 +++
 hw/pci-host/trace-events | 3 +++
 4 files changed, 12 insertions(+)

diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index 5f69626b3a..ad43483612 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -24,6 +24,7 @@
 #include "hw/ppc/xive_regs.h"
 #include "hw/qdev-properties.h"
 #include "hw/ppc/ppc.h"
+#include "trace.h"
 
 #include <libfdt.h>
 
@@ -1319,6 +1320,8 @@ static void pnv_xive_ic_hw_trigger(PnvXive *xive, hwaddr addr, uint64_t val)
     uint8_t blk;
     uint32_t idx;
 
+    trace_pnv_xive_ic_hw_trigger(addr, val);
+
     if (val & XIVE_TRIGGER_END) {
         xive_error(xive, "IC: END trigger at @0x%"HWADDR_PRIx" data 0x%"PRIx64,
                    addr, val);
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 8ed397a0d5..45ddaf48df 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -236,3 +236,6 @@ xive_tctx_tm_write(uint64_t offset, unsigned int size, uint64_t value) "@0x0x%"P
 xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) "@0x0x%"PRIx64" sz=%d val=0x%" PRIx64
 xive_presenter_notify(uint8_t nvt_blk, uint32_t nvt_idx, uint8_t ring) "found NVT 0x%x/0x%x ring=0x%x"
 xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "END 0x%x/0x%x @0x0x%"PRIx64
+
+# pnv_xive.c
+pnv_xive_ic_hw_trigger(uint64_t addr, uint64_t val) "@0x%"PRIx64" val=0x%"PRIx64
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 6328e985f8..54f57c660a 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -22,6 +22,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
+#include "trace.h"
 
 #define phb_error(phb, fmt, ...)                                        \
     qemu_log_mask(LOG_GUEST_ERROR, "phb4[%d:%d]: " fmt "\n",            \
@@ -1257,6 +1258,8 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno)
     uint64_t data = XIVE_TRIGGER_PQ | offset | srcno;
     MemTxResult result;
 
+    trace_pnv_phb4_xive_notify(notif_port, data);
+
     address_space_stq_be(&address_space_memory, notif_port, data,
                          MEMTXATTRS_UNSPECIFIED, &result);
     if (result != MEMTX_OK) {
diff --git a/hw/pci-host/trace-events b/hw/pci-host/trace-events
index d19ca9aef6..7d8063ac42 100644
--- a/hw/pci-host/trace-events
+++ b/hw/pci-host/trace-events
@@ -20,3 +20,6 @@ unin_data_write(uint64_t addr, unsigned len, uint64_t val) "write addr 0x%"PRIx6
 unin_data_read(uint64_t addr, unsigned len, uint64_t val) "read addr 0x%"PRIx64 " len %d val 0x%"PRIx64
 unin_write(uint64_t addr, uint64_t value) "addr=0x%" PRIx64 " val=0x%"PRIx64
 unin_read(uint64_t addr, uint64_t value) "addr=0x%" PRIx64 " val=0x%"PRIx64
+
+# pnv_phb4.c
+pnv_phb4_xive_notify(uint64_t notif_port, uint64_t data) "notif=@0x%"PRIx64" data=0x%"PRIx64
-- 
2.29.2


