Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA1331FB80
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:59:13 +0100 (CET)
Received: from localhost ([::1]:36194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7FQ-0000Yn-9a
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73K-0002AO-QV
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:45 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD739-0003PL-Hm
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:42 -0500
Received: by mail-wr1-x42f.google.com with SMTP id n4so8911247wrx.1
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Tnnq4eGrbcepmyuwUcHSjw4J1weXAX4V87WXkLtiaMI=;
 b=iS/6Mi5eEcWQVs5lLqw9gYqEXsdJQ6cL/dAlzbX2avR1NYnVp8EB8rh4SZvQllT76E
 tsKwIf/+IwPDA/Z7qHgDBs63TZgAG7+bZ+QUZIHgVtcwWm4pYJcJt0aBbP28wI4zA7ud
 Mi0JQu+tWmJCpr4KCAPT8+8EZu4X1aVoMtaecGS5QbBPtoDw+8FYAG9VFdpPEp/fHeie
 ef+6VCBFrEb6PePQIpyqkKxzOH4nv+TJ6rEj0xtzwtc9XpJL/jYq6qvuXMAzJvHNqMHj
 L35zX+rsGof1IIxvEa6t7GJNx81RiXyrBfyYfQBXKBfedCKCIfN+BCSnm9ojWOLFeYpn
 b2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tnnq4eGrbcepmyuwUcHSjw4J1weXAX4V87WXkLtiaMI=;
 b=q0xFtpFcshrzyL9d7OktXOmS/A8gQg1kX2QKM2fwsJVlBkg/sPaDPIbG76/Vg7zC7d
 I586ZKhSa4gUdKNv+KUam0mXDpWNDbMywTEQXvXANar1q9uxQU2C1UWAJ4qzmk6FUOEH
 hJivoAhXGSDhk+ewiNOQeskPPe3YYPYqL70Lox9QuZhuZTk0Ygmazwpa8uZpJrwDlm9d
 swgU4smupIj/Vcnc9KV1KT5KQTyr1XQLDbLmte9mUIuxWcyXnR9jfI94w+uIr+ArBidq
 8rlgVe6lC3L+y9ZecO7y1g9nbqUDEn4WZExErL9GrVS4/fxXhPrMzJ4LxJzFa/pA618M
 93dA==
X-Gm-Message-State: AOAM532MKTOTP45YWIdZebTuOUXIktzLCySUBY/gx3XN6/SGFpjb6xhw
 jSFuj2lw47lUSYwSI1GKkd5L/g==
X-Google-Smtp-Source: ABdhPJywvV2xKr6Ac+ZMjFb3+TFnh8Q4DgZ8TxfcdrASoWH1uerJO0ajhGfIZm2EVOAAzovGlt6w+w==
X-Received: by 2002:adf:9546:: with SMTP id 64mr9776580wrs.247.1613745987018; 
 Fri, 19 Feb 2021 06:46:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/44] hw/arm/armsse.c: Use correct SYS_CONFIG0 register value
 for SSE-300
Date: Fri, 19 Feb 2021 14:45:42 +0000
Message-Id: <20210219144617.4782-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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

In the SSE-300, the format of the SYS_CONFIG0 register has changed again;
pass through the correct value to the SYSINFO register block device.

We drop the old SysConfigFormat enum, which was implemented in the
hope that different flavours of SSE would share the same format;
since they all seem to be different and we now have an sse_version
enum to key off, just use that.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armsse.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 67fa4ffe34a..113a783a46a 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -24,12 +24,6 @@
 #include "hw/irq.h"
 #include "hw/qdev-clock.h"
 
-/* Format of the System Information block SYS_CONFIG register */
-typedef enum SysConfigFormat {
-    IoTKitFormat,
-    SSE200Format,
-} SysConfigFormat;
-
 struct ARMSSEInfo {
     const char *name;
     uint32_t sse_version;
@@ -37,7 +31,6 @@ struct ARMSSEInfo {
     int num_cpus;
     uint32_t sys_version;
     uint32_t cpuwait_rst;
-    SysConfigFormat sys_config_format;
     bool has_mhus;
     bool has_ppus;
     bool has_cachectrl;
@@ -78,7 +71,6 @@ static const ARMSSEInfo armsse_variants[] = {
         .num_cpus = 1,
         .sys_version = 0x41743,
         .cpuwait_rst = 0,
-        .sys_config_format = IoTKitFormat,
         .has_mhus = false,
         .has_ppus = false,
         .has_cachectrl = false,
@@ -93,7 +85,6 @@ static const ARMSSEInfo armsse_variants[] = {
         .num_cpus = 2,
         .sys_version = 0x22041743,
         .cpuwait_rst = 2,
-        .sys_config_format = SSE200Format,
         .has_mhus = true,
         .has_ppus = true,
         .has_cachectrl = true,
@@ -108,13 +99,13 @@ static uint32_t armsse_sys_config_value(ARMSSE *s, const ARMSSEInfo *info)
     /* Return the SYS_CONFIG value for this SSE */
     uint32_t sys_config;
 
-    switch (info->sys_config_format) {
-    case IoTKitFormat:
+    switch (info->sse_version) {
+    case ARMSSE_IOTKIT:
         sys_config = 0;
         sys_config = deposit32(sys_config, 0, 4, info->sram_banks);
         sys_config = deposit32(sys_config, 4, 4, s->sram_addr_width - 12);
         break;
-    case SSE200Format:
+    case ARMSSE_SSE200:
         sys_config = 0;
         sys_config = deposit32(sys_config, 0, 4, info->sram_banks);
         sys_config = deposit32(sys_config, 4, 5, s->sram_addr_width);
@@ -125,6 +116,12 @@ static uint32_t armsse_sys_config_value(ARMSSE *s, const ARMSSEInfo *info)
             sys_config = deposit32(sys_config, 28, 4, 2);
         }
         break;
+    case ARMSSE_SSE300:
+        sys_config = 0;
+        sys_config = deposit32(sys_config, 0, 4, info->sram_banks);
+        sys_config = deposit32(sys_config, 4, 5, s->sram_addr_width);
+        sys_config = deposit32(sys_config, 16, 3, 3); /* CPU0 = Cortex-M55 */
+        break;
     default:
         g_assert_not_reached();
     }
-- 
2.20.1


