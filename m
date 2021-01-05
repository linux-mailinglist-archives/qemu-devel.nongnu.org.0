Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40D62EB00C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:29:40 +0100 (CET)
Received: from localhost ([::1]:60448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpDH-00034F-R4
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwouU-0005Rh-Pb
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:10:14 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:35418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwouP-0004om-85
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:10:14 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FsjBE094307;
 Tue, 5 Jan 2021 16:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=m2hIOO7ZwaMGAjBO7ZUaLW022oomIk0QTUel1nQiT5I=;
 b=IFPogBhtNmQJ8oE+K9bkboOPsfnIEl5AkkxX1XnsNhnHMMl7hDpd3BjaYz6Yljn99gmO
 TNRzD1+VdRImEmsQrh92u8H+GJGBkz3RD64ZW4Hai15bLncUYxsMSHJDYxq+a0KJKwdZ
 QvfMVofjG7wQALO7aMJaSK49si5wfDTNayn1yBhnJN0gOK57nbfPnRuRupFyl5tjHBgK
 jyVq8xhNvsHAqF+zJy8GL48OOmb6nl5NaJI0Pd5sq7MOjd79J+BuTAxmodW8tgUlw9r2
 Pk51pV1OBCH0ZMjxdy1dFTJjKXh5ROSfH49YStntUeDqycoZzuv+DbfjutfBt+lFYdjN Bg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 35tebasjux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:09:04 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FtLnY175890;
 Tue, 5 Jan 2021 16:09:03 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 35vct61vjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:03 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 105G91Y1020380;
 Tue, 5 Jan 2021 16:09:01 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:09:01 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 02/22] qemu_ram_volatile
Date: Tue,  5 Jan 2021 07:41:50 -0800
Message-Id: <1609861330-129855-3-git-send-email-steven.sistare@oracle.com>
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
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1011 bulkscore=0
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

Add a function that returns true if any ram_list block represents
volatile memory.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 exec.c                | 30 ++++++++++++++++++++++++++++++
 include/exec/memory.h |  8 ++++++++
 slirp                 |  2 +-
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index 6f381f9..d1f31b4 100644
--- a/exec.c
+++ b/exec.c
@@ -2726,6 +2726,36 @@ ram_addr_t qemu_ram_addr_from_host(void *ptr)
     return block->offset + offset;
 }
 
+/*
+ * Return true if any memory regions are writable and not backed by shared
+ * memory.
+ */
+bool qemu_ram_volatile(Error **errp)
+{
+    RAMBlock *block;
+    MemoryRegion *mr;
+    bool ret = false;
+
+    rcu_read_lock();
+    QLIST_FOREACH_RCU(block, &ram_list.blocks, next) {
+        mr = block->mr;
+        if (mr &&
+            memory_region_is_ram(mr) &&
+            !memory_region_is_ram_device(mr) &&
+            !memory_region_is_rom(mr) &&
+            (block->fd == -1 || !qemu_ram_is_shared(block))) {
+
+            error_setg(errp, "Memory region %s is volatile",
+                       memory_region_name(mr));
+            ret = true;
+            break;
+        }
+    }
+
+    rcu_read_unlock();
+    return ret;
+}
+
 /* Generate a debug exception if a watchpoint has been hit.  */
 void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                           MemTxAttrs attrs, int flags, uintptr_t ra)
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 8dba065..6115a01 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2522,6 +2522,14 @@ bool ram_block_discard_is_disabled(void);
  */
 bool ram_block_discard_is_required(void);
 
+/**
+ * qemu_ram_volatile: return true if any memory regions are writable and not
+ * backed by shared memory.
+ *
+ * @errp: returned error message identifying the bad region.
+ */
+bool qemu_ram_volatile(Error **errp);
+
 #endif
 
 #endif
diff --git a/slirp b/slirp
index ce94eba..a62d367 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit ce94eba2042d52a0ba3d9e252ebce86715e94275
+Subproject commit a62d36734ffe9828d0f70df1b3898a3b4fbda755
-- 
1.8.3.1


