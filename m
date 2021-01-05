Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7B52EB018
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:31:16 +0100 (CET)
Received: from localhost ([::1]:33458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpEp-0003Yd-GP
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwovM-00079Q-9t
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:11:08 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:36170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwovK-0005UD-Hl
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:11:08 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FsjfW094282;
 Tue, 5 Jan 2021 16:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=xGxUrL2p7kReaYTonVCM7YEX96cymyrpmYU+usiceHg=;
 b=xoqD92iVpHqREL3SsFkOPAtZwyCv8s67UiIRRX5jWMzlEB1kmgD+3q7YPR8l4JvJoJfy
 Go4/e3R8LzruS1wgiCLvVsbs+nOce0kZnJOy3+ETPy3fQTcWaW6azmz+9UiizoYRAp8g
 YQv/0aadQk9ycjtZm31W48lXSJNF51n6qUtqBb8G1dkqrlN25qX240pxtiy8iKgmyjdL
 2/rMlvBulNe1fDTPi9v+k9F4ohEk1v/eVkXtVBSqOpBIqax8nEruGSLkadIlfZNEv5WY
 2hZQmBz7EbYuVquE4CupPv0pzyzoQdvv0L06I7XvzJbaWn43U9sSHgbia2TBGJtrGCav qw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 35tebask5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:11:03 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FtLBr175897;
 Tue, 5 Jan 2021 16:09:02 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 35vct61vhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:02 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 105G90J6003312;
 Tue, 5 Jan 2021 16:09:00 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:09:00 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 01/22] as_flat_walk
Date: Tue,  5 Jan 2021 07:41:49 -0800
Message-Id: <1609861330-129855-2-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050099
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=steven.sistare@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an iterator over the sections of a flattened address space.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/exec/memory.h |  3 +++
 softmmu/memory.c      | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 307e527..8dba065 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1894,6 +1894,9 @@ bool memory_region_present(MemoryRegion *container, hwaddr addr);
  */
 bool memory_region_is_mapped(MemoryRegion *mr);
 
+typedef int (*qemu_flat_walk_cb)(MemoryRegionSection *s, void *handle);
+int as_flat_walk(AddressSpace *as, qemu_flat_walk_cb func, void *handle);
+
 /**
  * memory_region_find: translate an address/size relative to a
  * MemoryRegion into a #MemoryRegionSection.
diff --git a/softmmu/memory.c b/softmmu/memory.c
index af25987..8cac3bc 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2513,6 +2513,23 @@ bool memory_region_is_mapped(MemoryRegion *mr)
     return mr->container ? true : false;
 }
 
+int as_flat_walk(AddressSpace *as, qemu_flat_walk_cb func, void *handle)
+{
+    FlatView *view = address_space_get_flatview(as);
+    FlatRange *fr;
+    int ret;
+
+    FOR_EACH_FLAT_RANGE(fr, view) {
+        MemoryRegionSection section = section_from_flat_range(fr, view);
+        ret = func(&section, handle);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
 /* Same as memory_region_find, but it does not add a reference to the
  * returned region.  It must be called from an RCU critical section.
  */
-- 
1.8.3.1


