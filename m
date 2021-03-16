Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C5333DB89
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:55:04 +0100 (CET)
Received: from localhost ([::1]:37348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDuI-0001o5-4O
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDRJ-0008IP-CC
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:25:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDRG-0002r9-Qu
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615915502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P9HOtQxBV/bG+GuI8aHNav7iJtNSHx8uTsMF5lguS5k=;
 b=g8ZGR9LsMGbXh8aIXvwx7Mkiq6OXKHluiYmB2t2e/nnVuYhvOsAvQRPdfZwrNaFV7EVNSj
 rszjcKYbbIiSWx+8PFbTuTDswGRnUVjSW6na+D5u4/l0G+xCgT56BCe4lQivfEaB/pNlgp
 +BiS8dhDizHiCBfWfa7/JBBxwuIlgeA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-vAkGgdJ2Oiitwf0fei93Tw-1; Tue, 16 Mar 2021 13:24:59 -0400
X-MC-Unique: vAkGgdJ2Oiitwf0fei93Tw-1
Received: by mail-wm1-f72.google.com with SMTP id c7so9897309wml.8
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 10:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P9HOtQxBV/bG+GuI8aHNav7iJtNSHx8uTsMF5lguS5k=;
 b=p/CezoWTsmius2bh4LjOzJnDRnujWOA2uT0qYC9mAG4S3DzGesgCImq0X6YRLatkjI
 yN17do3IkhwRdPIviJRcjIlBLW4OaEBN85EJc6I95o/L2ZgcZmjfMGSrAmP96bdKzJp4
 y83VrXFpTF8yhIksMs2tJ2cJCvZ0TI9D0PhGvav2O1i9Cv2vfT5Lb59PqIMSK6vt6xoc
 XujuQuM+bN1qTSoITbWQwBC9FnEGRT2LouDKQhrx7ZKxt56Df8+wZi+m2LdRS6EmQAV8
 cw4lTuCXL5+Xcsn8P+uJVKLiC8FzxJbFYtInEmH63NYKpQzTxLI/GxkkioTADmiX7I/F
 +Nsg==
X-Gm-Message-State: AOAM5322uHbKiHwfNxCafb4002mpXkGWUALZjyBmQ2XSpRjS2vn4AXpn
 qwss6EJ4oVsZTv1A8GZuBXflE7b0AChHJWtx54tfC1EDiuUxj1xsCBHDddAbrOO6BDIWW8P4Q/3
 zYQLE0rSXFBW/RsPawUCqRBbZPKKC4jBwE8BACwLMHYbTohlHtAHakGz4Q6VZ+61f
X-Received: by 2002:adf:ea0e:: with SMTP id q14mr43333wrm.389.1615915498416;
 Tue, 16 Mar 2021 10:24:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwy2pE4aQj+uWuWtKpHIDCCqqKI5Y0oeAjbejpCBZc34UdnssSi8XP9nUo2qvv89oWJY0SrA==
X-Received: by 2002:adf:ea0e:: with SMTP id q14mr43289wrm.389.1615915498087;
 Tue, 16 Mar 2021 10:24:58 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v18sm24427294wrf.41.2021.03.16.10.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 10:24:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] accel: Introduce 'query-accels' QMP command
Date: Tue, 16 Mar 2021 18:24:46 +0100
Message-Id: <20210316172449.3148634-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210316172449.3148634-1-philmd@redhat.com>
References: <20210316172449.3148634-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the 'query-accels' QMP command which returns a list
of built-in accelerator names.

- Accelerator is a QAPI enum of all existing accelerators,

- AcceleratorInfo is a QAPI structure providing accelerator
  specific information. Currently the common structure base
  provides the name of the accelerator, while the specific
  part is empty, but each accelerator can expand it.

- 'query-accels' QMP command returns a list of @AcceleratorInfo

For example on a KVM-only build we get:

    { "execute": "query-accels" }
    {
        "return": [
            {
                "name": "qtest"
            },
            {
                "name": "kvm"
            }
        ]
    }

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Since v1: 'type' -> 'name' in comments
---
 qapi/machine.json | 55 +++++++++++++++++++++++++++++++++++++++++++++++
 accel/accel-qmp.c | 49 +++++++++++++++++++++++++++++++++++++++++
 accel/meson.build |  2 +-
 3 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 accel/accel-qmp.c

diff --git a/qapi/machine.json b/qapi/machine.json
index 330189efe3d..610252fc25c 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1471,3 +1471,58 @@
 ##
 { 'event': 'MEM_UNPLUG_ERROR',
   'data': { 'device': 'str', 'msg': 'str' } }
+
+##
+# @Accelerator:
+#
+# An enumeration of accelerator names.
+#
+# Since: 6.0
+##
+{ 'enum': 'Accelerator',
+  'data': [ { 'name': 'qtest' },
+            { 'name': 'tcg' },
+            { 'name': 'kvm' },
+            { 'name': 'hax' },
+            { 'name': 'hvf' },
+            { 'name': 'whpx' },
+            { 'name': 'xen' } ] }
+
+##
+# @AcceleratorInfo:
+#
+# Accelerator information.
+#
+# @name: The accelerator name.
+#
+# Since: 6.0
+##
+{ 'union': 'AcceleratorInfo',
+  'base': {'name': 'Accelerator'},
+  'discriminator': 'name',
+  'data': { } }
+
+##
+# @query-accels:
+#
+# Get a list of AcceleratorInfo for all built-in accelerators.
+#
+# Returns: a list of @AcceleratorInfo describing each accelerator.
+#
+# Since: 6.0
+#
+# Example:
+#
+# -> { "execute": "query-accels" }
+# <- { "return": [
+#        {
+#            "name": "qtest"
+#        },
+#        {
+#            "name": "kvm"
+#        }
+#    ] }
+#
+##
+{ 'command': 'query-accels',
+  'returns': ['AcceleratorInfo'] }
diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
new file mode 100644
index 00000000000..426737b3f9a
--- /dev/null
+++ b/accel/accel-qmp.c
@@ -0,0 +1,49 @@
+/*
+ * QEMU accelerators, QMP commands
+ *
+ * Copyright (c) 2021 Red Hat Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-commands-machine.h"
+
+static const bool accel_builtin_list[ACCELERATOR__MAX] = {
+    [ACCELERATOR_QTEST] = true,
+#ifdef CONFIG_TCG
+    [ACCELERATOR_TCG] = true,
+#endif
+#ifdef CONFIG_KVM
+    [ACCELERATOR_KVM] = true,
+#endif
+#ifdef CONFIG_HAX
+    [ACCELERATOR_HAX] = true,
+#endif
+#ifdef CONFIG_HVF
+    [ACCELERATOR_HVF] = true,
+#endif
+#ifdef CONFIG_WHPX
+    [ACCELERATOR_WHPX] = true,
+#endif
+#ifdef CONFIG_XEN_BACKEND
+    [ACCELERATOR_XEN] = true,
+#endif
+};
+
+AcceleratorInfoList *qmp_query_accels(Error **errp)
+{
+    AcceleratorInfoList *list = NULL, **tail = &list;
+
+    for (Accelerator accel = 0; accel < ACCELERATOR__MAX; accel++) {
+        if (accel_builtin_list[accel]) {
+            AcceleratorInfo *info = g_new0(AcceleratorInfo, 1);
+
+            info->name = accel;
+
+            QAPI_LIST_APPEND(tail, info);
+        }
+    }
+
+    return list;
+}
diff --git a/accel/meson.build b/accel/meson.build
index b44ba30c864..7a48f6d568d 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -1,4 +1,4 @@
-specific_ss.add(files('accel-common.c'))
+specific_ss.add(files('accel-common.c', 'accel-qmp.c'))
 softmmu_ss.add(files('accel-softmmu.c'))
 user_ss.add(files('accel-user.c'))
 
-- 
2.26.2


