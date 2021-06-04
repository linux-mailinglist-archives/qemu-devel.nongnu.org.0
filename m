Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7280F39C12E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:20:28 +0200 (CEST)
Received: from localhost ([::1]:45410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGIt-0007M8-He
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB7-0005tF-7z
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:26 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:37618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB3-0005ON-KK
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:25 -0400
Received: by mail-pg1-x52c.google.com with SMTP id t9so8747774pgn.4
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 13:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Ml4qUqW7f9PWixv5pRGmS2Ze6jibnZ1zFb/E9JWDOY=;
 b=g6J0kOAYxKxV+gn0ubZxU/mDddd19I9doNrUuA2J6l4oXSawVyHgJDAX+jnjYs77P0
 tETbmyTaDf3LAL4eX683ZehnBG6npXofjyIIjg/etb20wwAoEyGFUaESz0NLONme4F9x
 vOLDJbyvUMUq8IVcFRrOJjl9GGYPZ/w9lANLCREgV8mrpXOKHqVY58PxJDarBHmJsebz
 Hi/hgkDjpNZ5opwK3VeRmYXH5syx9LB0FOaCd+T2rqgOM2o6wz+9EE69a8S+LglbCrmZ
 qqukT2J4A7flqWnzC9C8Vseqb3Z299MzDVFMjHKYzplUAw0ujXgtySGGJlDqghHekW2W
 xzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Ml4qUqW7f9PWixv5pRGmS2Ze6jibnZ1zFb/E9JWDOY=;
 b=ivplNf2xS/T3nRUvHa/r2MZSeAT74DsMHHwGZWOUBNzHd5W3Xp2onnEl1hx34FUcg/
 3c42uP6j9Jj+Gta3oxax2cCtZ0NkBUZf0K8nbwh5F31Bnf+Y4WrFAHDhzR9fjVpGMIis
 BvVJS/btJKmG+QIQSjjzzspSHP95s71Sy1fH2sWTMG+8M/tZYZ4MrZNPT1S7Z3qr7I+C
 Whcrdzw9o1pNnW5hzutWtIy3cdDHIxEQC+ztP82YV96LVts7BMwCl7EQxUeSrgAXo/5c
 BohOwKAxvv+/LbSuSTmBHFFkqncynNP9M+rgJL/cD8/xV942Jog9U9sCHf0Xxw1Vl3CH
 bB4g==
X-Gm-Message-State: AOAM530b5NxGRgJJ1Hh9OEvUfe+BSNSrJFgJcGq/e9ujS3WZR2rPq9BN
 j1PNfcHNh8gpA+3Nu9UMgN+F+2AgjhJn4w==
X-Google-Smtp-Source: ABdhPJx3DlE2OHhl1116AQAI1OAFt7XWFaGsYL6Ll79c2t8FDgLIa28ZnH3AVsIt4UiRW7jSp8TCzQ==
X-Received: by 2002:aa7:801a:0:b029:2e0:c3db:15a2 with SMTP id
 j26-20020aa7801a0000b02902e0c3db15a2mr6271132pfi.42.1622837539861; 
 Fri, 04 Jun 2021 13:12:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id a129sm2422599pfa.118.2021.06.04.13.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:12:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/15] tcg/arm: Implement TCG_TARGET_HAS_rotv_vec
Date: Fri,  4 Jun 2021 13:12:10 -0700
Message-Id: <20210604201210.920136-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604201210.920136-1-richard.henderson@linaro.org>
References: <20210604201210.920136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement via expansion, so don't actually set TCG_TARGET_HAS_rotv_vec.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index d0af654c65..f4c9cb8f9f 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2970,6 +2970,8 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
     case INDEX_op_rotli_vec:
+    case INDEX_op_rotlv_vec:
+    case INDEX_op_rotrv_vec:
         return -1;
     default:
         return 0;
@@ -2980,7 +2982,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
     va_list va;
-    TCGv_vec v0, v1, v2, t1;
+    TCGv_vec v0, v1, v2, t1, t2, c1;
     TCGArg a2;
 
     va_start(va, a0);
@@ -3025,6 +3027,37 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         tcg_temp_free_vec(t1);
         break;
 
+    case INDEX_op_rotlv_vec:
+        v2 = temp_tcgv_vec(arg_temp(a2));
+        t1 = tcg_temp_new_vec(type);
+        c1 = tcg_constant_vec(type, vece, 8 << vece);
+        tcg_gen_sub_vec(vece, t1, v2, c1);
+        /* Right shifts are negative left shifts for NEON.  */
+        vec_gen_3(INDEX_op_arm_ushl_vec, type, vece, tcgv_vec_arg(t1),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(t1));
+        vec_gen_3(INDEX_op_arm_ushl_vec, type, vece, tcgv_vec_arg(v0),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(v2));
+        tcg_gen_or_vec(vece, v0, v0, t1);
+        tcg_temp_free_vec(t1);
+        break;
+
+    case INDEX_op_rotrv_vec:
+        v2 = temp_tcgv_vec(arg_temp(a2));
+        t1 = tcg_temp_new_vec(type);
+        t2 = tcg_temp_new_vec(type);
+        c1 = tcg_constant_vec(type, vece, 8 << vece);
+        tcg_gen_neg_vec(vece, t1, v2);
+        tcg_gen_sub_vec(vece, t2, c1, v2);
+        /* Right shifts are negative left shifts for NEON.  */
+        vec_gen_3(INDEX_op_arm_ushl_vec, type, vece, tcgv_vec_arg(t1),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(t1));
+        vec_gen_3(INDEX_op_arm_ushl_vec, type, vece, tcgv_vec_arg(t2),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(t2));
+        tcg_gen_or_vec(vece, v0, t1, t2);
+        tcg_temp_free_vec(t1);
+        tcg_temp_free_vec(t2);
+        break;
+
     default:
         g_assert_not_reached();
     }
-- 
2.25.1


