Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E0343E49A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:08:42 +0200 (CEST)
Received: from localhost ([::1]:58680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg71F-0000gG-Cg
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg6ya-0006lk-5i
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:05:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg6yT-0007C9-If
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:05:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635433545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8q5NxY4tZqQ6nhyl14l1qak+/GhyQMQefx1CQ7dFSew=;
 b=GM5y7XINaRg+762D80/TVUxV9ISNZzWYkIFZvIw7jGwoLEd9pWigX0jyWuXhlbQM7lYoRs
 9nM1qDfAk3bRh5jay2dyvrab3hP+B3LylZyLlxIlu1NeIJuLk6w0/gdi0LK7qvvi43zBz5
 SbKubCXI5CWXCg1dc18ZTFHd72tAx1s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-jE34CjoUNHq0truS20VqcA-1; Thu, 28 Oct 2021 11:05:44 -0400
X-MC-Unique: jE34CjoUNHq0truS20VqcA-1
Received: by mail-wm1-f71.google.com with SMTP id
 125-20020a1c0183000000b003306ae8bfb7so453857wmb.7
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8q5NxY4tZqQ6nhyl14l1qak+/GhyQMQefx1CQ7dFSew=;
 b=NhFXfHAm0OYQG6CPnpUh1CGN2L27aZYFN0setQaO6jCewTnFQaU0u8zkb1txK/L6oU
 oCSoACdEKSg5e9UxAiXlHvEBkdBxRVZ7K0QUz33822MpC3prrNCEMbDpSaWfw/HlIm2D
 2HUlCtUeXsvrIzN7WRb2XNUaNPg4h60DtlEg7gqpnLr0/0aSzvJSCttkSkFmfsdxagkC
 SoFm68iFHyxuGfXTFYTVW9zP0DZT/4fp69w+6PhPjxxh0GzIAq3UZFiZCjGNxG846MUh
 DxHr/sv0i/h1JoQqLyjRKmnsNWe3dYMALOdbB9mKvuNkEg9P0iUcgkVsef+8DiywfoBR
 a2lg==
X-Gm-Message-State: AOAM530YhnG7VgfkGPQGTmEttvewogcoF7xKQ0xYXv2z68GsAUOR2fdp
 bRxsjP8btwisEKN5FDwiKbfIHwZOCxgV3snM3nSoKbugmVZQYgE2Rx8R3n5ihy/sct5mhy6rR/S
 9mOPbM9W4LQGhrvTJXRWuk33ZAZIYpqbjmaoDwpcqtO+pCClYeQ6WJ7lXAzyZOwbZ
X-Received: by 2002:a5d:40c9:: with SMTP id b9mr6434990wrq.409.1635433542848; 
 Thu, 28 Oct 2021 08:05:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd1kqs1by55shHybx9lNYM5phs/FDWTGPd6saDF/V6Wo9O75N5Gwy7mKGDkWq7aS/rAzA+QQ==
X-Received: by 2002:a5d:40c9:: with SMTP id b9mr6434964wrq.409.1635433542668; 
 Thu, 28 Oct 2021 08:05:42 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e8sm3468827wrp.58.2021.10.28.08.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:05:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] hw/core: Restrict hotplug to system emulation
Date: Thu, 28 Oct 2021 17:05:21 +0200
Message-Id: <20211028150521.1973821-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028150521.1973821-1-philmd@redhat.com>
References: <20211028150521.1973821-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict hotplug to system emulation, add stubs for the other uses.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/core/hotplug-stubs.c | 34 ++++++++++++++++++++++++++++++++++
 hw/core/meson.build     | 12 ++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 hw/core/hotplug-stubs.c

diff --git a/hw/core/hotplug-stubs.c b/hw/core/hotplug-stubs.c
new file mode 100644
index 00000000000..7aadaa29bd5
--- /dev/null
+++ b/hw/core/hotplug-stubs.c
@@ -0,0 +1,34 @@
+/*
+ * Hotplug handler stubs
+ *
+ * Copyright (c) Red Hat
+ *
+ * Authors:
+ *  Philippe Mathieu-Daudé <philmd@redhat.com>,
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "hw/qdev-core.h"
+
+HotplugHandler *qdev_get_hotplug_handler(DeviceState *dev)
+{
+    return NULL;
+}
+
+void hotplug_handler_pre_plug(HotplugHandler *plug_handler,
+                              DeviceState *plugged_dev,
+                              Error **errp)
+{
+    g_assert_not_reached();
+}
+
+void hotplug_handler_plug(HotplugHandler *plug_handler,
+                          DeviceState *plugged_dev,
+                          Error **errp)
+{
+    g_assert_not_reached();
+}
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 85f2ad1374b..afc5ed2c906 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -1,7 +1,6 @@
 # core qdev-related obj files, also used by *-user and unit tests
 hwcore_ss.add(files(
   'bus.c',
-  'hotplug.c',
   'qdev-properties.c',
   'qdev.c',
   'reset.c',
@@ -11,8 +10,17 @@
   'irq.c',
   'clock.c',
   'qdev-clock.c',
-  'qdev-hotplug.c',
 ))
+if have_system
+  hwcore_ss.add(files(
+    'hotplug.c',
+    'qdev-hotplug.c',
+  ))
+else
+  hwcore_ss.add(files(
+    'hotplug-stubs.c',
+  ))
+endif
 
 common_ss.add(files('cpu-common.c'))
 softmmu_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
-- 
2.31.1


