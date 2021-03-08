Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE2133154A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:54:30 +0100 (CET)
Received: from localhost ([::1]:40184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJK5O-000527-00
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJke-0006V4-6q
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:07 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkU-00071s-RK
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:03 -0500
Received: by mail-wr1-x42d.google.com with SMTP id b18so12330390wrn.6
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=t/0i5gP0fvOyDNPaVkl4SmcpUrXx30uegWr0B09D6oA=;
 b=sFt8QJAypq2Xw46PVFxszoLTMKYv+K/2skuAp+2VL+Bj5E+UJk/PelU0I77oGVljf4
 F3TUGyZ4YVlmv9XHgFR+qdinnQqJ3NkTwIjC4dERDGTUDWDUP7Uz+NQskexkCmEW6wKQ
 6envNJd6j3TfxTr7U6EVMiKAIfsLE6q7i5i1r6gCCFtrfB8v5j4jn/0xpE2GgXnNvA25
 rjQufBvS0E4PgH0cnqeNn8/GOps7BJnoFwAfBYJI847RBZGhupDGzIsfqhJOMAlJZxjv
 ovTTduqANJTixzWJqVeSe61h5OpNY/K0WG1yLc27Xs3LuPW66eqHxHT++TsEX8FxgwUq
 HlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t/0i5gP0fvOyDNPaVkl4SmcpUrXx30uegWr0B09D6oA=;
 b=XtqwxJSjhgRAcemoLaEzu7Kv3klr5BDmOCEg9/ciWRyfGvLCpJwJlzGfxzTLzh7C5m
 jTlAWPX0LPq6Bz99GOd0Ell1O9xygwFkIMIXgEE5h7yjUwmYtVdZFVF64biQeIr3hww5
 EPG3oyYYtP/kbu89VcZl1JEMONFQESm9Vsl2M9uZ3yo591lDolt7/lpzC10RYlRgltzN
 e7Z3ejFyN/91F86pSvYB0HIpVu27GqNAYwxGSbwe5ZI1boOQ5TvREPXRPom6iJk0QmUS
 VS/ft8s1Meldh2p+X+dgEAcCXKlVzgx5rcFi6GTKHGxXOkOwEHzBS+DDTUeyF3wp01ZX
 nVFw==
X-Gm-Message-State: AOAM532jVQLXlD1WZUVq+++fIbNp83lfK3kE0We4JC/yah6MjbKPRXxP
 rX7kWdFxJBJeKshhBckeC6drDFAlYWRgkA==
X-Google-Smtp-Source: ABdhPJxFi2x30/1yZ+alx5RbzB7b0JteZJ/oKAl3+75r0FZfThIfmhtaGRJU2tifjnFfSdmE6SYC6g==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr23877167wrt.133.1615224773244; 
 Mon, 08 Mar 2021 09:32:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.32.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:32:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/54] hw/arm/armsse.c: Use correct SYS_CONFIG0 register value
 for SSE-300
Date: Mon,  8 Mar 2021 17:31:59 +0000
Message-Id: <20210308173244.20710-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-10-peter.maydell@linaro.org
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


