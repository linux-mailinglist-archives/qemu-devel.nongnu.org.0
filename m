Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B6A331533
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:49:54 +0100 (CET)
Received: from localhost ([::1]:55626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJK0v-0007xX-Qi
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:49:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkc-0006US-U8
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:03 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkV-00071y-CL
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:02 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h98so12286918wrh.11
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XFF1OhNMNqvGibNSw+5+2cn3CH+sBe8I4eaSY9GdJCc=;
 b=E1jhP8e5DYnDZPp9GCYpK2Csnp3HjmIbgh41lLXmi/V6frvXH6LgtfWgboOM6kexvS
 s9F60oBIQH/1ZoKp+mlKyA67dJAB7c+CmAEpzF/sciEBhsrYIuSqmYgq5BEYuPBYbfPS
 +6Va3K3htwTTuPx4VECrCTqv0QvbyF8Nm97Z+EKhAqqAKGMMfwn9fF4OZ8CPULdHaDhX
 L48oE+qZcTHWZ1cdkG1JG34W+RcOmJUBiSAt8kJ2ytSy+SUSA3c71Wsw/fKQQQVQdMfv
 eN/zbTtgRsQcGzhxcCcNlWNSHPq6xXXGLhnbAiVYEvFQ9r+EOfnYjNSe+wexRlvtX0IO
 FNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XFF1OhNMNqvGibNSw+5+2cn3CH+sBe8I4eaSY9GdJCc=;
 b=lTCDg9rjztUbx/0rSg9groUtT7aDiLycImaihu7XsV7apqQTXSQd7vJbQznH5EhbNw
 DirecQwFKE3nhENb+LbrkiAa1DnX9/Z3qk1q3rq8uFOF63aSGHCRKsEhJQofoRRmz5EZ
 JUANmRnDf6hLStwRLRQMjXnljUhqojUbDKFirhdtKpHiouOYVfeOp3B644XpKtKwtiYv
 aPg5eV1TtsPdqPBDdWgM4SrTmZ1QE14AbCdFz1YH2iDIV1gf9RV0PEESlxpEv6FaDV6W
 NEOwRAXOERiHzKe/PurjxWmZlqSjDJ8rlcqO6Qibd/jUhCRmvwv7EkDu+Gj5yrWq9ZpM
 lr1A==
X-Gm-Message-State: AOAM533lcmuXoDLGaigXFDewTiOXy9RbwHT++phROrfdff6YhesVUAbk
 10lrMglfawn9ka+RmgL5iwhUuUr/dOX9NQ==
X-Google-Smtp-Source: ABdhPJwSuh0VvOZzxme4N/r/ZG7X5hCURttWAK1PeSmvZSukXLoMcA9um2OBpV3U5Mq9RI/xLHUIvg==
X-Received: by 2002:adf:84e6:: with SMTP id 93mr22769598wrg.376.1615224773903; 
 Mon, 08 Mar 2021 09:32:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.32.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:32:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/54] hw/misc/iotkit-sysinfo.c: Implement SYS_CONFIG1 and IIDR
Date: Mon,  8 Mar 2021 17:32:00 +0000
Message-Id: <20210308173244.20710-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For SSE-300, the SYSINFO register block has two new registers:

 * SYS_CONFIG1 indicates the config for a potential CPU2 and CPU3;
   since the SSE-300 can only be configured with a single CPU it
   is always zero

 * IIDR is the subsystem implementation identity register;
   its value is set by the SoC integrator, so we plumb this in from
   the armsse.c code as we do with SYS_VERSION and SYS_CONFIG

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-11-peter.maydell@linaro.org
---
 include/hw/misc/iotkit-sysinfo.h |  1 +
 hw/arm/armsse.c                  |  5 +++++
 hw/misc/iotkit-sysinfo.c         | 22 ++++++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/include/hw/misc/iotkit-sysinfo.h b/include/hw/misc/iotkit-sysinfo.h
index 91bd14bdbff..91c23f90d23 100644
--- a/include/hw/misc/iotkit-sysinfo.h
+++ b/include/hw/misc/iotkit-sysinfo.h
@@ -39,6 +39,7 @@ struct IoTKitSysInfo {
     uint32_t sys_version;
     uint32_t sys_config;
     uint32_t sse_version;
+    uint32_t iidr;
 };
 
 #endif
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 113a783a46a..326e161c8d4 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -30,6 +30,7 @@ struct ARMSSEInfo {
     int sram_banks;
     int num_cpus;
     uint32_t sys_version;
+    uint32_t iidr;
     uint32_t cpuwait_rst;
     bool has_mhus;
     bool has_ppus;
@@ -70,6 +71,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .sram_banks = 1,
         .num_cpus = 1,
         .sys_version = 0x41743,
+        .iidr = 0,
         .cpuwait_rst = 0,
         .has_mhus = false,
         .has_ppus = false,
@@ -84,6 +86,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .sram_banks = 4,
         .num_cpus = 2,
         .sys_version = 0x22041743,
+        .iidr = 0,
         .cpuwait_rst = 2,
         .has_mhus = true,
         .has_ppus = true,
@@ -950,6 +953,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     }
     object_property_set_int(OBJECT(&s->sysinfo), "sse-version",
                             info->sse_version, &error_abort);
+    object_property_set_int(OBJECT(&s->sysinfo), "IIDR",
+                            info->iidr, &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sysinfo), errp)) {
         return;
     }
diff --git a/hw/misc/iotkit-sysinfo.c b/hw/misc/iotkit-sysinfo.c
index 4bd3fd4c8f3..aaa9305b2ea 100644
--- a/hw/misc/iotkit-sysinfo.c
+++ b/hw/misc/iotkit-sysinfo.c
@@ -30,6 +30,8 @@
 
 REG32(SYS_VERSION, 0x0)
 REG32(SYS_CONFIG, 0x4)
+REG32(SYS_CONFIG1, 0x8)
+REG32(IIDR, 0xfc8)
 REG32(PID4, 0xfd0)
 REG32(PID5, 0xfd4)
 REG32(PID6, 0xfd8)
@@ -70,6 +72,24 @@ static uint64_t iotkit_sysinfo_read(void *opaque, hwaddr offset,
     case A_SYS_CONFIG:
         r = s->sys_config;
         break;
+    case A_SYS_CONFIG1:
+        switch (s->sse_version) {
+        case ARMSSE_SSE300:
+            return 0;
+            break;
+        default:
+            goto bad_read;
+        }
+        break;
+    case A_IIDR:
+        switch (s->sse_version) {
+        case ARMSSE_SSE300:
+            return s->iidr;
+            break;
+        default:
+            goto bad_read;
+        }
+        break;
     case A_PID4 ... A_CID3:
         switch (s->sse_version) {
         case ARMSSE_SSE300:
@@ -81,6 +101,7 @@ static uint64_t iotkit_sysinfo_read(void *opaque, hwaddr offset,
         }
         break;
     default:
+    bad_read:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "IoTKit SysInfo read: bad offset %x\n", (int)offset);
         r = 0;
@@ -114,6 +135,7 @@ static Property iotkit_sysinfo_props[] = {
     DEFINE_PROP_UINT32("SYS_VERSION", IoTKitSysInfo, sys_version, 0),
     DEFINE_PROP_UINT32("SYS_CONFIG", IoTKitSysInfo, sys_config, 0),
     DEFINE_PROP_UINT32("sse-version", IoTKitSysInfo, sse_version, 0),
+    DEFINE_PROP_UINT32("IIDR", IoTKitSysInfo, iidr, 0),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.20.1


