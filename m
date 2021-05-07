Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A173A376541
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:37:11 +0200 (CEST)
Received: from localhost ([::1]:49156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezjC-0005ti-NB
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbQ-0000Wf-9y
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:08 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:49842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbI-0001Ph-7b
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:08 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CDl5Z148701;
 Fri, 7 May 2021 12:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=lQBJ44QptfFTTE/3XPI+XHOEqOspc+Cq3thya32ShGc=;
 b=uduTUsJ7SKKI189DJw/WD51jc2O9HcMJiWQdQkhqb5BDcSFVwnZYRSD5ghVlfdtRxlVN
 1ebL+GB4mXC40yMkKcr4jDkT1QfLVS5VyHPxCCHUZ5i8P/5wNj9byQEYRq3fMPWT3qXe
 ZBjMcWHdGFmGcl1PGqZPHbMCxcLbJvTevq1dmCzCR0IAK3MOmzY2Kld9TclycaGBhJxR
 1dzlWf1TxM5aDx0WeEViOaZRXW9+IUrUHqfm8V906FxACzj3Nl1WXnqNZaY+XwRH5byi
 RUB8Wwm6F23jD/NNmJYdjEyBhnf6g6EAxEhnEZ7qpgZB3m3Rsfyfy/rG+uQSAmJiS8RQ HA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 38csrd9ew4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:53 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CFMV0031113;
 Fri, 7 May 2021 12:28:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 38css8ss0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:53 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CSqXK071367;
 Fri, 7 May 2021 12:28:52 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 38css8sry0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:52 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 147CSoX5017174;
 Fri, 7 May 2021 12:28:50 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:28:50 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 02/22] qemu_ram_volatile
Date: Fri,  7 May 2021 05:25:00 -0700
Message-Id: <1620390320-301716-3-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: ibaBaQ8Ch7tA6zW18AhNpPGZavo3Buav
X-Proofpoint-GUID: ibaBaQ8Ch7tA6zW18AhNpPGZavo3Buav
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070085
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=steven.sistare@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 include/exec/memory.h |  8 ++++++++
 softmmu/memory.c      | 30 ++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 2e5495a..d87c059 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2646,6 +2646,14 @@ bool ram_block_discard_is_disabled(void);
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
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 75d7d17..b2d5092 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2725,6 +2725,36 @@ void memory_global_dirty_log_stop(void)
     memory_global_dirty_log_do_stop();
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
 static void listener_add_address_space(MemoryListener *listener,
                                        AddressSpace *as)
 {
-- 
1.8.3.1


