Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDE568E0A1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:53:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPT4g-0007nC-HH; Tue, 07 Feb 2023 13:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPT4Q-0007cU-R1
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:51:59 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPT3z-0001nn-O2
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:51:37 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317Gmqtu022928; Tue, 7 Feb 2023 18:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=2XE0SnTniCx9KZVn2oMZbvUVAj5ZqIM1KrX5hlazDO4=;
 b=0cGZTxRICJAWZMxob9OBPzg/B8Dd/DqRWcIZuNXx6AhBnNm09lvPUdeF6lyaiz8yAnSK
 HcrpaheZQfdsiG6DhnP6mRY2M0tP+tiRozFl2j6EwSo62IMZehHJ9XBpogDMXdL9qIBu
 EKcth/145cNUTtspDA+rQnnPLUTgH7A38QdS388ILlfsHlJI8uMHkkqfDcJL4mnu3hQ1
 hrLpq7UN9lb51KMFOwpnPRkjdugFdXclL5RVfwcHPpZdcdrSYwZMFuSvl0Vd6i2CvCYR
 BFpNbBaGWj13xYNx24otbhzurg7IF0k2tZWZSAJluz2JFAActBZr1ufrGMbrRuhos+g6 Xg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nheytxdym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 18:51:30 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 317I271j007788; Tue, 7 Feb 2023 18:51:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdt6jjee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 18:51:29 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 317IoU9u020172;
 Tue, 7 Feb 2023 18:51:28 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3nhdt6jjds-1; Tue, 07 Feb 2023 18:51:28 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, 
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>
Subject: [PATCH V2 11/20] memory: flat section iterator
Date: Tue,  7 Feb 2023 10:51:27 -0800
Message-Id: <1675795887-235277-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_10,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070167
X-Proofpoint-GUID: H92-M3IAA-fSC-Br4Wyf6iupKwFleDa7
X-Proofpoint-ORIG-GUID: H92-M3IAA-fSC-Br4Wyf6iupKwFleDa7
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
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

Add an iterator over the sections of a flattened address space.
This will be needed by cpr to issue vfio ioctl's on the same memory
ranges that are already programmed.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/exec/memory.h | 31 +++++++++++++++++++++++++++++++
 softmmu/memory.c      | 21 +++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 3224e09..b6ca3f5 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2376,6 +2376,37 @@ void memory_region_set_ram_discard_manager(MemoryRegion *mr,
                                            RamDiscardManager *rdm);
 
 /**
+ * memory_region_section_cb: callback for address_space_flat_for_each_section()
+ *
+ * @mrs: MemoryRegionSection of the range
+ * @opaque: data pointer passed to address_space_flat_for_each_section()
+ * @errp: error message, returned to the address_space_flat_for_each_section
+ *        caller.
+ *
+ * Returns: non-zero to stop the iteration, and 0 to continue.  The same
+ * non-zero value is returned to the address_space_flat_for_each_section caller.
+ */
+
+typedef int (*memory_region_section_cb)(MemoryRegionSection *mrs,
+                                        void *opaque,
+                                        Error **errp);
+
+/**
+ * address_space_flat_for_each_section: walk the ranges in the address space
+ * flat view and call @func for each.  Return 0 on success, else return non-zero
+ * with a message in @errp.
+ *
+ * @as: target address space
+ * @func: callback function
+ * @opaque: passed to @func
+ * @errp: passed to @func
+ */
+int address_space_flat_for_each_section(AddressSpace *as,
+                                        memory_region_section_cb func,
+                                        void *opaque,
+                                        Error **errp);
+
+/**
  * memory_region_find: translate an address/size relative to a
  * MemoryRegion into a #MemoryRegionSection.
  *
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 9d64efc..57c3131 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2748,6 +2748,27 @@ bool memory_region_is_mapped(MemoryRegion *mr)
     return !!mr->container || mr->mapped_via_alias;
 }
 
+int address_space_flat_for_each_section(AddressSpace *as,
+                                        memory_region_section_cb func,
+                                        void *opaque,
+                                        Error **errp)
+{
+    FlatView *view = address_space_get_flatview(as);
+    FlatRange *fr;
+    int ret;
+
+    FOR_EACH_FLAT_RANGE(fr, view) {
+        MemoryRegionSection mrs = section_from_flat_range(fr, view);
+        ret = func(&mrs, opaque, errp);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    flatview_unref(view);
+    return 0;
+}
+
 /* Same as memory_region_find, but it does not add a reference to the
  * returned region.  It must be called from an RCU critical section.
  */
-- 
1.8.3.1


