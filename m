Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C69E6F53DB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:58:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8IP-0000ye-HN; Wed, 03 May 2023 04:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IL-0000wH-JU
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:05 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IK-0006cc-1W
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:05 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f315735514so14291335e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 01:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683104222; x=1685696222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qshuFHelfQFVr2N7hYS5TSyOh9tRjXEkwQ8CGfYtq2M=;
 b=BFam8d2Y1IYYtVXg5EnpLfNNu3m3oUpSAF4X2oRTHSqi7NBoLBtCfQFijhEdsWmzi0
 RyL0qzwET2dZd3zqAiLY1yWInkLQzP89C7yaIfz8bpBUeOb/ViGzVJ+McoGSjiI8qbLU
 h8IzAO3u2bd2DbhWuYe/vDmClFKxTgu89506XTzHJQR7iS5Xh4un3qYzZdXLIefo++3D
 2pl8lSS/fIE6Pqo5GJBWyOIiM7Lp5IyPWOqGIdTcftPf89dTYqGrlUDd7IQ27JwvgkSg
 3LtzL3NkVOxzWTLnPjUworhEnnSifpYj67AZwFIwUkuiL7KR36QQUQ/D+/kYhKd9TeFP
 qu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683104222; x=1685696222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qshuFHelfQFVr2N7hYS5TSyOh9tRjXEkwQ8CGfYtq2M=;
 b=Ih4xDGL+9cvaC7JXUt9v/Ho6aJTvAyzboaGim7ps1NE4NSRAdolWv5xXvxQN0Msciu
 OYoG/lfbZYHG5YykFRtMrLKybYLapncJzmNr0SPMEoo4sYV0u1A2tUJMsKjny/tJVaRU
 5gK5mmI6SWURSu0rJn2pQhD3LqUxxk5frq6AyqP437DX6hldbEbqKfC90AQGU7CWrJxE
 bsq5J0XKA6DQyI7MGRxaR7QA8yjjPw0PzeD4v1PO0uBJYVkLEoV197DDeBBEtt7tsIDF
 KVYN7T5LdT4zIkdIMvplGb01+VtvsM9zV1JLQNehnBxN8usdLAn2qJWj+rVYJapP5OvQ
 bBeg==
X-Gm-Message-State: AC+VfDyhodt0RAABGDDy3c7A0HiG/+iifbW28eqazC8J7LibaIt+3YLT
 Fvppvb12Gc4ptXM4Kuc5k/5sdFS6eTqFHbUBWPmn0w==
X-Google-Smtp-Source: ACHHUZ67Ck52E0l8dBmkeAdOnqWOl5F6jmfj0KL7MywAYgszJwq3BkiO9p+AqPDEFG0/kyJc4PdC5Q==
X-Received: by 2002:a05:600c:3b03:b0:3f1:754e:69e6 with SMTP id
 m3-20020a05600c3b0300b003f1754e69e6mr907573wms.17.1683104222594; 
 Wed, 03 May 2023 01:57:02 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a7bcd1a000000b003ef5f77901dsm1191307wmj.45.2023.05.03.01.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 01:57:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: dbarboza@ventanamicro.com
Subject: [PATCH 08/11] tcg/riscv: Support CPOP from Zbb
Date: Wed,  3 May 2023 09:56:54 +0100
Message-Id: <20230503085657.1814850-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503085657.1814850-1-richard.henderson@linaro.org>
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 tcg/riscv/tcg-target.h     | 4 ++--
 tcg/riscv/tcg-target.c.inc | 9 +++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 8e327afc3a..e0b23006c4 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -127,7 +127,7 @@ extern bool have_zbb;
 #define TCG_TARGET_HAS_nor_i32          0
 #define TCG_TARGET_HAS_clz_i32          0
 #define TCG_TARGET_HAS_ctz_i32          0
-#define TCG_TARGET_HAS_ctpop_i32        0
+#define TCG_TARGET_HAS_ctpop_i32        have_zbb
 #define TCG_TARGET_HAS_brcond2          1
 #define TCG_TARGET_HAS_setcond2         1
 #define TCG_TARGET_HAS_qemu_st8_i32     0
@@ -161,7 +161,7 @@ extern bool have_zbb;
 #define TCG_TARGET_HAS_nor_i64          0
 #define TCG_TARGET_HAS_clz_i64          0
 #define TCG_TARGET_HAS_ctz_i64          0
-#define TCG_TARGET_HAS_ctpop_i64        0
+#define TCG_TARGET_HAS_ctpop_i64        have_zbb
 #define TCG_TARGET_HAS_add2_i64         1
 #define TCG_TARGET_HAS_sub2_i64         1
 #define TCG_TARGET_HAS_mulu2_i64        0
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 9cbefb2833..044ddfb160 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1512,6 +1512,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_ctpop_i32:
+        tcg_out_opc_imm(s, OPC_CPOPW, a0, a1, 0);
+        break;
+    case INDEX_op_ctpop_i64:
+        tcg_out_opc_imm(s, OPC_CPOP, a0, a1, 0);
+        break;
+
     case INDEX_op_add2_i32:
         tcg_out_addsub2(s, a0, a1, a2, args[3], args[4], args[5],
                         const_args[4], const_args[5], false, true);
@@ -1634,6 +1641,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_bswap16_i64:
     case INDEX_op_bswap32_i64:
     case INDEX_op_bswap64_i64:
+    case INDEX_op_ctpop_i32:
+    case INDEX_op_ctpop_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
-- 
2.34.1


