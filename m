Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CFB292320
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 09:54:37 +0200 (CEST)
Received: from localhost ([::1]:53852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUQ04-0006Zc-9s
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 03:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kUPyF-00057a-1F
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 03:52:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kUPyD-00085a-7B
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 03:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603093960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OxA3Qq4UKBx78H131SKHi4ZpLY9OCsgstMMSifTmJY4=;
 b=APuDgPjNdBc8VA0NsIRoYTbLdb2HArNRgvq03BzVIm9XR9KtR61ZW9Q4dflyPByn3tzLHM
 6n9tqh4eE7XH2oORxbkyvkhA+LhEtJ0HcND4xSPwKLjy04qUDybe8B5ebc/PGwIUqZeetp
 FGwGmso1GczLdVW6ssTzdYXJfIXFtOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-qLqPAl1SN62Ewam4u5Qeug-1; Mon, 19 Oct 2020 03:52:38 -0400
X-MC-Unique: qLqPAl1SN62Ewam4u5Qeug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E01C803F42
 for <qemu-devel@nongnu.org>; Mon, 19 Oct 2020 07:52:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E82A5C641;
 Mon, 19 Oct 2020 07:52:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 51C459D5A; Mon, 19 Oct 2020 09:52:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/14] spice: move display_init() to QemuSpiceOps.
Date: Mon, 19 Oct 2020 09:52:14 +0200
Message-Id: <20201019075224.14803-5-kraxel@redhat.com>
In-Reply-To: <20201019075224.14803-1-kraxel@redhat.com>
References: <20201019075224.14803-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/qemu-spice-module.h | 1 +
 include/ui/qemu-spice.h        | 7 -------
 softmmu/vl.c                   | 2 +-
 ui/spice-core.c                | 1 +
 ui/spice-module.c              | 9 +++++++++
 5 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/ui/qemu-spice-module.h b/include/ui/qemu-spice-module.h
index b182bc4c21a6..dbe09035dade 100644
--- a/include/ui/qemu-spice-module.h
+++ b/include/ui/qemu-spice-module.h
@@ -20,6 +20,7 @@
 
 struct QemuSpiceOps {
     void (*init)(void);
+    void (*display_init)(void);
     int (*migrate_info)(const char *h, int p, int t, const char *s);
 };
 
diff --git a/include/ui/qemu-spice.h b/include/ui/qemu-spice.h
index e6df0a8715b0..a3fd1ea5ade8 100644
--- a/include/ui/qemu-spice.h
+++ b/include/ui/qemu-spice.h
@@ -66,13 +66,6 @@ static inline int qemu_spice_display_add_client(int csock, int skipauth,
     return -1;
 }
 
-static inline void qemu_spice_display_init(void)
-{
-    /* This must never be called if CONFIG_SPICE is disabled */
-    error_report("spice support is disabled");
-    abort();
-}
-
 #endif /* CONFIG_SPICE */
 
 static inline bool qemu_using_spice(Error **errp)
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 65c34a6b8a2e..8a06fe8bf77a 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4447,7 +4447,7 @@ void qemu_init(int argc, char **argv, char **envp)
 #endif
 
     if (using_spice) {
-        qemu_spice_display_init();
+        qemu_spice.display_init();
     }
 
     if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
diff --git a/ui/spice-core.c b/ui/spice-core.c
index 6ef66eb387de..82d5dbda3e26 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -995,6 +995,7 @@ int qemu_spice_display_is_running(SimpleSpiceDisplay *ssd)
 
 static struct QemuSpiceOps real_spice_ops = {
     .init         = qemu_spice_init,
+    .display_init = qemu_spice_display_init,
     .migrate_info = qemu_spice_migrate_info,
 };
 
diff --git a/ui/spice-module.c b/ui/spice-module.c
index a30fa452ea93..56868aaffe9a 100644
--- a/ui/spice-module.c
+++ b/ui/spice-module.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "ui/qemu-spice-module.h"
 
 int using_spice;
@@ -26,6 +27,13 @@ static void qemu_spice_init_stub(void)
 {
 }
 
+static void qemu_spice_display_init_stub(void)
+{
+    /* This must never be called if CONFIG_SPICE is disabled */
+    error_report("spice support is disabled");
+    abort();
+}
+
 static int qemu_spice_migrate_info_stub(const char *h, int p, int t,
                                         const char *s)
 {
@@ -34,5 +42,6 @@ static int qemu_spice_migrate_info_stub(const char *h, int p, int t,
 
 struct QemuSpiceOps qemu_spice = {
     .init         = qemu_spice_init_stub,
+    .display_init = qemu_spice_display_init_stub,
     .migrate_info = qemu_spice_migrate_info_stub,
 };
-- 
2.27.0


