Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463EF596660
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 02:42:35 +0200 (CEST)
Received: from localhost ([::1]:46648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO78j-0006UE-UM
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 20:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oO76b-00056B-K9
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 20:40:21 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oO76O-0005ja-3V
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 20:40:19 -0400
Received: by mail-pj1-x1029.google.com with SMTP id pm17so11126287pjb.3
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 17:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=john-millikin.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=OAgQIWRdf74cBRgSXe4neH4xYFw6QQ1FEA3mXMY5wKQ=;
 b=jXQBgH15EeLB2L1s/gpxygk2GYCm2DsPg0oMrlDDxqQRQjA+woGnSP4FxP0GbfSOeT
 1EqK3sCJNR/CXVV+Ku8KPXHEDIV/fJSwgd6HJZj4i+U6BJVA5OGtCuhYhGjH3zSd7g+2
 lz3beRuZ9z58iFWxS9RiN2rQodlRwFGEvy13iFUinoSqGLMvh07rb86eNaaSm7T1zV23
 ursYMlcuV6hAZpF8eHuQnd5mDHDDSAI8HfwNrlwZFU+bCT57dCJKmkSoJE27W5IBQtw/
 zgt2iKJVqkhFKvZmNAg0XZ9ZP3gBW32XEvyczSsYPGg5rbJ97WhmjKIiPR/X7Fkw1m+k
 Wc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=OAgQIWRdf74cBRgSXe4neH4xYFw6QQ1FEA3mXMY5wKQ=;
 b=AxQDZ+ak8AUz0DGq/E3EJt3ZypkBEz6nkNxmifLLD6RJCQ33Qs810cf5U80mLQfntB
 csWbefBXUEj21Tkqsp93xrXIC7WvSVrbBIGuso48Fkx6faYcnGVNlg5y7IJBhZZV7350
 sC3QvRwbAadgBzi8Iw3RM79B86sHuKuUB1Bp54lXquiXHsi9RJNV/VWlT+9IZ4yNQs4B
 F5LrJNIr6DsejyqwE+cZmz1+H5xKwTjrfwmgwAfuH7xOVX2L6i/sm0UxsDiM5pDI7EUJ
 vr3vHbyCkIh2CjZC7TNxwbDQre49W2x3uYuUIGbZu2YustOkgrdJs3Q3t5Bl+FpiTAzi
 sNTw==
X-Gm-Message-State: ACgBeo2FFz3gGRrSWgYizjznFLuwNsXgU8xv5eg+REslk+J1fKrYMPUs
 sYtTRe57qZUwoag2eFryqkRFyAQBx5eweoXHsok=
X-Google-Smtp-Source: AA6agR5e/hXTMR2M/dCcZBXzbSjrCOXof6Ug1X+/is1IlbAq06Rz+7qJloUfqGG69P3ZXRWwFK7ogg==
X-Received: by 2002:a17:90b:4a82:b0:1f5:5eaa:68a with SMTP id
 lp2-20020a17090b4a8200b001f55eaa068amr1147575pjb.13.1660696803753; 
 Tue, 16 Aug 2022 17:40:03 -0700 (PDT)
Received: from localhost.localdomain
 ([2405:6580:98c0:1200:8471:2642:55c0:76cb])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a1709027fc800b0016db441edd7sm8677plb.40.2022.08.16.17.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 17:40:03 -0700 (PDT)
From: John Millikin <john@john-millikin.com>
To: qemu-devel@nongnu.org
Cc: John Millikin <john@john-millikin.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Bill Paul <noisetube@gmail.com>
Subject: [PATCH] esp: Handle CMD_BUSRESET by resetting the SCSI bus
Date: Wed, 17 Aug 2022 09:33:58 +0900
Message-Id: <20220817003357.401492-1-john@john-millikin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=john@john-millikin.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per investigation on the linked ticket, SunOS issues a SCSI bus reset
to the ESP as part of its boot sequence. If this ESP command doesn't
cause devices to assert sense flag UNIT ATTENTION, SunOS will consider
the CD-ROM device to be non-compliant with Common Command Set (CCS).
In this condition, the SunOS installer's early userspace doesn't set
the installation source location to sr0 and the miniroot copy fails.

Suggested-by: Bill Paul <noisetube@gmail.com>
Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1127
---
 hw/scsi/esp.c | 6 ++++++
 1 file changed, 6 insertions(+)

With this patch in place, booting the SunOS installation contains the
new output line:

  sr0 at esp0 target 6 lun 0

and the early userspace successfully writes the CD-ROM's device name
to the ramdisk, where the installer script expects it:

  # dd if=/dev/rd0a of=/tmp.bin bs=1 count=3
  3+0 records in
  3+0 records out
  # cat /tmp.bin; echo ''
  sr0
  #

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 2d3c649567..c799c19bd4 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -939,6 +939,11 @@ static void esp_soft_reset(ESPState *s)
     esp_hard_reset(s);
 }
 
+static void esp_bus_reset(ESPState *s)
+{
+    qbus_reset_all(BUS(&s->bus));
+}
+
 static void parent_esp_reset(ESPState *s, int irq, int level)
 {
     if (level) {
@@ -1067,6 +1072,7 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
             break;
         case CMD_BUSRESET:
             trace_esp_mem_writeb_cmd_bus_reset(val);
+            esp_bus_reset(s);
             if (!(s->wregs[ESP_CFG1] & CFG1_RESREPT)) {
                 s->rregs[ESP_RINTR] |= INTR_RST;
                 esp_raise_irq(s);
-- 
2.25.1


