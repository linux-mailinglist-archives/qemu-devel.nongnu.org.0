Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEF230EA53
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:41:33 +0100 (CET)
Received: from localhost ([::1]:35470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UaK-0000FL-7G
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:41:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjv-0006Fl-Vh
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:24 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:38931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjp-0004Ce-0u
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:23 -0500
Received: by mail-pf1-x432.google.com with SMTP id e19so1069386pfh.6
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kpfe6JZmwXM15Cw7O9Ulgnnkm0DVoqv1s4+DGCwKajc=;
 b=sqtsnxO4M+CXXiGZF9Srv4vrSMPBv3HsqqheH0oRaXdnfVSl3kE5Pfq2lole0x75GT
 4rk7MXmu/+YVw+cg+ExOK9na01KD8yNXgEz6lF8iaSY34OV3bcjQh2j9GHtvbJ45YlVe
 TXXNh16V3FRRs8X/zACOvJ2Cs9/eMhqYH0sWq5ggOYFC7KTApY61bqNyJumTyn9iTeYq
 1PHLHmm6fkyP+UwY4UD4ppHNUehP4XY2L55lVaombD7oZXvxornX2GxEkgQGSEDakoS1
 2ps5HV3npcokVqbqL3CMQY+ABZ7AqWJK8KCoym04GfuTu5XbMj034iAO9LsnLuOv5rTH
 9bUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kpfe6JZmwXM15Cw7O9Ulgnnkm0DVoqv1s4+DGCwKajc=;
 b=pBkh3rcPmuT7CDTno6amfkTkI0SX7MeMx3ucTGCKrYryj54RlBohfwZcdZ64SrbD7w
 IybuKe+bsWnlo7wOcR22ws+0Wu8nYZy/uGFLctViRwueij8a3bCUC+8Rd4Kvolm/7eLF
 E+eEX+JncPfMhiZvZSnk5Xv1ajwt74dUR8C3wgav4iaz3h2wBdozzHp0UQrkRWJtNArm
 sKoRXtlAMqydYujuy6p45j+XKVnmByukGDxwctRItbLeZustBOXulE4WkttsKnKRWe1B
 pr5vnGpkv3nhCHkOa3H0KsfOMr03e2vzptz93txn8QRBfReXZA4W58gKY0HYw9zgi8Yc
 W5eA==
X-Gm-Message-State: AOAM531qnn2kBN7T7w7ZL863O0FUDkdedYdb2v4ESAAv+/jzT44mBies
 wtYP/+frXTHfScvZgNg6FUuRA6wloWZgy/GU
X-Google-Smtp-Source: ABdhPJxJ3DgnaEofA7Li2sZIXy6p9T1EXExenKMP6SLUGs1Fgn/KoWlFqheqXnuD7AbIpAzKP3OBKw==
X-Received: by 2002:a65:5283:: with SMTP id y3mr6468591pgp.174.1612403233216; 
 Wed, 03 Feb 2021 17:47:13 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:47:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 70/93] tcg/tci: Split out tcg_out_op_rr
Date: Wed,  3 Feb 2021 15:44:46 -1000
Message-Id: <20210204014509.882821-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the same time, validate the type argument in tcg_out_mov.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index cb0cbbb8da..272e3ca70b 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -303,6 +303,17 @@ static void tcg_out_op_p(TCGContext *s, TCGOpcode op, void *p0)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, intptr_t i2)
 {
@@ -337,16 +348,18 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
 
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
-    tcg_debug_assert(ret != arg);
-#if TCG_TARGET_REG_BITS == 32
-    tcg_out_op_t(s, INDEX_op_mov_i32);
-#else
-    tcg_out_op_t(s, INDEX_op_mov_i64);
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_out_op_rr(s, INDEX_op_mov_i32, ret, arg);
+        break;
+#if TCG_TARGET_REG_BITS == 64
+    case TCG_TYPE_I64:
+        tcg_out_op_rr(s, INDEX_op_mov_i64, ret, arg);
+        break;
 #endif
-    tcg_out_r(s, ret);
-    tcg_out_r(s, arg);
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    default:
+        g_assert_not_reached();
+    }
     return true;
 }
 
@@ -534,10 +547,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     CASE_32_64(bswap16)  /* Optional (TCG_TARGET_HAS_bswap16_*). */
     CASE_32_64(bswap32)  /* Optional (TCG_TARGET_HAS_bswap32_*). */
     CASE_64(bswap64)     /* Optional (TCG_TARGET_HAS_bswap64_i64). */
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rr(s, opc, args[0], args[1]);
         break;
 
 #if TCG_TARGET_REG_BITS == 32
-- 
2.25.1


