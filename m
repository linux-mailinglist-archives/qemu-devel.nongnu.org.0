Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E0266C3E7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:31:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRQh-0001HK-3S; Mon, 16 Jan 2023 10:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHRQe-0001GV-OZ; Mon, 16 Jan 2023 10:29:44 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHRQc-00086l-Nv; Mon, 16 Jan 2023 10:29:44 -0500
Received: by mail-ej1-x630.google.com with SMTP id v6so25908363ejg.6;
 Mon, 16 Jan 2023 07:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mn7/sU+mJfr3T8mTQw8ks77RVyjE2mSYXhGvMHZOqAQ=;
 b=BVcWA/nWBRUylsQS1tnSL0Yv8kdBJhhU3MOjBKw/tJSGH0PDoS7nImubVrleYPsc7I
 vFZ1m5VzV1Ngp/JJidY3ZsDEMcMUurDOHsq64qRk2PncvrkxW5aV1FJji2Y2DYZtekTf
 sqouZ+aU9O8OWK4TN0L0hXTiWtAyidQGbIg6BRD9rgec5qn7AGfEkfp/q62wFN8dI2Uv
 +tulGb7IBtO/2ghWJr87o5khaKzNJHHY9bT3eeetnB6M3Rc+XYZ2sYea13cxnchZlr95
 smTX2KGaZMZCNMXNDIZb5L8g3AHYUHL83/gSAMq0+qfVELVrOzL12ykwePCuxcCFkNPz
 SvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mn7/sU+mJfr3T8mTQw8ks77RVyjE2mSYXhGvMHZOqAQ=;
 b=62VVBojN1kVlR9jTpukD4Ph/bSdICKDooNc4YcTHee3wObMLSPpaeSEEgSQSihh1rP
 tNn9Yl9tiMJlPhXxvd48Aqtcqy6YWLTee34zuNlXZnCFa76qcRd+dvj3UA0MtFgDvAu8
 mHqSGs7nxtXJ5en9OltmwsI+BUAePV4d0FtOyt4UWIWTpxWKo7Jg7MhQMfkPCTpPgC34
 U2LVuVk3fKOuJarg2Z3qZP2HaEPCUwgVSDe7TTafTF2UnPB4SRDJ/RRwjXRdlIinXC1Y
 FPZMkqWWUunU1D4Rtc8h61vs0xB/q1Bhlw6EdESWCbAuwwu2IeguERwa7fDXlNeOETHX
 AIVQ==
X-Gm-Message-State: AFqh2krH0NvzNXAffHf8RiRbvg3NCD4IJjuasUGXbvUcp4HJfYl0FDjk
 7nJ0s4aAcKvKVXnDaMY7eNEZIk4iL4k=
X-Google-Smtp-Source: AMrXdXucuKU9T1EG0zEyDCYc9EPlDMz+tbDlD/YIxb5DN0HsZmUWNOabaPTfwqAIrPbiOkUM5MaKXg==
X-Received: by 2002:a17:907:8196:b0:7c1:6fd3:1efa with SMTP id
 iy22-20020a170907819600b007c16fd31efamr11315693ejc.28.1673882980854; 
 Mon, 16 Jan 2023 07:29:40 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-191-143-217.77.191.pool.telefonica.de. [77.191.143.217])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170906b08300b007c0688a68cbsm12180764ejy.176.2023.01.16.07.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 07:29:40 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 3/7] hw/acpi/acpi_dev_interface: Remove now unused #include
 "hw/boards.h"
Date: Mon, 16 Jan 2023 16:29:04 +0100
Message-Id: <20230116152908.147275-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116152908.147275-1-shentey@gmail.com>
References: <20230116152908.147275-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Removing the "hw/boards.h" include from hw/acpi/acpi_dev_interface.h
requires include fixes in various unrelated files to keep the code
compiling.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/acpi/hmat.h                       | 3 ++-
 include/hw/acpi/acpi_dev_interface.h | 1 -
 hw/acpi/cpu.c                        | 1 +
 hw/acpi/hmat.c                       | 1 +
 hw/acpi/memory_hotplug.c             | 1 +
 monitor/qmp-cmds.c                   | 1 +
 6 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/hmat.h b/hw/acpi/hmat.h
index b57f0e7e80..fd989cb661 100644
--- a/hw/acpi/hmat.h
+++ b/hw/acpi/hmat.h
@@ -27,7 +27,8 @@
 #ifndef HMAT_H
 #define HMAT_H
 
-#include "hw/acpi/aml-build.h"
+#include "hw/acpi/bios-linker-loader.h"
+#include "sysemu/numa.h"
 
 /*
  * ACPI 6.3: 5.2.27.3 Memory Proximity Domain Attributes Structure,
diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index ca92928124..68d9d15f50 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -3,7 +3,6 @@
 
 #include "qapi/qapi-types-acpi.h"
 #include "qom/object.h"
-#include "hw/boards.h"
 #include "hw/qdev-core.h"
 
 /* These values are part of guest ABI, and can not be changed */
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index db15f9278d..bc77c00d66 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -1,6 +1,7 @@
 #include "qemu/osdep.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/cpu.h"
+#include "hw/core/cpu.h"
 #include "qapi/error.h"
 #include "qapi/qapi-events-acpi.h"
 #include "trace.h"
diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
index 3a6d51282a..d9de0daf89 100644
--- a/hw/acpi/hmat.c
+++ b/hw/acpi/hmat.c
@@ -27,6 +27,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "sysemu/numa.h"
+#include "hw/acpi/aml-build.h"
 #include "hw/acpi/hmat.h"
 
 /*
diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index d926f4f77d..0b883df813 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -1,6 +1,7 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/mem/pc-dimm.h"
+#include "hw/boards.h"
 #include "hw/qdev-core.h"
 #include "migration/vmstate.h"
 #include "trace.h"
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 2932b3f3a5..45b0f2905d 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -44,6 +44,7 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/intc/intc.h"
 #include "hw/rdma/rdma.h"
+#include "hw/boards.h"
 #include "monitor/stats.h"
 
 NameInfo *qmp_query_name(Error **errp)
-- 
2.39.0


