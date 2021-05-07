Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734F5376551
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:40:10 +0200 (CEST)
Received: from localhost ([::1]:57234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezm5-0000kh-Ed
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbP-0000VN-MM
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:07 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:40470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbG-0001Q1-IL
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:07 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CDx3a096787;
 Fri, 7 May 2021 12:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=fM+XV4xsrJ0PL8iFkG3vUaunvGZ6nUCTkbxCVv9GgRc=;
 b=UKBAJgRvsOjZK3iLXOx9nn74tygy8tqHF0JEsPLRAtN0RqppUphu7wr4hoJJd+mVmphH
 ZCWSMuPyox9YtKcrAMQYxXgkSDM4oMqYwpvFPBzBBsVrpiZMXh7yQ76xRE1T5o5Ln5F6
 kouev89pBcj1cTCRgtC9iBtI0NkqDpVcY1lcfQzY21LYhXCiu2R/LvhjvF8RToHTtha1
 yhyWcnxiizrqcKVpj6SpktjoSbOYhAzuD3J4fPb4V+9u5OT2kLao7jCNqhBzUhgSkeOo
 TCVFBlQ/TJPJoK1kW75YhjxaQHBTF+yKQLQHN+5UPaSGmeGH6bQyRdqvXFpgidPD6NC/ VA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 38ctd89d15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:53 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CFkKJ168068;
 Fri, 7 May 2021 12:28:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 38csrh1sv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:53 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CSqAO014186;
 Fri, 7 May 2021 12:28:52 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 38csrh1su6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:52 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 147CSoxC016365;
 Fri, 7 May 2021 12:28:50 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:28:49 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 01/22] as_flat_walk
Date: Fri,  7 May 2021 05:24:59 -0700
Message-Id: <1620390320-301716-2-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: 4Ap3RWcocOSL9lU7LYBrZKcYeZFgslAd
X-Proofpoint-ORIG-GUID: 4Ap3RWcocOSL9lU7LYBrZKcYeZFgslAd
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070085
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
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

Add an iterator over the sections of a flattened address space.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/exec/memory.h | 17 +++++++++++++++++
 softmmu/memory.c      | 18 ++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 5728a68..2e5495a 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2003,6 +2003,23 @@ bool memory_region_present(MemoryRegion *container, hwaddr addr);
  */
 bool memory_region_is_mapped(MemoryRegion *mr);
 
+typedef int (*qemu_flat_walk_cb)(MemoryRegionSection *s,
+                                 void *handle,
+                                 Error **errp);
+
+/**
+ * as_flat_walk: walk the ranges in the address space flat view and call @func
+ * for each.  Return 0 on success, else return non-zero with a message in
+ * @errp.
+ *
+ * @as: target address space
+ * @func: callback function
+ * @handle: passed to @func
+ * @errp: passed to @func
+ */
+int as_flat_walk(AddressSpace *as, qemu_flat_walk_cb func,
+                 void *handle, Error **errp);
+
 /**
  * memory_region_find: translate an address/size relative to a
  * MemoryRegion into a #MemoryRegionSection.
diff --git a/softmmu/memory.c b/softmmu/memory.c
index d4493ef..75d7d17 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2570,6 +2570,24 @@ bool memory_region_is_mapped(MemoryRegion *mr)
     return mr->container ? true : false;
 }
 
+int as_flat_walk(AddressSpace *as, qemu_flat_walk_cb func,
+                 void *handle, Error **errp)
+{
+    FlatView *view = address_space_get_flatview(as);
+    FlatRange *fr;
+    int ret;
+
+    FOR_EACH_FLAT_RANGE(fr, view) {
+        MemoryRegionSection section = section_from_flat_range(fr, view);
+        ret = func(&section, handle, errp);
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


