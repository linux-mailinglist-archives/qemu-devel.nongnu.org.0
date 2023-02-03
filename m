Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89CE6892B8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:51:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNriM-00006a-D3; Fri, 03 Feb 2023 03:46:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrht-0008Mu-2C
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhl-0007UN-VB
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4SEbduPWXd1+5f5G4RsIe6W9lEmEgy4MGADIype3gu8=;
 b=SWmFbO66kD4C17UEA+VGYXRJvV1OhBdb+FR76U43f/KquwlzQ4CLLOLGc8fCotZCBT7K8l
 lelpvO7dSMZZCD2iOh+Regm/LQuph7pHKtMNJ/GC+AkRsrTQkadvdmwr5b/T1jypSyAJ/Z
 qF4+I8WAiGe8+D+Gey7BECdJ+PnuDFk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-hYdh2jp-MS2TbWO0guOtEQ-1; Fri, 03 Feb 2023 03:45:52 -0500
X-MC-Unique: hYdh2jp-MS2TbWO0guOtEQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9283E3C1016E;
 Fri,  3 Feb 2023 08:45:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51333140EBF6;
 Fri,  3 Feb 2023 08:45:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BA58A21E6A24; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 05/35] audio: Move HMP commands from monitor/ to audio/
Date: Fri,  3 Feb 2023 09:45:19 +0100
Message-Id: <20230203084549.2622302-6-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

This moves these commands from MAINTAINERS sections "Human
Monitor (HMP)" and "QMP" to "Overall Audio backends".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-3-armbru@redhat.com>
---
 include/monitor/hmp.h  |  3 ++
 audio/audio-hmp-cmds.c | 83 ++++++++++++++++++++++++++++++++++++++++++
 monitor/misc.c         | 56 ----------------------------
 audio/meson.build      |  1 +
 4 files changed, 87 insertions(+), 56 deletions(-)
 create mode 100644 audio/audio-hmp-cmds.c

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 1b3bdcb446..c25bec1863 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -151,5 +151,8 @@ void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
 void hmp_info_stats(Monitor *mon, const QDict *qdict);
 void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict);
+void hmp_info_capture(Monitor *mon, const QDict *qdict);
+void hmp_stopcapture(Monitor *mon, const QDict *qdict);
+void hmp_wavcapture(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/audio/audio-hmp-cmds.c b/audio/audio-hmp-cmds.c
new file mode 100644
index 0000000000..1237ce9e75
--- /dev/null
+++ b/audio/audio-hmp-cmds.c
@@ -0,0 +1,83 @@
+/*
+ * HMP commands related to audio backends
+ *
+ * Copyright (c) 2003-2004 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "audio/audio.h"
+#include "monitor/hmp.h"
+#include "monitor/monitor.h"
+#include "qapi/qmp/qdict.h"
+
+static QLIST_HEAD (capture_list_head, CaptureState) capture_head;
+
+void hmp_info_capture(Monitor *mon, const QDict *qdict)
+{
+    int i;
+    CaptureState *s;
+
+    for (s = capture_head.lh_first, i = 0; s; s = s->entries.le_next, ++i) {
+        monitor_printf(mon, "[%d]: ", i);
+        s->ops.info (s->opaque);
+    }
+}
+
+void hmp_stopcapture(Monitor *mon, const QDict *qdict)
+{
+    int i;
+    int n = qdict_get_int(qdict, "n");
+    CaptureState *s;
+
+    for (s = capture_head.lh_first, i = 0; s; s = s->entries.le_next, ++i) {
+        if (i == n) {
+            s->ops.destroy (s->opaque);
+            QLIST_REMOVE (s, entries);
+            g_free (s);
+            return;
+        }
+    }
+}
+
+void hmp_wavcapture(Monitor *mon, const QDict *qdict)
+{
+    const char *path = qdict_get_str(qdict, "path");
+    int freq = qdict_get_try_int(qdict, "freq", 44100);
+    int bits = qdict_get_try_int(qdict, "bits", 16);
+    int nchannels = qdict_get_try_int(qdict, "nchannels", 2);
+    const char *audiodev = qdict_get_str(qdict, "audiodev");
+    CaptureState *s;
+    AudioState *as = audio_state_by_name(audiodev);
+
+    if (!as) {
+        monitor_printf(mon, "Audiodev '%s' not found\n", audiodev);
+        return;
+    }
+
+    s = g_malloc0 (sizeof (*s));
+
+    if (wav_start_capture(as, s, path, freq, bits, nchannels)) {
+        monitor_printf(mon, "Failed to add wave capture\n");
+        g_free (s);
+        return;
+    }
+    QLIST_INSERT_HEAD (&capture_head, s, entries);
+}
diff --git a/monitor/misc.c b/monitor/misc.c
index 6fc8bfef13..80d5527774 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -30,7 +30,6 @@
 #include "net/slirp.h"
 #include "ui/qemu-spice.h"
 #include "qemu/ctype.h"
-#include "audio/audio.h"
 #include "disas/disas.h"
 #include "qemu/log.h"
 #include "sysemu/hw_accel.h"
@@ -892,61 +891,6 @@ static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
     mtree_info(flatview, dispatch_tree, owner, disabled);
 }
 
-/* Capture support */
-static QLIST_HEAD (capture_list_head, CaptureState) capture_head;
-
-static void hmp_info_capture(Monitor *mon, const QDict *qdict)
-{
-    int i;
-    CaptureState *s;
-
-    for (s = capture_head.lh_first, i = 0; s; s = s->entries.le_next, ++i) {
-        monitor_printf(mon, "[%d]: ", i);
-        s->ops.info (s->opaque);
-    }
-}
-
-static void hmp_stopcapture(Monitor *mon, const QDict *qdict)
-{
-    int i;
-    int n = qdict_get_int(qdict, "n");
-    CaptureState *s;
-
-    for (s = capture_head.lh_first, i = 0; s; s = s->entries.le_next, ++i) {
-        if (i == n) {
-            s->ops.destroy (s->opaque);
-            QLIST_REMOVE (s, entries);
-            g_free (s);
-            return;
-        }
-    }
-}
-
-static void hmp_wavcapture(Monitor *mon, const QDict *qdict)
-{
-    const char *path = qdict_get_str(qdict, "path");
-    int freq = qdict_get_try_int(qdict, "freq", 44100);
-    int bits = qdict_get_try_int(qdict, "bits", 16);
-    int nchannels = qdict_get_try_int(qdict, "nchannels", 2);
-    const char *audiodev = qdict_get_str(qdict, "audiodev");
-    CaptureState *s;
-    AudioState *as = audio_state_by_name(audiodev);
-
-    if (!as) {
-        monitor_printf(mon, "Audiodev '%s' not found\n", audiodev);
-        return;
-    }
-
-    s = g_malloc0 (sizeof (*s));
-
-    if (wav_start_capture(as, s, path, freq, bits, nchannels)) {
-        monitor_printf(mon, "Failed to add wave capture\n");
-        g_free (s);
-        return;
-    }
-    QLIST_INSERT_HEAD (&capture_head, s, entries);
-}
-
 void qmp_getfd(const char *fdname, Error **errp)
 {
     Monitor *cur_mon = monitor_cur();
diff --git a/audio/meson.build b/audio/meson.build
index 34aed78342..0722224ba9 100644
--- a/audio/meson.build
+++ b/audio/meson.build
@@ -1,5 +1,6 @@
 softmmu_ss.add([spice_headers, files('audio.c')])
 softmmu_ss.add(files(
+  'audio-hmp-cmds.c',
   'audio_legacy.c',
   'mixeng.c',
   'noaudio.c',
-- 
2.39.0


