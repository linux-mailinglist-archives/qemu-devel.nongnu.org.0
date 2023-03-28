Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761586CCBD5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 23:03:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phGRp-0000TI-T7; Tue, 28 Mar 2023 17:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phGRi-0000SZ-Me
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 17:01:35 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phGRf-0002xV-E4
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 17:01:33 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 bg13-20020a05600c3c8d00b003ef90adc168so591482wmb.5
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 14:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680037289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YNS6DKRP4wwEN6+6knCb2rHr3UGglLVmviV4kxalOdI=;
 b=pqnZzBIoRL/bKh6iZfkB7xgM0iXFRGbgdKMU1RIJ2YqydTrEQ0sgLbWmZ8iHqzI80a
 JjUOS5ux2RmVUk8z30wNKGAm5z8zFHpoU89+xIOEvEHvvU47A5GmCBFU9Fbc1rC8b+NH
 jSbhIAsm9qzuz2UZF3wq8T5bA70tMTs8U7g8tUHkQxTfqLBr9dUxnTFuyZIgPQFnNX5a
 HxhO+G5iE9fEoUo6E25TE7i4Lz58frnlQ2TyYHgugxtOesuD81JHGpNNFQiJA5NKxJz3
 agq/h3vsFFidtgIwin5sZPSlko0E+3a0t0puTw9HcdMr3BcPYqhubZXRBoZroclwt20F
 M8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680037289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YNS6DKRP4wwEN6+6knCb2rHr3UGglLVmviV4kxalOdI=;
 b=0okVdoE9p565xL7TYeg9pwyWE7uAlAVW18DDZDx9ZaX500F+lInWAJSswwWYiPjTl0
 wlhRZCF/zoHKjNH/id5ZHYCOAHT2cAfhdy0TFH/VmeBFz95el33khTpYi0nE0+uXcvkW
 UgeltEGSZtyYypFPdBBXifYAFuPJTvz4ooO6YPLKofCNZv2MkznEexqIyQ4F54Wbpwfw
 eKDm7+ZtpwMAZlZ0ziMFNWpxyoXoRnQkn4NIS4UNvSSSrQxyaiKURaNsjmNp1W4Lqevo
 UOj97DDxiyyXgvRV9s2zsLxwUpnY9s1O2WXPVycC7CCRVC9cIYLMhxGhnPYrJ0TSltg5
 IIQA==
X-Gm-Message-State: AO0yUKXnF4extiozI+4Sr4F1Evn5x9rBrEDYjpAqguSUUj38m3XZM+FC
 pgU4oWaPp0cQvyE8crPynCHUJe581kKduoCiVQM=
X-Google-Smtp-Source: AK7set+Abn2LcmQl8G98hEkdjkt9GiWwFSiACj6w+YN4DRhdjvicrmm6ig1IbQQNYQgJkvKih8kKMg==
X-Received: by 2002:a7b:cb44:0:b0:3ee:672d:caa3 with SMTP id
 v4-20020a7bcb44000000b003ee672dcaa3mr14381579wmj.18.1680037289595; 
 Tue, 28 Mar 2023 14:01:29 -0700 (PDT)
Received: from localhost.localdomain ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a05600c350600b003ee8ab8d6cfsm13605831wmq.21.2023.03.28.14.01.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Mar 2023 14:01:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 Hannes Reinecke <hare@suse.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2] hw/scsi/megasas: Silent GCC duplicated-cond warning
Date: Tue, 28 Mar 2023 23:01:26 +0200
Message-Id: <20230328210126.16282-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

GCC9 is confused when building with CFLAG -O3:

  hw/scsi/megasas.c: In function ‘megasas_scsi_realize’:
  hw/scsi/megasas.c:2387:26: error: duplicated ‘if’ condition [-Werror=duplicated-cond]
   2387 |     } else if (s->fw_sge >= 128 - MFI_PASS_FRAME_SIZE) {
  hw/scsi/megasas.c:2385:19: note: previously used here
   2385 |     if (s->fw_sge >= MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE) {
  cc1: all warnings being treated as errors

When this device was introduced in commit e8f943c3bcc, the author
cared about modularity, using a definition for the firmware limit.

However if the firmware limit isn't changed (MEGASAS_MAX_SGE = 128),
the code ends doing the same check twice.

Per the maintainer [*]:

> The original code assumed that one could change MFI_PASS_FRAME_SIZE,
> but it turned out not to be possible as it's being hardcoded in the
> drivers themselves (even though the interface provides mechanisms to
> query it). So we can remove the duplicate lines.

Add the 'MEGASAS_MIN_SGE' definition for the '64' magic value,
slightly rewrite the condition check to simplify a bit the logic
and remove the unnecessary / duplicated check.

[*] https://lore.kernel.org/qemu-devel/e0029fc5-882f-1d63-15e3-1c3dbe9b6a2c@suse.de/

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
v1: https://lore.kernel.org/qemu-devel/20191217173425.5082-6-philmd@redhat.com/
---
 hw/scsi/megasas.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 9cbbb16121..32c70c9e99 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -42,6 +42,7 @@
 #define MEGASAS_MAX_FRAMES 2048         /* Firmware limit at 65535 */
 #define MEGASAS_DEFAULT_FRAMES 1000     /* Windows requires this */
 #define MEGASAS_GEN2_DEFAULT_FRAMES 1008     /* Windows requires this */
+#define MEGASAS_MIN_SGE 64
 #define MEGASAS_MAX_SGE 128             /* Firmware limit */
 #define MEGASAS_DEFAULT_SGE 80
 #define MEGASAS_MAX_SECTORS 0xFFFF      /* No real limit */
@@ -2356,6 +2357,7 @@ static void megasas_scsi_realize(PCIDevice *dev, Error **errp)
     MegasasState *s = MEGASAS(dev);
     MegasasBaseClass *b = MEGASAS_GET_CLASS(s);
     uint8_t *pci_conf;
+    uint32_t sge;
     int i, bar_type;
     Error *err = NULL;
     int ret;
@@ -2424,13 +2426,15 @@ static void megasas_scsi_realize(PCIDevice *dev, Error **errp)
     if (!s->hba_serial) {
         s->hba_serial = g_strdup(MEGASAS_HBA_SERIAL);
     }
-    if (s->fw_sge >= MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE) {
-        s->fw_sge = MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE;
-    } else if (s->fw_sge >= 128 - MFI_PASS_FRAME_SIZE) {
-        s->fw_sge = 128 - MFI_PASS_FRAME_SIZE;
-    } else {
-        s->fw_sge = 64 - MFI_PASS_FRAME_SIZE;
+
+    sge = s->fw_sge + MFI_PASS_FRAME_SIZE;
+    if (sge < MEGASAS_MIN_SGE) {
+        sge = MEGASAS_MIN_SGE;
+    } else if (sge >= MEGASAS_MAX_SGE) {
+        sge = MEGASAS_MAX_SGE;
     }
+    s->fw_sge = sge - MFI_PASS_FRAME_SIZE;
+
     if (s->fw_cmds > MEGASAS_MAX_FRAMES) {
         s->fw_cmds = MEGASAS_MAX_FRAMES;
     }
-- 
2.38.1


