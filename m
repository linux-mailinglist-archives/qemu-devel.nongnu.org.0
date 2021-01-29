Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DD430888F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:50:51 +0100 (CET)
Received: from localhost ([::1]:44258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SIc-0001Hn-2q
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:50:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5Rnb-0004ui-RG
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:47 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:34271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnY-00066x-Pr
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:47 -0500
Received: by mail-ed1-x536.google.com with SMTP id d22so10136486edy.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dMBxoDIDlMoeXVhLAiWNw1X/TiIbPaCf8MYQG1V/XIo=;
 b=Q5RSTLGO8ZegE9AmrolKCs7R+NnKm2VeXB7aAMMmubPeRfQDMyXG190CSMkyz4uOsJ
 dEXTcxvIKvNLTLqZqR1qPkeTc4z+kt8/9LRX/hboGkm4QoMFQuBG7k9d0EBCivGXRLwH
 L/dysVj48OSjFnBIcM+LVpabQoeZTCfhpeNgggjZrErUARKdAZQkd19+0Lf4EZVP4W1E
 Io15Fifez/ZUEHIVoJ7MdCKUeMhZY4FBrfmsKliou9klwUK/0FggzXjIuPA2LW/n2Tn/
 c4UvJ14cxB9YuGgVGG/smTEI1o6pZ72dDeSzh4MpaV6R7+34E130IC8VzjvrXa2Fn/FP
 MrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dMBxoDIDlMoeXVhLAiWNw1X/TiIbPaCf8MYQG1V/XIo=;
 b=M+U7/bjbCUeKLf5EfQW+em2wfBDfroSvgCWlEFnvseBNCxInzhD4QnflLgyGwxjVqN
 Azymc/3ytA4uhi5C08lwBAkUTwSlEVAP8XwFCXaKNNRy5Q9qJH2KBt3OKlcccu2YZkXa
 cVAMkkcolgDinVOV26O+KkfC2HfMXVRneHgL3hhqOGCHGtpgwHB+PXsyEoncRkv/RgiH
 WbwwNt6YtVQoUs9YgKAZ8l5HpABt3jRm1jYMUw7aDMhAwXlhNYGfAnxKzkafu9Lo5b0R
 NgnO9ulB/3JWgx4zy037GojP+Yu7OtOwYjAoc/ze7y7V37ekvJzOs5nd6dQUkZ1AjDtb
 4gTg==
X-Gm-Message-State: AOAM532VDGJuC9pt1iZ0V89I7FIrRiKfRBSyMGZmiApvIl6b3sJ0JTTF
 SJspzdew7/gbkp/ZpW0eudPveQZzGu0r+g==
X-Google-Smtp-Source: ABdhPJw9MfXVOMKrVQAomOHM2km4z12IsvJEW4GbZwscCnG8ThmMunTJnWpI0pCK1I7z8GyX/OuOJg==
X-Received: by 2002:aa7:ce87:: with SMTP id y7mr4500969edv.211.1611919122994; 
 Fri, 29 Jan 2021 03:18:42 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/36] qapi/meson: Restrict qdev code to system-mode emulation
Date: Fri, 29 Jan 2021 12:18:09 +0100
Message-Id: <20210129111814.566629-32-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
index 34359a99b8..d2dd7c2422 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2523,6 +2523,7 @@ F: qapi/qom.json
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



