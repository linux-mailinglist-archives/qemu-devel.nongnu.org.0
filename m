Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF85331574
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:05:12 +0100 (CET)
Received: from localhost ([::1]:40434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKFj-0008VS-RD
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:05:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkr-0006et-NW
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:17 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJka-00073t-Rt
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:17 -0500
Received: by mail-wr1-x429.google.com with SMTP id u14so12349699wri.3
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=36RrchMeKZ1IRxEhRHo7H/uq/VbowPYdPDt5loQf2G0=;
 b=sNMsmyx8sJ5miAJqL092fk37/4Wm/9aMgsm7g20czCMsQN2ZwalxnrzNVzFxTXbRXv
 qf5pmbmfq4EMb7F3oxWOdhQpODPEtqLZEaRhVyhRoecZIK7Mhf5OlfCQoN79q5YoUzAt
 geWgs7DymQZxVld+BKUkFXAqj2uKQhse2fxzSFib+rowmzgX+hYDGH3uXdW9wZ0xEYL7
 W9/meTKceY33NAaQYsT8Z83UuYVNAe+uskqu+/nLWymhzImlRTpBFdw+64f9iXD2Faim
 PEbOmCiJ2OfKoCmaxX4T1sM612jsBeSifIwqco7DPMyC70FkY9Olu35yhELE2Bpg6G77
 W3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=36RrchMeKZ1IRxEhRHo7H/uq/VbowPYdPDt5loQf2G0=;
 b=a6gde0ht/SwBk2SCBy8v556EPxsh3OvUjpggCutjXM8gzAYpue5mBKEXq+6A3jfSDb
 BhVFT3WuF8icSDwRlWzymGp3Fg9pfVEREzK5wdngMpxHKTxuyAtEPkgsO5phbPzzQeS8
 LMfsZITpye2DlHf9J/gdCIVbHx2pEgnixzqMFuJEU93WgfDwdbMGig6TxEX6WqirDi+J
 Ebktc2TyWpgifO5uga56synfYdqt+IT/4fgYArfsxhmjMY1AxMPtNAfV6QCMsjINliCU
 M3jjlR9GcVRHJLhEB+hClL8DouhtvBMOHucn6qQrRZoM1QiOfcuC7DhCirOnVKM9LD1h
 oaOA==
X-Gm-Message-State: AOAM532I8jra0lh+efygAtlWN3zeZ1qHl0+q27dxeInLokDGYF13Folz
 bKKc5gf5a1PiiehN6nSScG0DvBgReQUfjg==
X-Google-Smtp-Source: ABdhPJwCDkJ1TegPjRx5goTXF/iflUpK3JCO8ys9/LDBPtY9v5Tpz6/dIjsavJ9Rzqj6HWQb5vaD1A==
X-Received: by 2002:adf:f7cc:: with SMTP id a12mr24030861wrq.54.1615224778832; 
 Mon, 08 Mar 2021 09:32:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.32.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:32:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/54] hw/misc/iotkit-sysctl: Implement dummy version of
 SSE-300 PWRCTRL register
Date: Mon,  8 Mar 2021 17:32:06 +0000
Message-Id: <20210308173244.20710-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

The SSE-300 has a new PWRCTRL register at offset 0x1fc (previously
reserved). This register controls accessibility of some registers
in the Power Policy Units (PPUs). Since QEMU doesn't implement
the PPUs, we don't need to implement any real behaviour for this
register, so we just handle the UNLOCK bit which controls whether
writes to the register itself are permitted and otherwise make it
be reads-as-written.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-17-peter.maydell@linaro.org
---
 include/hw/misc/iotkit-sysctl.h |  1 +
 hw/misc/iotkit-sysctl.c         | 52 +++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/include/hw/misc/iotkit-sysctl.h b/include/hw/misc/iotkit-sysctl.h
index 980c2ddfd3c..8859b15d73b 100644
--- a/include/hw/misc/iotkit-sysctl.h
+++ b/include/hw/misc/iotkit-sysctl.h
@@ -53,6 +53,7 @@ struct IoTKitSysCtl {
     uint32_t initsvtor1;
     uint32_t nmi_enable;
     uint32_t ewctrl;
+    uint32_t pwrctrl;
     uint32_t pdcm_pd_sys_sense;
     uint32_t pdcm_pd_sram0_sense;
     uint32_t pdcm_pd_sram1_sense;
diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index 511ede089c2..9ec02c3e942 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -52,6 +52,9 @@ REG32(CPUWAIT, 0x118)
 REG32(NMI_ENABLE, 0x11c) /* BUSWAIT in IoTKit */
 REG32(WICCTRL, 0x120)
 REG32(EWCTRL, 0x124)
+REG32(PWRCTRL, 0x1fc)
+    FIELD(PWRCTRL, PPU_ACCESS_UNLOCK, 0, 1)
+    FIELD(PWRCTRL, PPU_ACCESS_FILTER, 1, 1)
 REG32(PDCM_PD_SYS_SENSE, 0x200)
 REG32(PDCM_PD_SRAM0_SENSE, 0x20c)
 REG32(PDCM_PD_SRAM1_SENSE, 0x210)
@@ -233,6 +236,18 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
             g_assert_not_reached();
         }
         break;
+    case A_PWRCTRL:
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
+        case ARMSSE_SSE200:
+            goto bad_offset;
+        case ARMSSE_SSE300:
+            r = s->pwrctrl;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        break;
     case A_PDCM_PD_SYS_SENSE:
         switch (s->sse_version) {
         case ARMSSE_IOTKIT:
@@ -508,6 +523,23 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
             g_assert_not_reached();
         }
         break;
+    case A_PWRCTRL:
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
+        case ARMSSE_SSE200:
+            goto bad_offset;
+        case ARMSSE_SSE300:
+            if (!(s->pwrctrl & R_PWRCTRL_PPU_ACCESS_UNLOCK_MASK)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "IoTKit PWRCTRL write when register locked\n");
+                break;
+            }
+            s->pwrctrl = value;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        break;
     case A_PDCM_PD_SYS_SENSE:
         switch (s->sse_version) {
         case ARMSSE_IOTKIT:
@@ -635,6 +667,7 @@ static void iotkit_sysctl_reset(DeviceState *dev)
     s->clock_force = 0;
     s->nmi_enable = 0;
     s->ewctrl = 0;
+    s->pwrctrl = 0x3;
     s->pdcm_pd_sys_sense = 0x7f;
     s->pdcm_pd_sram0_sense = 0;
     s->pdcm_pd_sram1_sense = 0;
@@ -662,6 +695,24 @@ static void iotkit_sysctl_realize(DeviceState *dev, Error **errp)
     }
 }
 
+static bool sse300_needed(void *opaque)
+{
+    IoTKitSysCtl *s = IOTKIT_SYSCTL(opaque);
+
+    return s->sse_version == ARMSSE_SSE300;
+}
+
+static const VMStateDescription iotkit_sysctl_sse300_vmstate = {
+    .name = "iotkit-sysctl/sse-300",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = sse300_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(pwrctrl, IoTKitSysCtl),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static bool sse200_needed(void *opaque)
 {
     IoTKitSysCtl *s = IOTKIT_SYSCTL(opaque);
@@ -706,6 +757,7 @@ static const VMStateDescription iotkit_sysctl_vmstate = {
     },
     .subsections = (const VMStateDescription*[]) {
         &iotkit_sysctl_sse200_vmstate,
+        &iotkit_sysctl_sse300_vmstate,
         NULL
     }
 };
-- 
2.20.1


