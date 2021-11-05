Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE6E44636B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 13:37:41 +0100 (CET)
Received: from localhost ([::1]:45870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miyTU-0003oE-Jd
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 08:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1miyRV-0008Oj-Ub
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 08:35:37 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:38645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1miyRP-0007uR-Dl
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 08:35:37 -0400
Received: by mail-lf1-x133.google.com with SMTP id x27so18389535lfu.5
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 05:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cpSkSvKBJRtnlxsBqJ6oShjaOqwGvZc609DyfYNdTRQ=;
 b=Wxszon6Q8X7HeMHAFjbkiQHEcuQYBFnmVFDRtnuXgFAi6Bp3JLMxHyZubrlh09gK6r
 3J2weIdKOzGX3EO0DxiVzHyZEsvJfe3at3/p6IaJXUYHsa6vUp0kOfNd65jB65BPyXdP
 ISTiVPs4PZaeuUeJtNoOsMRAgZPuXJHSfaEpv0kvxsE/0Q4NrnIgyN2Un6MV8zSG2ud8
 LEY7rfq+wLlArV1zz1l/GULI+HxS3Zmd+OkClj/W7T9VzKsje/YQ5eajJJJEw79qhpYB
 zMs/Akdgr6+0sSagJStHcJ/RG6Bk7DnJ9znP+b3ew9GdURyFIctC/WIBczBA4iM6EejG
 N9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cpSkSvKBJRtnlxsBqJ6oShjaOqwGvZc609DyfYNdTRQ=;
 b=uI2e3oQBW+6zkOe5L7mxskGDRrNpL5c8tGUezoA0esPxc5n2bdnwZF0BvVI30huFjT
 qmjhLBV07bvaVKRcm+6VvmP3pczWNZ8xu0svpI3zNVumgp1xKSVl4Ya362xbqgwQPdgz
 sB5u0ViGo78x6/O6MHdGw5NUCOWUeegDCmaVeCIKRA71tbDGyspbNtI2iPf+yzzAwLk+
 xoke88DOKZFbFJibNiR27Z8tEqn/KubNjz7LKzyPUApa9fVFy6YQqWGTjCQIhE3gzbsf
 uA6KiJz3J2LD6aAyz1XWBA7Mj6WBXCF5Krg9xQSpt8jDKq/480EHcBd6OPbhDuhI02M5
 sxZw==
X-Gm-Message-State: AOAM531hfygBI0R5RcRYj0mT1yhHMNk3EsQLXpNUFcJ/s6+dHMvBWmPC
 7ITMiaB6GrkCjJWpDL2ov958Bv5H47zJ+g==
X-Google-Smtp-Source: ABdhPJxdPdDOSUHzgE5TA/mCUGgAUn279Ew1E5Yrm4iRIqKuc0iOUWZPBwPzxYVNr1eV0Iq4mDFYwQ==
X-Received: by 2002:ac2:5f9b:: with SMTP id r27mr34493734lfe.20.1636115727664; 
 Fri, 05 Nov 2021 05:35:27 -0700 (PDT)
Received: from localhost.localdomain ([188.187.26.88])
 by smtp.gmail.com with ESMTPSA id a3sm752035ljh.20.2021.11.05.05.35.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Nov 2021 05:35:26 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6] isa-applesmc: provide OSK forwarding on Apple hosts
Date: Fri,  5 Nov 2021 15:34:31 +0300
Message-Id: <20211105123431.46258-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: phil@philjordan.eu, t0rr3sp3dr0@gmail.com, berrange@redhat.com,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, suse@csgraf.de,
 laurent@vivier.eu, f4bug@amsat.org, r.bolshakov@yadro.com, agraf@csgraf.de,
 gsomlo@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Apple hosts we can read AppleSMC OSK key directly from host's
SMC and forward this value to QEMU Guest.

New property 'host_osk_only' added:
  `-device isa-applesmc,hostosk=on`
The property is set to 'on' by default for machine version > 6.1

Apple licence allows use and run up to two additional copies
or instances of macOS operating system within virtual operating system
environments on each Apple-branded computer that is already running
the Apple Software, for purposes of:
- software development
- testing during software development
- using macOS Server
- personal, non-commercial use

Guest macOS requires AppleSMC with correct OSK. The most legal
way to pass it to the Guest is to forward the key from host SMC
without any value exposion.

Based on https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 hw/core/machine.c  |   1 +
 hw/misc/applesmc.c | 115 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 948b3d9524..9f711b7447 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -39,6 +39,7 @@
 
 GlobalProperty hw_compat_6_1[] = {
     { "vhost-user-vsock-device", "seqpacket", "off" },
+    { "isa-applesmc", "hostosk", "off" }
 };
 const size_t hw_compat_6_1_len = G_N_ELEMENTS(hw_compat_6_1);
 
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 1b9acaf1d3..b9ed084667 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -37,6 +37,11 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "qom/object.h"
+#include "qapi/error.h"
+
+#if defined(__APPLE__) && defined(__MACH__)
+#include <IOKit/IOKitLib.h>
+#endif
 
 /* #define DEBUG_SMC */
 
@@ -109,6 +114,7 @@ struct AppleSMCState {
     uint8_t data_pos;
     uint8_t data[255];
     char *osk;
+    bool hostosk;
     QLIST_HEAD(, AppleSMCData) data_def;
 };
 
@@ -312,6 +318,101 @@ static const MemoryRegionOps applesmc_err_io_ops = {
     },
 };
 
+#if defined(__APPLE__) && defined(__MACH__)
+/*
+ * Based on
+ * https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/
+ */
+enum {
+    SMC_HANDLE_EVENT     = 2,
+    SMC_READ_KEY         = 5
+};
+
+struct AppleSMCParam {
+    uint32_t key;
+    uint8_t pad0[22];
+    IOByteCount data_size;
+    uint8_t pad1[10];
+    uint8_t command;
+    uint32_t pad2;
+    uint8_t bytes[32];
+};
+
+static bool applesmc_read_host_osk(char *host_osk, Error **errp)
+{
+    assert(host_osk != NULL);
+
+    io_service_t hostsmc_service = IO_OBJECT_NULL;
+    io_connect_t hostsmc_connect = IO_OBJECT_NULL;
+    size_t smc_param_size = sizeof(struct AppleSMCParam);
+    IOReturn status = kIOReturnError;
+    int i;
+
+    struct AppleSMCParam smc_param[2] = {
+         {
+             .key = ('OSK0'),
+             .data_size = sizeof(smc_param[0].bytes),
+             .command = SMC_READ_KEY,
+         }, {
+             .key = ('OSK1'),
+             .data_size = sizeof(smc_param[0].bytes),
+             .command = SMC_READ_KEY,
+         },
+    };
+
+    hostsmc_service = IOServiceGetMatchingService(
+        kIOMasterPortDefault,
+        IOServiceMatching("AppleSMC"));
+    if (hostsmc_service == IO_OBJECT_NULL) {
+        error_setg(errp, "Unable to get host-AppleSMC service");
+        goto error;
+    }
+
+    status = IOServiceOpen(hostsmc_service,
+                           mach_task_self(),
+                           0,
+                           &hostsmc_connect);
+    if (status != kIOReturnSuccess || hostsmc_connect == IO_OBJECT_NULL) {
+        error_setg(errp, "Unable to open host-AppleSMC service");
+        goto error;
+    }
+
+    for (i = 0; i < ARRAY_SIZE(smc_param); ++i) {
+        status = IOConnectCallStructMethod(
+                hostsmc_connect,
+                SMC_HANDLE_EVENT,
+                &smc_param[i],
+                sizeof(struct AppleSMCParam),
+                &smc_param[i],
+                &smc_param_size
+            );
+
+        if (status != kIOReturnSuccess) {
+            error_setg(errp, "Unable to read OSK from host-AppleSMC");
+            goto error;
+        }
+    }
+
+    memcpy(host_osk, smc_param[0].bytes, 32);
+    memcpy(host_osk + 32, smc_param[1].bytes, 32);
+
+    IOServiceClose(hostsmc_connect);
+    IOObjectRelease(hostsmc_service);
+    return true;
+
+error:
+    IOServiceClose(hostsmc_connect);
+    IOObjectRelease(hostsmc_service);
+    return false;
+}
+#else
+static bool applesmc_read_host_osk(char *host_osk, Error **errp)
+{
+    error_setg(errp, "OSK read is not supported on this host");
+    return false;
+}
+#endif
+
 static void applesmc_isa_realize(DeviceState *dev, Error **errp)
 {
     AppleSMCState *s = APPLE_SMC(dev);
@@ -331,9 +432,18 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
     isa_register_ioport(&s->parent_obj, &s->io_err,
                         s->iobase + APPLESMC_ERR_PORT);
 
-    if (!s->osk || (strlen(s->osk) != 64)) {
-        warn_report("Using AppleSMC with invalid key");
+    if (s->osk && strlen(s->osk) != 64) {
+        /* Only valid OSK is accepted within 'osk' property */
+        error_setg(errp, "Using AppleSMC with invalid key");
+    } else if (s->hostosk) {
+        s->osk = g_malloc0(65);
+        /* Fail hard if we cannot read requested host OSK */
+        if (!applesmc_read_host_osk(s->osk, errp)) {
+            g_assert_not_reached();
+        }
+    } else {
         s->osk = default_osk;
+        warn_report("Using AppleSMC with default (invalid) OSK");
     }
 
     QLIST_INIT(&s->data_def);
@@ -344,6 +454,7 @@ static Property applesmc_isa_properties[] = {
     DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, AppleSMCState, iobase,
                        APPLESMC_DEFAULT_IOBASE),
     DEFINE_PROP_STRING("osk", AppleSMCState, osk),
+    DEFINE_PROP_BOOL("hostosk", AppleSMCState, hostosk, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.23.0


