Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA88839752B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 16:12:24 +0200 (CEST)
Received: from localhost ([::1]:58516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo583-0007da-ME
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 10:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rka@sysgo.com>) id 1lo56e-00069p-MX
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:10:56 -0400
Received: from mail.sysgo.com ([176.9.12.79]:50642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rka@sysgo.com>) id 1lo56b-0002la-Hu
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:10:55 -0400
From: Roman Kapl <rka@sysgo.com>
To: 
Subject: [PATCH 1/1] amd_iommu: fix device entry invalidation
Date: Tue,  1 Jun 2021 16:10:39 +0200
Message-Id: <20210601141039.16104-1-rka@sysgo.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=176.9.12.79; envelope-from=rka@sysgo.com;
 helo=mail.sysgo.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, TO_EQ_FM_DIRECT_MX=2.497 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Roman Kapl <rka@sysgo.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since QEMU maintains TLB entries keyed by the device ID, there is no separate
device entry cache. This means we need to invalidate all translations keyed by
the device ID.

Signed-off-by: Roman Kapl <rka@sysgo.com>
---
 hw/i386/amd_iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 2801dff97c..62d22b220b 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -356,6 +356,7 @@ static void amdvi_update_iotlb(AMDVIState *s, uint16_t devid,
         }
 
         entry->domid = domid;
+        entry->devid = devid;
         entry->perms = to_cache.perm;
         entry->translated_addr = to_cache.translated_addr;
         entry->page_mask = to_cache.addr_mask;
@@ -399,6 +400,8 @@ static void amdvi_inval_devtab_entry(AMDVIState *s, uint64_t *cmd)
         amdvi_log_illegalcom_error(s, extract64(cmd[0], 60, 4),
                                    s->cmdbuf + s->cmdbuf_head);
     }
+    g_hash_table_foreach_remove(s->iotlb, amdvi_iotlb_remove_by_devid,
+                                &devid);
     trace_amdvi_devtab_inval(PCI_BUS_NUM(devid), PCI_SLOT(devid),
                              PCI_FUNC(devid));
 }
-- 
2.20.1


