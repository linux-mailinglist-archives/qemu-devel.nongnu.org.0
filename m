Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8469943759A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 12:39:59 +0200 (CEST)
Received: from localhost ([::1]:52986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdrxu-0003hk-LP
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 06:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mdrwW-0001qG-C7; Fri, 22 Oct 2021 06:38:32 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:35527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mdrwT-00007t-QL; Fri, 22 Oct 2021 06:38:31 -0400
Received: by mail-lf1-x12b.google.com with SMTP id p16so2400214lfa.2;
 Fri, 22 Oct 2021 03:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Dlcwtqr+zlOEtOxbxwh8vyGEEfN4+aDPfcwb1tqsxw=;
 b=GeLFyYNHWmUP1QSdTPrl7JvYQgYEJUQ7YCdTMi6gz2xZmDe2rfWOe0TQVg6xY0hyiC
 RH8LoB9ZFjCr+PdC9Pc5VtdL6NaencU1A6JwOXC5uYcs3A+UOITMI/mwPZ8pt77dTGP2
 evBCE9oUSPl/j8REiaZL25+k79SZXhs2P+495BAMVP2BeE0/Km59tvUcffJ9ej5g0EHO
 7RKR9f7jKZK11UaqrspAxo6miSMhJerEi5Y9smAmDYOEqMeTpObb0CF12r+HHE2V4Afg
 pXolhgGZk/kVPD9oIog6HJbDHsEPZh8hcLG+z2pFY08dOkORsnGjiQSkatIux9KYoWQD
 v0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Dlcwtqr+zlOEtOxbxwh8vyGEEfN4+aDPfcwb1tqsxw=;
 b=RWdyIYgF/xC3lh6s3z+L6YJ6Vw+wn7M9gw22x0JGLF5Qxc/yDGxDsYqHMOb3ifcNOV
 ewia+m8cyAGm6ZPC4V5rrd8iVuE9Aw3wzP+vZ1Kin4sclJrc0Um8A5wVEERcqqqm1pF7
 pf7mpBnpp6ovkulaTk2+J/HYB5iWOgfji/r7LrqsokRF0k42GbLTyAZ0qFKKGOd19w+Z
 lFcTGYUM7Qf0I+fX2wx3Sjpy8B6dnsAorjup+RQW014GKn2YXyo64Yv6aBo2ZwKp+JmI
 yelk9rD3L+g8DelMlsd77VHCDRry402J0fMKWjYA6x+ITYvtQkdfTuC4imvBk+TQqJyo
 XMDA==
X-Gm-Message-State: AOAM532RdG8uKEHrebpWB7bw+xxWFIzs61EKedM3vp63d2mquHYFgUSq
 tBP6jyfLiTmU8S42ZTMdafIaGlrPmuunuA==
X-Google-Smtp-Source: ABdhPJzbnvWvNVwrH15kMoM+Bx3e2r5epy/PzDT2mfSa0LatkwzAHoRFXxLa2exGYODPsw08A2uCJw==
X-Received: by 2002:ac2:5c12:: with SMTP id r18mr10574000lfp.251.1634899106866; 
 Fri, 22 Oct 2021 03:38:26 -0700 (PDT)
Received: from localhost.localdomain ([77.234.205.3])
 by smtp.gmail.com with ESMTPSA id z13sm860178ljk.70.2021.10.22.03.38.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Oct 2021 03:38:26 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] isa-applesmc: provide OSK forwarding on Apple hosts
Date: Fri, 22 Oct 2021 13:38:01 +0300
Message-Id: <20211022103801.19620-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12b.google.com
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
Cc: qemu-trivial@nongnu.org, suse@csgraf.de, r.bolshakov@yadro.com,
 agraf@suse.de, Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
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

Based on http://osxbook.com/book/bonus/chapter7/tpmdrmmyth/

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 hw/misc/applesmc.c | 144 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 143 insertions(+), 1 deletion(-)

diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 1b9acaf1d3..6986ab0028 100644
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
@@ -312,9 +317,133 @@ static const MemoryRegionOps applesmc_err_io_ops = {
     },
 };
 
+#if defined(__APPLE__)
+/* Based on http://osxbook.com/book/bonus/chapter7/tpmdrmmyth/ */
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
@@ -331,6 +460,18 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
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
@@ -344,6 +485,7 @@ static Property applesmc_isa_properties[] = {
     DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, AppleSMCState, iobase,
                        APPLESMC_DEFAULT_IOBASE),
     DEFINE_PROP_STRING("osk", AppleSMCState, osk),
+    DEFINE_PROP_STRING("hostosk", AppleSMCState, hostosk_flag),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.23.0


