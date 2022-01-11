Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7755C4B0882
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 09:36:14 +0100 (CET)
Received: from localhost ([::1]:51940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI4w0-0003Xg-NG
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 03:36:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <skrll@netbsd.org>) id 1nI4Wz-000833-1z
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 03:10:21 -0500
Received: from [2001:470:a085:999::25] (port=62899 helo=mail.netbsd.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <skrll@netbsd.org>) id 1nI4Wt-0002Dm-NQ
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 03:10:20 -0500
Received: by mail.netbsd.org (Postfix, from userid 1220)
 id 196C384ED9; Thu, 10 Feb 2022 08:03:31 +0000 (UTC)
From: Nick Hudson <skrll@netbsd.org>
To: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>
Date: Tue, 11 Jan 2022 05:56:39 +0000
Subject: [PATCH] hw/net: e1000e: Clear ICR on read when using non MSI-X
 interrupts
Message-Id: <20220210080331.196C384ED9@mail.netbsd.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:470:a085:999::25
 (failed)
Received-SPF: pass client-ip=2001:470:a085:999::25;
 envelope-from=skrll@netbsd.org; helo=mail.netbsd.org
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 RCVD_IN_DNSWL_MED=-2.3, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In section 7.4.3 of the 82574 datasheet it states that

    "In systems that do not support MSI-X, reading the ICR
     register clears it's bits..."

Some OSes rely on this.

Signed-off-by: Nick Hudson <skrll@netbsd.org>
---
 hw/net/e1000e_core.c | 5 +++++
 hw/net/trace-events  | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 8ae6fb7e14..2c51089a82 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -2607,6 +2607,11 @@ e1000e_mac_icr_read(E1000ECore *core, int index)
         core->mac[ICR] = 0;
     }
 
+    if (!msix_enabled(core->owner)) {
+        trace_e1000e_irq_icr_clear_nonmsix_icr_read();
+        core->mac[ICR] = 0;
+    }
+
     if ((core->mac[ICR] & E1000_ICR_ASSERTED) &&
         (core->mac[CTRL_EXT] & E1000_CTRL_EXT_IAME)) {
         trace_e1000e_irq_icr_clear_iame();
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 643338f610..084086ec44 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -221,6 +221,7 @@ e1000e_irq_write_ics(uint32_t val) "Adding ICR bits 0x%x"
 e1000e_irq_icr_process_iame(void) "Clearing IMS bits due to IAME"
 e1000e_irq_read_ics(uint32_t ics) "Current ICS: 0x%x"
 e1000e_irq_read_ims(uint32_t ims) "Current IMS: 0x%x"
+e1000e_irq_icr_clear_nonmisx_icr_read(void) "Clearing ICR on read due to non MSI-X int"
 e1000e_irq_icr_read_entry(uint32_t icr) "Starting ICR read. Current ICR: 0x%x"
 e1000e_irq_icr_read_exit(uint32_t icr) "Ending ICR read. Current ICR: 0x%x"
 e1000e_irq_icr_clear_zero_ims(void) "Clearing ICR on read due to zero IMS"
-- 
2.25.1


