Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841623AB611
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 16:36:14 +0200 (CEST)
Received: from localhost ([::1]:43976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltt7t-0006zr-IA
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 10:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ltt5b-0004EP-2r
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:33:57 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:46715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ltt5N-0001M9-Ns
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:33:48 -0400
Received: by mail-lf1-x12a.google.com with SMTP id m21so10854807lfg.13
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gtLaycDdICWu7/AUl/hrECYbXp2281mwsRjGskQkFgo=;
 b=EDT1z7VDjG1mtcN21APMIEtUlE4rc6QzzDRZT6Tbuf0nOUvtVh4PnB78JkvpYY8m3y
 If/Fy6fmgy82fpPjo7CXlb/cAG3T90qpR0FPJzjR7T2/TM1G9Y+2qmCg320JQcpsW9IU
 jxADR8knbHn750vHY/xjRQtgHyYKrFuGUrQ8yFWxWg1Woe44XTVoeOOiGAlSEodxIXFq
 9C7cDuYUcUDAc+vBj5IpagRKD3PwSYsf96NuhEGr0qknyu/2QeyDntT4qEaf5t0V1g/6
 lkuPOyCHgmYXqWrHCUjaGHbK5uzM/hqVg89WI6dFSEaRp00wBBrnucFFWiPXgfa5bs0m
 5bMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gtLaycDdICWu7/AUl/hrECYbXp2281mwsRjGskQkFgo=;
 b=MbvoIoP+hP0qW0z1p6aKcrn+6M/xsQjdtcuvqVsvnlKfFwRB7vdG7NYfH7JXISb6mg
 GOz/MuDOUXG17tRcuTAHweg3F1SVRXo7FZLKXsJoi1KZr08nXkk87e1iOp2rODim0zZD
 4i5fohbRDP1WQ7gcifZZnlrhBbZPg1jmtUEiBHCIlV6ejQxb6kpYCHtx9/KHlonCb80C
 RBItAVsqUJqhOHZpeUtbFJeTuJIkOqT6nkm4Y+9SI0SuEBNYAS+OctKaB6kXH36A/ied
 PwuxarjgIX7c1H4rrS5uLlGtUo8a3SDZu0meClxGiroyTCREDA03sw3nQSJ01n9Bpo7G
 cdRg==
X-Gm-Message-State: AOAM533fkUAjhbgZ46iSyX5ShQSTmevX8wyxbmlW7c9CMQGoWwS1yXRJ
 05OH5nqadiLpCkd7mOWVJlZneG1KqueystCc
X-Google-Smtp-Source: ABdhPJzy5G2eUmPYqT84L69z3PAgeoEZ/7BDbAbSPfxqRaFO54sKn7foTwCia61ecYxGW8Bl0vt9Xw==
X-Received: by 2002:ac2:4a83:: with SMTP id l3mr4171548lfp.406.1623940415848; 
 Thu, 17 Jun 2021 07:33:35 -0700 (PDT)
Received: from localhost.localdomain ([5.18.249.207])
 by smtp.gmail.com with ESMTPSA id d9sm597406lfv.47.2021.06.17.07.33.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Jun 2021 07:33:35 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] net/vmnet: create common netdev state structure
Date: Thu, 17 Jun 2021 17:32:42 +0300
Message-Id: <20210617143246.55336-4-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
References: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: jasowang@redhat.com, r.bolshakov@yadro.com,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 net/meson.build     |  8 +++++++-
 net/vmnet-bridged.c | 25 +++++++++++++++++++++++++
 net/vmnet-common.c  | 20 ++++++++++++++++++++
 net/vmnet-host.c    | 24 ++++++++++++++++++++++++
 net/vmnet-shared.c  | 25 +++++++++++++++++++++++++
 net/vmnet.c         | 34 ----------------------------------
 net/vmnet_int.h     | 25 +++++++++++++++++++++++++
 7 files changed, 126 insertions(+), 35 deletions(-)
 create mode 100644 net/vmnet-bridged.c
 create mode 100644 net/vmnet-common.c
 create mode 100644 net/vmnet-host.c
 create mode 100644 net/vmnet-shared.c
 delete mode 100644 net/vmnet.c
 create mode 100644 net/vmnet_int.h

diff --git a/net/meson.build b/net/meson.build
index 196cf321a2..82eed63c8f 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -38,5 +38,11 @@ softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files(tap_posix))
 softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('tap-win32.c'))
 softmmu_ss.add(when: 'CONFIG_VHOST_NET_VDPA', if_true: files('vhost-vdpa.c'))
 
-softmmu_ss.add(when: ['CONFIG_VMNET', vmnet], if_true: files('vmnet.c'))
+vmnet_files = files(
+  'vmnet-common.c',
+  'vmnet-bridged.c',
+  'vmnet-host.c',
+  'vmnet-shared.c'
+)
+softmmu_ss.add(when: ['CONFIG_VMNET', vmnet], if_true: vmnet_files)
 subdir('can')
diff --git a/net/vmnet-bridged.c b/net/vmnet-bridged.c
new file mode 100644
index 0000000000..9226c42353
--- /dev/null
+++ b/net/vmnet-bridged.c
@@ -0,0 +1,25 @@
+/*
+ * vmnet-bridged.c
+ *
+ * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi-types-net.h"
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
diff --git a/net/vmnet-common.c b/net/vmnet-common.c
new file mode 100644
index 0000000000..8ba31dc7b2
--- /dev/null
+++ b/net/vmnet-common.c
@@ -0,0 +1,20 @@
+/*
+ * vmnet.c - network client wrapper for Apple vmnet.framework
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
+#include "qapi-types-net.h"
+#include "vmnet_int.h"
+#include "clients.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+
+#include <vmnet/vmnet.h>
+
diff --git a/net/vmnet-host.c b/net/vmnet-host.c
new file mode 100644
index 0000000000..1d3484b51e
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
+#include "qapi-types-net.h"
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
index 0000000000..177b5a48ec
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
+#include "qapi-types-net.h"
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


