Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2E1289F2B
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Oct 2020 10:11:10 +0200 (CEST)
Received: from localhost ([::1]:41600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kR9y9-00062M-UP
	for lists+qemu-devel@lfdr.de; Sat, 10 Oct 2020 04:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kR9lI-00043I-Bq
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 03:57:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kR9lD-0006g2-TK
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 03:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602316667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1HuS/ldYTqaXHMm2IQ3F6xjU2L7PLXN0yN5kW8hLwA=;
 b=cBJPB1+tMqd9Gtotyh5gokGTiAdONYK4zHcgSr1Ow8YBsa5NuRi/hq07kJKjGHYsyPGaY2
 0PO1gQDO82CnR4sWrJFjLTxRvZIY4VQSG+hYh1aw/5k3na5rOxj5V5hB4CbkswOBRBL2bn
 KGHE0M2pvWAgup2bE6LrrSEji0lPJas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172--7-XBtGoPZSmXhAcfqG9dQ-1; Sat, 10 Oct 2020 03:57:45 -0400
X-MC-Unique: -7-XBtGoPZSmXhAcfqG9dQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C42E3FF8
 for <qemu-devel@nongnu.org>; Sat, 10 Oct 2020 07:57:44 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC0C36EF4F;
 Sat, 10 Oct 2020 07:57:43 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/39] hw/nvram: Always register FW_CFG_DATA_GENERATOR_INTERFACE
Date: Sat, 10 Oct 2020 03:57:10 -0400
Message-Id: <20201010075739.951385-11-pbonzini@redhat.com>
In-Reply-To: <20201010075739.951385-1-pbonzini@redhat.com>
References: <20201010075739.951385-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/10 03:36:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

While the FW_CFG_DATA_GENERATOR_INTERFACE is only consumed
by a device only available using system-mode (fw_cfg), it is
implemented by a crypto component (tls-cipher-suites) which
is always available when crypto is used.

Commit 69699f3055 introduced the following error in the
qemu-storage-daemon binary:

  $ echo -e \
    '{"execute": "qmp_capabilities"}\r\n{"execute": "qom-list-types"}\r\n{"execute": "quit"}\r\n' \
    | storage-daemon/qemu-storage-daemon --chardev stdio,id=qmp0  --monitor qmp0
  {"QMP": {"version": {"qemu": {"micro": 50, "minor": 1, "major": 5}, "package": ""}, "capabilities": ["oob"]}}
  {"return": {}}
  missing interface 'fw_cfg-data-generator' for object 'tls-creds'
  Aborted (core dumped)

Since QOM dependencies are resolved at runtime, this issue
could not be triggered at linktime, and we don't have test
running the qemu-storage-daemon binary.

Fix by always registering the QOM interface.

Reported-by: Kevin Wolf <kwolf@redhat.com>
Fixes: 69699f3055 ("crypto/tls-cipher-suites: Produce fw_cfg consumable blob")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201006111909.2302081-2-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS                 |  2 +-
 hw/nvram/fw_cfg-interface.c | 23 +++++++++++++++++++++++
 hw/nvram/fw_cfg.c           |  7 -------
 hw/nvram/meson.build        |  3 +++
 4 files changed, 27 insertions(+), 8 deletions(-)
 create mode 100644 hw/nvram/fw_cfg-interface.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e9d85cc873..8d50b96c33 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2055,7 +2055,7 @@ R: Laszlo Ersek <lersek@redhat.com>
 R: Gerd Hoffmann <kraxel@redhat.com>
 S: Supported
 F: docs/specs/fw_cfg.txt
-F: hw/nvram/fw_cfg.c
+F: hw/nvram/fw_cfg*.c
 F: stubs/fw_cfg.c
 F: include/hw/nvram/fw_cfg.h
 F: include/standard-headers/linux/qemu_fw_cfg.h
diff --git a/hw/nvram/fw_cfg-interface.c b/hw/nvram/fw_cfg-interface.c
new file mode 100644
index 0000000000..0e93feeae5
--- /dev/null
+++ b/hw/nvram/fw_cfg-interface.c
@@ -0,0 +1,23 @@
+/*
+ * QEMU Firmware configuration device emulation (QOM interfaces)
+ *
+ * Copyright 2020 Red Hat, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/nvram/fw_cfg.h"
+
+static const TypeInfo fw_cfg_data_generator_interface_info = {
+    .parent = TYPE_INTERFACE,
+    .name = TYPE_FW_CFG_DATA_GENERATOR_INTERFACE,
+    .class_size = sizeof(FWCfgDataGeneratorClass),
+};
+
+static void fw_cfg_register_interfaces(void)
+{
+    type_register_static(&fw_cfg_data_generator_interface_info);
+}
+
+type_init(fw_cfg_register_interfaces)
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 0e95d057fd..08539a1aab 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1360,18 +1360,11 @@ static const TypeInfo fw_cfg_mem_info = {
     .class_init    = fw_cfg_mem_class_init,
 };
 
-static const TypeInfo fw_cfg_data_generator_interface_info = {
-    .parent = TYPE_INTERFACE,
-    .name = TYPE_FW_CFG_DATA_GENERATOR_INTERFACE,
-    .class_size = sizeof(FWCfgDataGeneratorClass),
-};
-
 static void fw_cfg_register_types(void)
 {
     type_register_static(&fw_cfg_info);
     type_register_static(&fw_cfg_io_info);
     type_register_static(&fw_cfg_mem_info);
-    type_register_static(&fw_cfg_data_generator_interface_info);
 }
 
 type_init(fw_cfg_register_types)
diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
index 1f2ed013b2..fd2951a860 100644
--- a/hw/nvram/meson.build
+++ b/hw/nvram/meson.build
@@ -1,3 +1,6 @@
+# QOM interfaces must be available anytime QOM is used.
+qom_ss.add(files('fw_cfg-interface.c'))
+
 softmmu_ss.add(files('fw_cfg.c'))
 softmmu_ss.add(when: 'CONFIG_CHRP_NVRAM', if_true: files('chrp_nvram.c'))
 softmmu_ss.add(when: 'CONFIG_DS1225Y', if_true: files('ds1225y.c'))
-- 
2.26.2



