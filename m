Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B8F2DAF50
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:48:16 +0100 (CET)
Received: from localhost ([::1]:34034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBcd-0003BT-4i
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpBWz-0005xe-5l
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:42:25 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpBWw-0000I0-2s
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:42:24 -0500
Received: by mail-wr1-x443.google.com with SMTP id q18so12564674wrn.1
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6nKNZyQ5mwOCGiSTv8PcByBpUnp/OJYzR5xUJtXpQ+Q=;
 b=EHhhIuoqwTmX2v4/Wcxq4ENCTTvFib33OgMXAeM9aC7VW24v1V/6akoay/aBHP/Zun
 /VXmYBuzoJ4xbi00jHUBQHge6xWKz/3joH+gHVG/rZRtEk9Ij1iIQKQk0JlY2RKK1TFY
 gsVBNv2PqZMXklycL8Z61JQn/WEhEcQEZU8dsWunMSFLlVu/IBLVJwy8y6/xaK6ycKHT
 09szXZ7hc86brQBuIsi8IXlQZv1jxrx0lurqtkA29AgGsvdF+RjeqoF8zSfm8ojevDeP
 F6vNVBcDLUpzlvOKV/Yu1fASY9HOHsecMOnE2p7lqZd02hiqmbRuPEeiRjVy89hmimgx
 V7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6nKNZyQ5mwOCGiSTv8PcByBpUnp/OJYzR5xUJtXpQ+Q=;
 b=Sftf1ZmYHYNCyZbCIu/9hHBBIS7OHASvtoJedVTxYQc147Zmp30r02KQp+eW8hI5m/
 xoBL96qnkQR1yuoYpfHXFYeckJBIEUqXb/XkbaLwal1sULhHiKvpRUpUYi0+iTG4Jj29
 GuDagHZmuaphWkj+15yp6K3doOztdIxrYukEz6FGVJ0smP7LfjfDM5h8pPo/KpCoJFg+
 syYru/s2G8P4EDKTDwUBvNsk2mdSuqpl7MkcAr2Pwc6SOOIm1sIbbpRwnIdO4y5MSLCd
 CYI7pnSh7MProKPQDsUyOETmGo4vL6wXqPH0QOezOnuDny8RVUWSGd+7+s5DdhafL/p1
 j0FA==
X-Gm-Message-State: AOAM530t2O+c+jUNGEfHU81dw6je9zFLwLezwpaKm7zYAOQOTSvDe1+H
 pAbUt7ViOGR+CxqXCzwU/t8yGA==
X-Google-Smtp-Source: ABdhPJy4RiLcOTHA8q/X5VF+SQPdadxRCy/LfHQQZY4ouqZfWQFzzb44W71hyUz6G6EPOV253ufCyQ==
X-Received: by 2002:adf:dc8b:: with SMTP id r11mr34830700wrj.131.1608043337083; 
 Tue, 15 Dec 2020 06:42:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z22sm35049810wml.1.2020.12.15.06.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:42:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/highbank: Drop dead KVM support code
Date: Tue, 15 Dec 2020 14:42:15 +0000
Message-Id: <20201215144215.28482-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Rob Herring <robh@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support for running KVM on 32-bit Arm hosts was removed in commit
82bf7ae84ce739e.  You can still run a 32-bit guest on a 64-bit Arm
host CPU, but because Arm KVM requires the host and guest CPU types
to match, it is not possible to run a guest that requires a Cortex-A9
or Cortex-A15 CPU there.  That means that the code in the
highbank/midway board models to support KVM is no longer used, and we
can delete it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/highbank.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index bf7b8f4c648..bf886268c57 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -26,7 +26,6 @@
 #include "hw/arm/boot.h"
 #include "hw/loader.h"
 #include "net/net.h"
-#include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
@@ -38,6 +37,7 @@
 #include "hw/cpu/a15mpcore.h"
 #include "qemu/log.h"
 #include "qom/object.h"
+#include "cpu.h"
 
 #define SMP_BOOT_ADDR           0x100
 #define SMP_BOOT_REG            0x40
@@ -396,15 +396,9 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     highbank_binfo.loader_start = 0;
     highbank_binfo.write_secondary_boot = hb_write_secondary;
     highbank_binfo.secondary_cpu_reset_hook = hb_reset_secondary;
-    if (!kvm_enabled()) {
-        highbank_binfo.board_setup_addr = BOARD_SETUP_ADDR;
-        highbank_binfo.write_board_setup = hb_write_board_setup;
-        highbank_binfo.secure_board_setup = true;
-    } else {
-        warn_report("cannot load built-in Monitor support "
-                    "if KVM is enabled. Some guests (such as Linux) "
-                    "may not boot.");
-    }
+    highbank_binfo.board_setup_addr = BOARD_SETUP_ADDR;
+    highbank_binfo.write_board_setup = hb_write_board_setup;
+    highbank_binfo.secure_board_setup = true;
 
     arm_load_kernel(ARM_CPU(first_cpu), machine, &highbank_binfo);
 }
-- 
2.20.1


