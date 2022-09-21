Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885585C0047
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 16:49:08 +0200 (CEST)
Received: from localhost ([::1]:53314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob12B-0003HF-53
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 10:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slf553@126.com>) id 1oavDk-0008TB-J8
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 04:36:40 -0400
Received: from m15114.mail.126.com ([220.181.15.114]:25301)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slf553@126.com>) id 1oavDb-0007wY-Gd
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 04:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=PrMxuYAxIaMfkKDctO
 2Z5uggG9AFjdKzrLzrBsh3uGM=; b=DbeVv8+CiSFb1OzvMLU+WlonSWO+qLsyE0
 l+jiZ3iPI2nTRPXPRTQYBXZ6TiZTFpse6S02mwWgu119nw1MBgo2gxuwovZdHzbn
 +KgnTKPk2rMmtAp4GFF0Q2LE8NMQsPrDLWJ5IiKPatS3N95llq7WrxXV2Ub9zZWN
 EgDc/UiME=
Received: from master.localdomain (unknown [117.160.246.157])
 by smtp7 (Coremail) with SMTP id DsmowABnkJoCzSpjYTDVBw--.7217S2;
 Wed, 21 Sep 2022 16:36:19 +0800 (CST)
From: songlinfeng <slf553@126.com>
To: qemu-devel@nongnu.org
Cc: eblake@redhat.com,
	songlinfeng <songlinfeng@inspur.com>
Subject: [PATCH] add keepalive for qemu-nbd
Date: Wed, 21 Sep 2022 16:36:09 +0800
Message-Id: <1663749369-3057-1-git-send-email-slf553@126.com>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: DsmowABnkJoCzSpjYTDVBw--.7217S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFW3Zr1rurW7GF45WFyrCrg_yoW8CrWkpF
 yDAFy5KrWrC347u3sIvasxJr1avrs5JryUXr9rGrn2yFsrKr40qFZ2yr909F13WrWqv3ya
 kry0gF10vFn5ZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j1hFcUUUUU=
X-Originating-IP: [117.160.246.157]
X-CM-SenderInfo: 5voikkat6rjloofrz/1tbiLQ2DtVpD-lEK-AABsX
Received-SPF: pass client-ip=220.181.15.114; envelope-from=slf553@126.com;
 helo=m15114.mail.126.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 21 Sep 2022 10:31:51 -0400
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

From: songlinfeng <songlinfeng@inspur.com>

we want to export a image with qemu-nbd as server, in client we use libnbd to connect qemu-nbd,but when client power down,the server is still working.
qemu-nbd will exit when last client exit.so,we still want server exit when client power down.maybe qmp can handle it,but i don't know how to do .
Signed-off-by: songlinfeng <songlinfeng@inspur.com>
---
 qemu-nbd.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index 0cd5aa6..115ef2b 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -20,7 +20,8 @@
 #include <getopt.h>
 #include <libgen.h>
 #include <pthread.h>
-
+#include <sys/types.h>
+#include <sys/socket.h>
 #include "qemu/help-texts.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
@@ -365,6 +366,26 @@ static void nbd_accept(QIONetListener *listener, QIOChannelSocket *cioc,
     nb_fds++;
     nbd_update_server_watch();
     nbd_client_new(cioc, tlscreds, tlsauthz, nbd_client_closed);
+    int tcp_keepalive_intvl = 5;
+    int tcp_keepalive_probes = 5;
+    int tcp_keepalive_time = 60;
+    int tcp_keepalive_on = 1;
+    if (setsockopt(cioc->fd, SOL_TCP, TCP_KEEPINTVL,
+                   &tcp_keepalive_intvl, sizeof(tcp_keepalive_intvl)) < 0) {
+        perror("setsockopt failed\n");
+    }
+    if (setsockopt(cioc->fd, SOL_TCP, TCP_KEEPCNT,
+                   &tcp_keepalive_probes, sizeof(tcp_keepalive_probes)) < 0) {
+        perror("setsockopt failed\n");
+    }
+    if (setsockopt(cioc->fd, SOL_TCP, TCP_KEEPIDLE,
+                   &tcp_keepalive_time, sizeof(tcp_keepalive_time)) < 0) {
+        perror("setsockopt failed\n");
+    }
+    if (setsockopt(cios->fd, SOL_SOCKET, SO_KEEPALIVE,
+                   &tcp_keepalive_on, sizeof(tcp_keepalive_on)) < 0) {
+        perror("setsockopt failed\n");
+    }
 }
 
 static void nbd_update_server_watch(void)
-- 
1.8.3.1


