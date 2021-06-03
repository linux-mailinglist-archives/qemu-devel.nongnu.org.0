Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893B639A57F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:13:10 +0200 (CEST)
Received: from localhost ([::1]:60068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopy1-0001ov-HC
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkv-00016l-Tw
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:37 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopks-0007AW-Gq
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:37 -0400
Received: by mail-wr1-x429.google.com with SMTP id i94so1346781wri.4
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=grpJYafjNW+ukFyoPqAiBJXGevYi02tanX+BC8ln2iM=;
 b=FOOB2ILcray/Zxz9fQPHfQ+w7kGTC8USftSK6RO58oTgZjLhIr8s67H8gp7PhfEhX3
 OIQLdRkK9KseK6RzIRwTEIzlkpRitjlzH5tMuQafUofD3JFeV3LjlD/3etMzl2eoEHY6
 CS88ENvMkOvQllS+heCNS+heY0nG4pxzZ6zpg7uQaj7Yy9fgrBlgUO4VTeZDAL2L9mGQ
 m1u6ENXXUNTgUKQxm4TtD/Urq2PuilgAn50TEL8rx/Sdv9q+7V1vgZ05eXiIvvn7DhoZ
 6wPwKFc9H1KQWva8s1KxvOn4zKnew6hCHn0A7i9OB5++ZaMRvz5NwUMM/aaDAAFInXfG
 iBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=grpJYafjNW+ukFyoPqAiBJXGevYi02tanX+BC8ln2iM=;
 b=U4P20jQAwpoTtvfb6riuyIgyQFyKmuLF86JBbBAT8dAKhfuKpw2hbH4d8ETUqfP3Hb
 yJ1EDALyB8wN2I158SZ/XyanHe7NSE850KlgtJZi8QnbYlR6rhGTf9t+BUbHay28jD9V
 DNR1dVwUNdbUemoBWZXnAisPDkMlbrYsP/GDBPIMocbZ4dBgwzQix/cpaK/DTcRciaKf
 aMQN3KxZpzm8yvbgdgpBWdYmUwoe9zGMev3/sp92nRx6m7OfzsX06GubqFai9hJ/mU9q
 R0D/PzBGUYRENqvVy79aaFFjPwwtZWmKUax6FAzSE3RHodjy6OUcW8ABNYCxf/ct4yNU
 Wj3w==
X-Gm-Message-State: AOAM532n4nrW3aBinD2ePGuCOrXMv93O1sB2b1pVOg3zfnldUzvgPq/H
 +Yb20b0VWBfxNGXkcBs907L3AYYU66ks21Gd
X-Google-Smtp-Source: ABdhPJxyxgDXHONcJmI7CYldjJxl70eEQFLsgk5SaambYLYSpev4luMp7mDQJifFv9JjE524Oq5GMQ==
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr645972wrs.418.1622735973292; 
 Thu, 03 Jun 2021 08:59:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/45] hvf: Move assert_hvf_ok() into common directory
Date: Thu,  3 Jun 2021 16:58:47 +0100
Message-Id: <20210603155904.26021-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

Until now, Hypervisor.framework has only been available on x86_64 systems.
With Apple Silicon shipping now, it extends its reach to aarch64. To
prepare for support for multiple architectures, let's start moving common
code out into its own accel directory.

This patch moves assert_hvf_ok() and introduces generic build infrastructure.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20210519202253.76782-2-agraf@csgraf.de
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/sysemu/hvf_int.h | 18 +++++++++++++++
 accel/hvf/hvf-all.c      | 47 ++++++++++++++++++++++++++++++++++++++++
 target/i386/hvf/hvf.c    | 33 +---------------------------
 MAINTAINERS              |  8 +++++++
 accel/hvf/meson.build    |  6 +++++
 accel/meson.build        |  1 +
 6 files changed, 81 insertions(+), 32 deletions(-)
 create mode 100644 include/sysemu/hvf_int.h
 create mode 100644 accel/hvf/hvf-all.c
 create mode 100644 accel/hvf/meson.build

diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
new file mode 100644
index 00000000000..3deb4cfacc4
--- /dev/null
+++ b/include/sysemu/hvf_int.h
@@ -0,0 +1,18 @@
+/*
+ * QEMU Hypervisor.framework (HVF) support
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+/* header to be included in HVF-specific code */
+
+#ifndef HVF_INT_H
+#define HVF_INT_H
+
+#include <Hypervisor/hv.h>
+
+void assert_hvf_ok(hv_return_t ret);
+
+#endif
diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
new file mode 100644
index 00000000000..f185b0830a7
--- /dev/null
+++ b/accel/hvf/hvf-all.c
@@ -0,0 +1,47 @@
+/*
+ * QEMU Hypervisor.framework support
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/error-report.h"
+#include "sysemu/hvf.h"
+#include "sysemu/hvf_int.h"
+
+void assert_hvf_ok(hv_return_t ret)
+{
+    if (ret == HV_SUCCESS) {
+        return;
+    }
+
+    switch (ret) {
+    case HV_ERROR:
+        error_report("Error: HV_ERROR");
+        break;
+    case HV_BUSY:
+        error_report("Error: HV_BUSY");
+        break;
+    case HV_BAD_ARGUMENT:
+        error_report("Error: HV_BAD_ARGUMENT");
+        break;
+    case HV_NO_RESOURCES:
+        error_report("Error: HV_NO_RESOURCES");
+        break;
+    case HV_NO_DEVICE:
+        error_report("Error: HV_NO_DEVICE");
+        break;
+    case HV_UNSUPPORTED:
+        error_report("Error: HV_UNSUPPORTED");
+        break;
+    default:
+        error_report("Unknown Error");
+    }
+
+    abort();
+}
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index f044181d061..32f42f15924 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -51,6 +51,7 @@
 #include "qemu/error-report.h"
 
 #include "sysemu/hvf.h"
+#include "sysemu/hvf_int.h"
 #include "sysemu/runstate.h"
 #include "hvf-i386.h"
 #include "vmcs.h"
@@ -76,38 +77,6 @@
 
 HVFState *hvf_state;
 
-static void assert_hvf_ok(hv_return_t ret)
-{
-    if (ret == HV_SUCCESS) {
-        return;
-    }
-
-    switch (ret) {
-    case HV_ERROR:
-        error_report("Error: HV_ERROR");
-        break;
-    case HV_BUSY:
-        error_report("Error: HV_BUSY");
-        break;
-    case HV_BAD_ARGUMENT:
-        error_report("Error: HV_BAD_ARGUMENT");
-        break;
-    case HV_NO_RESOURCES:
-        error_report("Error: HV_NO_RESOURCES");
-        break;
-    case HV_NO_DEVICE:
-        error_report("Error: HV_NO_DEVICE");
-        break;
-    case HV_UNSUPPORTED:
-        error_report("Error: HV_UNSUPPORTED");
-        break;
-    default:
-        error_report("Unknown Error");
-    }
-
-    abort();
-}
-
 /* Memory slots */
 hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
 {
diff --git a/MAINTAINERS b/MAINTAINERS
index 96a4eeb5a59..de5426f6724 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -436,7 +436,15 @@ M: Roman Bolshakov <r.bolshakov@yadro.com>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: target/i386/hvf/
+
+HVF
+M: Cameron Esfahani <dirty@apple.com>
+M: Roman Bolshakov <r.bolshakov@yadro.com>
+W: https://wiki.qemu.org/Features/HVF
+S: Maintained
+F: accel/hvf/
 F: include/sysemu/hvf.h
+F: include/sysemu/hvf_int.h
 
 WHPX CPUs
 M: Sunil Muthuswamy <sunilmut@microsoft.com>
diff --git a/accel/hvf/meson.build b/accel/hvf/meson.build
new file mode 100644
index 00000000000..227b11cd717
--- /dev/null
+++ b/accel/hvf/meson.build
@@ -0,0 +1,6 @@
+hvf_ss = ss.source_set()
+hvf_ss.add(files(
+  'hvf-all.c',
+))
+
+specific_ss.add_all(when: 'CONFIG_HVF', if_true: hvf_ss)
diff --git a/accel/meson.build b/accel/meson.build
index b44ba30c864..dfd808d2c8e 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -2,6 +2,7 @@ specific_ss.add(files('accel-common.c'))
 softmmu_ss.add(files('accel-softmmu.c'))
 user_ss.add(files('accel-user.c'))
 
+subdir('hvf')
 subdir('qtest')
 subdir('kvm')
 subdir('tcg')
-- 
2.20.1


