Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FD410F52E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 03:49:10 +0100 (CET)
Received: from localhost ([::1]:47432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibyFR-00081T-6P
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 21:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32781)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ibxxI-0003M6-SD
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 21:30:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ibxxB-0008SV-8G
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 21:30:21 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46435)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ibxxA-0008I9-Np
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 21:30:16 -0500
Received: by mail-pg1-x544.google.com with SMTP id z124so851076pgb.13
 for <qemu-devel@nongnu.org>; Mon, 02 Dec 2019 18:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Yw6liUOnTrdCiX1bj2V8EHNGM2nemLD+p3/vAl9e62o=;
 b=PQrgbuw6OQKZbq9XNotG18JWkKYmvYeFzME4EbDrrbPaNcX3DEbB1R+vBZJ9YF0Yko
 29+xR7O8uRjBzhNMjwWd3vCnkOLpiggI7ZIAO/UO0RSWwW9c9QTr0+qSFbqREEampCjL
 Ks1AoQ6zqmOWsEQK90/MljU6c+mPAHYTogYBOxBHQ6GkpUj53kguQ414KPzN8N9luL7x
 jXATIfwqwECM1OsqqfL9XnTbWJktJ6AOPGJzh7D4EbzKqVFZsiiPkORAa+QDF6RObsbQ
 Z2S9nWnpbefgoZFGw/WhLNKykomLJ/eE6L3VFz7aS+VX+cmnsM1TmCWnkb1W9/Y2+xbS
 IN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Yw6liUOnTrdCiX1bj2V8EHNGM2nemLD+p3/vAl9e62o=;
 b=fXVcVPyuCOL7B6Bm+70oc8IMewEv292vFZy9TfPo/Th1brRzozehUerxS+Km7mZEor
 iAfWonK8/Z9ed3elzoo8jaYQsXYwBrv4JXXEbYGSytt1uzitM/XLQmZuZmGwtOlH0rex
 IbfuemT9rkaqDPTAFPEOA6Xe9q943zjJrccxVmkhT5DipPz4nVhHAr6PqA0kJRkXeUmH
 N8E2Mjgrs7UQI08PXsBhoHm9yOHCbbwPcGPzYuFt+b6h6fWA4EXxQaNiPHpsxf4S2bMS
 u8PGeEPsnGIGA0pjyi7xggzyz39g+ETk/2aF0NT0lppq4cs6qtmO/t11AmUbnPK1mz6Q
 n1Jw==
X-Gm-Message-State: APjAAAV9DEPi2GwlqF7e2XsJhlO/+mAZUvUiqb6G7nM4eXqPEWKcV9Su
 QN0m0Hp1357pgzZHhWxzx+rJAjKTy0o=
X-Google-Smtp-Source: APXvYqxYc1QvRA+b1Ge6RQYbSQCW7JWzGjz4+Jzwy1VlKXBuqeawnOkwJGzuY7++qAVidz97Qv6i+A==
X-Received: by 2002:a63:93:: with SMTP id 141mr2758722pga.411.1575340207863;
 Mon, 02 Dec 2019 18:30:07 -0800 (PST)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id q22sm873695pfg.170.2019.12.02.18.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 18:30:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/40] target/arm: Update aa64_zva_access for EL2
Date: Mon,  2 Dec 2019 18:29:19 -0800
Message-Id: <20191203022937.1474-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203022937.1474-1-richard.henderson@linaro.org>
References: <20191203022937.1474-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The comment that we don't support EL2 is somewhat out of date.
Update to include checks against HCR_EL2.TDZ.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4f5e0b656c..ffa82b5509 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4109,11 +4109,27 @@ static void tlbi_aa64_ipas2e1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                       bool isread)
 {
-    /* We don't implement EL2, so the only control on DC ZVA is the
-     * bit in the SCTLR which can prohibit access for EL0.
-     */
-    if (arm_current_el(env) == 0 && !(env->cp15.sctlr_el[1] & SCTLR_DZE)) {
-        return CP_ACCESS_TRAP;
+    int cur_el = arm_current_el(env);
+
+    if (cur_el < 2) {
+        uint64_t hcr = arm_hcr_el2_eff(env);
+
+        if (cur_el == 0) {
+            if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+                if (!(env->cp15.sctlr_el[2] & SCTLR_DZE)) {
+                    return CP_ACCESS_TRAP_EL2;
+                }
+            } else {
+                if (!(env->cp15.sctlr_el[1] & SCTLR_DZE)) {
+                    return CP_ACCESS_TRAP;
+                }
+                if (hcr & HCR_TDZ) {
+                    return CP_ACCESS_TRAP_EL2;
+                }
+            }
+        } else if (hcr & HCR_TDZ) {
+            return CP_ACCESS_TRAP_EL2;
+        }
     }
     return CP_ACCESS_OK;
 }
-- 
2.17.1


