Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 009FE338124
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:14:45 +0100 (CET)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKUVv-0003r6-V8
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:14:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTf-0001h7-FE
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:12:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTW-00050E-5O
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:12:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615504333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9/A/riDh/u3/RZyU2QEb9TC3+IuIFZua1rs0ajVdzA=;
 b=DD33atTyxk3olUJb8ZaRTKYkt/4RdaHFpJQMxREvp5q+90qKiaQW0N7O7Fu4HlIj46m7Z2
 K1lmkg0UWMZT7nHIhnw7kmpSTeKkkALQRqR6GX5o02FW++QuG3Btcc8b4a5/DECLwuoi3g
 Ain15R5SzYfW04PXLxDx2nZAudK+M18=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-P-uEKJD3OcmfMa_I6DdHUw-1; Thu, 11 Mar 2021 18:12:12 -0500
X-MC-Unique: P-uEKJD3OcmfMa_I6DdHUw-1
Received: by mail-wm1-f72.google.com with SMTP id i14so4626956wmq.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 15:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+9/A/riDh/u3/RZyU2QEb9TC3+IuIFZua1rs0ajVdzA=;
 b=hinh1+cYq65qZaWcO0QsX7NczGj+sjipzCOvI0czwIxf/sgzgv4zvL4tGEXmgRzb7y
 9IjRS1GxZli1Lts6z28J8VFEleOG6lBTPocGsVa6F+9UuzsGiKXwrKBWdalSuyRbkKZw
 rqHOTcKDSP3tDit/AIOQ9GhWqWx0wFGKU/Aq+jFND11hiyxTuDGBkFuhSZ1bA4xNg+P/
 fhrt/17XTCkcNbP4saB/FI+wrx/rQpkXklE3bt7XxnONyt6HU3gAlUFzBqRsKszUla3L
 qZ5kQTLSZ1R/TJfsUpbIr6VedbB6b1YEYJsoBbtsahE5LyPdLAOfy3VBT+pcVg74AitA
 JAiA==
X-Gm-Message-State: AOAM533qhK29iQq0026j1Z3xQ8UxuR+77nwS+/OpEpCFhwYfxKN+GKeq
 +qam5J/IPRcRumfbKiIFCnVi2EcWFY4UpWe+ThHWZVeK5N1Wfnl6mZdsutc/Ss7JWiMjmotM8i9
 2x89WOX+rFNMKUU1PGm664xv2OOJN66JgjnNlDZ8NKE1kPzBC0Ofy3SEQVFVd4iF4
X-Received: by 2002:a5d:6406:: with SMTP id z6mr11075620wru.264.1615504330842; 
 Thu, 11 Mar 2021 15:12:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysXdqtJRmtotqOQgLz0vsf4bgNft74C9mKospRLq0C1t3KX6BCpSTwxs3d3bCiESNuhn56Uw==
X-Received: by 2002:a5d:6406:: with SMTP id z6mr11075596wru.264.1615504330632; 
 Thu, 11 Mar 2021 15:12:10 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s11sm276284wme.22.2021.03.11.15.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 15:12:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Claudio Fontana <cfontana@suse.de>
Subject: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
Date: Fri, 12 Mar 2021 00:11:57 +0100
Message-Id: <20210311231202.1536040-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311231202.1536040-1-philmd@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the 'query-accels' QMP command which returns a list
of built-in accelerators names.

- Accelerator is an QAPI enum of all existing accelerators,

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
                "type": "qtest"
            },
            {
                "type": "kvm"
            }
        ]
    }

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/machine.json | 55 +++++++++++++++++++++++++++++++++++++++++++++++
 accel/accel-qmp.c | 47 ++++++++++++++++++++++++++++++++++++++++
 accel/meson.build |  2 +-
 3 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 accel/accel-qmp.c

diff --git a/qapi/machine.json b/qapi/machine.json
index 330189efe3d..ffbf28e5d50 100644
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
+#            "type": "qtest"
+#        },
+#        {
+#            "type": "kvm"
+#        }
+#    ] }
+#
+##
+{ 'command': 'query-accels',
+  'returns': ['AcceleratorInfo'] }
diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
new file mode 100644
index 00000000000..f16e49b8956
--- /dev/null
+++ b/accel/accel-qmp.c
@@ -0,0 +1,47 @@
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
+static const Accelerator accel_list[] = {
+    ACCELERATOR_QTEST,
+#ifdef CONFIG_TCG
+    ACCELERATOR_TCG,
+#endif
+#ifdef CONFIG_KVM
+    ACCELERATOR_KVM,
+#endif
+#ifdef CONFIG_HAX
+    ACCELERATOR_HAX,
+#endif
+#ifdef CONFIG_HVF
+    ACCELERATOR_HVF,
+#endif
+#ifdef CONFIG_WHPX
+    ACCELERATOR_WHPX,
+#endif
+#ifdef CONFIG_XEN_BACKEND
+    ACCELERATOR_XEN,
+#endif
+};
+
+AcceleratorInfoList *qmp_query_accels(Error **errp)
+{
+    AcceleratorInfoList *list = NULL, **tail = &list;
+
+    for (unsigned i = 0; i < ARRAY_SIZE(accel_list); i++) {
+        AcceleratorInfo *info = g_new0(AcceleratorInfo, 1);
+
+        info->name = accel_list[i];
+
+        QAPI_LIST_APPEND(tail, info);
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


