Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFC4442148
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:03:34 +0100 (CET)
Received: from localhost ([::1]:45940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdWn-0005wm-Ln
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcHP-0000Sl-T4
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcHL-0008QN-Ps
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635792210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwFvWOuJyssO0Z6DL9B2iJO2pVnuKxsynrvNM6xKjqs=;
 b=aiounzSsRk56Dq/Our0QB7nMUzsp+CATVJfdU//4DAd8XQgG+EOhABRgfFahdf07WR1vwz
 mZxR0THA9rWy8vS7vXZpwVFwPi6MkY37EyHTLg3Lt838E/bmDDAqsETgjrgw4+pLIu9Fl/
 8QGPvggecJRnHkl51GqccB9BX3g+/Mg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-UdaL_GSKMgelG3k7p652hg-1; Mon, 01 Nov 2021 14:43:27 -0400
X-MC-Unique: UdaL_GSKMgelG3k7p652hg-1
Received: by mail-wm1-f72.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso73976wmb.0
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OwFvWOuJyssO0Z6DL9B2iJO2pVnuKxsynrvNM6xKjqs=;
 b=4e9neKj0AiwKSmmMd/r6245D2dGSORlip+QesQg9Ibyr0q2ruAAMvyvG7ggygj4UIs
 rRLQ28Hef7QaZYrGXq8IOV0WxcxvhXEpyfavZmNgT7GUGnlKwHrwYfdkP1S+oW04xAXG
 JNAy2n3ywXP/a0ZtCuDaG3j/7QGgSlveATp17NL/5C9wXiS++Sj5PQWbbQm3GPjLImJ7
 MoXB88SENW50a3CO24CpZGW/TEsjgD63KB1V3e2fMLoBW46Fqh01SPCMZ5dZWKZHVXp4
 3yltDHj6pHlzN8uFMPm53P5NoA0SHVZhBdwiBuic7KSoHLMXipHAQAB7tpqUS0BRCHc8
 pajA==
X-Gm-Message-State: AOAM531nxEzo0vJuC0V/bAmE3ZuAtSg0Ygo0BtC/QT5AOf39EXicrAKt
 R6NXQCQ5KdOkjGUpy2eq9xsNDZwaYBo9In0V34C9QHbHdxMHdvbx0EbM288p/kEZx2wBTlc5unB
 NaFLjSIj9HRMvSb4L0BMMbQH37HRBjS3S1An5qLSiZ2MjzbvayKTLrQda4GdbwiS1
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr36822770wrt.88.1635792206553; 
 Mon, 01 Nov 2021 11:43:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqaJuWFOc17DJo3kuVwUakNDeYQZXBzO2XBCIsQJunrj/QbH+w59C4EBPssg5T74gYfhFJRQ==
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr36822733wrt.88.1635792206360; 
 Mon, 01 Nov 2021 11:43:26 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 c15sm14428464wrs.19.2021.11.01.11.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 11:43:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/10] hw/core: Restrict hotplug to system emulation
Date: Mon,  1 Nov 2021 19:42:54 +0100
Message-Id: <20211101184259.2859090-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101184259.2859090-1-philmd@redhat.com>
References: <20211101184259.2859090-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict hotplug to system emulation, add stubs for the other uses.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20211028150521.1973821-5-philmd@redhat.com>
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
index c9fe6441d92..7ec7bb93d5f 100644
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


