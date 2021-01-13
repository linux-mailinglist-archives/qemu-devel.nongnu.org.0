Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BF72F506B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 17:54:13 +0100 (CET)
Received: from localhost ([::1]:47596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzjPO-0007y1-Jr
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 11:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kzjEp-0006Wj-Vj
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:43:16 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:48326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kzjEm-0007xy-3w
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:43:14 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DGfQqI138201;
 Wed, 13 Jan 2021 16:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=fcOYsIut7P+7V3lCOwx9r74mhX1CARiekYFi7+KIyC8=;
 b=azhi2cu35ypnvIJYcc+8+HQCs4TphoSW9xdAqRBBrDEzaxoMufmC8AK8R+lwoYhsULnT
 8sGHdGt/l6bioDeg20nT73HIE04Vzl81faIpVVEfvpzjC+H7sNDwW1oGiQaz140Xd93g
 unfvEA8nZeRQv0i6jQeo5ZZdLNb61lAy88ktNw0BstArVE5or5WRPHcRAUWV7GotItFN
 eEDtHFFxFdQkBMtC4chnQu3etWTQ6br2nDL79nEDM9VmiDcwqzBNX+a75o/BggksgmhA
 QFfy/GGGgcXjVpcfpEl444voEA62IulZhC5idsWv/xRes7+/c3IEJNIh5n2I+Vf2u3g3 zA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 360kcyvdt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 16:43:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DGeYEo150544;
 Wed, 13 Jan 2021 16:43:06 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 360kf7wjfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 16:43:06 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10DGh4Dq028556;
 Wed, 13 Jan 2021 16:43:04 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Jan 2021 08:43:04 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v17 14/20] multi-process: add proxy communication functions
Date: Wed, 13 Jan 2021 11:42:26 -0500
Message-Id: <aa916df1b289f322bfeca6b7b8cf58206ed7a44d.1610556046.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1610556046.git.jag.raman@oracle.com>
References: <cover.1610556046.git.jag.raman@oracle.com>
In-Reply-To: <cover.1610556046.git.jag.raman@oracle.com>
References: <cover.1610556046.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130101
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130100
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 hw/remote/mpqemu-link.c         | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index 6ee5bc5..1b35d40 100644
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
index 4b25649..88d1f9b 100644
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
1.8.3.1


