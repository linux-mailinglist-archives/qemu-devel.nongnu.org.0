Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD43A58175E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:23:35 +0200 (CEST)
Received: from localhost ([::1]:40068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNLK-0002xR-PV
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9d-0002am-GS
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:29 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:33860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9Z-00069E-HM
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:29 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn3av031727;
 Tue, 26 Jul 2022 16:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=MbfnnC1qY1LDXF+ob6lpIOUBkz0IM61m41VFAnUlMC0=;
 b=QokN1Oh3gF0XYbe2GB65orTgViG8mmmGh7aKCuOF0aIhaQwKbggq5Xd/hl5W/z54gSgM
 UAQY8wJe8eVxUwY4Qwpd7qZcko/7Sr6ZKdkYh1IIC0t00MD2hyOWtCEhnvLhCJK1929Y
 QrQT2k3hlOhOV3FLsjJ+6RUwpz/9Yef5jMHoeZA5s/+pZzmr0Qo0X7MTGkXieja2fjFN
 9RK4mV6ZiZHIwWeQP4Tz8v95I4pvf4LDY7hPcRKiiKIu6pq7HkvzKp5Hsqb1/qgKdliu
 AhsaIWZLe66lxA1rmIow6HjfnHQ5oBlnwMq9uSdHoE1YUvVc4YP7cqRH2jGvCudd8kPK FA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a4q1ab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:12 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QFl763006339; Tue, 26 Jul 2022 16:11:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq1uu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:11 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uSj023334;
 Tue, 26 Jul 2022 16:11:11 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-19; Tue, 26 Jul 2022 16:11:10 +0000
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
Subject: [PATCH V9 18/46] memory: flat section iterator
Date: Tue, 26 Jul 2022 09:10:15 -0700
Message-Id: <1658851843-236870-19-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-ORIG-GUID: 1vBJwC0V0P1Avf41pfJSTUByE3yZofYh
X-Proofpoint-GUID: 1vBJwC0V0P1Avf41pfJSTUByE3yZofYh
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

Add an iterator over the sections of a flattened address space.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/exec/memory.h | 31 +++++++++++++++++++++++++++++++
 softmmu/memory.c      | 21 +++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 7513d04..9629289 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2346,6 +2346,37 @@ void memory_region_set_ram_discard_manager(MemoryRegion *mr,
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
index 7ba2048..6aa3a2f 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2683,6 +2683,27 @@ bool memory_region_is_mapped(MemoryRegion *mr)
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


