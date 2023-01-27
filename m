Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C3267E94B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:18:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQSa-0006ML-Rv; Fri, 27 Jan 2023 10:16:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSQ-0006IO-Ap
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:02 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSN-0007fg-JO
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:01 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso5621975wmc.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JRh6Zd7yURln8ss/3uCQjhMmHZdDScQS9IWz9tbNtyA=;
 b=i+rwphMLjmk6oKkA4//+2PYmZu1Mp4iB0X/UeXL+mO1j7ppvC3/N5OleZvXaCFpb8Y
 6V+6LplTd7bCbrbbn+Hs7672wVVfFYSVf174UQvJVI1DX/xwPHgT2zCYb9iORRpojyT9
 p1uZ17Sk4wxcROQGWVYiTgYx/sflyph7lrtbT/16n/Df77V4gisFaQpUGpTConkVJbA4
 diFewgZcJ7SWNO3vmT7+xJxcijmqU9SI85lHvzCpO44w4OvSTlUPJSb+KJ0MjSEx4mGx
 9dLzvo706MpLNLZlyO+C/H3Sp1ZxSWl4VnqcS4mtkSxbABfuoYyRHZSzlbH5rR6SGaDw
 GxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JRh6Zd7yURln8ss/3uCQjhMmHZdDScQS9IWz9tbNtyA=;
 b=YxcGjTQwusUXCRb+fJ3BsjZzXMrH/bFNEeyBbe+saRc4OtXNzoiz5TypEOIrHlVeAr
 i36QACKc3mNL1U95j9F5EbFVqHsyqn3UeluuL7a72qY9rbOq2yyLi3gxjYK2ebd6mKVO
 er00z0FXEqNihCdtnhj+I0DHPLgEByLCSd9kqJWs2zuH3Dhy9jN0z6oqC91QTNrJir34
 aYwBw6LiW48RZ7+/hej6XMQPgd4Wx42szhzyjlsop6Wrv0wEklwNJtfBouTJkdeoelzP
 aPsqaMY0LkS+jw3r01Li/r6DQPMnEnGf0Njlfhs+O/1GpVRu1cXJDp7ZGEnfnEtZDJH9
 6gGA==
X-Gm-Message-State: AO0yUKVsVBF4CFYAfzYzOoKHbr3D8/P3SJN7edIUKzw+I3XG7iyetaAR
 rnzXZ2u/AYtmi9xNVdHu5jcqAA==
X-Google-Smtp-Source: AK7set9uZwUVX7qiIlmt/JjGTgC6uHAUHR60SnBlrYfTdSnmscfOfsYbRlCfeYwIpdHCWmo29wOiLw==
X-Received: by 2002:a05:600c:3b82:b0:3dc:37bf:c634 with SMTP id
 n2-20020a05600c3b8200b003dc37bfc634mr2745999wms.15.1674832557876; 
 Fri, 27 Jan 2023 07:15:57 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:15:57 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 02/16] target/arm: Add confidential guest support
Date: Fri, 27 Jan 2023 15:07:15 +0000
Message-Id: <20230127150727.612594-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32d.google.com
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

Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
support the Arm Realm Management Extension (RME). It is instantiated by
passing on the command-line:

  -M virt,confidential-guest-support=<id>
  -object guest-rme,id=<id>[,options...]

This is only the skeleton. Support will be added in following patches.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 docs/system/confidential-guest-support.rst |  1 +
 qapi/qom.json                              |  3 +-
 target/arm/kvm-rme.c                       | 48 ++++++++++++++++++++++
 target/arm/meson.build                     |  7 +++-
 4 files changed, 57 insertions(+), 2 deletions(-)
 create mode 100644 target/arm/kvm-rme.c

diff --git a/docs/system/confidential-guest-support.rst b/docs/system/confidential-guest-support.rst
index 0c490dbda2..acf46d8856 100644
--- a/docs/system/confidential-guest-support.rst
+++ b/docs/system/confidential-guest-support.rst
@@ -40,5 +40,6 @@ Currently supported confidential guest mechanisms are:
 * AMD Secure Encrypted Virtualization (SEV) (see :doc:`i386/amd-memory-encryption`)
 * POWER Protected Execution Facility (PEF) (see :ref:`power-papr-protected-execution-facility-pef`)
 * s390x Protected Virtualization (PV) (see :doc:`s390x/protvirt`)
+* Arm Realm Management Extension (RME)
 
 Other mechanisms may be supported in future.
diff --git a/qapi/qom.json b/qapi/qom.json
index 30e76653ad..7ca27bb86c 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -917,7 +917,8 @@
     'tls-creds-x509',
     'tls-cipher-suites',
     { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
-    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] }
+    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] },
+    'rme-guest'
   ] }
 
 ##
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
new file mode 100644
index 0000000000..22aa3dc712
--- /dev/null
+++ b/target/arm/kvm-rme.c
@@ -0,0 +1,48 @@
+/*
+ * QEMU Arm RME support
+ *
+ * Copyright Linaro 2022
+ */
+
+#include "qemu/osdep.h"
+
+#include "exec/confidential-guest-support.h"
+#include "hw/boards.h"
+#include "hw/core/cpu.h"
+#include "kvm_arm.h"
+#include "migration/blocker.h"
+#include "qapi/error.h"
+#include "qom/object_interfaces.h"
+#include "sysemu/kvm.h"
+#include "sysemu/runstate.h"
+
+#define TYPE_RME_GUEST "rme-guest"
+OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
+
+typedef struct RmeGuest RmeGuest;
+
+struct RmeGuest {
+    ConfidentialGuestSupport parent_obj;
+};
+
+static void rme_guest_class_init(ObjectClass *oc, void *data)
+{
+}
+
+static const TypeInfo rme_guest_info = {
+    .parent = TYPE_CONFIDENTIAL_GUEST_SUPPORT,
+    .name = TYPE_RME_GUEST,
+    .instance_size = sizeof(struct RmeGuest),
+    .class_init = rme_guest_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void rme_register_types(void)
+{
+    type_register_static(&rme_guest_info);
+}
+
+type_init(rme_register_types);
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 87e911b27f..a2224c0d23 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -40,7 +40,12 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
+arm_ss.add(when: 'CONFIG_KVM',
+  if_true: files(
+    'kvm.c',
+    'kvm64.c',
+    'kvm-rme.c'),
+  if_false: files('kvm-stub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
-- 
2.39.0


