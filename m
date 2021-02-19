Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D953431FB72
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:56:38 +0100 (CET)
Received: from localhost ([::1]:53050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7Cv-000456-Vn
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:56:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73E-00022r-6d
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:38 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD734-0003Nt-KT
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:35 -0500
Received: by mail-wr1-x436.google.com with SMTP id 7so8916897wrz.0
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JjzammxlnoyyAwwWhFgyD6FVkMWPaU3DMBqWjhwZgfk=;
 b=yelb6rlN3TMEUdtSsK4E/CbAAHpVpT7NJIbyy4l/jesi59UhvzYB3mkkvU85KkntT6
 tId7Xw/jX4G4HBiMb52ChjBO4IWqU5EiGplFf1EhCbGqpcGLrjZ1j5/k6ykpPbvjcqNk
 Bc/LeYKxTRtBD20jiSAnO52EvtoZ+9NAhdWw9AEzRgVtiyNcjex+R3v9MPqTT5RBHtu9
 iMOLPe/C0il+QaVUG5o3dxuG2G4YArdFt/UCjZyHl841apvkTnpuvSYi8r2Zh/4ARgB4
 yDu/GPLli58I+3UTMXUZoozLlzf2MKorE58NLgJeh/2SyzwryKOZtmoiTpWq8sF7PFYK
 ti6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JjzammxlnoyyAwwWhFgyD6FVkMWPaU3DMBqWjhwZgfk=;
 b=gk3pD2/LnoOBnmBejQPPJy3kSviqAKfGeK1kLkafj34U5U2TdSycCnHRD/dAq+DMUc
 goITsmbDJl0EVud8HO7NXCDWZIi/3/R+dZPnjGf1tRVAS8pmH0Hpg9eYwoH59VFQkV07
 PBDWL1eXtkYRYaEjYgFq74WCAz9POhHsnvzJZ7F9e3/XeXF2kCpnuE7Ewrv5EHoG5TxL
 ddXs85IHLIql4DcL4Po/J9LOyoIppNCFOgNszpstXHGZMKuoXJsHC6a7cmZx7KkMc/h0
 K9CIgPew9cZ4N//aEwJ4iOoIvexm64l8dkFrgXvA3gfv8VZgT4k5YoSOfxn0qoRD6n0P
 kVUQ==
X-Gm-Message-State: AOAM5331cxpfkqXXXcEXJTMGvNYwp3aQ1IkJ2bbXvSPH0umgC0+LcKJy
 ZYJpxSHbawciCAdEWmi+F+pl4A==
X-Google-Smtp-Source: ABdhPJzk6PnizGY+7HHeQXL1tWRu3gGKhS+eqkpUuAI2UkY2IcX5wOLfhre4JAI9bt5JmumWkQwIJg==
X-Received: by 2002:adf:fa01:: with SMTP id m1mr2165556wrr.209.1613745985002; 
 Fri, 19 Feb 2021 06:46:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/44] hw/misc/iotkit-sysctl: Remove is_sse200 flag
Date: Fri, 19 Feb 2021 14:45:39 +0000
Message-Id: <20210219144617.4782-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Remove the is_sse200 flag in favour of just directly testing the new
sse_version field.

Since some of these registers exist in the SSE-300 but some do not or
have different behaviour, we expand out the if() statements in the
read and write functions into switch()es, so we have an easy place to
put SSE-300 specific behaviour.

(Until we do add the SSE-300 behaviour, the thing preventing us
reaching the "unreachable" default cases is that armsse.c doesn't
yet pass us an ARMSSE_SSE300 version.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/iotkit-sysctl.h |   2 -
 hw/misc/iotkit-sysctl.c         | 256 +++++++++++++++++++++++---------
 2 files changed, 187 insertions(+), 71 deletions(-)

diff --git a/include/hw/misc/iotkit-sysctl.h b/include/hw/misc/iotkit-sysctl.h
index 7cdafea3e25..980c2ddfd3c 100644
--- a/include/hw/misc/iotkit-sysctl.h
+++ b/include/hw/misc/iotkit-sysctl.h
@@ -64,8 +64,6 @@ struct IoTKitSysCtl {
     uint32_t cpuwait_rst;
     uint32_t initsvtor0_rst;
     uint32_t initsvtor1_rst;
-
-    bool is_sse200;
 };
 
 #endif
diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index 34b37fe8824..c67f5b320ab 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -101,28 +101,48 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         r = s->secure_debug;
         break;
     case A_SCSECCTRL:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->scsecctrl;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->scsecctrl;
         break;
     case A_FCLK_DIV:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->fclk_div;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->fclk_div;
         break;
     case A_SYSCLK_DIV:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->sysclk_div;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->sysclk_div;
         break;
     case A_CLOCK_FORCE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->clock_force;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->clock_force;
         break;
     case A_RESET_SYNDROME:
         r = s->reset_syndrome;
@@ -137,60 +157,100 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         r = s->initsvtor0;
         break;
     case A_INITSVTOR1:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->initsvtor1;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->initsvtor1;
         break;
     case A_CPUWAIT:
         r = s->cpuwait;
         break;
     case A_NMI_ENABLE:
-        /* In IoTKit this is named BUSWAIT but is marked reserved, R/O, zero */
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
+            /* In IoTKit this is named BUSWAIT but marked reserved, R/O, zero */
             r = 0;
             break;
+        case ARMSSE_SSE200:
+            r = s->nmi_enable;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->nmi_enable;
         break;
     case A_WICCTRL:
         r = s->wicctrl;
         break;
     case A_EWCTRL:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->ewctrl;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->ewctrl;
         break;
     case A_PDCM_PD_SYS_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->pdcm_pd_sys_sense;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->pdcm_pd_sys_sense;
         break;
     case A_PDCM_PD_SRAM0_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->pdcm_pd_sram0_sense;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->pdcm_pd_sram0_sense;
         break;
     case A_PDCM_PD_SRAM1_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->pdcm_pd_sram1_sense;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->pdcm_pd_sram1_sense;
         break;
     case A_PDCM_PD_SRAM2_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->pdcm_pd_sram2_sense;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->pdcm_pd_sram2_sense;
         break;
     case A_PDCM_PD_SRAM3_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->pdcm_pd_sram3_sense;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->pdcm_pd_sram3_sense;
         break;
     case A_PID4 ... A_CID3:
         r = sysctl_id[(offset - A_PID4) / 4];
@@ -284,94 +344,154 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
         }
         break;
     case A_SCSECCTRL:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl SCSECCTRL unimplemented\n");
+            s->scsecctrl = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl SCSECCTRL unimplemented\n");
-        s->scsecctrl = value;
         break;
     case A_FCLK_DIV:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl FCLK_DIV unimplemented\n");
+            s->fclk_div = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl FCLK_DIV unimplemented\n");
-        s->fclk_div = value;
         break;
     case A_SYSCLK_DIV:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl SYSCLK_DIV unimplemented\n");
+            s->sysclk_div = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl SYSCLK_DIV unimplemented\n");
-        s->sysclk_div = value;
         break;
     case A_CLOCK_FORCE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl CLOCK_FORCE unimplemented\n");
+            s->clock_force = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl CLOCK_FORCE unimplemented\n");
-        s->clock_force = value;
         break;
     case A_INITSVTOR1:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            s->initsvtor1 = value;
+            set_init_vtor(1, s->initsvtor1);
+            break;
+        default:
+            g_assert_not_reached();
         }
-        s->initsvtor1 = value;
-        set_init_vtor(1, s->initsvtor1);
         break;
     case A_EWCTRL:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl EWCTRL unimplemented\n");
+            s->ewctrl = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl EWCTRL unimplemented\n");
-        s->ewctrl = value;
         break;
     case A_PDCM_PD_SYS_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP,
+                          "IoTKit SysCtl PDCM_PD_SYS_SENSE unimplemented\n");
+            s->pdcm_pd_sys_sense = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP,
-                      "IoTKit SysCtl PDCM_PD_SYS_SENSE unimplemented\n");
-        s->pdcm_pd_sys_sense = value;
         break;
     case A_PDCM_PD_SRAM0_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP,
+                          "IoTKit SysCtl PDCM_PD_SRAM0_SENSE unimplemented\n");
+            s->pdcm_pd_sram0_sense = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP,
-                      "IoTKit SysCtl PDCM_PD_SRAM0_SENSE unimplemented\n");
-        s->pdcm_pd_sram0_sense = value;
         break;
     case A_PDCM_PD_SRAM1_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP,
+                          "IoTKit SysCtl PDCM_PD_SRAM1_SENSE unimplemented\n");
+            s->pdcm_pd_sram1_sense = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP,
-                      "IoTKit SysCtl PDCM_PD_SRAM1_SENSE unimplemented\n");
-        s->pdcm_pd_sram1_sense = value;
         break;
     case A_PDCM_PD_SRAM2_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP,
+                          "IoTKit SysCtl PDCM_PD_SRAM2_SENSE unimplemented\n");
+            s->pdcm_pd_sram2_sense = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP,
-                      "IoTKit SysCtl PDCM_PD_SRAM2_SENSE unimplemented\n");
-        s->pdcm_pd_sram2_sense = value;
         break;
     case A_PDCM_PD_SRAM3_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP,
+                          "IoTKit SysCtl PDCM_PD_SRAM3_SENSE unimplemented\n");
+            s->pdcm_pd_sram3_sense = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP,
-                      "IoTKit SysCtl PDCM_PD_SRAM3_SENSE unimplemented\n");
-        s->pdcm_pd_sram3_sense = value;
         break;
     case A_NMI_ENABLE:
         /* In IoTKit this is BUSWAIT: reserved, R/O, zero */
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto ro_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl NMI_ENABLE unimplemented\n");
+            s->nmi_enable = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl NMI_ENABLE unimplemented\n");
-        s->nmi_enable = value;
         break;
     case A_SECDBGSTAT:
     case A_PID4 ... A_CID3:
@@ -443,15 +563,13 @@ static void iotkit_sysctl_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "invalid sse-version value %d", s->sse_version);
         return;
     }
-
-    s->is_sse200 = s->sse_version == ARMSSE_SSE200;
 }
 
 static bool sse200_needed(void *opaque)
 {
     IoTKitSysCtl *s = IOTKIT_SYSCTL(opaque);
 
-    return s->is_sse200;
+    return s->sse_version == ARMSSE_SSE200;
 }
 
 static const VMStateDescription iotkit_sysctl_sse200_vmstate = {
-- 
2.20.1


