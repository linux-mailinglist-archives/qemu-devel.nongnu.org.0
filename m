Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAB64398A1
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:32:21 +0200 (CEST)
Received: from localhost ([::1]:49274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf11Q-0005Et-Dx
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mf0w3-0007VN-5d
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:26:47 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:34422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mf0w0-0002Yh-8q
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:26:46 -0400
Received: by mail-lj1-x22a.google.com with SMTP id h11so1289154ljk.1
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 07:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R3/fvc60gWHtPZvEZfJwa0LEeUy1F2FAV72MDJGcmhE=;
 b=XfP/DPkmcbt07DpdBEJ8P/zuxezGImVDeirCUtAhWPmFxEhPvyJfuFiEkEqpl4P/3z
 PXRz1AxXx76NbkKY7hm+lyxMgdcHxrwfTKwRd1k2BVqBp0l2JV5XNR6DeK5vcjKTid1h
 UevoZSzRmo+iSmECU+t/9a2i/Ytn5ObOWiyfZ+M3Z/6Prd3KU4sq2UaVloXOMh+izeHK
 IHzOpVKRCe9879L8kuorE6EuQ5tDXL3PL8g9cxnTCw2LWl/73MEuTJYyOCRt/tCQMTdd
 B6LDGKeu9Rn65DWcU979bmbU1vOXJ7c2HGMjbTvv16G3RDbrvit59PWcUO7ee/un8+bw
 Kipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R3/fvc60gWHtPZvEZfJwa0LEeUy1F2FAV72MDJGcmhE=;
 b=0O8RooNz9rWMilsd6VhcRtRIT5GfQklUsO98r7PKPW0llsQTR7EXBVT5MxQhPj+EBc
 hMDTS2ip/LfyiQ6w/ysO214FiyUaW7gp93orsk+KVWgNpayV/EAI8ekN09ZWLPpT846L
 s9i7ovvVl7/6VRqX/mMJbnRZtP2wB5xtySMjNj26NvvACx9EAmRPGJuO/Ig9j/WKQNSY
 yEcOTxT2bB1iq/rDvj2lTAChPLjkP3SslO3cQ3as2RDQk6JWz8iJjVqZkQCXdjgIR8Xg
 9N38zr566jp1BIOw9u7Rh8wGP1R6hvhIoMNw31y/O7rl8OhdJBguULqnbaK/jAHPnLt9
 1B6g==
X-Gm-Message-State: AOAM530NghQCA22+azuO6+yzkqNVgq+VmN2cS7HvtRnRQULOYkzw5ZaP
 3FppKAX+APQUmv2/3EL098+HXYIicPuhU4/Q
X-Google-Smtp-Source: ABdhPJyl+PrpoFpq8Da2vTXxaFhMCTdOeWaX4B6fjCano0nmXelupdt4ZaEQuGZdH9n68xhIJFtP2w==
X-Received: by 2002:a05:651c:b22:: with SMTP id
 b34mr19634173ljr.306.1635172002104; 
 Mon, 25 Oct 2021 07:26:42 -0700 (PDT)
Received: from UNIT-808.labs.intellij.net ([91.132.204.20])
 by smtp.gmail.com with ESMTPSA id a16sm1658140lfu.274.2021.10.25.07.26.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Oct 2021 07:26:41 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5] isa-applesmc: provide OSK forwarding on Apple hosts
Date: Mon, 25 Oct 2021 17:21:38 +0300
Message-Id: <20211025142138.9393-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x22a.google.com
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
Cc: phil@philjordan.eu, t0rr3sp3dr0@gmail.com,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, f4bug@amsat.org,
 laurent@vivier.eu, r.bolshakov@yadro.com, agraf@csgraf.de, pbonzini@redhat.com,
 gsomlo@gmail.com, suse@csgraf.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Apple hosts we can read AppleSMC OSK key directly from host's
SMC and forward this value to QEMU Guest.

Usage:
`-device isa-applesmc,osk=host`

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

Enable this feature by default on Apple devices

Based on https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 hw/misc/applesmc.c | 121 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 1b9acaf1d3..6bd2584ca0 100644
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
 
@@ -312,9 +317,106 @@ static const MemoryRegionOps applesmc_err_io_ops = {
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
+    uint32_t    key;
+    uint8_t     pad0[22];
+    IOByteCount data_size;
+    uint8_t     pad1[10];
+    uint8_t     command;
+    uint32_t    pad2;
+    uint8_t     bytes[32];
+};
+
+static bool applesmc_read_host_osk(char *host_osk, Error **errp)
+{
+    assert(host_osk != NULL);
+
+    io_service_t    hostsmc_service = IO_OBJECT_NULL;
+    io_connect_t    hostsmc_connect = IO_OBJECT_NULL;
+    size_t          smc_param_size = sizeof(struct AppleSMCParam);
+    IOReturn        status = kIOReturnError;
+    int             i;
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
+    error_setg(errp, "isa-applesmc.osk=host ignored: "
+                     "unsupported on non-Apple hosts");
+    return false;
+}
+#endif
+
 static void applesmc_isa_realize(DeviceState *dev, Error **errp)
 {
     AppleSMCState *s = APPLE_SMC(dev);
+    Error *err = NULL;
 
     memory_region_init_io(&s->io_data, OBJECT(s), &applesmc_data_io_ops, s,
                           "applesmc-data", 1);
@@ -331,6 +433,25 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
     isa_register_ioport(&s->parent_obj, &s->io_err,
                         s->iobase + APPLESMC_ERR_PORT);
 
+#if defined(__APPLE__) && defined(__MACH__)
+    /* Enable osk='host' on Apple devices by default */
+    if (!s->osk) {
+        s->osk = g_strdup("host");
+    }
+#endif
+
+    /* Overloaded property: osk='host' forces OSK reading from host AppleSMC */
+    if (s->osk && !strcmp(s->osk, "host")) {
+        g_free(s->osk);
+        s->osk = g_malloc0(65);
+
+        if (!applesmc_read_host_osk(s->osk, &err)) {
+            /* host OSK retrieval error only causes a warning, not a failure */
+            error_report_err(err);
+            s->osk = default_osk;
+        }
+    }
+
     if (!s->osk || (strlen(s->osk) != 64)) {
         warn_report("Using AppleSMC with invalid key");
         s->osk = default_osk;
-- 
2.23.0


