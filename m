Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846F7331562
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:00:24 +0100 (CET)
Received: from localhost ([::1]:56866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKB5-0003PX-I2
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:00:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJko-0006ak-Tj
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:16 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJka-00074t-S3
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:14 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u16so12325652wrt.1
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9MO7N6slfJ/u/iUY53I63D8eNFBQAXF/vspfprFjGCc=;
 b=P/9VYjSOM8O+bnbcUbVlPB7bhzMayjGwFAfrZonKlqWOTkXbjiBdcxFwa9aFSpQcdC
 9N627VRoDFMZ1asKAtEPMFtacuL1iJy05fWJ5weZVfTPPz8ojN1P6hMXDW1aNbKmHqyX
 tL83l8NqfuH/3QPwHENn5JG/45K5ZrEL7sI7sv7JQ4MTOeRGpWeUVfmMMI/s3vp2HLB5
 gjBiNuFzlfYmTw89MYQd0/uKWL1SJqaBFMaugfpz9qwcQT1nOHmSiIdzifll+AVz1FOc
 XiiqKbUpVEXN5/n/hpo4qwlrIDalHnoPkYLE+I3HCZYHqoY0AFGQd/rUMX3iwZpe5w4x
 gDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9MO7N6slfJ/u/iUY53I63D8eNFBQAXF/vspfprFjGCc=;
 b=V5qS2m2UUhZ1fhQZQkygM7CZv38odXb3qp50WSi8UX0eCKcqFdsHWUu78uS1MDPi0R
 bgbUHD/0aAeiuVIDNUVKs9jvw0GARMzpEohH2wsUntiuPG80v7dYYwMKoqgtotcDxH1u
 pV7qMGqOUf2nNfs5MrQh2VXxR72IeOmIADLRhc2ewKN+GkdYi5PLs9OwwGFrjIIbm/Ch
 OOII7cg14/mBIojbUVVvPAvvf5At65duA5ig/RtWUQrQ2e96Lj+EEcm0GPerfm/BV68y
 c4lGESjDPvqzlX8CRhuSuScz+c6mvUAzxf1de/qBv3qUua0xjeTeOqW+MLtGMH3kN9lt
 FLBA==
X-Gm-Message-State: AOAM531lRllEvtZc0Of2Qo+vzKn+LLZvLnn4d+KGr1Cio6o0S22L3WHi
 uRgeozcL+xuGrT2VdLIAxi5QpkAfO9K4gg==
X-Google-Smtp-Source: ABdhPJyc/k6NQI4b11LaYVcWd8c0PaZJt2Lb2hqAT43uYCQ+/uiWqxnVv5f18z724P7sxwQx+Ru0/Q==
X-Received: by 2002:a5d:5088:: with SMTP id a8mr13401794wrt.294.1615224779632; 
 Mon, 08 Mar 2021 09:32:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.32.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:32:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/54] hw/misc/iotkit-sysctl: Handle SSE-300 changes to
 PDCM_PD_*_SENSE registers
Date: Mon,  8 Mar 2021 17:32:07 +0000
Message-Id: <20210308173244.20710-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-18-peter.maydell@linaro.org
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
index 9ec02c3e942..aa8c49d9b6b 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -56,10 +56,11 @@ REG32(PWRCTRL, 0x1fc)
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
@@ -260,6 +261,18 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
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
@@ -267,6 +280,8 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_SSE200:
             r = s->pdcm_pd_sram0_sense;
             break;
+        case ARMSSE_SSE300:
+            goto bad_offset;
         default:
             g_assert_not_reached();
         }
@@ -278,6 +293,8 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_SSE200:
             r = s->pdcm_pd_sram1_sense;
             break;
+        case ARMSSE_SSE300:
+            goto bad_offset;
         default:
             g_assert_not_reached();
         }
@@ -289,6 +306,9 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_SSE200:
             r = s->pdcm_pd_sram2_sense;
             break;
+        case ARMSSE_SSE300:
+            r = s->pdcm_pd_vmr0_sense;
+            break;
         default:
             g_assert_not_reached();
         }
@@ -300,6 +320,9 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_SSE200:
             r = s->pdcm_pd_sram3_sense;
             break;
+        case ARMSSE_SSE300:
+            r = s->pdcm_pd_vmr1_sense;
+            break;
         default:
             g_assert_not_reached();
         }
@@ -554,6 +577,20 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
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
@@ -563,6 +600,8 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
                           "IoTKit SysCtl PDCM_PD_SRAM0_SENSE unimplemented\n");
             s->pdcm_pd_sram0_sense = value;
             break;
+        case ARMSSE_SSE300:
+            goto bad_offset;
         default:
             g_assert_not_reached();
         }
@@ -576,6 +615,8 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
                           "IoTKit SysCtl PDCM_PD_SRAM1_SENSE unimplemented\n");
             s->pdcm_pd_sram1_sense = value;
             break;
+        case ARMSSE_SSE300:
+            goto bad_offset;
         default:
             g_assert_not_reached();
         }
@@ -589,6 +630,11 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
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
@@ -602,6 +648,11 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
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
@@ -673,6 +724,9 @@ static void iotkit_sysctl_reset(DeviceState *dev)
     s->pdcm_pd_sram1_sense = 0;
     s->pdcm_pd_sram2_sense = 0;
     s->pdcm_pd_sram3_sense = 0;
+    s->pdcm_pd_cpu0_sense = 0;
+    s->pdcm_pd_vmr0_sense = 0;
+    s->pdcm_pd_vmr1_sense = 0;
 }
 
 static void iotkit_sysctl_init(Object *obj)
@@ -709,6 +763,9 @@ static const VMStateDescription iotkit_sysctl_sse300_vmstate = {
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


