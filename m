Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D025D51545C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 21:19:52 +0200 (CEST)
Received: from localhost ([::1]:43030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkW9f-0003mS-E6
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 15:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1nkW8V-0002wG-V1
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 15:18:40 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:46960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1nkW8T-0007xv-Rk
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 15:18:39 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso5262608wml.5
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 12:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JEJCb/cV1xKK6pat7l/ooDn+lqd8Rp+Be3IDtCQAXX0=;
 b=ejyLnGvY9C0L66y9Jug2vMvFjWizBlz1kQnNbtb5PlBEBO31qIPBy/5isLfDBMn48F
 o6wgb/G5AzumSbqNs79bMhSdrc+pn7O8s9ydyTV1Gz1x2bNpPkOnzSl2iaK5s/LVoFbw
 D0uS1gH1lIwC9TWr7F2XmcO7noK8R0jzLqkT9ogZ7T4CejnANzFjHc4JR3efjbA3NVVn
 8g0hzYD+vZR6RmVsCurkXPyZDB5zrsn0nG6qjWbEa0vj4pi4XTcNTc7Dmb1Tn4T5wuyf
 meBxW44V/ODo3SRUl0Y51+8P+UgNLKn5u+D8ciJX9ItXvtW8fDnb84oT3mas/K3l6OA0
 19OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JEJCb/cV1xKK6pat7l/ooDn+lqd8Rp+Be3IDtCQAXX0=;
 b=z/Dp5T90q70Xeg5l+SbTg8id8Tb0h0Q7RrzJECz7BTEH96H7SYPp5ysfCl3I/MorFl
 psxUPZl4xrhR0RKXfwJUATnTvoASDTJqsO7WeZpgaZsI+baK+pviuwFJMvDYIM9YlNMZ
 qlEiDPbJIcmPJNW5impvPwlT18u8Wq4cpuyJLat6yai0LX2sZbsGnF4GmptltP7SKXDr
 +wT9+RhnjLJabEu3Qb6TwRlWfgMnBqehFyzSI1G4AZZfkpUF7GOmC1HGi5mkBlNIl8gb
 DerMBL9pZGrGO48cKt/pUZwB66vxeFCCGidRM1bv+gGNzMsjwpMsG3UeehDKB7yQjZfz
 ZrDA==
X-Gm-Message-State: AOAM533qStpbq5kaaoj2VwM/8CQkWrqA4l5/NveGtytZsfvH93dDlvhe
 uNf3KAECFBSwQNXwHRFEi3wcI/g3WZnNgsrkmnE=
X-Google-Smtp-Source: ABdhPJyK4ZNwsB1dnEFi8sg17wb3nU6gsytHZOBFtai+rEOCE024nm/0JXqLM0KGFh0qC4Y47BF85w==
X-Received: by 2002:a05:600c:3503:b0:392:943f:c53d with SMTP id
 h3-20020a05600c350300b00392943fc53dmr4552259wmq.197.1651259915769; 
 Fri, 29 Apr 2022 12:18:35 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-3-121-162-165.eu-central-1.compute.amazonaws.com. [3.121.162.165])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a05600c0b4800b003942a244f3asm26788wmr.19.2022.04.29.12.18.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Apr 2022 12:18:35 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10] isa-applesmc: provide OSK forwarding on Apple hosts
Date: Fri, 29 Apr 2022 22:18:27 +0300
Message-Id: <20220429191827.8917-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, phil@philjordan.eu, t0rr3sp3dr0@gmail.com,
 imammedo@redhat.com, jan.kiszka@siemens.com, f4bug@amsat.org,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, armbru@redhat.com,
 gsomlo@gmail.com, marcandre.lureau@redhat.com, rene@exactcode.de,
 ehabkost@redhat.com, marcel.a@redhat.com, alistair.francis@xilinx.com,
 r.bolshakov@yadro.com, agraf@csgraf.de, suse@csgraf.de, berrange@redhat.com,
 laurent@vivier.eu, chetan4windows@gmail.com, pbonzini@redhat.com,
 afaerber@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Apple hosts we can read AppleSMC OSK key directly from host's
SMC and forward this value to QEMU Guest.

New 'hostosk' property is added:
* `-device isa-applesmc,hostosk=on`
The property is set to 'on' by default for machine version > 7.0

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
index cb9bbc844d..7f4a27406a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,7 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_7_0[] = {};
+GlobalProperty hw_compat_7_0[] = {
+    { "isa-applesmc", "hostosk", "off" }
+};
 const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
 
 GlobalProperty hw_compat_6_2[] = {
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 81cd6b6423..8672c9d56e 100644
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
2.34.1.vfs.0.0


