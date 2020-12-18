Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA6E2DDE22
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 06:43:37 +0100 (CET)
Received: from localhost ([::1]:52584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8YC-00028E-Uq
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 00:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8W9-0000Oy-4T
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:41:29 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:57492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8W7-0003xn-6a
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:41:28 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5Y09g078945;
 Fri, 18 Dec 2020 05:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=t2bj9OpEueRrJXotLk2q1xTor8b8X6FMxHwLU+LWsOw=;
 b=lOYnLh2omwrb9T8+hS+G8BB6lcZrt5UnfQ0Inl7MdGGt0ZGM75JJqc/kN7KxyPN/e1XT
 Zjha9n2XpWN3lF8l3ldNnvj2c6hWWYkHWvzZTWKowVwYvf8VA47OFlDUD2tilySSPkbj
 25Icz4vGs+/SWxE72uvK7jdlNoUnsIrIuEyePYLet0uq2+2eb9Ta4JxHLBoyoVLwHDUO
 YVeIIKAJlLeiWbdk0zt0rKhKBZawbPI5jKucIIx4soH4cVc/RY/KFM3+9MjLwjkgc2/n
 Kc6MotQ8zrD4p3dIabfxagN1xBRYWr9aBTPT8fQhn4j3Z0NkaH7f/FP1QhXDpVDXHSup ug== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 35cntmgnxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Dec 2020 05:41:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5ZKPP043363;
 Fri, 18 Dec 2020 05:41:20 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 35e6eu9vyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 05:41:20 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BI5fIQP009948;
 Fri, 18 Dec 2020 05:41:18 GMT
Received: from flaka.hsd1.ca.comcast.net (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Dec 2020 21:41:17 -0800
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH v14 RESEND 15/21] multi-process: add proxy communication
 functions
Date: Thu, 17 Dec 2020 21:40:45 -0800
Message-Id: <abafc759d9ce07645dc630bf9bd17fb262463997.1608263018.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
In-Reply-To: <cover.1608263017.git.elena.ufimtseva@oracle.com>
References: <cover.1608263017.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180040
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=elena.ufimtseva@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/mpqemu-link.h |  4 ++++
 hw/remote/mpqemu-link.c         | 34 +++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index 48c617ebad..36b540c047 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -15,6 +15,8 @@
 #include "qemu/thread.h"
 #include "io/channel.h"
 #include "exec/hwaddr.h"
+#include "io/channel-socket.h"
+#include "hw/remote/proxy.h"
 
 #define REMOTE_MAX_FDS 8
 
@@ -68,6 +70,8 @@ typedef struct {
 bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
 bool mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
 
+uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev *pdev,
+                                         Error **errp);
 bool mpqemu_msg_valid(MPQemuMsg *msg);
 
 #endif
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index 5c9af1de71..df35a4d9c6 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -182,6 +182,40 @@ fail:
     return ret;
 }
 
+/*
+ * Send msg and wait for a reply with command code RET_MSG.
+ * Returns the message received of size u64 or UINT64_MAX
+ * on error.
+ * Called from VCPU thread in non-coroutine context.
+ * Used by the Proxy object to communicate to remote processes.
+ */
+uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev *pdev,
+                                         Error **errp)
+{
+    ERRP_GUARD();
+    MPQemuMsg msg_reply = {0};
+    uint64_t ret = UINT64_MAX;
+
+    assert(!qemu_in_coroutine());
+
+    QEMU_LOCK_GUARD(&pdev->io_mutex);
+    if (!mpqemu_msg_send(msg, pdev->ioc, errp)) {
+        return ret;
+    }
+
+    if (!mpqemu_msg_recv(&msg_reply, pdev->ioc, errp)) {
+        return ret;
+    }
+
+    if (!mpqemu_msg_valid(&msg_reply)) {
+        error_setg(errp, "ERROR: Invalid reply received for command %d",
+                         msg->cmd);
+        return ret;
+    }
+
+    return msg_reply.data.u64;
+}
+
 bool mpqemu_msg_valid(MPQemuMsg *msg)
 {
     if (msg->cmd >= MPQEMU_CMD_MAX && msg->cmd < 0) {
-- 
2.25.GIT


