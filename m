Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37F44375DF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 13:12:34 +0200 (CEST)
Received: from localhost ([::1]:43280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdsTR-0001lc-DG
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 07:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mdsRI-0000LA-8Z; Fri, 22 Oct 2021 07:10:20 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:43580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mdsRE-00026o-Dz; Fri, 22 Oct 2021 07:10:19 -0400
Received: by mail-lj1-x22e.google.com with SMTP id o11so1871061ljg.10;
 Fri, 22 Oct 2021 04:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6PZV69uqafogNUFNEMllTNDiKy0mGVq+k6zGsLppAiY=;
 b=jVW5/1QdnVN1eaJ2JGgYJXPHUp8tncZtQPEhXsmEDHYoXGurc+uxP5JIeIDLcOlWPo
 ASOlANDjLeGQvyMB0s9gsfjkvhA0dCc8DhbFSXRN5JSKXH+rELBOpvkBZw/uK8FRGu0c
 RkQlodibhFB34IbD5BDAUjhqfK4pAWdBoqBHiTegXTEmAzbaCf/sQBxl2Xg/ImxtyPn9
 nVhqGrO7qb31ErruXztPPuLkoSX68R+CTOHEI7++KY/VSDqHMpi97TAWJAALxVhLEbWO
 2hILESs9yCd3rWUYH+F9QurKZPAqO/PbzDDHzDztmy8xlIaQunMimp8MY7VitiLWynk2
 MMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6PZV69uqafogNUFNEMllTNDiKy0mGVq+k6zGsLppAiY=;
 b=Jfa5DXYN0ZeOffDfdRhTxPxnrDoOy4dkEvx4iULhPzH6m2k+VBYzEqMeiI+XIlSeiE
 yGipH/4whetaVaU3nNhl3vxOv/4MJkWX9BuFshU9xTO/wh1L/IhbLhe32GpLX0mR9s0j
 4xIRXQhjOUAoCxH6OYnjhcQzBpb0eiDixTlsu0ZlxXzF+GFoyMLftnt9JRViFRUOJopa
 vyMEzbC8jHoCXrbAr94stIt+BKhsHAEAyJ5MFOdKkK0o1hYFWA7xI2XUbult4CDk0Xcj
 XM64eXsrP0wCUyzFWXEylWizNL1B659z5bnEvou7U+n6Acwplc5ghjAZkzj+4qUezIxT
 Jv2w==
X-Gm-Message-State: AOAM532D1WbfP3MPTM9cbw/GpdOipuPjsz3fV517OIUeWJ71igz7qktu
 nomuy6Bgco+D72oaSr+M0b6Bbhw+kUgyXA==
X-Google-Smtp-Source: ABdhPJx19yI2yOA4+TkQ89cWLAjg83USkiG9/NnZ9yCdIXIXFa55qNt2TDBDUzeY/Iroho7bI457dQ==
X-Received: by 2002:a2e:918e:: with SMTP id f14mr12668951ljg.501.1634901013833; 
 Fri, 22 Oct 2021 04:10:13 -0700 (PDT)
Received: from localhost.localdomain ([77.234.205.3])
 by smtp.gmail.com with ESMTPSA id k18sm856029ljk.26.2021.10.22.04.10.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Oct 2021 04:10:13 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] isa-applesmc: provide OSK forwarding on Apple hosts
Date: Fri, 22 Oct 2021 14:10:07 +0300
Message-Id: <20211022111007.43478-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x22e.google.com
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
 agraf@suse.de, f4bug@amsat.org, r.bolshakov@yadro.com, suse@csgraf.de
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
 hw/misc/applesmc.c | 147 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 146 insertions(+), 1 deletion(-)

diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 1b9acaf1d3..bcc021f7b7 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -38,6 +38,10 @@
 #include "qemu/timer.h"
 #include "qom/object.h"
 
+#if defined(__APPLE__)
+#include <IOKit/IOKitLib.h>
+#endif
+
 /* #define DEBUG_SMC */
 
 #define APPLESMC_DEFAULT_IOBASE        0x300
@@ -108,6 +112,7 @@ struct AppleSMCState {
     uint8_t data_len;
     uint8_t data_pos;
     uint8_t data[255];
+    char *hostosk_flag;
     char *osk;
     QLIST_HEAD(, AppleSMCData) data_def;
 };
@@ -312,9 +317,136 @@ static const MemoryRegionOps applesmc_err_io_ops = {
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
+static int applesmc_read_host_osk(char **host_osk)
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
+        warn_report("host AppleSMC device is unreachable");
+        goto error_osk_buffer_free;
+    }
+
+    status = IOServiceOpen(hostsmc_service,
+                           mach_task_self(),
+                           1,
+                           &hostsmc_connect);
+    if (status != kIOReturnSuccess || hostsmc_connect == IO_OBJECT_NULL) {
+        warn_report("host AppleSMC device is unreachable");
+        goto error_osk_buffer_free;
+    }
+
+    status = IOConnectCallMethod(
+        hostsmc_connect,
+        SMC_CLIENT_OPEN,
+        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL
+    );
+    if (status != kIOReturnSuccess) {
+        warn_report("host AppleSMC device is unreachable");
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
+        warn_report("unable to read OSK0 from host AppleSMC device");
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
+        warn_report("unable to read OSK1 from host AppleSMC device");
+        goto error_ioconnect_close;
+    }
+    strncpy((*host_osk) + 32, (const char *) out.bytes, 32);
+
+    IOConnectCallMethod(
+        hostsmc_connect,
+        SMC_CLIENT_CLOSE,
+        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL);
+    IOServiceClose(hostsmc_connect);
+    return 0;
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
+    return -1;
+}
+#else
+static int applesmc_read_host_osk(char **output_key)
+{
+    warn_report("isa-applesmc.hostosk ignored: "
+                "unsupported on non-Apple hosts");
+    return -1;
+}
+#endif
+
 static void applesmc_isa_realize(DeviceState *dev, Error **errp)
 {
-    AppleSMCState *s = APPLE_SMC(dev);
+    AppleSMCState   *s = APPLE_SMC(dev);
+    char            *host_osk;
 
     memory_region_init_io(&s->io_data, OBJECT(s), &applesmc_data_io_ops, s,
                           "applesmc-data", 1);
@@ -331,6 +463,18 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
     isa_register_ioport(&s->parent_obj, &s->io_err,
                         s->iobase + APPLESMC_ERR_PORT);
 
+    /* Key retrieved from host SMC overwrites provided OSK string */
+    if (s->hostosk_flag
+        && !strcmp("on", s->hostosk_flag)
+        && !applesmc_read_host_osk(&host_osk)) {
+        if (s->osk) {
+            warn_report("provided isa-applesmc.osk "
+                        "is overwritten with host OSK");
+            g_free(s->osk);
+        }
+        s->osk = host_osk;
+    }
+
     if (!s->osk || (strlen(s->osk) != 64)) {
         warn_report("Using AppleSMC with invalid key");
         s->osk = default_osk;
@@ -344,6 +488,7 @@ static Property applesmc_isa_properties[] = {
     DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, AppleSMCState, iobase,
                        APPLESMC_DEFAULT_IOBASE),
     DEFINE_PROP_STRING("osk", AppleSMCState, osk),
+    DEFINE_PROP_STRING("hostosk", AppleSMCState, hostosk_flag),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.23.0


