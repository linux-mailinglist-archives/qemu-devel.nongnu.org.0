Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E608F3FCDB3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 21:32:45 +0200 (CEST)
Received: from localhost ([::1]:43454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL9Uy-00054f-W1
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 15:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mL9QT-00088G-7E
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:28:05 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:45647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mL9QQ-0001kM-Se
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:28:04 -0400
Received: by mail-lf1-x129.google.com with SMTP id g13so1061677lfj.12
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 12:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gtLaycDdICWu7/AUl/hrECYbXp2281mwsRjGskQkFgo=;
 b=iiES62mPHkI/ukIN8FpG55LZ07UU4B+nuus6k0/HNXt5OOAcibWnrzAXys3ObcKUiz
 O9cW5UETq/9qAyxtued6JFTh+qP46vuOzD5WRwg4Y1TLY3tMMBhbWAP0PXtY//2stBlo
 GJXFr018h4wpmpxpxMrI5JCbwGCiUHeKLYUqQlwt4m+joXS/bF2kaG3YSRtM8YSrXkvU
 lpURVM8/bjSLMBCzxhTPD97xoxB6OVjWx0I30ihBEX+NNp36l49ZVggRxf7gMaTpOXtW
 Vpk9Qq09U4VSgkoL4StRqMGoNzaUKtvLl2V8x1taeCYM3bLAmXLq/Pm+4XV91pcCT1q3
 xTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gtLaycDdICWu7/AUl/hrECYbXp2281mwsRjGskQkFgo=;
 b=OfGKX3OPuWeOZRt4j6R6pp3d+1dMXL5oJFaSj7EmNwhlGoY7YjPRuIumrRMMPayfcJ
 rzZgpfs00fNhgCy4zghq+nMiXFbEi/l21fj+xXe7yl7zYbEo1DcBkT4c3s3WUDuNcbSG
 Q/YIF3CLWifrebdOd4YUlIlYJiI4GvZ6Y87dSmZyLQbZSUb/yi4X6ciGMEElyN/2wti8
 SvJoSq8P3hmJiRsW1AVOvdjttqvoiIInzGURG5ONcDFoCp1SAqYZ0tKncXG+FhhvoF1g
 Upq3j3naoGwagABMRgDE9b/SNkBX+9Ni1tB6ViGJbbn1cghssgDWULSCoc4VuTGK5Imh
 v5+Q==
X-Gm-Message-State: AOAM533JfU2oc6+lq/WFsaasR3FVHYiBMrzl7MJxhQm6HMulUOL9UI4H
 lH8DH0/knzqcbNVsyaPikz991am2ZJmGAg==
X-Google-Smtp-Source: ABdhPJy6iYK8zWUFr2JY8USJXp4Ac3koNey2fnAUoXshv0qc5R9hIvmG5NkRWLpbtM5RiVMJMlKgfw==
X-Received: by 2002:a05:6512:114a:: with SMTP id
 m10mr4472487lfg.268.1630438081054; 
 Tue, 31 Aug 2021 12:28:01 -0700 (PDT)
Received: from UNIT-808.lan ([217.12.73.131])
 by smtp.gmail.com with ESMTPSA id u13sm1254791lfq.254.2021.08.31.12.28.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Aug 2021 12:28:00 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] net/vmnet: create common netdev state structure
Date: Tue, 31 Aug 2021 22:27:16 +0300
Message-Id: <20210831192720.33406-3-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210831192720.33406-1-yaroshchuk2000@gmail.com>
References: <20210831192720.33406-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x129.google.com
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


