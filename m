Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3E2669A86
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:35:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKmv-000153-Ep; Fri, 13 Jan 2023 09:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmk-00012S-Bt
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:59 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmh-0003f4-8k
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:57 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so18857810wms.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Dxp2wfE0pKqPXsVGcWtOJq7QnhlLWskLKJj95GnQE+8=;
 b=diKGLz8vmUGTJtNRDLua+u96cWJZN1B05xT9S1CJMdJsm1HjNeA5gUKQcIfN7TsvLs
 hfQfQpG2KfOD2mc4uAevCk5iOReEk+2m/y5XfhmNvbxvbpfxTCE9xWM4CZRjGe9JIP69
 GfA/NX+3Cy+4FGAiYfikngFqXpq22ceZlipM2Yv4fbc4+xKS1Vm2h3FHE8BqLBg411mp
 Ooq+W3oTwxJonTo9DYz3BvITaZsqRZT5XW6kbvSUivnCNMpvveduUiY4ApJEBJgnEhlm
 zhDW7lS4MDIXNDQD6D8zn/h51MtVy7hK+POqTPm353l6DBLS03FYgeRysHtqW89cGoNV
 F1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dxp2wfE0pKqPXsVGcWtOJq7QnhlLWskLKJj95GnQE+8=;
 b=NS1WHTXXwhzUnd6h5C/jSwbNX59c6o7G8bmP9M2gofgNBWDg/XFThy2acYHno0Sh3B
 AIg8amqSJmX1H7lZnAIA9pKwALofML86+Ex8VtS0Q2ptcWifLpXxpbPQK70YALCToF46
 nD5UaNYWnffNTr1fhmflNsVvK3sowLpmz0jtOkgGJ5ROaoZ/sIYaSBzrG3KPGBYXxXk1
 IU7j29cMmtSKnL5P8b6Q1/5MxHIw/5x8j75bE8OquMZiYD1Gn5V2+EcEjiRToogF8FU1
 2ZffJJJViiSU8GV1YNv4l0+L9jAGALWVPdtaqLsOX8d/JNNrjLzsLF3IIbPI0WC9Zpr1
 tO2g==
X-Gm-Message-State: AFqh2koxmkG+wLqd1tc+9KF6/aJYf5Jd/3w34e+RlWEGLqthvfL63ynE
 RcH1DLwqCIgVMwBQdneNE4BSRQDWyj5ML0ZL
X-Google-Smtp-Source: AMrXdXuK6Q56YYn0uP+Zuik4J3q9gSaY7rg5i2rg10Oq56S+YK535FGmPYLCJ2Uc4rV7COemoJO0hw==
X-Received: by 2002:a05:600c:4f93:b0:3d9:e5f9:984c with SMTP id
 n19-20020a05600c4f9300b003d9e5f9984cmr17120423wmq.2.1673619106170; 
 Fri, 13 Jan 2023 06:11:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/38] hw/arm/z2: Use the IEC binary prefix definitions
Date: Fri, 13 Jan 2023 14:11:09 +0000
Message-Id: <20230113141126.535646-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

IEC binary prefixes ease code review: the unit is explicit.

Add the FLASH_SECTOR_SIZE definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109115316.2235-12-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/z2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 8eb6f495bc9..839be3ca169 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/arm/pxa.h"
 #include "hw/arm/boot.h"
 #include "hw/i2c/i2c.h"
@@ -297,9 +298,10 @@ static const TypeInfo aer915_info = {
     .class_init    = aer915_class_init,
 };
 
+#define FLASH_SECTOR_SIZE   (64 * KiB)
+
 static void z2_init(MachineState *machine)
 {
-    uint32_t sector_len = 0x10000;
     PXA2xxState *mpu;
     DriveInfo *dinfo;
     void *z2_lcd;
@@ -312,7 +314,7 @@ static void z2_init(MachineState *machine)
     dinfo = drive_get(IF_PFLASH, 0, 0);
     if (!pflash_cfi01_register(Z2_FLASH_BASE, "z2.flash0", Z2_FLASH_SIZE,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               sector_len, 4, 0, 0, 0, 0, 0)) {
+                               FLASH_SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
         error_report("Error registering flash memory");
         exit(1);
     }
-- 
2.34.1


