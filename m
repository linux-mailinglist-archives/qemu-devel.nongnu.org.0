Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E267F292321
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 09:54:38 +0200 (CEST)
Received: from localhost ([::1]:54004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUQ05-0006fJ-V7
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 03:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kUPyG-00059m-Lc
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 03:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kUPyE-00086b-Nn
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 03:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603093961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=maxUohMWEPw0bBb1vHeCZsFpQesaxYhCQBd/D4o2Tj0=;
 b=bBOZJrcLEYqD/Rg4FUzxhuHotelnQxZOwxBRKRZrnreRmx2EriOZZH0mSH20tqMvJjfXtp
 jZaFVPMRHZEgoTnFdj1rr3b5Uh3TE2/ufti78Qa0m4rbGh5rVMShyK/zjT+siQ/aWJFROB
 765lKm0Aa9DZO6TtcG9RjJXeog7zwt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-FazRPJ4nN-SdKSDo8wZ6uw-1; Mon, 19 Oct 2020 03:52:39 -0400
X-MC-Unique: FazRPJ4nN-SdKSDo8wZ6uw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1D9A18A077E
 for <qemu-devel@nongnu.org>; Mon, 19 Oct 2020 07:52:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 947E15C641;
 Mon, 19 Oct 2020 07:52:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8D7F59D0F; Mon, 19 Oct 2020 09:52:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/14] spice: wire up monitor in QemuSpiceOps.
Date: Mon, 19 Oct 2020 09:52:18 +0200
Message-Id: <20201019075224.14803-9-kraxel@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 01:44:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

Rename qmp_query_spice() to qmp_query_spice_real(), add to QemuSpiceOps.

Add new qmp_query_spice() function which calls the real function via
QemuSpiceOps if available, otherwise return SpiceInfo.enabled = false.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/qemu-spice-module.h |  3 +++
 ui/spice-core.c                |  3 ++-
 ui/spice-module.c              | 17 +++++++++++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/ui/qemu-spice-module.h b/include/ui/qemu-spice-module.h
index 7422f6404ba0..1f22d557ea2f 100644
--- a/include/ui/qemu-spice-module.h
+++ b/include/ui/qemu-spice-module.h
@@ -22,6 +22,8 @@
 #include <spice.h>
 #endif
 
+typedef struct SpiceInfo SpiceInfo;
+
 struct QemuSpiceOps {
     void (*init)(void);
     void (*display_init)(void);
@@ -32,6 +34,7 @@ struct QemuSpiceOps {
     int (*display_add_client)(int csock, int skipauth, int tls);
 #ifdef CONFIG_SPICE
     int (*add_interface)(SpiceBaseInstance *sin);
+    SpiceInfo* (*qmp_query)(Error **errp);
 #endif
 };
 
diff --git a/ui/spice-core.c b/ui/spice-core.c
index 99457c226e6f..eea52f538999 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -502,7 +502,7 @@ static QemuOptsList qemu_spice_opts = {
     },
 };
 
-SpiceInfo *qmp_query_spice(Error **errp)
+static SpiceInfo *qmp_query_spice_real(Error **errp)
 {
     QemuOpts *opts = QTAILQ_FIRST(&qemu_spice_opts.head);
     int port, tls_port;
@@ -1001,6 +1001,7 @@ static struct QemuSpiceOps real_spice_ops = {
     .set_pw_expire = qemu_spice_set_pw_expire,
     .display_add_client = qemu_spice_display_add_client,
     .add_interface = qemu_spice_add_interface,
+    .qmp_query = qmp_query_spice_real,
 };
 
 static void spice_register_config(void)
diff --git a/ui/spice-module.c b/ui/spice-module.c
index 8fbc99c03c55..32223358722c 100644
--- a/ui/spice-module.c
+++ b/ui/spice-module.c
@@ -19,6 +19,9 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qapi/qapi-types-ui.h"
+#include "qapi/qapi-commands-ui.h"
 #include "ui/qemu-spice-module.h"
 
 int using_spice;
@@ -66,3 +69,17 @@ struct QemuSpiceOps qemu_spice = {
     .set_pw_expire = qemu_spice_set_pw_expire_stub,
     .display_add_client = qemu_spice_display_add_client_stub,
 };
+
+#ifdef CONFIG_SPICE
+
+SpiceInfo *qmp_query_spice(Error **errp)
+{
+    if (!qemu_spice.qmp_query) {
+        SpiceInfo *info = g_new0(SpiceInfo, 1);
+        info->enabled = false;
+        return info;
+    }
+    return qemu_spice.qmp_query(errp);
+}
+
+#endif
-- 
2.27.0


