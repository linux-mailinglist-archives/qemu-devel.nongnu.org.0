Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E71B69148B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 00:35:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQGRC-0007vc-ID; Thu, 09 Feb 2023 18:34:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQGR5-0007v8-S9
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:34:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQGR4-0006dU-5s
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:34:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675985677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JInKtzC6RF655Lncv3TKfNncp1aYsh6hnMBdswU/+NM=;
 b=ZOI8ziZAfDWuR30IcxXwX5q945FoOtMhif+gdbtQBxhiP0CLkNdn/sNJP5ZGq7fFCMEMKN
 N+zmCU/xoSl2wMdThS55zrY7KQnU9TtcDqTQ8kWJDZ1HEWiCA3oEGFU+zGIci5cAa/qP/1
 S0LNJ/cXAAmAX5ImwA6ZjERAQsghjnw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-uGnPQdBcOLSAauHZwLs_aQ-1; Thu, 09 Feb 2023 18:34:34 -0500
X-MC-Unique: uGnPQdBcOLSAauHZwLs_aQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BAE98027EB;
 Thu,  9 Feb 2023 23:34:34 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01C62175AD;
 Thu,  9 Feb 2023 23:34:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li Zhang <lizhang@suse.de>
Subject: [PULL 02/17] multifd: cleanup the function multifd_channel_connect
Date: Fri, 10 Feb 2023 00:34:11 +0100
Message-Id: <20230209233426.37811-3-quintela@redhat.com>
In-Reply-To: <20230209233426.37811-1-quintela@redhat.com>
References: <20230209233426.37811-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Li Zhang <lizhang@suse.de>

Cleanup multifd_channel_connect

Signed-off-by: Li Zhang <lizhang@suse.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 43 +++++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index b7ad7002e0..c8132ab7e8 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -843,30 +843,29 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
         ioc, object_get_typename(OBJECT(ioc)),
         migrate_get_current()->hostname, error);
 
-    if (!error) {
-        if (migrate_channel_requires_tls_upgrade(ioc)) {
-            multifd_tls_channel_connect(p, ioc, &error);
-            if (!error) {
-                /*
-                 * tls_channel_connect will call back to this
-                 * function after the TLS handshake,
-                 * so we mustn't call multifd_send_thread until then
-                 */
-                return true;
-            } else {
-                return false;
-            }
+    if (error) {
+        return false;
+    }
+    if (migrate_channel_requires_tls_upgrade(ioc)) {
+        multifd_tls_channel_connect(p, ioc, &error);
+        if (!error) {
+            /*
+             * tls_channel_connect will call back to this
+             * function after the TLS handshake,
+             * so we mustn't call multifd_send_thread until then
+             */
+            return true;
         } else {
-            migration_ioc_register_yank(ioc);
-            p->registered_yank = true;
-            p->c = ioc;
-            qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
-                                   QEMU_THREAD_JOINABLE);
-       }
-       return true;
+            return false;
+        }
+    } else {
+        migration_ioc_register_yank(ioc);
+        p->registered_yank = true;
+        p->c = ioc;
+        qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
+                           QEMU_THREAD_JOINABLE);
     }
-
-    return false;
+    return true;
 }
 
 static void multifd_new_send_channel_cleanup(MultiFDSendParams *p,
-- 
2.39.1


