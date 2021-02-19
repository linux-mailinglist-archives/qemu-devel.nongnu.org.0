Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAB631FBAE
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:09:02 +0100 (CET)
Received: from localhost ([::1]:33734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7Ov-0003lP-KC
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73b-0002Sp-VK
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:01 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73B-0003Ud-Vq
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:59 -0500
Received: by mail-wr1-x429.google.com with SMTP id b3so8885789wrj.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TmDv8Ark28Kk9q6F5pp4r3C2pFWL+y0OiDgJ+fBRPtM=;
 b=XgemUiF3rhqVMDpiCR3mpwvvfjCgIjV/dS9mcUiHa4YtQcttLdMpwWQaM6gu3dtDac
 Go1eSgONVGMZltDUBuJryvPw3N/7jfC9K4i/+0y99GJelGfPD8axuQnJBMn7oemBXfv5
 bEfJ4QBISMtkdag9wCy6NLbSdDqqJqPCVJNrkbLxFFX3fYYygNtD0bo3ujw4qzDhQcEE
 /A1dm32oCqsW1mGQTON2Z790MBHGc4mxgTaPkkW36zpJlgDp1mlKZDE+0iedsiTpPKAP
 egSAffQZHGmpxeRKn+fTZfiYFEB3sJfgHY0jU88a9gWIerpAV3LszYzcOqMqiUvWMAzk
 Fvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TmDv8Ark28Kk9q6F5pp4r3C2pFWL+y0OiDgJ+fBRPtM=;
 b=gmmlDRDdfEPveyqQlrZZKuw/1YYU2tbJUkMsvEwkrYv2A7Wt4pbFOzZSI/oB436sLt
 okxuWiG0DpIuGomX62tHePkfkvKK6uG5XlEQkQIr3OODw3I0wJI2UZ8+FCC9X3kAB7ja
 qOpZiqymTBnH3K1vA3K3sXeR6r87V/RGI7Vca5K0bMZEsuEFldxBHvM2OCUh0sx6vy7o
 wznV1ejUnzcBN8+9AIrvimivpwUjQ8D/+irpeNWdykLtlVqeOcEA1OJejHQuJp3wVBaw
 Mhsnhu4ahFcXa9FWa5QlDEOyQw1ToENN0/MpSWM4v+C2OIi7ycs+370lCllZDYAuWnhX
 Aonw==
X-Gm-Message-State: AOAM532Es3ybst/AIndTG52oHKJmFiQylVgV8Rz3X9BmjgGMaHSBvDK6
 zZ6FAhEMSvXX31hT0ptM5fsXng==
X-Google-Smtp-Source: ABdhPJxey8WYXdmOccnH0oyLtyKaDSLJUZoh04S/4m5nSg467p/pjI5nOirLd7lYbuQthxDj8s86qQ==
X-Received: by 2002:a5d:47a8:: with SMTP id 8mr9264896wrb.180.1613745992570;
 Fri, 19 Feb 2021 06:46:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 16/44] hw/misc/iotkit-sysctl: Implement dummy version of
 SSE-300 PWRCTRL register
Date: Fri, 19 Feb 2021 14:45:49 +0000
Message-Id: <20210219144617.4782-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
index ab97055f529..e8255d26b5a 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -51,6 +51,9 @@ REG32(CPUWAIT, 0x118)
 REG32(NMI_ENABLE, 0x11c) /* BUSWAIT in IoTKit */
 REG32(WICCTRL, 0x120)
 REG32(EWCTRL, 0x124)
+REG32(PWRCTRL, 0x1fc)
+    FIELD(PWRCTRL, PPU_ACCESS_UNLOCK, 0, 1)
+    FIELD(PWRCTRL, PPU_ACCESS_FILTER, 1, 1)
 REG32(PDCM_PD_SYS_SENSE, 0x200)
 REG32(PDCM_PD_SRAM0_SENSE, 0x20c)
 REG32(PDCM_PD_SRAM1_SENSE, 0x210)
@@ -232,6 +235,18 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
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
@@ -507,6 +522,23 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
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
@@ -634,6 +666,7 @@ static void iotkit_sysctl_reset(DeviceState *dev)
     s->clock_force = 0;
     s->nmi_enable = 0;
     s->ewctrl = 0;
+    s->pwrctrl = 0x3;
     s->pdcm_pd_sys_sense = 0x7f;
     s->pdcm_pd_sram0_sense = 0;
     s->pdcm_pd_sram1_sense = 0;
@@ -661,6 +694,24 @@ static void iotkit_sysctl_realize(DeviceState *dev, Error **errp)
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
@@ -705,6 +756,7 @@ static const VMStateDescription iotkit_sysctl_vmstate = {
     },
     .subsections = (const VMStateDescription*[]) {
         &iotkit_sysctl_sse200_vmstate,
+        &iotkit_sysctl_sse300_vmstate,
         NULL
     }
 };
-- 
2.20.1


