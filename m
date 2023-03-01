Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDD96A65CC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:53:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCZX-0007t5-RU; Tue, 28 Feb 2023 21:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZR-0007jm-Fu
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:51:58 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZP-0001ff-PS
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:51:57 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so15818220pjh.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677639115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hW0/TnVbaKXVVnYFWE4r3/RgtfUxjdrwB+uyh9EgFgI=;
 b=E8H3miMVEdcYhb3G8BNVEUvhRUwP/DR6jrPUidud8osfIBKnKeTmI688nhcpbEReRV
 tx3717YB7hSD+fgLr2zeGpYvlOe2i9ZzyrCGryU6RRDaYpUbKjRbUs095OSzGYTBUxbw
 oBWOwJc1Eij/qWN/dprzrwH5ikE3WhZqhcrljxFIJzUJxn614t2IxtyrdKCVdsZ1qYtR
 XPq0eceQv3J0swnHcZ3C+nBLqI4OZnVELoLQngwIM5/RnXe3wKJ02tMpGlGwkcOjyd3X
 Tjdg/Yzdc40UuT3z+1jDLmnjmg3a0c/XnvQTRuZsO1rQwvHMJP3CAkqWOGf05iCKtUnJ
 DhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677639115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hW0/TnVbaKXVVnYFWE4r3/RgtfUxjdrwB+uyh9EgFgI=;
 b=yTVhG8ZMNnSQxQbqmJrKWElM+sM9EItddhj/ACi0ppQ02LJDbb8C4J8755IRzDz8lD
 QL+iSbB5Cj0/pWv0u4nhhQOfH7+pa3Snhmf7gi3E5EpbOqMIvvQOCs+lQNL8fv21ecZ/
 atu8QR5N+t5qSfoMqFhnjLguWZYxn12fta0m/QrKDWYSEQTQ7t4mlsjbGQjR9dbem7OV
 jqYOlfAh3x7/OFlp/CTYd3FjO7Pp2b6v2kWmRcgQqC+dEMbp7xbtoQsfy8RI4xLSBLFL
 e1330hmibb+wYQcgZcYQhYXyGIDAv1NzSXX4gfJ3DehsuB76IXh/rkBPegTGeeqZYivA
 KgVg==
X-Gm-Message-State: AO0yUKUB/2cdOocWLq6EYwF+mmqePDdhjtpYxkSrIy3zsAgf7PgsKcJh
 MU2rlGgs1Uj4pamwkRrQ+sVVtgT246RmG1uw
X-Google-Smtp-Source: AK7set9F1O4p36QLhTELHV14u1Z4YzNJYUC3q6Cx8eSHZppf3sfxWYtaRUWCPbznOvD0AZgQHl+X3A==
X-Received: by 2002:a17:902:f545:b0:19a:8304:21eb with SMTP id
 h5-20020a170902f54500b0019a830421ebmr16097479plf.6.1677639114690; 
 Tue, 28 Feb 2023 18:51:54 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 ix1-20020a170902f80100b0019ab58f47a6sm7218743plb.105.2023.02.28.18.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:51:54 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v5 07/12] hmp: add cryptodev info command
Date: Wed,  1 Mar 2023 10:51:19 +0800
Message-Id: <20230301025124.3605557-8-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025124.3605557-1-pizhenwei@bytedance.com>
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Example of this command:
 # virsh qemu-monitor-command vm --hmp info cryptodev
cryptodev1: service=[akcipher|mac|hash|cipher]
    queue 0: type=builtin
cryptodev0: service=[akcipher]
    queue 0: type=lkcf

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 backends/cryptodev-hmp-cmds.c | 54 +++++++++++++++++++++++++++++++++++
 backends/meson.build          |  1 +
 hmp-commands-info.hx          | 14 +++++++++
 include/monitor/hmp.h         |  1 +
 4 files changed, 70 insertions(+)
 create mode 100644 backends/cryptodev-hmp-cmds.c

diff --git a/backends/cryptodev-hmp-cmds.c b/backends/cryptodev-hmp-cmds.c
new file mode 100644
index 0000000000..4f7220bb13
--- /dev/null
+++ b/backends/cryptodev-hmp-cmds.c
@@ -0,0 +1,54 @@
+/*
+ * HMP commands related to cryptodev
+ *
+ * Copyright (c) 2023 Bytedance.Inc
+ *
+ * Authors:
+ *    zhenwei pi<pizhenwei@bytedance.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "monitor/hmp.h"
+#include "monitor/monitor.h"
+#include "qapi/qapi-commands-cryptodev.h"
+#include "qapi/qmp/qdict.h"
+
+
+void hmp_info_cryptodev(Monitor *mon, const QDict *qdict)
+{
+    QCryptodevInfoList *il;
+    QCryptodevBackendServiceTypeList *sl;
+    QCryptodevBackendClientList *cl;
+
+    for (il = qmp_query_cryptodev(NULL); il; il = il->next) {
+        g_autofree char *services = NULL;
+        QCryptodevInfo *info = il->value;
+        char *tmp_services;
+
+        /* build a string like 'service=[akcipher|mac|hash|cipher]' */
+        for (sl = info->service; sl; sl = sl->next) {
+            const char *service = QCryptodevBackendServiceType_str(sl->value);
+
+            if (!services) {
+                services = g_strdup(service);
+            } else {
+                tmp_services = g_strjoin("|", services, service, NULL);
+                g_free(services);
+                services = tmp_services;
+            }
+        }
+        monitor_printf(mon, "%s: service=[%s]\n", info->id, services);
+
+        for (cl = info->client; cl; cl = cl->next) {
+            QCryptodevBackendClient *client = cl->value;
+            monitor_printf(mon, "    queue %" PRIu32 ": type=%s\n",
+                           client->queue,
+                           QCryptodevBackendType_str(client->type));
+        }
+    }
+
+    qapi_free_QCryptodevInfoList(il);
+}
diff --git a/backends/meson.build b/backends/meson.build
index 954e658b25..b369e0a9d0 100644
--- a/backends/meson.build
+++ b/backends/meson.build
@@ -1,5 +1,6 @@
 softmmu_ss.add([files(
   'cryptodev-builtin.c',
+  'cryptodev-hmp-cmds.c',
   'cryptodev.c',
   'hostmem-ram.c',
   'hostmem.c',
diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 754b1e8408..47d63d26db 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -993,3 +993,17 @@ SRST
   ``info virtio-queue-element`` *path* *queue* [*index*]
     Display element of a given virtio queue
 ERST
+
+    {
+        .name       = "cryptodev",
+        .args_type  = "",
+        .params     = "",
+        .help       = "show the crypto devices",
+        .cmd        = hmp_info_cryptodev,
+        .flags      = "p",
+    },
+
+SRST
+  ``info cryptodev``
+    Show the crypto devices.
+ERST
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 2220f14fc9..e6cf0b7aa7 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -178,5 +178,6 @@ void hmp_ioport_read(Monitor *mon, const QDict *qdict);
 void hmp_ioport_write(Monitor *mon, const QDict *qdict);
 void hmp_boot_set(Monitor *mon, const QDict *qdict);
 void hmp_info_mtree(Monitor *mon, const QDict *qdict);
+void hmp_info_cryptodev(Monitor *mon, const QDict *qdict);
 
 #endif
-- 
2.34.1


