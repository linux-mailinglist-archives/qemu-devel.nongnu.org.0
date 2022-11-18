Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0026362F1EC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:55:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxzg-0007py-L2; Fri, 18 Nov 2022 04:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxzQ-0007kE-UQ
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:57 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxzP-00028s-Aa
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:52 -0500
Received: by mail-pg1-x534.google.com with SMTP id 62so4514871pgb.13
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=x7svweP0IDihRUwLjDBPUL8ODiog5cZ+HQk14NZtEqw=;
 b=EqKxmZThtIdEUZjWI3AVWPuerwkJeXSZZuRsxMXaz59mDhapMBgbEr342XbvwIQ6LF
 M5fu8uUocsiqc0TkcLFYdj4a3weFCEniCi6fjpDu0qsm1ZJq+SBpAt+ONmo7fG5xsy4q
 Fm6chC7m83+N4lwYiyF0yIQnVUEy3GzGtb1RItaE4yUrbCvyjXFAEZteXPrwkWzfjATE
 b9yj90xn3fTkZ8JhQtaIEX978it7TPG5PgLku+RDR+JP18ZVBy4c5huqy5zuMwM8GQKD
 mq2P1f5fyixHrEYx5Q9nlzrm02aS/z2lWoW68rYv8IcUiLl653dpxhhYwFX3Z9djYO0i
 tR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x7svweP0IDihRUwLjDBPUL8ODiog5cZ+HQk14NZtEqw=;
 b=ZgwHCJwzySwcMr4S/z7GDlaV6CXwAvCXpmZ5BPm3+dnOmUvmLtmsR16vHCoblWPAP9
 bLp1RmEMRC/uxdS1cQbIudWgIsUsB3d8hnFc1Du8EXKtsCkX7Lu216upUi5Sa0py7C71
 4EcnUSwvVo9mnbbQKipKp5KbU+1AMklzMd4fGlBAbEGRrc8WxYYhMvVGoHOCjnir1cgG
 GYXyKeojVGephD0BMgkXdPPqC5cBz4hPz93BR3qwpTCnxswfmhVIWE3KJtOvYIBlh+g3
 X1A1iToyCQ3lkTaR3bazQZLtYo5UuG0hdZzDP9ci9cAXu9G3kiOtj+4tV5LwBqRvUVm2
 f2cw==
X-Gm-Message-State: ANoB5pkrFGdsSe6HuGiIJ3fiD4n47BfQ/TPiV5SfCAu4F518PHt+jt7P
 Mg7/P/XV71kwcyXPJVjFl1Lh82FqxUKcZA==
X-Google-Smtp-Source: AA0mqf5HvQo/LPzTczcjeTLvreBo5pQy63/a19uPg+PI1yPBSRPmBvs9JQiXXG4Vvw7oPtlGmYL3gA==
X-Received: by 2002:a05:6a00:2396:b0:572:698b:5fa9 with SMTP id
 f22-20020a056a00239600b00572698b5fa9mr6979635pfc.28.1668764927988; 
 Fri, 18 Nov 2022 01:48:47 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 28/29] tcg/i386: Add vex_v argument to
 tcg_out_vex_modrm_pool
Date: Fri, 18 Nov 2022 01:47:53 -0800
Message-Id: <20221118094754.242910-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index f277085321..3f0cb4bc66 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -841,9 +841,9 @@ static inline void tcg_out_modrm_pool(TCGContext *s, int opc, int r)
 }
 
 /* Output an opcode with an expected reference to the constant pool.  */
-static inline void tcg_out_vex_modrm_pool(TCGContext *s, int opc, int r)
+static inline void tcg_out_vex_modrm_pool(TCGContext *s, int opc, int r, int v)
 {
-    tcg_out_vex_opc(s, opc, r, 0, 0, 0);
+    tcg_out_vex_opc(s, opc, r, v, 0, 0);
     /* Absolute for 32-bit, pc-relative for 64-bit.  */
     tcg_out8(s, LOWREGMASK(r) << 3 | 5);
     tcg_out32(s, 0);
@@ -990,18 +990,18 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
 
     if (TCG_TARGET_REG_BITS == 32 && vece < MO_64) {
         if (have_avx2) {
-            tcg_out_vex_modrm_pool(s, OPC_VPBROADCASTD + vex_l, ret);
+            tcg_out_vex_modrm_pool(s, OPC_VPBROADCASTD + vex_l, ret, 0);
         } else {
-            tcg_out_vex_modrm_pool(s, OPC_VBROADCASTSS, ret);
+            tcg_out_vex_modrm_pool(s, OPC_VBROADCASTSS, ret, 0);
         }
         new_pool_label(s, arg, R_386_32, s->code_ptr - 4, 0);
     } else {
         if (type == TCG_TYPE_V64) {
-            tcg_out_vex_modrm_pool(s, OPC_MOVQ_VqWq, ret);
+            tcg_out_vex_modrm_pool(s, OPC_MOVQ_VqWq, ret, 0);
         } else if (have_avx2) {
-            tcg_out_vex_modrm_pool(s, OPC_VPBROADCASTQ + vex_l, ret);
+            tcg_out_vex_modrm_pool(s, OPC_VPBROADCASTQ + vex_l, ret, 0);
         } else {
-            tcg_out_vex_modrm_pool(s, OPC_MOVDDUP, ret);
+            tcg_out_vex_modrm_pool(s, OPC_MOVDDUP, ret, 0);
         }
         if (TCG_TARGET_REG_BITS == 64) {
             new_pool_label(s, arg, R_386_PC32, s->code_ptr - 4, -4);
@@ -1024,7 +1024,7 @@ static void tcg_out_movi_vec(TCGContext *s, TCGType type,
     }
 
     int rexw = (type == TCG_TYPE_I32 ? 0 : P_REXW);
-    tcg_out_vex_modrm_pool(s, OPC_MOVD_VyEy + rexw, ret);
+    tcg_out_vex_modrm_pool(s, OPC_MOVD_VyEy + rexw, ret, 0);
     if (TCG_TARGET_REG_BITS == 64) {
         new_pool_label(s, arg, R_386_PC32, s->code_ptr - 4, -4);
     } else {
-- 
2.34.1


