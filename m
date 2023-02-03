Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052236892B7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:51:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNriF-00005v-A0; Fri, 03 Feb 2023 03:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrht-0008Mv-20
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhl-0007UK-U3
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orXptK2B42fK7gOw25mpVx5CGtUb1E1ea5zMtLjqD10=;
 b=Tdgkkgpcp9OV0ralGkxshjwODvNeO/GYYxl3xWKqj4C3laqRxwxqOOqminh8EsiyaoakMJ
 HZeU8S44m5zxmnpk+RueK9z/quSRljBtff2wflbccAs9QKUjZX9yd0tM/uexEWU/nAJZoy
 /DiQ6P3xmVbzsHBTBJIbo1CEmK1Cp2U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-9yeWwwWePnyWQoZ2OCWYNg-1; Fri, 03 Feb 2023 03:45:52 -0500
X-MC-Unique: 9yeWwwWePnyWQoZ2OCWYNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 753233C1016C;
 Fri,  3 Feb 2023 08:45:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 516CF40168BF;
 Fri,  3 Feb 2023 08:45:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BF2DE21E6A26; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 07/35] char: Factor out qmp_add_client() parts and move to
 chardev/
Date: Fri,  3 Feb 2023 09:45:21 +0100
Message-Id: <20230203084549.2622302-8-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Code moves from MAINTAINERS section "QMP" to "Character device
backends".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-5-armbru@redhat.com>
---
 include/monitor/qmp-helpers.h |  3 +++
 chardev/char.c                | 20 ++++++++++++++++++++
 monitor/qmp-cmds.c            | 13 ++-----------
 3 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/include/monitor/qmp-helpers.h b/include/monitor/qmp-helpers.h
index 4718c63c73..318c3357a2 100644
--- a/include/monitor/qmp-helpers.h
+++ b/include/monitor/qmp-helpers.h
@@ -22,5 +22,8 @@ bool qmp_add_client_vnc(int fd, bool has_skipauth, bool skipauth,
 bool qmp_add_client_dbus_display(int fd, bool has_skipauth, bool skipauth,
                         bool has_tls, bool tls, Error **errp);
 #endif
+bool qmp_add_client_char(int fd, bool has_skipauth, bool skipauth,
+                         bool has_tls, bool tls, const char *protocol,
+                         Error **errp);
 
 #endif
diff --git a/chardev/char.c b/chardev/char.c
index 87ab6efbcc..11eab7764c 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
 #include "monitor/monitor.h"
+#include "monitor/qmp-helpers.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
@@ -1166,6 +1167,25 @@ void qmp_chardev_send_break(const char *id, Error **errp)
     qemu_chr_be_event(chr, CHR_EVENT_BREAK);
 }
 
+bool qmp_add_client_char(int fd, bool has_skipauth, bool skipauth,
+                         bool has_tls, bool tls, const char *protocol,
+                         Error **errp)
+{
+    Chardev *s = qemu_chr_find(protocol);
+
+    if (!s) {
+        error_setg(errp, "protocol '%s' is invalid", protocol);
+        close(fd);
+        return false;
+    }
+    if (qemu_chr_add_client(s, fd) < 0) {
+        error_setg(errp, "failed to add client");
+        close(fd);
+        return false;
+    }
+    return true;
+}
+
 /*
  * Add a timeout callback for the chardev (in milliseconds), return
  * the GSource object created. Please use this to add timeout hook for
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 743849c0b5..e5ab77f6c6 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -17,7 +17,6 @@
 #include "monitor/monitor.h"
 #include "monitor/qmp-helpers.h"
 #include "sysemu/sysemu.h"
-#include "chardev/char.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "sysemu/runstate-action.h"
@@ -174,7 +173,6 @@ void qmp_add_client(const char *protocol, const char *fdname,
         { "@dbus-display", qmp_add_client_dbus_display },
 #endif
     };
-    Chardev *s;
     int fd, i;
 
     fd = monitor_get_fd(monitor_cur(), fdname, errp);
@@ -192,16 +190,9 @@ void qmp_add_client(const char *protocol, const char *fdname,
         }
     }
 
-    s = qemu_chr_find(protocol);
-    if (!s) {
-        error_setg(errp, "protocol '%s' is invalid", protocol);
+    if (!qmp_add_client_char(fd, has_skipauth, skipauth, has_tls, tls,
+                             protocol, errp)) {
         close(fd);
-        return;
-    }
-    if (qemu_chr_add_client(s, fd) < 0) {
-        error_setg(errp, "failed to add client");
-        close(fd);
-        return;
     }
 }
 
-- 
2.39.0


