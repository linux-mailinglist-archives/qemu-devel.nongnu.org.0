Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E9A372244
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:12:35 +0200 (CEST)
Received: from localhost ([::1]:58002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldfrl-0005qg-J2
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfpv-00045e-Aw
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:10:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfps-000710-LC
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620076235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P/JwIaYRijlIKIuvZy1yv4gicsUV0JiEB0BppIoUwQc=;
 b=SsRd0xJpSMuxl9QWf0XyYcqSzgL7Ou79kcuV/0x13y7MzLDF7vyGo2fALZX4gdVATjksxQ
 bM8awBfasp7uH0ydJeSTmKS92SsfccOPiEYp1XVry++AO3Er6aDTNJoWijJloKsUjauCUO
 OX3JJuHJfF3PGcwWSIiMBO0vZIdld7g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-kJVPEGf_M0S1ULOeZnNMRQ-1; Mon, 03 May 2021 17:10:34 -0400
X-MC-Unique: kJVPEGf_M0S1ULOeZnNMRQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r10-20020a05600c2c4ab029014b601975e1so65853wmg.0
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 14:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/JwIaYRijlIKIuvZy1yv4gicsUV0JiEB0BppIoUwQc=;
 b=B02oQ2KfwBio+CZyeyf7yroB15ann/FDi8Js4CanEptUdtRS+OFVgOYOmwVtutuKZP
 Ff9iJI2jEk2n1jfaZH47X52siYBYPij2Gt3ap06NLhmbqHemrebtRJAakdcm3538E0E7
 /+TbK8uuu1W4zDIbGq4deE+Y+0BTZgBx58vx/R4HigqDPALesMilfqAtU78pFmDMgD+g
 o2LoK5zofjGsqh5i1+qijDLTONpFPF/lptXCiY0qCjyLRPF/2l9oc060tU1i6PxMoO+8
 DpSgWqpc9s6W5xkgvRhtMlrarYUMbCx1Cm7U0xKY9GADMq9fywFNeZbJW4Cv7WrWEZsh
 lo6A==
X-Gm-Message-State: AOAM531QCQhHRj91cugacVtLUZn3XET3xZpL48woyEoyci7qqNKityFF
 zObxrY6drDdlw7LU7e6vXCBCmkSWhgcv2NUBoLXVPfiL31ySM4Y1wP+THP5uDB46YGZEjOIusuP
 l0s9/QjBoHQQxnGhapW2HFZKXdr7D0U29bP4LdvF31C/MGFU2ssNblGXk1K2C/xJ3
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr504254wmq.133.1620076233092; 
 Mon, 03 May 2021 14:10:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfC74+KBGj0iZP4yjF1Dlg6WZlocMh6ZsUPwF8xTZut77i2zQIa8DTsdf5gINFQkwHobpJQw==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr504226wmq.133.1620076232859; 
 Mon, 03 May 2021 14:10:32 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id o17sm14529602wrs.48.2021.05.03.14.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 14:10:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/12] accel: Introduce 'query-accels' QMP command
Date: Mon,  3 May 2021 23:10:10 +0200
Message-Id: <20210503211020.894589-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
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

Note that we can't make the enum values or union branches conditional
because of target-specific poisoning of accelerator definitions.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/machine.json | 47 +++++++++++++++++++++++++++++++++++++++++++++
 accel/accel-qmp.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++
 accel/meson.build |  2 +-
 3 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 accel/accel-qmp.c

diff --git a/qapi/machine.json b/qapi/machine.json
index 6e90d463fc9..6dd3b765248 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1274,3 +1274,50 @@
 ##
 { 'event': 'MEM_UNPLUG_ERROR',
   'data': { 'device': 'str', 'msg': 'str' } }
+
+##
+# @Accelerator:
+#
+# An enumeration of accelerator names.
+#
+# Since: 6.1
+##
+{ 'enum': 'Accelerator',
+  'data': [ 'hax', 'hvf', 'kvm', 'qtest', 'tcg', 'whpx', 'xen' ] }
+
+##
+# @AcceleratorInfo:
+#
+# Accelerator information.
+#
+# @name: The accelerator name.
+#
+# Since: 6.1
+##
+{ 'struct': 'AcceleratorInfo',
+  'data': { 'name': 'Accelerator' } }
+
+##
+# @query-accels:
+#
+# Get a list of AcceleratorInfo for all built-in accelerators.
+#
+# Returns: a list of @AcceleratorInfo describing each accelerator.
+#
+# Since: 6.1
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
2.26.3


