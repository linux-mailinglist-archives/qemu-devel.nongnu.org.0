Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1832132A922
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:14:39 +0100 (CET)
Received: from localhost ([::1]:54848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9Xa-0002gj-2N
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:14:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HR-0002jj-Ol
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:57 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HQ-0007a7-0H
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:57 -0500
Received: by mail-pl1-x62c.google.com with SMTP id d8so2050708plg.10
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xk1GB79AaGUkcV+qDEpBrBCVOi2EqtNfKQnf1wr+BmM=;
 b=hOlRkx6EHGPS0/y7ls9iGJf8odN04UtUfgkhhcKEFza1WT1gj8Wi7XOOwjklvJun3B
 EtrIcg2/QCP6MKNC7iJ48qddcMjhgerkImcKMg4ZSVYMVxhUXptnq8RZiAgqlxf6ILS3
 UdNumjmuqlifcFH845pVE6BzYh+aWsPUkXcoMSlNK8+YgHq5Se23yqokB56/z7uAB+yg
 kgjX0tjr2b+N00uh0aWhdKqlKwQKUtxunN+MKXNo2kVAq6ptUwPKGVBXP2P+Ttau4ebX
 t+j9Ix1KiLDrSPHNJuRruAXJtdZMW0A15vUSsBZTtXO5JFfVXnk1IOtQvbIOV5zB1dUb
 TFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xk1GB79AaGUkcV+qDEpBrBCVOi2EqtNfKQnf1wr+BmM=;
 b=Z7Zn/8JZncaayqAQKKI80FpXhCUkK+jfT5c/fHPAxRhnEs3zMJDpEBr1GIMxeBOQLF
 0XTmOypH5qXpyzqFJuNQtjmY0kdoZwJ2OGiQxvIvVdiNnrHe1MK7S+s+LcVfmUJOixGY
 j2WPA607tE6rLukC17e/xRoUFqhqwocesua/ChKGG9QDO3qKVgcHJ4I2oJId42rw06Ih
 dkMHJSKUbeR/Qtet08DTEJPQajXhafAFv0NmwCytjCWv013kIvbuTlqI5NiOrlXYWdml
 wAfVq0zLERuLZvRpjWmNTmdE08JTVfNplMb+ULkMbj9AyA7wRQjq2ItSCDmgTfAfG+Qu
 S9vw==
X-Gm-Message-State: AOAM5303sWG8BnbcrQrBwvXfyB59+Udx24ZzEZezK0qp/p7KwWpj9Kas
 RaFYmrLwYzlfy/cBVkhsHxmWjEl3IPlG9A==
X-Google-Smtp-Source: ABdhPJyu/hzGc/FN4S1uV/1ZmRrLo5xkBGMzV78s5zykqXYf78UrGxkaSeOgsTrWKr4qoj/6WbaxJQ==
X-Received: by 2002:a17:90a:ce82:: with SMTP id
 g2mr5583307pju.193.1614707874834; 
 Tue, 02 Mar 2021 09:57:54 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:57:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/27] tcg/tci: Merge identical cases in generation
 (load/store opcodes)
Date: Tue,  2 Mar 2021 09:57:25 -0800
Message-Id: <20210302175741.1079851-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use CASE_32_64 and CASE_64 to reduce ifdefs and merge
cases that are identical between 32-bit and 64-bit hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210217202036.1724901-5-richard.henderson@linaro.org>
[PMD: Split patch as 5/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210218232840.1760806-6-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 49 ++++++++++++----------------------------
 1 file changed, 14 insertions(+), 35 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f9893b9539..c79f9c32d8 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -440,25 +440,20 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out8(s, args[5]);   /* condition */
         break;
 #endif
-    case INDEX_op_ld8u_i32:
-    case INDEX_op_ld8s_i32:
-    case INDEX_op_ld16u_i32:
-    case INDEX_op_ld16s_i32:
+
+    CASE_32_64(ld8u)
+    CASE_32_64(ld8s)
+    CASE_32_64(ld16u)
+    CASE_32_64(ld16s)
     case INDEX_op_ld_i32:
-    case INDEX_op_st8_i32:
-    case INDEX_op_st16_i32:
+    CASE_64(ld32u)
+    CASE_64(ld32s)
+    CASE_64(ld)
+    CASE_32_64(st8)
+    CASE_32_64(st16)
     case INDEX_op_st_i32:
-    case INDEX_op_ld8u_i64:
-    case INDEX_op_ld8s_i64:
-    case INDEX_op_ld16u_i64:
-    case INDEX_op_ld16s_i64:
-    case INDEX_op_ld32u_i64:
-    case INDEX_op_ld32s_i64:
-    case INDEX_op_ld_i64:
-    case INDEX_op_st8_i64:
-    case INDEX_op_st16_i64:
-    case INDEX_op_st32_i64:
-    case INDEX_op_st_i64:
+    CASE_64(st32)
+    CASE_64(st)
         stack_bounds_check(args[1], args[2]);
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
@@ -552,24 +547,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 #endif
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_r(s, *args++);
-        tcg_out_r(s, *args++);
-        if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-            tcg_out_r(s, *args++);
-        }
-        tcg_out_i(s, *args++);
-        break;
-    case INDEX_op_qemu_ld_i64:
-        tcg_out_r(s, *args++);
-        if (TCG_TARGET_REG_BITS == 32) {
-            tcg_out_r(s, *args++);
-        }
-        tcg_out_r(s, *args++);
-        if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-            tcg_out_r(s, *args++);
-        }
-        tcg_out_i(s, *args++);
-        break;
     case INDEX_op_qemu_st_i32:
         tcg_out_r(s, *args++);
         tcg_out_r(s, *args++);
@@ -578,6 +555,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         tcg_out_i(s, *args++);
         break;
+
+    case INDEX_op_qemu_ld_i64:
     case INDEX_op_qemu_st_i64:
         tcg_out_r(s, *args++);
         if (TCG_TARGET_REG_BITS == 32) {
-- 
2.25.1


