Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AA25817F4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:54:00 +0200 (CEST)
Received: from localhost ([::1]:35896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNol-000675-HC
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9z-0003CX-8m
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:51 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9w-0006CF-UI
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:50 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn3YH031760;
 Tue, 26 Jul 2022 16:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=gJGFuTMaWiIcrsU6nRU8Y2CLbN0aTbcqp7/ItlBmngM=;
 b=z7LshblmLYFwMhp0Wv1BO+l/pF8TMtyXbQivFaUuNu05Dj9RzoY+mjDyrEAM83BWEtfB
 3ztb87Yd5yg9RSQkr6Whcc7VbIFQx2oWifwcZQZH7r+axoWySWeiNEcbvrYBUcd+hwqF
 X3bil78z53guWnyHXGY4eB+arP5GB7s1qu5T6I1mDuwivqFVUHO5uLfyqNyU6OGqZkpz
 YlzUDR7hQxePElDwIl6LZoXmvjU6gkIgv9jkZneSPMhccEHvAxwlBXOfEgen7t0vmlJm
 pr2DYXFivfNaEREFFTFusi8SoMrY0nZkC+25a5SjkEd+LimslZY/e94S+w5RH5t8kBEq kQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a4q1bd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:23 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QEq0Yb006400; Tue, 26 Jul 2022 16:11:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq25j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:22 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uT1023334;
 Tue, 26 Jul 2022 16:11:22 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-27; Tue, 26 Jul 2022 16:11:22 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Subject: [PATCH V9 26/46] cpr: Mismatched GPAs fix
Date: Tue, 26 Jul 2022 09:10:23 -0700
Message-Id: <1658851843-236870-27-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-ORIG-GUID: PYrA6gTumkwN1EFC16sdjsEW-qb-qUeH
X-Proofpoint-GUID: PYrA6gTumkwN1EFC16sdjsEW-qb-qUeH
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

For cpr-exec mode, ramblock_is_ignored is always true, and the address of
each migrated memory region must match the address of the statically
initialized region on the target.  However, for a PCI rom block, the region
address is set when the guest writes to a BAR on the source, which does not
occur on the target, causing a "Mismatched GPAs" error during cpr-exec
migration.

To fix, unconditionally set the target's address to the source's address
if the region does not have an address yet.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/exec/memory.h | 12 ++++++++++++
 migration/ram.c       | 17 ++++++++++-------
 softmmu/memory.c      | 10 ++++++++--
 3 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 128bf3e..9b3bad5 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -738,6 +738,7 @@ struct MemoryRegion {
     bool flush_coalesced_mmio;
     uint8_t dirty_log_mask;
     bool is_iommu;
+    bool has_addr;
     RAMBlock *ram_block;
     Object *owner;
 
@@ -2268,6 +2269,17 @@ void memory_region_set_enabled(MemoryRegion *mr, bool enabled);
 void memory_region_set_address(MemoryRegion *mr, hwaddr addr);
 
 /*
+ * memory_region_set_address_only: set the address of a region.
+ *
+ * Same as memory_region_set_address, but without causing transaction side
+ * effects.
+ *
+ * @mr: the region to be updated
+ * @addr: new address, relative to container region
+ */
+void memory_region_set_address_only(MemoryRegion *mr, hwaddr addr);
+
+/*
  * memory_region_set_size: dynamically update the size of a region.
  *
  * Dynamically updates the size of a region.
diff --git a/migration/ram.c b/migration/ram.c
index 4c868d2..6005c53 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4314,13 +4314,16 @@ static int ram_load_precopy(QEMUFile *f)
                     }
                     if (migrate_ignore_shared()) {
                         hwaddr addr = qemu_get_be64(f);
-                        if (ramblock_is_ignored(block) &&
-                            block->mr->addr != addr) {
-                            error_report("Mismatched GPAs for block %s "
-                                         "%" PRId64 "!= %" PRId64,
-                                         id, (uint64_t)addr,
-                                         (uint64_t)block->mr->addr);
-                            ret = -EINVAL;
+                        if (ramblock_is_ignored(block)) {
+                            if (!block->mr->has_addr) {
+                                memory_region_set_address_only(block->mr, addr);
+                            } else if (block->mr->addr != addr) {
+                                error_report("Mismatched GPAs for block %s "
+                                             "%" PRId64 "!= %" PRId64,
+                                             id, (uint64_t)addr,
+                                             (uint64_t)block->mr->addr);
+                                ret = -EINVAL;
+                            }
                         }
                     }
                     ram_control_load_hook(f, RAM_CONTROL_BLOCK_REG,
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 6aa3a2f..8825608 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2552,7 +2552,7 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
     for (alias = subregion->alias; alias; alias = alias->alias) {
         alias->mapped_via_alias++;
     }
-    subregion->addr = offset;
+    memory_region_set_address_only(subregion, offset);
     memory_region_update_container_subregions(subregion);
 }
 
@@ -2632,10 +2632,16 @@ static void memory_region_readd_subregion(MemoryRegion *mr)
     }
 }
 
+void memory_region_set_address_only(MemoryRegion *mr, hwaddr addr)
+{
+    mr->addr = addr;
+    mr->has_addr = true;
+}
+
 void memory_region_set_address(MemoryRegion *mr, hwaddr addr)
 {
     if (addr != mr->addr) {
-        mr->addr = addr;
+        memory_region_set_address_only(mr, addr);
         memory_region_readd_subregion(mr);
     }
 }
-- 
1.8.3.1


