Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F63437AD3
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 18:21:24 +0200 (CEST)
Received: from localhost ([::1]:49936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdxII-0002Z3-5o
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 12:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mdxD5-0005Aq-DQ; Fri, 22 Oct 2021 12:15:59 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:36551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mdxD2-0005T8-UR; Fri, 22 Oct 2021 12:15:59 -0400
Received: by mail-lf1-x12d.google.com with SMTP id g36so1698556lfv.3;
 Fri, 22 Oct 2021 09:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EvDCHWnksCSisypyIi5MkBKJA+rl9od5gVKT6Ixycns=;
 b=I/CJJtN+1Bp4VPRUJ091hKT3d8VQCQOyucO1I1PlAbRZkv2O25l2crC0+0W/Qg6Eo5
 TZYwiFnM3mvXUvPfOiQAwP0PATTjy8XtZ+ANuLbGR+VShsib0jchzCyg4OmqspDR7Gdl
 X01aAtp50DD0ks1vBWVDtd2OMM4djfy1hl2Ztv9vZX+fYDaqweURml51c/FX2Sv+kN2w
 cUdWvp2t22DdhGhFIhYlvY88ZznuMMLw7/uDRYn0IoAdwdbb2TPnV8V8kKkVTWnyhWO6
 +FVsThXwrifx7crRLkTfETLt39O7It7Ozm2O6y4ZiDtAQF0DBHB+1cYWhrSxMGA+DIzn
 WSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EvDCHWnksCSisypyIi5MkBKJA+rl9od5gVKT6Ixycns=;
 b=w0Cg2MWaNIZqSeBjbbXlo4Hmfyuofk+fNZNbf03Wf2bdiT5IkLJK+dv1H0LXLjzbi7
 hc33DN8WuaRnuU5tuGo9+jXKjQdFBU3IJrEcHvzdYtvD2/vBfLc1LQtMiP+yvAD8m0/f
 NqctyeN3SmpTbvDgb3Tf0kbFX5/vOqP9vUUlhYzR58DidzqDn20W4lX0VJ/kvKIwyjKr
 Jqe9vtUWXQ8Y2m6CZ3/SgD4jIKz0Jvlnuo+BV4JqPPbHueTv1sofbUdhXmc+MTrbm7e/
 4EJXlCx/P/IRAd4bwPYMbheAdMLu6HkBVt2F4UHZArRo6LUxduKzhoROVKgIAgLBruet
 fL8g==
X-Gm-Message-State: AOAM532he+/k+0QurVfxekdeH8CvosLd7IUdqNx1lqDSh07U6wf5KDzt
 qtG1svdQJb9Mz5Qram/JgegJkKCnCJrNZw==
X-Google-Smtp-Source: ABdhPJxSN9p/Zrm81huqjOZnlzxAtI5PmsMPppapAw9BiSSa31I5ekuWdQX+4I86zjx75X9fAXW6yw==
X-Received: by 2002:a05:6512:3107:: with SMTP id
 n7mr581341lfb.179.1634919354400; 
 Fri, 22 Oct 2021 09:15:54 -0700 (PDT)
Received: from localhost.localdomain ([77.234.205.3])
 by smtp.gmail.com with ESMTPSA id o26sm933909ljg.92.2021.10.22.09.15.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Oct 2021 09:15:54 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4] isa-applesmc: provide OSK forwarding on Apple hosts
Date: Fri, 22 Oct 2021 19:14:48 +0300
Message-Id: <20211022161448.81579-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12d.google.com
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
Cc: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, qemu-trivial@nongnu.org,
 laurent@vivier.eu, agraf@suse.de, r.bolshakov@yadro.com, suse@csgraf.de,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Apple hosts we can read AppleSMC OSK key directly from host's
SMC and forward this value to QEMU Guest.

Usage:
`-device isa-applesmc,hostosk=on`

Apple licence allows use and run up to two additional copies
or instances of macOS operating within virtual operating system
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
 hw/misc/applesmc.c | 155 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 154 insertions(+), 1 deletion(-)

diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 1b9acaf1d3..6bdec0063b 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -37,6 +37,11 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "qom/object.h"
+#include "qapi/error.h"
+
+#if defined(__APPLE__)
+#include <IOKit/IOKitLib.h>
+#endif
 
 /* #define DEBUG_SMC */
 
@@ -108,6 +113,7 @@ struct AppleSMCState {
     uint8_t data_len;
     uint8_t data_pos;
     uint8_t data[255];
+    bool hostosk_flag;
     char *osk;
     QLIST_HEAD(, AppleSMCData) data_def;
 };
@@ -312,9 +318,136 @@ static const MemoryRegionOps applesmc_err_io_ops = {
     },
 };
 
+#if defined(__APPLE__)
+/*
+ * Based on
+ * https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/
+ */
+enum {
+    SMC_CLIENT_OPEN      = 0,
+    SMC_CLIENT_CLOSE     = 1,
+    SMC_HANDLE_EVENT     = 2,
+    SMC_READ_KEY         = 5
+};
+
+struct AppleSMCParam {
+    uint32_t    key;
+    uint8_t     pad0[22];
+    IOByteCount data_size;
+    uint8_t     pad1[10];
+    uint8_t     command;
+    uint32_t    pad2;
+    uint8_t     bytes[32];
+};
+
+static bool applesmc_read_host_osk(char **host_osk, Error **errp)
+{
+    assert(host_osk != NULL);
+
+    io_service_t            hostsmc_service = IO_OBJECT_NULL;
+    io_connect_t            hostsmc_connect = IO_OBJECT_NULL;
+    size_t                  out_size = sizeof(struct AppleSMCParam);
+    IOReturn                status = kIOReturnError;
+    struct AppleSMCParam    in = {0};
+    struct AppleSMCParam    out = {0};
+
+    /* OSK key size + '\0' */
+    *host_osk = g_malloc0(65);
+    (*host_osk)[64] = '\0';
+
+    hostsmc_service = IOServiceGetMatchingService(kIOMasterPortDefault,
+                                          IOServiceMatching("AppleSMC"));
+    if (hostsmc_service == IO_OBJECT_NULL) {
+        error_setg(errp, "Unable to get host-AppleSMC service");
+        goto error_osk_buffer_free;
+    }
+
+    status = IOServiceOpen(hostsmc_service,
+                           mach_task_self(),
+                           1,
+                           &hostsmc_connect);
+    if (status != kIOReturnSuccess || hostsmc_connect == IO_OBJECT_NULL) {
+        error_setg(errp, "Unable to open host-AppleSMC service");
+        goto error_osk_buffer_free;
+    }
+
+    status = IOConnectCallMethod(
+        hostsmc_connect,
+        SMC_CLIENT_OPEN,
+        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL
+    );
+    if (status != kIOReturnSuccess) {
+        error_setg(errp, "Unable to connect to host-AppleSMC");
+        goto error_ioservice_close;
+    }
+
+    in.key = ('OSK0');
+    in.data_size = sizeof(out.bytes);
+    in.command = SMC_READ_KEY;
+    status = IOConnectCallStructMethod(
+        hostsmc_connect,
+        SMC_HANDLE_EVENT,
+        &in,
+        sizeof(struct AppleSMCParam),
+        &out,
+        &out_size
+    );
+
+    if (status != kIOReturnSuccess) {
+        error_setg(errp, "Unable to read OSK0 from host-AppleSMC");
+        goto error_ioconnect_close;
+    }
+    strncpy(*host_osk, (const char *) out.bytes, 32);
+
+    in.key = ('OSK1');
+    in.data_size = sizeof(out.bytes);
+    in.command = SMC_READ_KEY;
+    status = IOConnectCallStructMethod(
+        hostsmc_connect,
+        SMC_HANDLE_EVENT,
+        &in,
+        sizeof(struct AppleSMCParam),
+        &out,
+        &out_size
+    );
+    if (status != kIOReturnSuccess) {
+        error_setg(errp, "Unable to read OSK1 from host-AppleSMC");
+        goto error_ioconnect_close;
+    }
+    strncpy((*host_osk) + 32, (const char *) out.bytes, 32);
+
+    IOConnectCallMethod(
+        hostsmc_connect,
+        SMC_CLIENT_CLOSE,
+        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL);
+    IOServiceClose(hostsmc_connect);
+    return true;
+
+error_ioconnect_close:
+    IOConnectCallMethod(
+        hostsmc_connect,
+        SMC_CLIENT_CLOSE,
+        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL);
+error_ioservice_close:
+    IOServiceClose(hostsmc_connect);
+
+error_osk_buffer_free:
+    g_free(*host_osk);
+    return false;
+}
+#else
+static bool applesmc_read_host_osk(char **output_key, Error **errp)
+{
+    error_setg(errp, "isa-applesmc.hostosk ignored: "
+                     "unsupported on non-Apple hosts");
+    return false;
+}
+#endif
+
 static void applesmc_isa_realize(DeviceState *dev, Error **errp)
 {
-    AppleSMCState *s = APPLE_SMC(dev);
+    AppleSMCState   *s = APPLE_SMC(dev);
+    Error           *err = NULL;
 
     memory_region_init_io(&s->io_data, OBJECT(s), &applesmc_data_io_ops, s,
                           "applesmc-data", 1);
@@ -331,6 +464,25 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
     isa_register_ioport(&s->parent_obj, &s->io_err,
                         s->iobase + APPLESMC_ERR_PORT);
 
+    if (s->hostosk_flag) {
+        /*
+         * Property 'hostosk' has higher priority than 'osk'
+         * and shadows it.
+         * Free user-provided 'osk' property value
+         */
+        if (s->osk) {
+            warn_report("isa-applesmc.osk is shadowed "
+                        "by isa-applesmc.hostosk");
+            g_free(s->osk);
+        }
+
+        if (!applesmc_read_host_osk(&s->osk, &err)) {
+            /* On host OSK retrieval error report a warning */
+            error_report_err(err);
+            s->osk = default_osk;
+        }
+    }
+
     if (!s->osk || (strlen(s->osk) != 64)) {
         warn_report("Using AppleSMC with invalid key");
         s->osk = default_osk;
@@ -344,6 +496,7 @@ static Property applesmc_isa_properties[] = {
     DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, AppleSMCState, iobase,
                        APPLESMC_DEFAULT_IOBASE),
     DEFINE_PROP_STRING("osk", AppleSMCState, osk),
+    DEFINE_PROP_BOOL("hostosk", AppleSMCState, hostosk_flag, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.23.0


