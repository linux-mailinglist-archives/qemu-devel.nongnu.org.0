Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F0B331538
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:51:23 +0100 (CET)
Received: from localhost ([::1]:60004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJK2M-0001Lg-NE
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkX-0006T1-Ho
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:01 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkT-00071P-2K
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:32:57 -0500
Received: by mail-wr1-x435.google.com with SMTP id b18so12330274wrn.6
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UgQVj1xUbdSa2HwBsp43GVc2QdLfNOw5vVbdlhyRPxU=;
 b=OG0qLsgJEAKa3Lev6C2djgHATj0qjUvL1t8ChTme3C1dv+EKBrI6L70BIlPp2QVyTb
 i7msmPnZv8VwQpMPeUHP4b6bRiBbh4XwyTDMkIadAioXBIeYwrcaUkcJTV48Ul7L0XL0
 T3dyVL+yEc8Gm546UxS6ImNxCN7+GLHYeWHDT83Hd1ffxte1uQnP8fphmgXuygMf5pm2
 tffUs1KmJPGhy3MFXx9olDCLeGSAxV5sGEluq4IQCxPIDf6vHpL5+3Pw7R4yoxZiulb0
 UggAvhW0HQCDJxmWJs8a3wIcZLlfBP3VQifurj3Au+IOUhWvwYe9d/HjuBOIaXvzSlyw
 n8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UgQVj1xUbdSa2HwBsp43GVc2QdLfNOw5vVbdlhyRPxU=;
 b=LwA4Lzga1SCitR3WV+K1Mj4+GD1PH5Vfkp/+8I3ZpLVSsueidPgf0eo5ZmXPr9ixHO
 M23JpA2xiEo4s5zTuLfNwRmoBnJYqRzzjMN+dNuOb4MClmIyw2th6gma8BQ4dvXK/8f+
 EYBiwVS13vg+jQvzTfxuV/j9oXqlYJZ14SbmYH3CyvUP49AbKRnlgGeLYpcbwq/m9uaH
 1QS6roI7dX8YK2lU2sAHS8/tFcpY+9AVSjgdKNFqMQpFmCHLyTybX7Lhj0Me54EZbQMq
 7hrGa+81wZ/2JvthR+LmKPybSZr2IKu4dOvSbIu+rOzIFNRPljjeI5FqmMJPm7dXMQ5B
 cFvQ==
X-Gm-Message-State: AOAM530g6sgBAWDlSkutzKO8DC+PnJVob6Y0tjrO6pJqr0bEdRsUBr9m
 avQGxGQouPxfMW9LvKG/LpiqKpAgTTyciQ==
X-Google-Smtp-Source: ABdhPJw6kwMIR1tR0MyIhVsVfHDN/GnmG+EFsOtc/ZfcHWAmi2QMecrAhdtxOz4QBbdkLJD9CQ/hIg==
X-Received: by 2002:adf:f0c1:: with SMTP id x1mr23574499wro.7.1615224771281;
 Mon, 08 Mar 2021 09:32:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.32.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:32:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/54] hw/misc/iotkit-sysctl: Remove is_sse200 flag
Date: Mon,  8 Mar 2021 17:31:56 +0000
Message-Id: <20210308173244.20710-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-7-peter.maydell@linaro.org
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


