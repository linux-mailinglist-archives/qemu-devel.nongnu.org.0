Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0DF2CAD57
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 21:30:18 +0100 (CET)
Received: from localhost ([::1]:39452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkCHx-0006Kw-Hw
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 15:30:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kkCBV-0005hC-K9
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:23:37 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:44478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kkCBT-0000Ys-Pp
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:23:37 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1KEu4e122193;
 Tue, 1 Dec 2020 20:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=DPtMP0qAzXlj08G8XwtbptNa6rATRlLCZIxp39PaXZ8=;
 b=NjNhGE6vRGyNFpzg/P4H5GF9w1UvHoCSSiVvtpPBRL1ax3kJjwBwP/zQJo3BPVoOPww9
 X8+VNXg4xS8LkKU8jCgXHhE8RGZZGoe5j3fuycE0v4mdlzgyX6kZCk5NO+uQnPJc+FhH
 XC/MAVkvY2WZMp77QTE81R3XdR7LHTB3fQ47P330NTdHxSZCh37eTJQ7HXNpc5ZoGXUm
 Dx++uWsZBfVG5+lM24IQOAFGXknY00fpedSqWSzii19iwDkx9Vz5uSLVhEBHrYCSEKd1
 sLt490eX6NS8NaBjW7KQvN3fUxB8//hWNhXXaen3dpHJp2yIenXIY3hugOYe5s6lSdch /g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 353egkmm4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 01 Dec 2020 20:23:28 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1KGI0n120080;
 Tue, 1 Dec 2020 20:23:27 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 3540asyv9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Dec 2020 20:23:27 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B1KNPJG014564;
 Tue, 1 Dec 2020 20:23:26 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Dec 2020 20:23:25 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 13/19] multi-process: add proxy communication functions
Date: Tue,  1 Dec 2020 15:22:48 -0500
Message-Id: <75c61eaf356343f207ad8d4e244cd3f9a36de792.1606853298.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1606853298.git.jag.raman@oracle.com>
References: <cover.1606853298.git.jag.raman@oracle.com>
In-Reply-To: <cover.1606853298.git.jag.raman@oracle.com>
References: <cover.1606853298.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=1
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 suspectscore=1
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012010122
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
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
 hw/remote/mpqemu-link.c         | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index 070ac77..cee9468 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -15,6 +15,8 @@
 #include "qemu/thread.h"
 #include "io/channel.h"
 #include "exec/hwaddr.h"
+#include "io/channel-socket.h"
+#include "hw/remote/proxy.h"
 
 #define REMOTE_MAX_FDS 8
 
@@ -65,6 +67,8 @@ typedef struct {
     int num_fds;
 } MPQemuMsg;
 
+uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev *pdev,
+                                         Error **errp);
 void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
 void mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
 
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index bbd9df3..18c8a54 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -17,6 +17,7 @@
 #include "qemu/iov.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "io/channel.h"
 
 /*
  * Send message over the ioc QIOChannel.
@@ -219,6 +220,43 @@ fail:
     }
 }
 
+/*
+ * Called from VCPU thread in non-coroutine context.
+ */
+uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev *pdev,
+                                         Error **errp)
+{
+    MPQemuMsg msg_reply = {0};
+    uint64_t ret = UINT64_MAX;
+    Error *local_err = NULL;
+
+    qemu_mutex_lock(&pdev->io_mutex);
+    mpqemu_msg_send(msg, pdev->ioc, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        goto exit_send;
+    }
+
+    mpqemu_msg_recv(&msg_reply, pdev->ioc, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        goto exit_send;
+    }
+
+    if (!mpqemu_msg_valid(&msg_reply) || msg_reply.cmd != RET_MSG) {
+        error_setg(errp, "ERROR: Invalid reply received for command %d",
+                         msg->cmd);
+        goto exit_send;
+    } else {
+        ret = msg_reply.data.u64;
+    }
+
+ exit_send:
+    qemu_mutex_unlock(&pdev->io_mutex);
+
+    return ret;
+}
+
 bool mpqemu_msg_valid(MPQemuMsg *msg)
 {
     if (msg->cmd >= MPQEMU_CMD_MAX && msg->cmd < 0) {
-- 
1.8.3.1


