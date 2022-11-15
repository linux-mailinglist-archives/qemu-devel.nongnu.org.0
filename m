Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DBA629EC6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 17:18:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouydL-00076I-IE; Tue, 15 Nov 2022 11:17:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouyd4-0006xN-3A
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:17:47 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouyd1-0007OT-Px
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:17:41 -0500
Received: by mail-wr1-x42a.google.com with SMTP id g12so24954849wrs.10
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 08:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A0oqifx7nFQ8c8YiTcc3Tl+0de2kLNp9JgSCsS2wc6A=;
 b=Y2g1G61i3bJUAmz4jbXwI5p43+lO5roHNTiJhMktsZClsJxJp6ZQIVc/NfhqOe48p4
 Av+tXaQN4EgNwQ9k3Wudf9ahor4I5Gas0lu8gfyp1Jxx+FncKtUdXeGA63k+6tvcneA8
 LbSNEmB3u33Zjb2FPQDk6nr6ECh8/eAi9FJol2slvKVJQlRlyZsma2ujWAvHhiPDMUQ8
 NkxmxQyjx8QO6h16g8SlCoO7ohZuWZHsPY2/YllAS8VQEzO4ZsPXriMkkhSfYjMSKQuy
 uS5x4v4fTo/qlMwsToxPVX5Ndin1bj+ZWS/Uss6cDxShTZyiKUQmSnHLJ248G8i76TER
 6ugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A0oqifx7nFQ8c8YiTcc3Tl+0de2kLNp9JgSCsS2wc6A=;
 b=x8+wnvAmwX2wf0z3tQEVuZIcrkVIKKpdW2HmxffQCYiaIdRLWCWkr5QQJNTV5DHsP0
 KtyZDDzRVWbzugdrd/kQ4YiS3QEPnoUrgXeR62dQ+NI29j5JCYgvP4FdI7C20ASpbNSL
 SHLQWzcL0MuaErDITOskua4iYf6U5FzBoOdB/PMAneLkkTu6f7iagxMpfzECJ3Fat6rC
 1VPAB8U1rnyxAFBJzl7kn4PbLxjBaaEl73iTb+PdEJgH4UOQDdJ8toQVyQ0PqwDYBCPo
 VsDP+Zu3/+PV/dWV8MoE0ygItH2FccXmjlnfdcDf2AfRXj2MPpwJ/6+L9XYfpAXiZGZP
 Ap5A==
X-Gm-Message-State: ANoB5pnQ7NmLDDMlHNOrfEISmiA30gBpQNK53gjCkDAnagXKgET8R+Jy
 YAvw0lvzrYscw/0H9T/q/z1Q0Q==
X-Google-Smtp-Source: AA0mqf6SilAiZP+wfbL98IiCM0JNVsQbpzjOryOShjHs5qkHYNEAFI5nt3z0LWtPLYsHVlGJewZh0w==
X-Received: by 2002:adf:f74f:0:b0:22c:f296:1120 with SMTP id
 z15-20020adff74f000000b0022cf2961120mr10803620wrp.369.1668529058001; 
 Tue, 15 Nov 2022 08:17:38 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q13-20020adfea0d000000b0023677fd2657sm12650100wrm.52.2022.11.15.08.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 08:17:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EA5F31FFB8;
 Tue, 15 Nov 2022 16:17:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH  v2 1/2] hw/intc: clean-up access to GIC multi-byte registers
Date: Tue, 15 Nov 2022 16:17:35 +0000
Message-Id: <20221115161736.2425584-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115161736.2425584-1-alex.bennee@linaro.org>
References: <20221115161736.2425584-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

gic_dist_readb was returning a word value which just happened to work
as a result of the way we OR the data together. Lets fix it so only
the explicit byte is returned for each part of GICD_TYPER. I've
changed the return type to uint8_t although the overflow is only
detected with an explicit -Wconversion.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/arm_gic.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 492b2421ab..1a04144c38 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -941,7 +941,7 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
     gic_update(s);
 }
 
-static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
+static uint8_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
     uint32_t res;
@@ -955,6 +955,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
     cm = 1 << cpu;
     if (offset < 0x100) {
         if (offset == 0) {      /* GICD_CTLR */
+            /* We rely here on the only non-zero bits being in byte 0 */
             if (s->security_extn && !attrs.secure) {
                 /* The NS bank of this register is just an alias of the
                  * EnableGrp1 bit in the S bank version.
@@ -964,11 +965,14 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
                 return s->ctlr;
             }
         }
-        if (offset == 4)
-            /* Interrupt Controller Type Register */
-            return ((s->num_irq / 32) - 1)
-                    | ((s->num_cpu - 1) << 5)
-                    | (s->security_extn << 10);
+        if (offset == 4) {
+            /* GICD_TYPER byte 0 */
+            return ((s->num_irq / 32) - 1) | ((s->num_cpu - 1) << 5);
+        }
+        if (offset == 5) {
+            /* GICD_TYPER byte 1 */
+            return (s->security_extn << 2);
+        }
         if (offset < 0x08)
             return 0;
         if (offset >= 0x80) {
-- 
2.34.1


