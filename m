Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5AB6A4D4A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 22:35:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWl82-0007Dd-4f; Mon, 27 Feb 2023 16:33:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl80-0007Cu-8y
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:48 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7y-0004Fz-Sm
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:48 -0500
Received: by mail-pl1-x632.google.com with SMTP id u5so4860874plq.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 13:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ktLcLczpC5J61u+Wz7S4IYVLAaoqvKihU89wRw7bX20=;
 b=p63P1GiZPmiY8xvzMOADD+GWqI2H568kbhWRm5rtCG+A/8yhcYfqA8m/I79BDsdvp/
 Ktn6gtA4Bt8egk+vfdZsuVIvfv0dwpuSiPcMXaaeXBLR91gkmvtDDJaQwVutQkqSCfJO
 oZfeCM2+f+q+8VXHR4T0tn7gg5Hv4AzHu0N066Qo7HjkWJgbMBVMCQWYpnfa3wNT/vC8
 u5j53McfRhkl2HaNKl48dtAEhOwHBP0UqVDE0pD7ap4+GsWfyN4tMQ7ExJe/FmC3aTr5
 3woO7vUrUlthqXyFtCcMfvjzsyz21IkCDr8gEEMO/OV36IFMEZBtvPCmc0y78T1r5xjr
 Z0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ktLcLczpC5J61u+Wz7S4IYVLAaoqvKihU89wRw7bX20=;
 b=IrzcIsZXFsCM/PjE9HE9rSgrwicMOjZvzk1EYJkod8qtcjaPt2oa6fiEq6nTYYh3VX
 NP20a8tbqSCq/OBWXp5/3ybjfZ8uPgrz8bMVuJxbJ9RIh6AdjClnAQnJaMTFU5+P/P3X
 87XG3XeVnI+nYNBmk72ovoeG/tfIdmD/Q4NYljE2cS61W6LjFNM0j8eB7cDUKZo8ucbT
 kXYlR9mciGZylHHQV21Pet4aGrGfvRTetqR51RHrKe8rX7JGnNrQihUv1dzhquH08Tve
 m3KAxq+wXB3qoE1H8KzpXSjiaiVcdnLwJ/3vaNc8MdMIOVgitACEIHs3vmmv8X1jhbgG
 PROg==
X-Gm-Message-State: AO0yUKX9Lxt+70IFSI5nEyxeX0AB/1Rj08ypUk/l+aZeE4jtby1ImUf/
 UHGcXpRsWu56yHGNaOV1SzhXeCRDEnMTwgXKDhE=
X-Google-Smtp-Source: AK7set92L19KYZNGsU/rsrh9cfLJi55mrYBZh+NYSpK6+wIpg3nBfr7ZkRDV1OakFyh9Is170on+sQ==
X-Received: by 2002:a17:903:283:b0:19c:ac9d:f682 with SMTP id
 j3-20020a170903028300b0019cac9df682mr430578plr.25.1677533626115; 
 Mon, 27 Feb 2023 13:33:46 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 09/14] target/arm: Simplify iteration over bit widths
Date: Mon, 27 Feb 2023 11:33:24 -1000
Message-Id: <20230227213329.793795-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Order suf[] by the log8 of the width.
Use ARRAY_SIZE instead of hard-coding 128.

This changes the order of the union definitions,
but retains the order of the union-of-union members.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 36166bf81e..3d9e9e97c8 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -240,8 +240,8 @@ static void output_vector_union_type(GString *s, int reg_width,
         { "int8", 8, 'b', 's' },
     };
 
-    static const char suf[] = { 'q', 'd', 's', 'h', 'b' };
-    int i, j, bits;
+    static const char suf[] = { 'b', 'h', 's', 'd', 'q' };
+    int i, j;
 
     /* First define types and totals in a whole VL */
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
@@ -256,7 +256,9 @@ static void output_vector_union_type(GString *s, int reg_width,
      * signed and potentially float versions of each size from 128 to
      * 8 bits.
      */
-    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
+    for (i = 0; i < ARRAY_SIZE(suf); i++) {
+        int bits = 8 << i;
+
         g_string_append_printf(s, "<union id=\"%sn%c\">", name, suf[i]);
         for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
             if (vec_lanes[j].size == bits) {
@@ -270,7 +272,7 @@ static void output_vector_union_type(GString *s, int reg_width,
 
     /* And now the final union of unions */
     g_string_append_printf(s, "<union id=\"%s\">", name);
-    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
+    for (i = ARRAY_SIZE(suf) - 1; i >= 0; i--) {
         g_string_append_printf(s, "<field name=\"%c\" type=\"%sn%c\"/>",
                                suf[i], name, suf[i]);
     }
-- 
2.34.1


