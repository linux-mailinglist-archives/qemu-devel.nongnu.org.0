Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C356AFBD3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:12:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiKw-0000kv-8Z; Tue, 07 Mar 2023 20:11:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKu-0000gF-DJ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKr-0001WY-N5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P5BqJTeJKUER7ahJjWEDggh8lRcUNxJHYwuJFTh5R+Q=;
 b=VYQGh7qYJD18o/Ms+PidMIHZnFUqb4l9f5FluMmFkVeZNxbBfk2x5g/Ikqda/d0ejiKdLY
 FBfHRlmtkVXuTu7aypsWjG+4Fj5c79Nwbg4AA6Zb6ru9NYEyCgKGBwhQ6pZIHKjlb1yreP
 U22Q2DtDBj6a2h1aLar5CT/EW5Lp04E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-L0vJktE6Puq9m1KOszgYKw-1; Tue, 07 Mar 2023 20:11:15 -0500
X-MC-Unique: L0vJktE6Puq9m1KOszgYKw-1
Received: by mail-wm1-f71.google.com with SMTP id
 f26-20020a7bcd1a000000b003e71cde0e70so708523wmj.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237874;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P5BqJTeJKUER7ahJjWEDggh8lRcUNxJHYwuJFTh5R+Q=;
 b=h5DcCUTAyapRwOAMq7MBeHBEsv1bIsdriJmBLk83wmJeleWlUe/88C38jyEuGrALjv
 u1O4J/StROwlWaszclH3BSGIj6c3M+QfzEpnRzsQUaOmlteYdh6oFJFYtNEHR1NpyfB3
 ntMiIoe3NxO6+9s9rzimeuRbS7BEHEMkkIb2DkNgK0auzygwNCuEAEFA+BLOw27ttikQ
 DfrmGwvpDsDzk+UCCY1Q0lOfJYi0JKgMC/1zidPJE+YWH1z3BP0J91Lf/SofBIUNwkSO
 JeIP0+6bviJ3RbknUZkWZo7/6s+SLnqbIDSvbOPULb4IcviDYT6gJuBjTIGgSiCYbyeq
 9IZg==
X-Gm-Message-State: AO0yUKV5kF7dHdLrLtaAqfR4OP+RK7YJmj7HYiCGYceT7dOKSdlF8mux
 T+3y7mU9OEYf40ARUStQ9zpsPrxJ0yph15PeCmaxkN+il/JFNk7DTUx8S51Bnxd/K3/aiIU8C+L
 CUlHAjyKpOhIL8wNRpTfGLnhcY69aLb1mA6v3htez450F6nIKlVX+LjqJJEAiUqFlmPgZ
X-Received: by 2002:a05:600c:3d14:b0:3df:9858:c033 with SMTP id
 bh20-20020a05600c3d1400b003df9858c033mr14770552wmb.8.1678237874127; 
 Tue, 07 Mar 2023 17:11:14 -0800 (PST)
X-Google-Smtp-Source: AK7set/ywsABS8IvTRq/VrJOl6GLTDSJFl5hKmjrFuAA/RBL+JAn0pN/1B25xeGWuVslu74TFtO5iQ==
X-Received: by 2002:a05:600c:3d14:b0:3df:9858:c033 with SMTP id
 bh20-20020a05600c3d1400b003df9858c033mr14770539wmb.8.1678237873811; 
 Tue, 07 Mar 2023 17:11:13 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 s8-20020a7bc388000000b003eb2e685c7dsm18099364wmj.9.2023.03.07.17.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:13 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PULL 07/73] hmp: add cryptodev info command
Message-ID: <ef52091aebb9860d9a454a792a9fbd66acdc63c8.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: zhenwei pi <pizhenwei@bytedance.com>

Example of this command:
 # virsh qemu-monitor-command vm --hmp info cryptodev
cryptodev1: service=[akcipher|mac|hash|cipher]
    queue 0: type=builtin
cryptodev0: service=[akcipher]
    queue 0: type=lkcf

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20230301105847.253084-8-pizhenwei@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/monitor/hmp.h         |  1 +
 backends/cryptodev-hmp-cmds.c | 54 +++++++++++++++++++++++++++++++++++
 backends/meson.build          |  1 +
 hmp-commands-info.hx          | 14 +++++++++
 4 files changed, 70 insertions(+)
 create mode 100644 backends/cryptodev-hmp-cmds.c

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index efae6b06bc..fdb69b7f9c 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -180,5 +180,6 @@ void hmp_ioport_read(Monitor *mon, const QDict *qdict);
 void hmp_ioport_write(Monitor *mon, const QDict *qdict);
 void hmp_boot_set(Monitor *mon, const QDict *qdict);
 void hmp_info_mtree(Monitor *mon, const QDict *qdict);
+void hmp_info_cryptodev(Monitor *mon, const QDict *qdict);
 
 #endif
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
-- 
MST


