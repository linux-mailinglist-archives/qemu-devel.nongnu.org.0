Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C0242A2E7
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:14:09 +0200 (CEST)
Received: from localhost ([::1]:50888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFjU-0008Oa-9K
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1maFSR-0003A9-NX
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:56:32 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:38589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1maFSO-0003xB-F7
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:56:31 -0400
Received: by mail-lf1-x12e.google.com with SMTP id x27so86254912lfu.5
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 03:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2rOAinE0BNop+OBOUb1GJ2NIo3qa6aePfog4NtPiGQI=;
 b=o4i8N+Ssinp4RIytI1NWBmZcp/eUUSao74gLgtLjt/15cdTE6I7XdqMIdOhUIEnppe
 Gvb0q5cOUC0D5pC5i3EHyKk19ULl0MjjDiJAA7C05IJzOMJGHgOtjR1Ymqetk2O9d0UK
 WnaXf4Dt5R4liTA4Ms4KpbDw0ITmxd8kEdYQmnBm2vgEKjeX+dovub23N/xaAEA/dUhk
 Mn1pHplJYlKUmIjnZD7UUKonX3KiK/i6XolQO1r61+G7lQcH/kuGnKz4ceKBWeH3OxTr
 KPvpA4qUUue2oIiDMiCDt1Oq8wvGQ4vDSI2yX85m+sqJyrj2GMVEXNmdmB02gGMaatWK
 TRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2rOAinE0BNop+OBOUb1GJ2NIo3qa6aePfog4NtPiGQI=;
 b=57xuw1sdMzL5039yugv/7fwaoedxW9ADY2yn1revzkCLbWDl7Rs/DMO8tV3UOnYG8b
 Ov0jcNooj3bkmYd+cbRxdPrUzCsgy7qXJ80QGJqJfJFElzH3noO891QJEoaoby0+mko1
 /QODArER6Kf1OK+F6kzWcLLt1E7m4hGzMom3X5SuT3z9Sd1AoyucN3b/nWWZAHtobD35
 2fn0F2Fow2JXvQkTw9E2Y3KJdHUypoOQS3FRAFhdUr4KqhlMgb1qJDl+q8akqITFWdsM
 EINVS1i4nKD8Y4BqQ7JRlPg8WhQh4dbJlArcqu2aXJ1yCWo0T4eSMzU39nyGoqscu6gX
 8umA==
X-Gm-Message-State: AOAM531hHo3otZqEJoXdwEo7DphR2VwiH+E0KzwV6XS5TXCFXLFOhxLZ
 oXvrnQ8936HG3qcaNofSWHKzKBX0XfJq6p1Y
X-Google-Smtp-Source: ABdhPJyL6HyLH09T9kOeTgp46P/ztptWmZ+w+l/4w56rKGmVgCFtzfpx2njLf16QYMOE5ey1JMi12A==
X-Received: by 2002:a19:6742:: with SMTP id e2mr3475182lfj.568.1634036186505; 
 Tue, 12 Oct 2021 03:56:26 -0700 (PDT)
Received: from localhost.localdomain ([77.234.205.3])
 by smtp.gmail.com with ESMTPSA id p16sm995361lfe.166.2021.10.12.03.56.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Oct 2021 03:56:26 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] net/vmnet: create common netdev state structure
Date: Tue, 12 Oct 2021 13:55:54 +0300
Message-Id: <20211012105558.21530-3-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211012105558.21530-1-yaroshchuk2000@gmail.com>
References: <20211012105558.21530-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: jasowang@redhat.com, eblake@redhat.com, r.bolshakov@yadro.com,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 net/meson.build     |  8 +++++++-
 net/vmnet-bridged.m | 25 +++++++++++++++++++++++++
 net/vmnet-common.m  | 20 ++++++++++++++++++++
 net/vmnet-host.c    | 24 ++++++++++++++++++++++++
 net/vmnet-shared.c  | 25 +++++++++++++++++++++++++
 net/vmnet.c         | 34 ----------------------------------
 net/vmnet_int.h     | 25 +++++++++++++++++++++++++
 7 files changed, 126 insertions(+), 35 deletions(-)
 create mode 100644 net/vmnet-bridged.m
 create mode 100644 net/vmnet-common.m
 create mode 100644 net/vmnet-host.c
 create mode 100644 net/vmnet-shared.c
 delete mode 100644 net/vmnet.c
 create mode 100644 net/vmnet_int.h

diff --git a/net/meson.build b/net/meson.build
index 196cf321a2..495419e964 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -38,5 +38,11 @@ softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files(tap_posix))
 softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('tap-win32.c'))
 softmmu_ss.add(when: 'CONFIG_VHOST_NET_VDPA', if_true: files('vhost-vdpa.c'))
 
-softmmu_ss.add(when: ['CONFIG_VMNET', vmnet], if_true: files('vmnet.c'))
+vmnet_files = files(
+  'vmnet-common.m',
+  'vmnet-bridged.m',
+  'vmnet-host.c',
+  'vmnet-shared.c'
+)
+softmmu_ss.add(when: ['CONFIG_VMNET', vmnet], if_true: vmnet_files)
 subdir('can')
diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
new file mode 100644
index 0000000000..4e42a90391
--- /dev/null
+++ b/net/vmnet-bridged.m
@@ -0,0 +1,25 @@
+/*
+ * vmnet-bridged.m
+ *
+ * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-types-net.h"
+#include "vmnet_int.h"
+#include "clients.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+
+#include <vmnet/vmnet.h>
+
+int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
+                           NetClientState *peer, Error **errp)
+{
+  error_setg(errp, "vmnet-bridged is not implemented yet");
+  return -1;
+}
diff --git a/net/vmnet-common.m b/net/vmnet-common.m
new file mode 100644
index 0000000000..532d152840
--- /dev/null
+++ b/net/vmnet-common.m
@@ -0,0 +1,20 @@
+/*
+ * vmnet-common.m - network client wrapper for Apple vmnet.framework
+ *
+ * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
+ * Copyright(c) 2021 Phillip Tennen <phillip@axleos.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-types-net.h"
+#include "vmnet_int.h"
+#include "clients.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+
+#include <vmnet/vmnet.h>
+
diff --git a/net/vmnet-host.c b/net/vmnet-host.c
new file mode 100644
index 0000000000..4a5ef99dc7
--- /dev/null
+++ b/net/vmnet-host.c
@@ -0,0 +1,24 @@
+/*
+ * vmnet-host.c
+ *
+ * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-types-net.h"
+#include "vmnet_int.h"
+#include "clients.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+
+#include <vmnet/vmnet.h>
+
+int net_init_vmnet_host(const Netdev *netdev, const char *name,
+                        NetClientState *peer, Error **errp) {
+  error_setg(errp, "vmnet-host is not implemented yet");
+  return -1;
+}
diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
new file mode 100644
index 0000000000..f8c4a4f3b8
--- /dev/null
+++ b/net/vmnet-shared.c
@@ -0,0 +1,25 @@
+/*
+ * vmnet-shared.c
+ *
+ * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-types-net.h"
+#include "vmnet_int.h"
+#include "clients.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+
+#include <vmnet/vmnet.h>
+
+int net_init_vmnet_shared(const Netdev *netdev, const char *name,
+                          NetClientState *peer, Error **errp)
+{
+  error_setg(errp, "vmnet-shared is not implemented yet");
+  return -1;
+}
diff --git a/net/vmnet.c b/net/vmnet.c
deleted file mode 100644
index 3f25afd7e8..0000000000
--- a/net/vmnet.c
+++ /dev/null
@@ -1,34 +0,0 @@
-/*
- * vmnet.c - network client wrapper for Apple vmnet.framework
- *
- * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#include "qemu/osdep.h"
-#include "clients.h"
-#include "qemu/error-report.h"
-#include "qapi/error.h"
-
-#include <vmnet/vmnet.h>
-
-int net_init_vmnet_host(const Netdev *netdev, const char *name,
-                    NetClientState *peer, Error **errp) {
-  error_setg(errp, "vmnet is not implemented yet");
-  return -1;
-}
-
-int net_init_vmnet_shared(const Netdev *netdev, const char *name,
-                    NetClientState *peer, Error **errp) {
-  error_setg(errp, "vmnet is not implemented yet");
-  return -1;
-}
-
-int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
-                    NetClientState *peer, Error **errp) {
-  error_setg(errp, "vmnet is not implemented yet");
-  return -1;
-}
diff --git a/net/vmnet_int.h b/net/vmnet_int.h
new file mode 100644
index 0000000000..c5982259a4
--- /dev/null
+++ b/net/vmnet_int.h
@@ -0,0 +1,25 @@
+/*
+ * vmnet_int.h
+ *
+ * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+#ifndef VMNET_INT_H
+#define VMNET_INT_H
+
+#include "qemu/osdep.h"
+#include "vmnet_int.h"
+#include "clients.h"
+
+#include <vmnet/vmnet.h>
+
+typedef struct VmnetCommonState {
+  NetClientState nc;
+
+} VmnetCommonState;
+
+
+#endif /* VMNET_INT_H */
-- 
2.23.0


