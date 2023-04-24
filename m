Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255BF6EC5BF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:56:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqp4j-0006AA-6l; Mon, 24 Apr 2023 01:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0S-00064b-0u
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:44:56 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0F-0005LJ-Q6
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:44:54 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f18dacd392so22122875e9.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315077; x=1684907077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M0CeyWjMqe57NR22sbQHD4MYtLkRo2vj3jA4zBvWRdg=;
 b=x0O2MMXzuxtgXc98eVZyavVQrKe/c3yNwRazTZI2qt20MKQQGO23wXEn+iYQCQukUX
 FH/XGHUg55vSvxerxhce9yQMyhaz7RysUROXz8y0P1H1AwOcwCcEhsQnyb5Bw/O4Oqe6
 eMFxYmTsVXrqJlxIqAk6TplfCgwWGBAEt5+bkexjpja5+T2DP4dP4IRNOwiToTILf46W
 4RO2GsHZ9ao9zJI+allGQrOirAbTgb+X1VD5dZIFG3O70LJ14mSsdeFRMDQ0+mT8JfRx
 XHjW29XnElpqTnIHKZXlGbcLmk2l0c5u8wmtpSkCNPg2dxGVvCX8RdOKGeuytE6omb6r
 OgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315077; x=1684907077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M0CeyWjMqe57NR22sbQHD4MYtLkRo2vj3jA4zBvWRdg=;
 b=iG8okiHb1eTbu7eA/hoTEqG2iq5Muy6fj+D+KDYz1dZLJvCQ0Ul8zFNDDh67uvulYP
 989+tkBqBETKRG9EmN0dnDuytcfMI6biO4eeDufb4P0IbVTrqfGK/02A6yjz+BOxv8EX
 wHhFXWZfGpZW3xpb8Z9stROm0qcP/GfUb11OFoeDTY05Xx8vGLWoXt3MtaHTWJmB5cTL
 rurorYlP4e+d0gsfIV3oe4/1r+X8g02udKCAuA0AW3v+uO1uQz15W5vtYfM1+kEIPHN6
 jLcXGaCeaIXzcU/RliQ29fZ7kb7qgA4zIhUQCD5i/C6mq3tnP4ueYtPPsDl094OZRImW
 xehQ==
X-Gm-Message-State: AAQBX9cgNv0js887W8gNydvSwj0vNZ6wZDX7I0xTNz5irTGsPCU2vnpq
 Br17THFJ3+oAlE9I3+t/QAIflPo7PZcYisLS0RC4dA==
X-Google-Smtp-Source: AKy350ZmP9Awwb+pNtW+/VgU3BIn5HW4YkL35er79DU0yjh4pan+ykBhfE4aJ0pH8X19cytncAVEaw==
X-Received: by 2002:adf:f384:0:b0:2f2:9198:f0f with SMTP id
 m4-20020adff384000000b002f291980f0fmr8146842wro.10.1682315077408; 
 Sun, 23 Apr 2023 22:44:37 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 53/57] tcg/ppc: Adjust constraints on qemu_ld/st
Date: Mon, 24 Apr 2023 06:41:01 +0100
Message-Id: <20230424054105.1579315-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The softmmu tlb uses TCG_REG_{TMP1,TMP2,R0}, not any of the normally
available registers.  Now that we handle overlap betwen inputs and
helper arguments, we can allow any allocatable reg.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-set.h | 11 ++++-------
 tcg/ppc/tcg-target-con-str.h |  2 --
 tcg/ppc/tcg-target.c.inc     | 32 ++++++++++----------------------
 3 files changed, 14 insertions(+), 31 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-set.h b/tcg/ppc/tcg-target-con-set.h
index a1a345883d..f206b29205 100644
--- a/tcg/ppc/tcg-target-con-set.h
+++ b/tcg/ppc/tcg-target-con-set.h
@@ -12,18 +12,15 @@
 C_O0_I1(r)
 C_O0_I2(r, r)
 C_O0_I2(r, ri)
-C_O0_I2(S, S)
 C_O0_I2(v, r)
-C_O0_I3(S, S, S)
+C_O0_I3(r, r, r)
 C_O0_I4(r, r, ri, ri)
-C_O0_I4(S, S, S, S)
-C_O1_I1(r, L)
+C_O0_I4(r, r, r, r)
 C_O1_I1(r, r)
 C_O1_I1(v, r)
 C_O1_I1(v, v)
 C_O1_I1(v, vr)
 C_O1_I2(r, 0, rZ)
-C_O1_I2(r, L, L)
 C_O1_I2(r, rI, ri)
 C_O1_I2(r, rI, rT)
 C_O1_I2(r, r, r)
@@ -36,7 +33,7 @@ C_O1_I2(v, v, v)
 C_O1_I3(v, v, v, v)
 C_O1_I4(r, r, ri, rZ, rZ)
 C_O1_I4(r, r, r, ri, ri)
-C_O2_I1(L, L, L)
-C_O2_I2(L, L, L, L)
+C_O2_I1(r, r, r)
+C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, rI, rZM, r, r)
 C_O2_I4(r, r, r, r, rI, rZM)
diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index 298ca20d5b..f3bf030bc3 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -14,8 +14,6 @@ REGS('A', 1u << TCG_REG_R3)
 REGS('B', 1u << TCG_REG_R4)
 REGS('C', 1u << TCG_REG_R5)
 REGS('D', 1u << TCG_REG_R6)
-REGS('L', ALL_QLOAD_REGS)
-REGS('S', ALL_QSTORE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 6850ecbc80..5a4ec0470a 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -93,18 +93,6 @@
 #define ALL_GENERAL_REGS  0xffffffffu
 #define ALL_VECTOR_REGS   0xffffffff00000000ull
 
-#ifdef CONFIG_SOFTMMU
-#define ALL_QLOAD_REGS \
-    (ALL_GENERAL_REGS & \
-     ~((1 << TCG_REG_R3) | (1 << TCG_REG_R4) | (1 << TCG_REG_R5)))
-#define ALL_QSTORE_REGS \
-    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R3) | (1 << TCG_REG_R4) | \
-                          (1 << TCG_REG_R5) | (1 << TCG_REG_R6)))
-#else
-#define ALL_QLOAD_REGS  (ALL_GENERAL_REGS & ~(1 << TCG_REG_R3))
-#define ALL_QSTORE_REGS ALL_QLOAD_REGS
-#endif
-
 TCGPowerISA have_isa;
 static bool have_isel;
 bool have_altivec;
@@ -3752,23 +3740,23 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_qemu_ld_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O1_I1(r, L)
-                : C_O1_I2(r, L, L));
+                ? C_O1_I1(r, r)
+                : C_O1_I2(r, r, r));
 
     case INDEX_op_qemu_st_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O0_I2(S, S)
-                : C_O0_I3(S, S, S));
+                ? C_O0_I2(r, r)
+                : C_O0_I3(r, r, r));
 
     case INDEX_op_qemu_ld_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L)
-                : TARGET_LONG_BITS == 32 ? C_O2_I1(L, L, L)
-                : C_O2_I2(L, L, L, L));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r)
+                : TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, r)
+                : C_O2_I2(r, r, r, r));
 
     case INDEX_op_qemu_st_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(S, S)
-                : TARGET_LONG_BITS == 32 ? C_O0_I3(S, S, S)
-                : C_O0_I4(S, S, S, S));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(r, r)
+                : TARGET_LONG_BITS == 32 ? C_O0_I3(r, r, r)
+                : C_O0_I4(r, r, r, r));
 
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
-- 
2.34.1


