Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4576625A3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:31:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqxn-0008WU-Co; Mon, 09 Jan 2023 07:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxM-0008Pc-CQ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:08:59 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxK-0005st-Hj
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:08:48 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so8836263wmb.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DDiIve9+U0UXUJTYIcIXbQymbtky2bheQmHzx8WN4+8=;
 b=z83dM/4keYHnqcTlSqT5e/Bn/IUyEx0niy5l9EOlu/pyk0VvSnzE9PmQHhcZqhKb3w
 hgywj42afHMcFEzPdEeXW2+VjIWSuGynSdkDZGGgMStd/jbHEGyMl+CJOZBNudYfs9jk
 WTVJ2N1LKHA6RCh2i+9mMnB2Xzj8ggEIGkN3ayo8BiriIIAqI4omo/JQY++QrlBtNSsw
 Nax40CDuKAsbfEx0CdISISEMvcmELjB22rfTXp6UKnAPPMOMSP+fRk6yQOBZ9zhOOWcm
 rj4f06GxtaQJz10M7nFtzeIaGmxUgpTdlRMJkGv9N3fuz2UAlo+R+C+X6KuWqoAu2Aoa
 LoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DDiIve9+U0UXUJTYIcIXbQymbtky2bheQmHzx8WN4+8=;
 b=DEizPdyToQDN6fyBsA8Mo4R14+miT1Fa0TpkkLOByjfPtdoXy38Tc2yoB+fH0WfXG3
 jc/3cXNReoVWNzCQFZhZ85mlHdHc3tmF68opP16JbOsVPLO5VUzXb2EYanMY9EMeQNYd
 ah/ZT1dD4fghAa1BRJVI2ctd4Fv+ZG/boFOgbemPVWR0aJmkR0qDFSf3JRdWjGBoyi5g
 /OBonee86MBdYZ/w7J7kM4OroOp4YhVFIZ5Iv8AO3SLY7AtcLeMFFaC44dE9YtdzAHT8
 23+Ah7ZuCWkhVr18Jt53TeId1oNaMib030cRWoGkg4UYQKdXYuUu6n+bqcUC48FYtwv1
 MCqw==
X-Gm-Message-State: AFqh2kq7zNQnQ5cM+FruJitzCmqoskyyXQTt1gmvexMbuJ56fp4n9KJR
 IRAz8c/8iybO8WI/JYpXX52GuQhHsT+X9j6k
X-Google-Smtp-Source: AMrXdXvPEdHecOI+2HRufYHzhm1u3jprRv4lRQh4GilOglVMu6RMHiZeT/fT9V1N1sSTLR+U9OTAUQ==
X-Received: by 2002:a05:600c:3b82:b0:3cf:900c:de6b with SMTP id
 n2-20020a05600c3b8200b003cf900cde6bmr46285095wms.15.1673266124915; 
 Mon, 09 Jan 2023 04:08:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 fc14-20020a05600c524e00b003a3442f1229sm17700259wmb.29.2023.01.09.04.08.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:08:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 02/21] hw/block: Pass DeviceState to pflash_cfi01_get_blk()
Date: Mon,  9 Jan 2023 13:08:14 +0100
Message-Id: <20230109120833.3330-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

The point of a getter() function is to not expose the structure
internal fields. Otherwise callers could simply access the
PFlashCFI01::blk field.

Have the callers pass a DeviceState* argument. The QOM
type check is done in the callee.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/arm/sbsa-ref.c        | 2 +-
 hw/arm/virt.c            | 2 +-
 hw/block/pflash_cfi01.c  | 4 +++-
 hw/i386/pc_sysfw.c       | 4 ++--
 include/hw/block/flash.h | 2 +-
 5 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 4bb444684f..65b9acba04 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -346,7 +346,7 @@ static bool sbsa_firmware_init(SBSAMachineState *sms,
 
     sbsa_flash_map(sms, sysmem, secure_sysmem);
 
-    pflash_blk0 = pflash_cfi01_get_blk(sms->flash[0]);
+    pflash_blk0 = pflash_cfi01_get_blk(DEVICE(sms->flash[0]));
 
     bios_name = MACHINE(sms)->firmware;
     if (bios_name) {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ea2413a0ba..954e3ca5ce 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1233,7 +1233,7 @@ static bool virt_firmware_init(VirtMachineState *vms,
 
     virt_flash_map(vms, sysmem, secure_sysmem);
 
-    pflash_blk0 = pflash_cfi01_get_blk(vms->flash[0]);
+    pflash_blk0 = pflash_cfi01_get_blk(DEVICE(vms->flash[0]));
 
     bios_name = MACHINE(vms)->firmware;
     if (bios_name) {
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 0cbc2fb4cb..458c50ec45 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -984,8 +984,10 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
     return PFLASH_CFI01(dev);
 }
 
-BlockBackend *pflash_cfi01_get_blk(PFlashCFI01 *fl)
+BlockBackend *pflash_cfi01_get_blk(DeviceState *dev)
 {
+    PFlashCFI01 *fl = PFLASH_CFI01(dev);
+
     return fl->blk;
 }
 
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index c8d9e71b88..4b85c48ec8 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -152,7 +152,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
 
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
         system_flash = pcms->flash[i];
-        blk = pflash_cfi01_get_blk(system_flash);
+        blk = pflash_cfi01_get_blk(DEVICE(system_flash));
         if (!blk) {
             break;
         }
@@ -216,7 +216,7 @@ void pc_system_firmware_init(PCMachineState *pcms,
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
         pflash_cfi01_legacy_drive(pcms->flash[i],
                                   drive_get(IF_PFLASH, 0, i));
-        pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);
+        pflash_blk[i] = pflash_cfi01_get_blk(DEVICE(pcms->flash[i]));
     }
 
     /* Reject gaps */
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 86d8363bb0..961b6e9f74 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -21,7 +21,7 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
                                    uint16_t id0, uint16_t id1,
                                    uint16_t id2, uint16_t id3,
                                    int be);
-BlockBackend *pflash_cfi01_get_blk(PFlashCFI01 *fl);
+BlockBackend *pflash_cfi01_get_blk(DeviceState *dev);
 MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl);
 void pflash_cfi01_legacy_drive(PFlashCFI01 *dev, DriveInfo *dinfo);
 
-- 
2.38.1


