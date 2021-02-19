Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6832E31FB7C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:58:29 +0100 (CET)
Received: from localhost ([::1]:33886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7Ei-0007zF-FJ
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73U-0002Oi-OV
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:52 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73C-0003Vg-Qn
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:52 -0500
Received: by mail-wr1-x42c.google.com with SMTP id b3so8885864wrj.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AJDCZ5O3Sn9dNbDBTisc4ZNJwVgLelQLa4u+3Pzsjbc=;
 b=KGbPI45tV6zAFAl11w3v9T/2j1hPrCtXbAB4KLaLvn9ErLR2t1oBO+/WUvj4j3vet+
 GIRXX3yVklr2WWroUvItxVKOK35salM8tHa/DwgrIs3xD9PIqaGX4GctnF5bLlx227he
 YkAtMCWzZl/oBrC5OyYt1v7/F/RfN283iA+RlxuNov1FV1zFTII3JYer1nM07lTiRJ7v
 2aVlZXWRtUqkbO99vkqLPVQjl6dYZGXEq5JoPbzHml226/gGTMBI+3MgcK6Dlmgclxuw
 V18PAVlqoFNQSlNkYPumpM3bgE0V+1WRNDKPwpYd1hlKzLImcSlItmPgOlRRBaUQXqZz
 S2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJDCZ5O3Sn9dNbDBTisc4ZNJwVgLelQLa4u+3Pzsjbc=;
 b=WuV+PHBXKZKFTcrkf5k5m8xVsOnxM44GRgV+Ji0vAum9QAc9DubDck9W+a9TCQtSi5
 HF8KTvFzc7uO7XrRK+/DPWZM4e0ELmTCaoUIqvuDzMtH6fQgrn2xBMjd8z8etCasNSsh
 BTaXprEvi5jlk3b2me949GZgJkhXdhnKv6Zx+MO1J5I1L+RaIpu4iCQYr3ppC09GlPYH
 C7X9X+q6hYQUW0ZLaWWW6NQXGeA5bMZ+FtxQr45W2X2nT8CilBvYtX5O4e5S415AOX4x
 Jv5Cu2FXFEmDMLgo19AHj5xRdVBT0RbETND03xO4TPuw/Aqc5LteOVpO5M/z6MgReQFY
 P4tQ==
X-Gm-Message-State: AOAM53305Mfyhp1OLigfvlmD3NaXkKqlAbKKfAWldI1iFKXG1Qwb6m89
 KlltiMAFToTdxEEaBYsA3MhLaA==
X-Google-Smtp-Source: ABdhPJyLdVG/uo6lpon1Rt/2UEjFa6IMVECvcOsACunzYIR6wzpEoEyn+JTWwR8Ngr51u4T5hjDcRA==
X-Received: by 2002:a5d:5109:: with SMTP id s9mr8160185wrt.325.1613745993330; 
 Fri, 19 Feb 2021 06:46:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 17/44] hw/misc/iotkit-sysctl: Handle SSE-300 changes to
 PDCM_PD_*_SENSE registers
Date: Fri, 19 Feb 2021 14:45:50 +0000
Message-Id: <20210219144617.4782-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

The sysctl PDCM_PD_*_SENSE registers control various power domains in
the system and allow the guest to configure which conditions keep a
power domain awake and what power state to use when the domain is in
a low power state.  QEMU doesn't model power domains, so for us these
registers are dummy reads-as-written implementations.

The SSE-300 has a different power domain setup, so the set of
registers is slightly different:

 Offset   SSE-200               SSE-300
---------------------------------------------------
 0x200    PDCM_PD_SYS_SENSE     PDCM_PD_SYS_SENSE
 0x204    reserved              PDCM_PD_CPU0_SENSE
 0x208    reserved              reserved
 0x20c    PDCM_PD_SRAM0_SENSE   reserved
 0x210    PDCM_PD_SRAM1_SENSE   reserved
 0x214    PDCM_PD_SRAM2_SENSE   PDCM_PD_VMR0_SENSE
 0x218    PDCM_PD_SRAM3_SENSE   PDCM_PD_VMR1_SENSE

Offsets 0x200 and 0x208 are the same for both, so handled in a
previous commit; here we deal with 0x204, 0x20c, 0x210, 0x214, 0x218.

(We can safely add new lines to the SSE300 vmstate because no board
uses this device in an SSE300 yet.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/iotkit-sysctl.h |  3 ++
 hw/misc/iotkit-sysctl.c         | 61 +++++++++++++++++++++++++++++++--
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/include/hw/misc/iotkit-sysctl.h b/include/hw/misc/iotkit-sysctl.h
index 8859b15d73b..481e27f4db1 100644
--- a/include/hw/misc/iotkit-sysctl.h
+++ b/include/hw/misc/iotkit-sysctl.h
@@ -59,6 +59,9 @@ struct IoTKitSysCtl {
     uint32_t pdcm_pd_sram1_sense;
     uint32_t pdcm_pd_sram2_sense;
     uint32_t pdcm_pd_sram3_sense;
+    uint32_t pdcm_pd_cpu0_sense;
+    uint32_t pdcm_pd_vmr0_sense;
+    uint32_t pdcm_pd_vmr1_sense;
 
     /* Properties */
     uint32_t sse_version;
diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index e8255d26b5a..a80f68b7995 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -55,10 +55,11 @@ REG32(PWRCTRL, 0x1fc)
     FIELD(PWRCTRL, PPU_ACCESS_UNLOCK, 0, 1)
     FIELD(PWRCTRL, PPU_ACCESS_FILTER, 1, 1)
 REG32(PDCM_PD_SYS_SENSE, 0x200)
+REG32(PDCM_PD_CPU0_SENSE, 0x204)
 REG32(PDCM_PD_SRAM0_SENSE, 0x20c)
 REG32(PDCM_PD_SRAM1_SENSE, 0x210)
-REG32(PDCM_PD_SRAM2_SENSE, 0x214)
-REG32(PDCM_PD_SRAM3_SENSE, 0x218)
+REG32(PDCM_PD_SRAM2_SENSE, 0x214) /* PDCM_PD_VMR0_SENSE on SSE300 */
+REG32(PDCM_PD_SRAM3_SENSE, 0x218) /* PDCM_PD_VMR1_SENSE on SSE300 */
 REG32(PID4, 0xfd0)
 REG32(PID5, 0xfd4)
 REG32(PID6, 0xfd8)
@@ -259,6 +260,18 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
             g_assert_not_reached();
         }
         break;
+    case A_PDCM_PD_CPU0_SENSE:
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
+        case ARMSSE_SSE200:
+            goto bad_offset;
+        case ARMSSE_SSE300:
+            r = s->pdcm_pd_cpu0_sense;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        break;
     case A_PDCM_PD_SRAM0_SENSE:
         switch (s->sse_version) {
         case ARMSSE_IOTKIT:
@@ -266,6 +279,8 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_SSE200:
             r = s->pdcm_pd_sram0_sense;
             break;
+        case ARMSSE_SSE300:
+            goto bad_offset;
         default:
             g_assert_not_reached();
         }
@@ -277,6 +292,8 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_SSE200:
             r = s->pdcm_pd_sram1_sense;
             break;
+        case ARMSSE_SSE300:
+            goto bad_offset;
         default:
             g_assert_not_reached();
         }
@@ -288,6 +305,9 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_SSE200:
             r = s->pdcm_pd_sram2_sense;
             break;
+        case ARMSSE_SSE300:
+            r = s->pdcm_pd_vmr0_sense;
+            break;
         default:
             g_assert_not_reached();
         }
@@ -299,6 +319,9 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_SSE200:
             r = s->pdcm_pd_sram3_sense;
             break;
+        case ARMSSE_SSE300:
+            r = s->pdcm_pd_vmr1_sense;
+            break;
         default:
             g_assert_not_reached();
         }
@@ -553,6 +576,20 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
             g_assert_not_reached();
         }
         break;
+    case A_PDCM_PD_CPU0_SENSE:
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
+        case ARMSSE_SSE200:
+            goto bad_offset;
+        case ARMSSE_SSE300:
+            qemu_log_mask(LOG_UNIMP,
+                          "IoTKit SysCtl PDCM_PD_CPU0_SENSE unimplemented\n");
+            s->pdcm_pd_cpu0_sense = value;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        break;
     case A_PDCM_PD_SRAM0_SENSE:
         switch (s->sse_version) {
         case ARMSSE_IOTKIT:
@@ -562,6 +599,8 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
                           "IoTKit SysCtl PDCM_PD_SRAM0_SENSE unimplemented\n");
             s->pdcm_pd_sram0_sense = value;
             break;
+        case ARMSSE_SSE300:
+            goto bad_offset;
         default:
             g_assert_not_reached();
         }
@@ -575,6 +614,8 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
                           "IoTKit SysCtl PDCM_PD_SRAM1_SENSE unimplemented\n");
             s->pdcm_pd_sram1_sense = value;
             break;
+        case ARMSSE_SSE300:
+            goto bad_offset;
         default:
             g_assert_not_reached();
         }
@@ -588,6 +629,11 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
                           "IoTKit SysCtl PDCM_PD_SRAM2_SENSE unimplemented\n");
             s->pdcm_pd_sram2_sense = value;
             break;
+        case ARMSSE_SSE300:
+            qemu_log_mask(LOG_UNIMP,
+                          "IoTKit SysCtl PDCM_PD_VMR0_SENSE unimplemented\n");
+            s->pdcm_pd_vmr0_sense = value;
+            break;
         default:
             g_assert_not_reached();
         }
@@ -601,6 +647,11 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
                           "IoTKit SysCtl PDCM_PD_SRAM3_SENSE unimplemented\n");
             s->pdcm_pd_sram3_sense = value;
             break;
+        case ARMSSE_SSE300:
+            qemu_log_mask(LOG_UNIMP,
+                          "IoTKit SysCtl PDCM_PD_VMR1_SENSE unimplemented\n");
+            s->pdcm_pd_vmr1_sense = value;
+            break;
         default:
             g_assert_not_reached();
         }
@@ -672,6 +723,9 @@ static void iotkit_sysctl_reset(DeviceState *dev)
     s->pdcm_pd_sram1_sense = 0;
     s->pdcm_pd_sram2_sense = 0;
     s->pdcm_pd_sram3_sense = 0;
+    s->pdcm_pd_cpu0_sense = 0;
+    s->pdcm_pd_vmr0_sense = 0;
+    s->pdcm_pd_vmr1_sense = 0;
 }
 
 static void iotkit_sysctl_init(Object *obj)
@@ -708,6 +762,9 @@ static const VMStateDescription iotkit_sysctl_sse300_vmstate = {
     .needed = sse300_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(pwrctrl, IoTKitSysCtl),
+        VMSTATE_UINT32(pdcm_pd_cpu0_sense, IoTKitSysCtl),
+        VMSTATE_UINT32(pdcm_pd_vmr0_sense, IoTKitSysCtl),
+        VMSTATE_UINT32(pdcm_pd_vmr1_sense, IoTKitSysCtl),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.20.1


