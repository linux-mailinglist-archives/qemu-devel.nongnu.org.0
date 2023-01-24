Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA066797E1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 13:25:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKILf-0007mm-B5; Tue, 24 Jan 2023 07:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pKIHi-00024z-S1
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:20:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pKIHQ-0006Uo-7c
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674562799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hzhkCtiGE/Nt/5UhkRP2EOhS734lSSVlGakAMxcfwlA=;
 b=fuPTCGV1FKe6bRKHMtikOXDn4WvVtnhpqGQzwBzAaco2vEkHp3UzEkIB25E4hdPRL+8+Lx
 NIh2ydSxnz/Zbr3//EAMEDco9q62Rvc77FqMQAyrvFFTJUCS0If7nDfUjyo1DTs23oGoM2
 itW4ZtnPIHw8OiHneBcubWG7B5LW6nw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-5qmKE6X0Ovu-q1UFc15yWQ-1; Tue, 24 Jan 2023 07:19:49 -0500
X-MC-Unique: 5qmKE6X0Ovu-q1UFc15yWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 307D718A6462;
 Tue, 24 Jan 2023 12:19:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D9BF53A0;
 Tue, 24 Jan 2023 12:19:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8C41B21E6A23; Tue, 24 Jan 2023 13:19:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, kraxel@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, marcandre.lureau@redhat.com, dgilbert@redhat.com,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 jasowang@redhat.com, jiri@resnulli.us, berrange@redhat.com,
 thuth@redhat.com, quintela@redhat.com, stefanb@linux.vnet.ibm.com,
 stefanha@redhat.com, kvm@vger.kernel.org, qemu-block@nongnu.org
Subject: [PATCH 04/32] char: Factor out qmp_add_client() parts and move to
 chardev/
Date: Tue, 24 Jan 2023 13:19:18 +0100
Message-Id: <20230124121946.1139465-5-armbru@redhat.com>
In-Reply-To: <20230124121946.1139465-1-armbru@redhat.com>
References: <20230124121946.1139465-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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


