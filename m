Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEEB2EAFCD
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:13:33 +0100 (CET)
Received: from localhost ([::1]:46642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwoxg-0001YZ-WF
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:13:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwote-00044r-Ek
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:23 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:34610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotc-00043s-ET
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:22 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FssIm094377;
 Tue, 5 Jan 2021 16:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=JQJnPEZDvQ1M9ymRyKSvIWA8GKzZCqefysF6L/x0eic=;
 b=TGWV1+rRrtBVfnX4jfTLtosgs4rkvKk5MrdaxtZXf6sBQLFULqKS0r5SflWyXNXyFtaz
 KJ7HFA3CBlLc1hd17jCtQ9kZpLFf9e/ikmjNJxJk1rsmc07ZTyIhXMJFXvndk8/2e4Fn
 mtIOvUoenSyu4UDTjaGzfysBSwQx5JyeWYq/z8fNTpFVzB8UsoDHrFx4cW9SM9BaOYyq
 lGMEIAxpguvtVIGToOKQNPgdx67E2SZyA4M9D9JobADgiQmNoraqByW44BgXpWrK7LE8
 8KN1JHjE/Mbq5uvs8JLurYyhmU81iJeVHOrv9lu78FePvFiDZBSgWDKKNULj9p/Poe0g qA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 35tebasjvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:09:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FuNl6029067;
 Tue, 5 Jan 2021 16:09:15 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 35uxnsvb7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:15 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 105G9EL6003485;
 Tue, 5 Jan 2021 16:09:14 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:09:13 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 17/22] chardev: socket accept subroutine
Date: Tue,  5 Jan 2021 07:42:05 -0800
Message-Id: <1609861330-129855-18-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 spamscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
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

Factor out the post-accept actions into a subroutine that can be used in a
subsequent patch.  No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 io/channel-socket.c | 43 ++++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index e1b4667..de49880 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -349,16 +349,34 @@ void qio_channel_socket_dgram_async(QIOChannelSocket *ioc,
                            context);
 }
 
+static int qio_channel_socket_post_accept(QIOChannelSocket *cioc,
+                                           Error **errp)
+{
+    cioc->localAddrLen = sizeof(cioc->localAddr);
+    if (getsockname(cioc->fd, (struct sockaddr *)&cioc->localAddr,
+                    &cioc->localAddrLen) < 0) {
+        error_setg_errno(errp, errno,
+                         "Unable to query local socket address");
+        return 1;
+    }
+
+#ifndef WIN32
+    if (cioc->localAddr.ss_family == AF_UNIX) {
+        QIOChannel *ioc_local = QIO_CHANNEL(cioc);
+        qio_channel_set_feature(ioc_local, QIO_CHANNEL_FEATURE_FD_PASS);
+    }
+#endif /* WIN32 */
+
+    return 0;
+}
 
 QIOChannelSocket *
 qio_channel_socket_accept(QIOChannelSocket *ioc,
                           Error **errp)
 {
-    QIOChannelSocket *cioc;
+    QIOChannelSocket *cioc = qio_channel_socket_new();
 
-    cioc = qio_channel_socket_new();
     cioc->remoteAddrLen = sizeof(ioc->remoteAddr);
-    cioc->localAddrLen = sizeof(ioc->localAddr);
 
  retry:
     trace_qio_channel_socket_accept(ioc);
@@ -372,24 +390,11 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
         trace_qio_channel_socket_accept_fail(ioc);
         goto error;
     }
-
-    if (getsockname(cioc->fd, (struct sockaddr *)&cioc->localAddr,
-                    &cioc->localAddrLen) < 0) {
-        error_setg_errno(errp, errno,
-                         "Unable to query local socket address");
-        goto error;
+    if (!qio_channel_socket_post_accept(cioc, errp)) {
+        trace_qio_channel_socket_accept_complete(ioc, cioc, cioc->fd);
+        return cioc;
     }
 
-#ifndef WIN32
-    if (cioc->localAddr.ss_family == AF_UNIX) {
-        QIOChannel *ioc_local = QIO_CHANNEL(cioc);
-        qio_channel_set_feature(ioc_local, QIO_CHANNEL_FEATURE_FD_PASS);
-    }
-#endif /* WIN32 */
-
-    trace_qio_channel_socket_accept_complete(ioc, cioc, cioc->fd);
-    return cioc;
-
  error:
     object_unref(OBJECT(cioc));
     return NULL;
-- 
1.8.3.1


