Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D71D314395
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:17:38 +0100 (CET)
Received: from localhost ([::1]:37086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Fmi-00006d-3O
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:17:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCg-0003bf-09
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:06 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCd-0006GX-AE
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:05 -0500
Received: by mail-wm1-x335.google.com with SMTP id m1so61440wml.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KjlWsFlnMsATQFEaRDp2nWf68++6Ehctu+osPdoz+0g=;
 b=rtMWFJdk98Yyoqq69+RrMaod/2T0uXuNLJk5q4fsrvw87oXRY50fus11eTCvVYrBiN
 n4H8TuZCyITRxpVZlipFpr0i+283dEabttHGR8rKrygKdZVRImQGg+LgI2u2N+2RBhC6
 4+UNaNN6gjygt09cq4jMP8UI8jtGEtiOBalkpmNXxsjmKC1IY52pM22uPgVJ4nIsvza7
 Q/N0O831/NgMwwRniGwi/0OeRZi/3VdwtN/mVuqMmKeF6+A6/0C8CDT3wrkzpRZ6V8w5
 vJzYZOwJQLM9g2vzo8NigpVgpY1VARdwM4qkSWZr8Eq6dopfHgRp3ybrSsTi4cGqX1IE
 pCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KjlWsFlnMsATQFEaRDp2nWf68++6Ehctu+osPdoz+0g=;
 b=Xq6lBvx5vDuGHRU+ckC9tox7oIQ5U+pdvlYHuTksnWH1YEcvID5OKHlBQLzU7YygtY
 i0vSCRA8+yTayP+pB5okwTcPFvcq1X66ISoi2bVsLTEB3VyQmIBrYO0Y7pDswkvLAmDa
 10WIymCCab8ED80DVlvrJFo+GaC5eGzdRss7LL/iHYxNue+e9ViTi9mtxdfg9CsM1pju
 yk3tvOYm7AvRphWuARFfs0601fa1UCuMB7gsoS7614nmt2iN63juZUtmaGJf26rk2CIM
 7e7jQo6xJF6/WRP+NJ2cYiPIL6utD+lj63UQonAv8rKIW3lyLM0Xw4fb/fY+ggbpkG2/
 Pbwg==
X-Gm-Message-State: AOAM5333FISODSwL13y/h5jbt5zKsd7i1CbOzuKSqlVV+lAI4V1m96vz
 wk0ZT0Wp730j8g/fztRDj43sFrDrKNWJ1g==
X-Google-Smtp-Source: ABdhPJwNNdjQgb7IGVWehVHRtbFwkRDFd8MW8ac/YD3N1F70w5y74bpXYPSxdvIMJJzdyk76TdMcHg==
X-Received: by 2002:a1c:1bc4:: with SMTP id b187mr100550wmb.18.1612808639202; 
 Mon, 08 Feb 2021 10:23:59 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/46] qapi/meson: Restrict qdev code to system-mode emulation
Date: Mon,  8 Feb 2021 19:23:13 +0100
Message-Id: <20210208182331.58897-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Beside a CPU device, user-mode emulation doesn't access
anything else from qdev subsystem.

Tools don't need anything from qdev.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210122204441.2145197-10-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS       |  1 +
 qapi/meson.build  |  6 +++++-
 stubs/meson.build |  2 ++
 stubs/qdev.c      | 23 +++++++++++++++++++++++
 4 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 stubs/qdev.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d8b0bf966..ca74617cc3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2539,6 +2539,7 @@ F: qapi/qom.json
 F: qapi/qdev.json
 F: scripts/coccinelle/qom-parent-type.cocci
 F: softmmu/qdev-monitor.c
+F: stubs/qdev.c
 F: qom/
 F: tests/check-qom-interface.c
 F: tests/check-qom-proplist.c
diff --git a/qapi/meson.build b/qapi/meson.build
index ab68e7900e..2839871b47 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -35,7 +35,6 @@ qapi_all_modules = [
   'misc-target',
   'net',
   'pragma',
-  'qdev',
   'pci',
   'qom',
   'rdma',
@@ -49,6 +48,11 @@ qapi_all_modules = [
   'ui',
   'yank',
 ]
+if have_system
+  qapi_all_modules += [
+    'qdev',
+  ]
+endif
 
 qapi_storage_daemon_modules = [
   'block-core',
diff --git a/stubs/meson.build b/stubs/meson.build
index 1a656cd070..a054d5877f 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -53,4 +53,6 @@ endif
 if have_system
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('xen-hw-stub.c'))
+else
+  stub_ss.add(files('qdev.c'))
 endif
diff --git a/stubs/qdev.c b/stubs/qdev.c
new file mode 100644
index 0000000000..92e6143134
--- /dev/null
+++ b/stubs/qdev.c
@@ -0,0 +1,23 @@
+/*
+ * QOM stubs
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * Author:
+ *   Philippe Mathieu-Daudé <philmd@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-events-qdev.h"
+
+void qapi_event_send_device_deleted(bool has_device,
+                                    const char *device,
+                                    const char *path)
+{
+    /* Nothing to do. */
+}
-- 
2.29.2



