Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC22821A807
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 21:46:20 +0200 (CEST)
Received: from localhost ([::1]:59612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtcUt-0003IR-PT
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 15:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1jtcSL-0006sg-7g
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 15:43:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29928
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1jtcSJ-0000Pz-O1
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 15:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594323819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w3v0OvPrnRzLS4tBxGtk+XVFvBiWN7UBLmvU5flzVSY=;
 b=hahLgtQ1jMS+XMNCCWyB05PYl4cXRgYmKsc6uEVaXHxpa6BgKF1w1Ip0ZkMm1gaTwd7VRB
 X9ktDK1qwEpZCqHQrN3tZQUOfyvHnk5twqTZu7dBu3HSXbvQgdLHgElsC/jwt5EDyi9OHd
 cFkNu8+V8lrKUuT9lz231MuJjRh4QLc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-W90mSXxtNdGPkMnrsun0fA-1; Thu, 09 Jul 2020 15:43:37 -0400
X-MC-Unique: W90mSXxtNdGPkMnrsun0fA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DECAD80BCB2;
 Thu,  9 Jul 2020 19:43:35 +0000 (UTC)
Received: from localhost (unknown [10.36.110.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 081B87F8A5;
 Thu,  9 Jul 2020 19:43:34 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/13] block/gluster: auto-ify URI parsing variables
Date: Thu,  9 Jul 2020 23:42:28 +0400
Message-Id: <20200709194234.2117650-8-marcandre.lureau@redhat.com>
In-Reply-To: <20200709194234.2117650-1-marcandre.lureau@redhat.com>
References: <20200709194234.2117650-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=marcandre.lureau@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 11:25:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, integration@gluster.org,
 sheepdog@lists.wpkg.org, qemu-block@nongnu.org, Peter Lieven <pl@kamp.de>,
 "Richard W.M. Jones" <rjones@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Liu Yuan <namei.unix@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 block/gluster.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/block/gluster.c b/block/gluster.c
index 31233cac696..c06eca1c12f 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -349,10 +349,10 @@ static int qemu_gluster_parse_uri(BlockdevOptionsGluster *gconf,
                                   const char *filename)
 {
     SocketAddress *gsconf;
-    URI *uri;
-    QueryParams *qp = NULL;
+    g_autoptr(URI) uri = NULL;
+    g_autoptr(QueryParams) qp = NULL;
     bool is_unix = false;
-    int ret = 0;
+    int ret;
 
     uri = uri_parse(filename);
     if (!uri) {
@@ -374,29 +374,25 @@ static int qemu_gluster_parse_uri(BlockdevOptionsGluster *gconf,
         gsconf->type = SOCKET_ADDRESS_TYPE_INET;
         warn_report("rdma feature is not supported, falling back to tcp");
     } else {
-        ret = -EINVAL;
-        goto out;
+        return -EINVAL;
     }
 
     ret = parse_volume_options(gconf, uri->path);
     if (ret < 0) {
-        goto out;
+        return ret;
     }
 
     qp = query_params_parse(uri->query);
     if (qp->n > 1 || (is_unix && !qp->n) || (!is_unix && qp->n)) {
-        ret = -EINVAL;
-        goto out;
+        return -EINVAL;
     }
 
     if (is_unix) {
         if (uri->server || uri->port) {
-            ret = -EINVAL;
-            goto out;
+            return -EINVAL;
         }
         if (strcmp(qp->p[0].name, "socket")) {
-            ret = -EINVAL;
-            goto out;
+            return -EINVAL;
         }
         gsconf->u.q_unix.path = g_strdup(qp->p[0].value);
     } else {
@@ -408,12 +404,7 @@ static int qemu_gluster_parse_uri(BlockdevOptionsGluster *gconf,
         }
     }
 
-out:
-    if (qp) {
-        query_params_free(qp);
-    }
-    uri_free(uri);
-    return ret;
+    return 0;
 }
 
 static struct glfs *qemu_gluster_glfs_init(BlockdevOptionsGluster *gconf,
-- 
2.27.0.221.ga08a83db2b


