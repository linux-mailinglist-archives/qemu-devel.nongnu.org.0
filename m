Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623D1436910
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 19:31:46 +0200 (CEST)
Received: from localhost ([::1]:56308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdbup-0007Tp-9R
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 13:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mdbsb-0006a1-Il; Thu, 21 Oct 2021 13:29:25 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:38532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mdbsZ-0006mt-86; Thu, 21 Oct 2021 13:29:25 -0400
Received: by mail-lj1-x22f.google.com with SMTP id n7so1181090ljp.5;
 Thu, 21 Oct 2021 10:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BrP1Aa7hFNHKUpyDn/H8g3LyZcFS1ZXxyktAofS60SM=;
 b=nsDXZbS6MZzpYDFpXhVJHEYeUqvBJoC6hfHuamTGNE9F7fdzqNjIlor7ibXbQIof8b
 DG1ZnYMWum5tOd7tbVrjxcEWrtdLte2BpjSedsE84GV8KPzIlFoBWzfvQBfbQwDeFCLm
 kISUCHidxvJrmQe3NoYQISUCAxr5AqkY0JsvfBv1/a22cpa9DsrkbRkSoI7sVtUbIhKY
 sHoPeolbZLACcz8URK6JMSNOqb5bMsmW7DAPb79IIO5IZhSJnecu9iyFZ+ibYAbcy/TF
 ICh4duyrrW5P0N0iVOsu28vMB2ezTD8Y6Di6FvrArDNuPLAGq057MCS2RVUqFljgf9Oe
 ePGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BrP1Aa7hFNHKUpyDn/H8g3LyZcFS1ZXxyktAofS60SM=;
 b=wZ6RLXTo3o3unzIn+7Qu/lo0EH5heQYDgbXsNh1v5l5C63V1cmM23GE01HHRZTYvJ7
 ivvuHGoSS1LajkYdKD9eGvfYzkUirKKoPl/YYzXsN66pmJBPfryUaUQ9mF/+iCUP9xSX
 BBTcow9Rn8kyBFeCrQ0/C+cHsp6GW2gd73gZMW0AHL5hhRKhpEffHlIN+6cbtEfb5NAE
 198ZHBWqb4ImAHD0/2bu8EtTJ37oR+oqHi85eqyhtt0TxQ4aVAIYNfKXCMaiFav+QRbC
 wafwQhJIDk+/GJdC6I7IrnX52VW1DqmPBtmc14Bxd8gt57OBhEyEGZ09jYTp/V+evZrZ
 q3dw==
X-Gm-Message-State: AOAM530wJ5LfxDtJFeCrWXd0nfae4R93CSWYilusu1DbBW4lln2yaCk9
 8oQ9Z/WMll4iCELVviZ9nCxVSYzUyNcMKA==
X-Google-Smtp-Source: ABdhPJzbZYvH8Mv2fdT/DlrCEqGtAarBZNpkaNKDoH6plswYCoq6eCWq7v/XrRsQ4A/8eZtihoSI4Q==
X-Received: by 2002:a2e:a4a7:: with SMTP id g7mr7295642ljm.255.1634837360082; 
 Thu, 21 Oct 2021 10:29:20 -0700 (PDT)
Received: from UNIT-808.labs.intellij.net ([91.132.204.20])
 by smtp.gmail.com with ESMTPSA id n19sm509046lfu.207.2021.10.21.10.29.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Oct 2021 10:29:19 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] isa-applesmc: provide OSK forwarding on Apple hosts
Date: Thu, 21 Oct 2021 20:28:45 +0300
Message-Id: <20211021172845.69316-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x22f.google.com
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

On Apple hosts we can read AppleSMC OSK directly from SMC
and forward this value to QEMU

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 hw/misc/applesmc.c | 129 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 1b9acaf1d3..d4a6d1eaab 100644
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
+    char *oskdirect;
     char *osk;
     QLIST_HEAD(, AppleSMCData) data_def;
 };
@@ -312,6 +317,124 @@ static const MemoryRegionOps applesmc_err_io_ops = {
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
+static void applesmc_direct_read_osk(DeviceState *dev, Error **errp)
+{
+    AppleSMCState           *s = APPLE_SMC(dev);
+    io_service_t            realsmc = IO_OBJECT_NULL;
+    io_connect_t            realsmc_connect = IO_OBJECT_NULL;
+    size_t                  out_size = sizeof(struct AppleSMCParam);
+    IOReturn                status = kIOReturnError;
+    struct AppleSMCParam    in = {0};
+    struct AppleSMCParam    out = {0};
+    char                    *osk_buffer;
+
+    /* OSK key size + '\0' */
+    osk_buffer = g_malloc0(65);
+    osk_buffer[64] = '\0';
+
+    realsmc = IOServiceGetMatchingService(kIOMasterPortDefault,
+                                          IOServiceMatching("AppleSMC"));
+    if (realsmc == IO_OBJECT_NULL) {
+        warn_report("host AppleSMC device is unreachable");
+        goto osk_buffer_free;
+    }
+
+    status = IOServiceOpen(realsmc, mach_task_self(), 1, &realsmc_connect);
+    if (status != kIOReturnSuccess || realsmc_connect == IO_OBJECT_NULL) {
+        warn_report("host AppleSMC device is unreachable");
+        goto osk_buffer_free;
+    }
+
+    status = IOConnectCallMethod(
+        realsmc_connect,
+        SMC_CLIENT_OPEN,
+        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL
+    );
+    if (status != kIOReturnSuccess) {
+        warn_report("host AppleSMC device is unreachable");
+        goto ioservice_close;
+    }
+
+    in.key = ('OSK0');
+    in.data_size = sizeof(out.bytes);
+    in.command = SMC_READ_KEY;
+    status = IOConnectCallStructMethod(
+        realsmc_connect,
+        SMC_HANDLE_EVENT,
+        &in,
+        sizeof(struct AppleSMCParam),
+        &out,
+        &out_size
+    );
+
+    if (status != kIOReturnSuccess) {
+        warn_report("unable to read OSK0 from host AppleSMC device");
+        goto ioconnect_close;
+    }
+    strncpy(osk_buffer, (const char *) out.bytes, 32);
+
+    in.key = ('OSK1');
+    status = IOConnectCallStructMethod(
+        realsmc_connect,
+        SMC_HANDLE_EVENT,
+        &in,
+        sizeof(struct AppleSMCParam),
+        &out,
+        &out_size
+    );
+    if (status != kIOReturnSuccess) {
+        warn_report("unable to read OSK1 from host AppleSMC device");
+        goto ioconnect_close;
+    }
+    strncpy(osk_buffer + 32, (const char *) out.bytes, 32);
+
+    s->osk = osk_buffer;
+
+    IOConnectCallMethod(
+        realsmc_connect,
+        SMC_CLIENT_CLOSE,
+        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL);
+    IOServiceClose(realsmc_connect);
+    return;
+
+ioconnect_close:
+    IOConnectCallMethod(
+        realsmc_connect,
+        SMC_CLIENT_CLOSE,
+        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL);
+ioservice_close:
+    IOServiceClose(realsmc_connect);
+
+osk_buffer_free:
+    g_free(osk_buffer);
+}
+#else
+static void applesmc_direct_read_osk(DeviceState *dev, Error **errp)
+{
+    warn_report("isa-applesmc.oskdirect ignored: "
+                "unsupported on non-Apple hosts");
+}
+#endif
+
 static void applesmc_isa_realize(DeviceState *dev, Error **errp)
 {
     AppleSMCState *s = APPLE_SMC(dev);
@@ -331,6 +454,11 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
     isa_register_ioport(&s->parent_obj, &s->io_err,
                         s->iobase + APPLESMC_ERR_PORT);
 
+    /* Use key retrieved directly from real SMC has higher priority */
+    if (s->oskdirect && !strcmp("on", s->oskdirect)) {
+        applesmc_direct_read_osk(dev, errp);
+    }
+
     if (!s->osk || (strlen(s->osk) != 64)) {
         warn_report("Using AppleSMC with invalid key");
         s->osk = default_osk;
@@ -344,6 +472,7 @@ static Property applesmc_isa_properties[] = {
     DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, AppleSMCState, iobase,
                        APPLESMC_DEFAULT_IOBASE),
     DEFINE_PROP_STRING("osk", AppleSMCState, osk),
+    DEFINE_PROP_STRING("oskdirect", AppleSMCState, oskdirect),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.23.0


