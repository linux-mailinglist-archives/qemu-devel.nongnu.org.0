Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC837653630
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:24:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83kZ-00086a-BN; Wed, 21 Dec 2022 13:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kU-00083Z-Ng
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:23:28 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kT-0007qH-5D
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:23:26 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-14449b7814bso20154156fac.3
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7RkRJF9o2c3C5CMhU+t5ZhyG4d5D3mhoMdfolGfNI5A=;
 b=l3X1279vNzRS9eoA1217HxROrlF3YdTMbtlmZL0aAd3rwwFAOSfsZO2nliQdgR+D2B
 gZ5vwP6aLAC7dcNV5YHkkVDPJy6Kk3oVHoJ0ivvVF5FPigAY9mMl5CQYhCjSKgy/NwiM
 2jXsIcAqBv1bD+Abq6wAEo/KQGx+Rrg/4BAI9JIaKSyd0aoFD2MB7MqSp2+ML7oPap0P
 eO35vKlLR29gDUQ4B1+lWB/lQHytsQlw/6ZbwG9WS7T9wlx+CTK9by1mO522SJCaS4Ak
 6rSb9gWzwzxRUMILZ2lrsxTa1ZLfFfxNRcTBiiI0+VV8qjXqEsIg+Jd1Xa/YMehQRNI9
 ZDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7RkRJF9o2c3C5CMhU+t5ZhyG4d5D3mhoMdfolGfNI5A=;
 b=DzZIAoOuACc6bx6u5A5KPskuarQElp+72TMQ0F+mmD+hkOcWtpGUWdWrEPrEpgvUS2
 Q8tsiGGvHkDhdAU5w1M53CSUkpZ5VKS29m96to1P6jong5APEKZogk4c8T48NY82GDDu
 YsJJPwLOBohGg3IE/aD3sp0/dow/na87JQkbGsP/uwMn3Sh1voHgdQ9U70ge1YsG8L9u
 6C4qY1v2RtmykOR70l32tfPfSacG0yPmmwVjIbiKdkOAPziwBUPRHeI5K2L8er3tWOvC
 d4ET6sqkkMScyFUJehEjAppUtfrYbnWeCt8nD4qfFrDEHc13eJR4NxDOESRNdLbQr1Gr
 YlMQ==
X-Gm-Message-State: AFqh2kotZfsPKN9AQJBQ23t54k8CjbvgIujsOgq4tm7NpoJ0ls6nDPql
 f5BrTwXizWSZj2geEO2Dqez3FPkV8r2+0nsn
X-Google-Smtp-Source: AMrXdXtkO/6paE+LYEq5GnKwbTjr8zmBocj31mBuFluQuGG0URpBMEUiUaY9gvYtpN3u4jIFzZokFw==
X-Received: by 2002:a05:6870:910f:b0:14b:cdc5:879 with SMTP id
 o15-20020a056870910f00b0014bcdc50879mr1390732oae.8.1671647003425; 
 Wed, 21 Dec 2022 10:23:23 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:23 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 04/15] hw/riscv/boot.c: make riscv_find_firmware() static
Date: Wed, 21 Dec 2022 15:22:49 -0300
Message-Id: <20221221182300.307900-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The only caller is riscv_find_and_load_firmware(), which is in the same
file.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c         | 44 ++++++++++++++++++++---------------------
 include/hw/riscv/boot.h |  1 -
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index ebd351c840..7361d5c0d8 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -75,6 +75,28 @@ target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
     }
 }
 
+static char *riscv_find_firmware(const char *firmware_filename)
+{
+    char *filename;
+
+    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware_filename);
+    if (filename == NULL) {
+        if (!qtest_enabled()) {
+            /*
+             * We only ship OpenSBI binary bios images in the QEMU source.
+             * For machines that use images other than the default bios,
+             * running QEMU test will complain hence let's suppress the error
+             * report for QEMU testing.
+             */
+            error_report("Unable to load the RISC-V firmware \"%s\"",
+                         firmware_filename);
+            exit(1);
+        }
+    }
+
+    return filename;
+}
+
 target_ulong riscv_find_and_load_firmware(MachineState *machine,
                                           const char *default_machine_firmware,
                                           hwaddr firmware_load_addr,
@@ -104,28 +126,6 @@ target_ulong riscv_find_and_load_firmware(MachineState *machine,
     return firmware_end_addr;
 }
 
-char *riscv_find_firmware(const char *firmware_filename)
-{
-    char *filename;
-
-    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware_filename);
-    if (filename == NULL) {
-        if (!qtest_enabled()) {
-            /*
-             * We only ship OpenSBI binary bios images in the QEMU source.
-             * For machines that use images other than the default bios,
-             * running QEMU test will complain hence let's suppress the error
-             * report for QEMU testing.
-             */
-            error_report("Unable to load the RISC-V firmware \"%s\"",
-                         firmware_filename);
-            exit(1);
-        }
-    }
-
-    return filename;
-}
-
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb)
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 93e5f8760d..c03e4e74c5 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -37,7 +37,6 @@ target_ulong riscv_find_and_load_firmware(MachineState *machine,
                                           const char *default_machine_firmware,
                                           hwaddr firmware_load_addr,
                                           symbol_fn_t sym_cb);
-char *riscv_find_firmware(const char *firmware_filename);
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb);
-- 
2.38.1


