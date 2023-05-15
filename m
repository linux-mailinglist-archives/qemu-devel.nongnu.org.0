Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B9770306A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:45:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZIl-00012w-BT; Mon, 15 May 2023 10:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHS-0006xf-HQ
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:36 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGY-0004yE-Pb
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:33:45 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1ab1ce53ca6so91623425ad.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161212; x=1686753212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GZ7SPbKoQkb/kckt0ZzABkZ84Z1c924yY+RMLRaPnSA=;
 b=AHp8Lh2QaBGILnU1XfUsuhB4iv9F8Pz9ErzbaRzFGTHkvlI78NEAbKHx3OLOCA8wLA
 Es5N18bQvKvuJL8kbP3/cSmgoV9mWvqseXFgNxp0cF2lE7wfGpX4Jlg1iJUfUI5M7wjT
 boMjogLS2nKXhCMMt+V9oAZ7nknPJtAFd4ufPO/XYUzB++5ppGLdE9ih3/XltWPwX/HM
 iz5cj0EIEsdrIePGiZf5/O+WGxrdeeia4ylrIwpBPd3CGf9NQEvjKoMa+sZwjee61l+W
 raEGgXgg0o+YaY7WuUaqUCGmr2Jp+k6TaBM41Dblgz147PRZcmc2dubdJfUIzpqUb5hD
 ZC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161212; x=1686753212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GZ7SPbKoQkb/kckt0ZzABkZ84Z1c924yY+RMLRaPnSA=;
 b=e8+xwGGL8Ubu4ASUTnmM8rUCia87Fnvt7ih+kPPZ3OEsRF5pjnrNmD2cB/ex/gI+Zv
 m+yKVgazGZ9LQno3/12v5fKbiYF1PXkkVuFMn7Hq4JvVv5zSsKuvGrYNaCBVW218KkQ3
 OY7rE2uV6ikb8z21XJNLxKMjcLUxiO8tocBTHr4HhPnBOgxUSClmlxHAle8Sq6QU56At
 lskh6ip0a/FH1ec+2wIjoxa7hKfuCC3HxsqBYb/XxP3Ao36Kw8vA6ENryydf0CnZ9NZ4
 xUzGca7aTlCHNeCRiWhIzBwRuL6wz0rGb3cCbDYXFjyEqyfzUM46TXYYSpwmZLy/4o+U
 u4gQ==
X-Gm-Message-State: AC+VfDyEsMl+DskYz36SDQlHgM9A7DCyvpLiYROjUwd06kE7Mp71JWXK
 3zTsE0Atq+hYit/RpA6iQ90jdyVF4K9dv4Bc1Xw=
X-Google-Smtp-Source: ACHHUZ765OqcaOoItImH9beTRYw+ZxUsVX52LyMky8qPe1spsH6UOnNfTnc0V1zV4uYy38tzCpFXAw==
X-Received: by 2002:a17:902:f9cd:b0:1a5:1e7:86d7 with SMTP id
 kz13-20020a170902f9cd00b001a501e786d7mr31373272plb.52.1684161212221; 
 Mon, 15 May 2023 07:33:32 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 20/54] tcg/arm: Adjust constraints on qemu_ld/st
Date: Mon, 15 May 2023 07:32:39 -0700
Message-Id: <20230515143313.734053-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Always reserve r3 for tlb softmmu lookup.  Fix a bug in user-only
ALL_QLDST_REGS, in that r14 is clobbered by the BLNE that leads
to the misaligned trap.  Remove r0+r1 from user-only ALL_QLDST_REGS;
I believe these had been reserved for bswap, which we no longer
perform during qemu_st.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target-con-set.h | 16 ++++++++--------
 tcg/arm/tcg-target-con-str.h |  5 ++---
 tcg/arm/tcg-target.c.inc     | 23 ++++++++---------------
 3 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/tcg/arm/tcg-target-con-set.h b/tcg/arm/tcg-target-con-set.h
index b8849b2478..229ae258ac 100644
--- a/tcg/arm/tcg-target-con-set.h
+++ b/tcg/arm/tcg-target-con-set.h
@@ -12,19 +12,19 @@
 C_O0_I1(r)
 C_O0_I2(r, r)
 C_O0_I2(r, rIN)
-C_O0_I2(s, s)
+C_O0_I2(q, q)
 C_O0_I2(w, r)
-C_O0_I3(s, s, s)
-C_O0_I3(S, p, s)
+C_O0_I3(q, q, q)
+C_O0_I3(Q, p, q)
 C_O0_I4(r, r, rI, rI)
-C_O0_I4(S, p, s, s)
-C_O1_I1(r, l)
+C_O0_I4(Q, p, q, q)
+C_O1_I1(r, q)
 C_O1_I1(r, r)
 C_O1_I1(w, r)
 C_O1_I1(w, w)
 C_O1_I1(w, wr)
 C_O1_I2(r, 0, rZ)
-C_O1_I2(r, l, l)
+C_O1_I2(r, q, q)
 C_O1_I2(r, r, r)
 C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rIK)
@@ -39,8 +39,8 @@ C_O1_I2(w, w, wZ)
 C_O1_I3(w, w, w, w)
 C_O1_I4(r, r, r, rI, rI)
 C_O1_I4(r, r, rIN, rIK, 0)
-C_O2_I1(e, p, l)
-C_O2_I2(e, p, l, l)
+C_O2_I1(e, p, q)
+C_O2_I2(e, p, q, q)
 C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, r, r, rIN, rIK)
 C_O2_I4(r, r, rI, rI, rIN, rIK)
diff --git a/tcg/arm/tcg-target-con-str.h b/tcg/arm/tcg-target-con-str.h
index 24b4b59feb..f83f1d3919 100644
--- a/tcg/arm/tcg-target-con-str.h
+++ b/tcg/arm/tcg-target-con-str.h
@@ -10,9 +10,8 @@
  */
 REGS('e', ALL_GENERAL_REGS & 0x5555) /* even regs */
 REGS('r', ALL_GENERAL_REGS)
-REGS('l', ALL_QLOAD_REGS)
-REGS('s', ALL_QSTORE_REGS)
-REGS('S', ALL_QSTORE_REGS & 0x5555)  /* even qstore */
+REGS('q', ALL_QLDST_REGS)
+REGS('Q', ALL_QLDST_REGS & 0x5555)   /* even qldst */
 REGS('w', ALL_VECTOR_REGS)
 
 /*
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 8b0d526659..a02804dd69 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -353,23 +353,16 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define ALL_VECTOR_REGS   0xffff0000u
 
 /*
- * r0-r2 will be overwritten when reading the tlb entry (softmmu only)
- * and r0-r1 doing the byte swapping, so don't use these.
- * r3 is removed for softmmu to avoid clashes with helper arguments.
+ * r0-r3 will be overwritten when reading the tlb entry (softmmu only);
+ * r14 will be overwritten by the BLNE branching to the slow path.
  */
 #ifdef CONFIG_SOFTMMU
-#define ALL_QLOAD_REGS \
+#define ALL_QLDST_REGS \
     (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
                           (1 << TCG_REG_R2) | (1 << TCG_REG_R3) | \
                           (1 << TCG_REG_R14)))
-#define ALL_QSTORE_REGS \
-    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
-                          (1 << TCG_REG_R2) | (1 << TCG_REG_R14) | \
-                          ((TARGET_LONG_BITS == 64) << TCG_REG_R3)))
 #else
-#define ALL_QLOAD_REGS   ALL_GENERAL_REGS
-#define ALL_QSTORE_REGS \
-    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1)))
+#define ALL_QLDST_REGS   (ALL_GENERAL_REGS & ~(1 << TCG_REG_R14))
 #endif
 
 /*
@@ -2203,13 +2196,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I4(r, r, r, rI, rI);
 
     case INDEX_op_qemu_ld_i32:
-        return TARGET_LONG_BITS == 32 ? C_O1_I1(r, l) : C_O1_I2(r, l, l);
+        return TARGET_LONG_BITS == 32 ? C_O1_I1(r, q) : C_O1_I2(r, q, q);
     case INDEX_op_qemu_ld_i64:
-        return TARGET_LONG_BITS == 32 ? C_O2_I1(e, p, l) : C_O2_I2(e, p, l, l);
+        return TARGET_LONG_BITS == 32 ? C_O2_I1(e, p, q) : C_O2_I2(e, p, q, q);
     case INDEX_op_qemu_st_i32:
-        return TARGET_LONG_BITS == 32 ? C_O0_I2(s, s) : C_O0_I3(s, s, s);
+        return TARGET_LONG_BITS == 32 ? C_O0_I2(q, q) : C_O0_I3(q, q, q);
     case INDEX_op_qemu_st_i64:
-        return TARGET_LONG_BITS == 32 ? C_O0_I3(S, p, s) : C_O0_I4(S, p, s, s);
+        return TARGET_LONG_BITS == 32 ? C_O0_I3(Q, p, q) : C_O0_I4(Q, p, q, q);
 
     case INDEX_op_st_vec:
         return C_O0_I2(w, r);
-- 
2.34.1


