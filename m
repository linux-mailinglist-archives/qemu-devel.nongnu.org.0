Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A663F48DAB1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:30:45 +0100 (CET)
Received: from localhost ([::1]:45124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n823o-0005p8-Ng
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:30:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n8227-0004s6-U2
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:28:59 -0500
Received: from [2a00:1450:4864:20::132] (port=46026
 helo=mail-lf1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n8225-0008NI-Tt
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:28:59 -0500
Received: by mail-lf1-x132.google.com with SMTP id o12so4098377lfu.12
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 07:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jlFEN3o5BTlavbwrOlCptwCnca4YsheXTpkrYlxzcAM=;
 b=hB0JpolZ0KhstWKJ5I3IjZQmagxLEsel+pqwqF5yNTW7BgbYCRa2NWgD7pjk+Sc6r8
 +kFiSUQBHPZdrBvk8brueJcYUKzdJTK8bmW8/NZLSgWchh+F0I+nZxtYNlNwyB8aCcds
 XlS12x5sCS3WWTKNsyorRnAuc0kXvaxg25pygububvTkCiwWjQPr5em0W7ByR5iF/qEn
 DtRuKRxBEaKqO1yNcYcs/IY1LzSTXYNMoZ/ksHs7z8oEIXGbGa+g8ziWSvQELu1X5P0X
 KVDS3d8RsZw/nASejFoYtiTnsA4Jf3ckTLP+cHV5++Rh0fkOmJ4b7CE3Ig3gS5PAGotH
 SamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jlFEN3o5BTlavbwrOlCptwCnca4YsheXTpkrYlxzcAM=;
 b=RL9YaJ0NBKBSAfDEydhusvwB+6Wkq8hUr3HbSoNrq4o+hiAD5kVYEXbG2tDiGin7Z6
 KVyZwYiu19mh6w51U3z/Lce1r4GXtNF7NdpISibvmc+a29qnvvkLJjw/Lrlf6nUAIM7z
 ytHTrZRqQVg2a7mQxTDcWpZJ9MABbiSw4fUW1NzUnCnvevyN7JmqcwjXxIbIdynoSQ1f
 9ZQXyIRp/IoXazy9zpalgsggnVHx1z81EwM21Hm0+fSW3wcMlTjzc4v16xCpFt/93/m5
 dZMm6SrSbT3908gbqkPx03i2lPGGu07PwfV7/02Kww0d2M3x0pLyNTNQ0dMUqSvtWP6I
 ncRQ==
X-Gm-Message-State: AOAM533oV7bavMcqeOrXJsukJYbHxinXB75Npb4Q+O3p9ntKaIumGG7r
 lnDzp0pHljiIkCeJJZC1YUyJ1suaCnYAe2JQ
X-Google-Smtp-Source: ABdhPJwp49qJ2gKB7SykpT0xK+WP/WO+RwUnnuoGRHchOub7vMI4aVZZUnNW1dstaFWZjKuWI3Fnuw==
X-Received: by 2002:a19:ae1a:: with SMTP id f26mr3653542lfc.270.1642087734982; 
 Thu, 13 Jan 2022 07:28:54 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.20])
 by smtp.gmail.com with ESMTPSA id s20sm283922lfb.264.2022.01.13.07.28.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jan 2022 07:28:54 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8] isa-applesmc: provide OSK forwarding on Apple hosts
Date: Thu, 13 Jan 2022 18:28:36 +0300
Message-Id: <20220113152836.60398-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::132
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: phil@philjordan.eu, t0rr3sp3dr0@gmail.com,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, f4bug@amsat.org,
 laurent@vivier.eu, r.bolshakov@yadro.com, agraf@csgraf.de, pbonzini@redhat.com,
 gsomlo@gmail.com, suse@csgraf.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Apple hosts we can read AppleSMC OSK key directly from host's
SMC and forward this value to QEMU Guest.

New 'hostosk' property is added:
* `-device isa-applesmc,hostosk=on`
The property is set to 'on' by default for machine version > 6.2

Apple licence allows use and run up to two additional copies
or instances of macOS operating system within virtual operating system
environments on each Apple-branded computer that is already running
the Apple Software, for purposes of:
 * software development
 * testing during software development
 * using macOS Server
 * personal, non-commercial use

Guest macOS requires AppleSMC with correct OSK. The most legal
way to pass it to the Guest is to forward the key from host SMC
without any value exposion.

Based on https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 hw/core/machine.c  |   4 +-
 hw/misc/applesmc.c | 125 +++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 125 insertions(+), 4 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index debcdc0e70..ea70be0270 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,7 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_6_2[] = {};
+GlobalProperty hw_compat_6_2[] = {
+    { "isa-applesmc", "hostosk", "off" }
+};
 const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
 
 GlobalProperty hw_compat_6_1[] = {
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 1b9acaf1d3..99bcc937f9 100644
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
 
@@ -80,7 +85,7 @@ enum {
 #define smc_debug(...) do { } while (0)
 #endif
 
-static char default_osk[64] = "This is a dummy key. Enter the real key "
+static char default_osk[65] = "This is a dummy key. Enter the real key "
                               "using the -osk parameter";
 
 struct AppleSMCData {
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
@@ -331,9 +432,26 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
     isa_register_ioport(&s->parent_obj, &s->io_err,
                         s->iobase + APPLESMC_ERR_PORT);
 
-    if (!s->osk || (strlen(s->osk) != 64)) {
-        warn_report("Using AppleSMC with invalid key");
+    if (s->osk && s->hostosk) {
+        error_setg(errp, "-osk property cannot be used with -hostosk=on");
+    }
+
+    if (!s->osk && !s->hostosk) {
         s->osk = default_osk;
+        warn_report("Using AppleSMC with default (dummy) OSK");
+    }
+
+    if (s->hostosk) {
+        s->osk = g_malloc0(65);
+        /* Fail hard if we cannot read requested host OSK */
+        if (!applesmc_read_host_osk(s->osk, errp)) {
+            g_assert_not_reached();
+        }
+    }
+
+    if (s->osk && strlen(s->osk) != 64) {
+        /* Only valid OSK is accepted within 'osk' property */
+        error_setg(errp, "Using AppleSMC with key of invalid length");
     }
 
     QLIST_INIT(&s->data_def);
@@ -344,6 +462,7 @@ static Property applesmc_isa_properties[] = {
     DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, AppleSMCState, iobase,
                        APPLESMC_DEFAULT_IOBASE),
     DEFINE_PROP_STRING("osk", AppleSMCState, osk),
+    DEFINE_PROP_BOOL("hostosk", AppleSMCState, hostosk, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.23.0


