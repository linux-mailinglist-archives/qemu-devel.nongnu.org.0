Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04255294014
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 17:58:46 +0200 (CEST)
Received: from localhost ([::1]:60224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUu29-0005zV-17
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 11:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUu0Y-00049M-Ql
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 11:57:06 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUu0V-0003pH-FN
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 11:57:06 -0400
Received: by mail-wr1-x42c.google.com with SMTP id e17so2770782wru.12
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 08:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XOCeDt/XshK6ncC0g9UgbF4Gv2PxS5XPW6TaNeQwZoc=;
 b=tZHqj/4qIYoda6/BxM5FiSZthev/nTdKYHosS4UsZ1UgSUQ8KplFQLXjUR/CWwk/VM
 VAqhl6tNr7v4U1KlWryYSUsbDfGygNrXMLjAn0v+8PIeLdWyX+Cxk9Fq91n+QQtVPVK0
 OpbztpwG3R6MyQ8lx3hmuQDw0Z3slfTe4pQxgn/604yUSO0CJ5t7M+SdSkRUTVXhtF/a
 xOuZfAQpv+t7znFuKyIocjz5vwekiEcFXrb6skwSY7eL4RF60CRkWZZ3Fb9JtbiTOt2q
 KQv6V/JlEDs7RELFt4pmHLfBTt4YoqnW0fTUU4EjQ70IXqtXtIr9j5Ri+z96RRv23C6V
 u0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XOCeDt/XshK6ncC0g9UgbF4Gv2PxS5XPW6TaNeQwZoc=;
 b=W3ilkHsp7MAlJMhRYhxse5SEWZk1trZlcT9xB5p7eQCoOBvPnJj15UQ2dpTG3kci+B
 bmAz1fMOwnIjN1PjmKMGlzbER73hNhH/8E4PIr0PhUkQQt1s63g9CrKrfPJsaBeEpFj5
 Cbe8kNcc6H+468ZMSTcBoi0T3kUOOSqFUHgPrYwmJLuQLJes5d5YSmXmGUqTh4JonheC
 Ihb/aDlx87UU/vhftMJkMmJAt9SvIqsS4LcJrUgcXCoI+96YGlZPvrJsk1iUx7+o4MoP
 wYOMQ5WskxHXyEVs9IQm3/hh9bZo9r5Z3OdN7IxhlDxW8NX9vjSho/c2ZheWEKw67HqN
 2rCw==
X-Gm-Message-State: AOAM530hIlNBYmlF6sU5cKPclCXrKRGcPVNrKEQDni5SQ3/qiWpidrrm
 KMfCEQOU45TRBU/AU1u54trptdSX1zO0aQ==
X-Google-Smtp-Source: ABdhPJwboZ4UfVuz4A7gY+F7hoiDjeZNUsyWT/3PG7mvM5grmFqJRnN8qe7eLsAl+32nEaJDtzMrLg==
X-Received: by 2002:adf:b353:: with SMTP id k19mr4198342wrd.216.1603209420838; 
 Tue, 20 Oct 2020 08:57:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v6sm3780205wrp.69.2020.10.20.08.56.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 08:56:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/41] target/arm: Fix SMLAD incorrect setting of Q bit
Date: Tue, 20 Oct 2020 16:56:16 +0100
Message-Id: <20201020155656.8045-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201020155656.8045-1-peter.maydell@linaro.org>
References: <20201020155656.8045-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SMLAD instruction is supposed to:
 * signed multiply Rn[15:0] * Rm[15:0]
 * signed multiply Rn[31:16] * Rm[31:16]
 * perform a signed addition of the products and Ra
 * set Rd to the low 32 bits of the theoretical
   infinite-precision result
 * set the Q flag if the sign-extension of Rd
   would differ from the infinite-precision result
   (ie on overflow)

Our current implementation doesn't quite do this, though: it performs
an addition of the products setting Q on overflow, and then it adds
Ra, again possibly setting Q.  This sometimes incorrectly sets Q when
the architecturally mandated only-check-for-overflow-once algorithm
does not. For instance:
 r1 = 0x80008000; r2 = 0x80008000; r3 = 0xffffffff
 smlad r0, r1, r2, r3
This is (-32768 * -32768) + (-32768 * -32768) - 1

The products are both 0x4000_0000, so when added together as 32-bit
signed numbers they overflow (and QEMU sets Q), but because the
addition of Ra == -1 brings the total back down to 0x7fff_ffff
there is no overflow for the complete operation and setting Q is
incorrect.

Fix this edge case by resorting to 64-bit arithmetic for the
case where we need to add three values together.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201009144712.11187-1-peter.maydell@linaro.org
---
 target/arm/translate.c | 58 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d34c1d351a6..d8729e42c48 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7401,21 +7401,59 @@ static bool op_smlad(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
     gen_smul_dual(t1, t2);
 
     if (sub) {
-        /* This subtraction cannot overflow. */
+        /*
+         * This subtraction cannot overflow, so we can do a simple
+         * 32-bit subtraction and then a possible 32-bit saturating
+         * addition of Ra.
+         */
         tcg_gen_sub_i32(t1, t1, t2);
+        tcg_temp_free_i32(t2);
+
+        if (a->ra != 15) {
+            t2 = load_reg(s, a->ra);
+            gen_helper_add_setq(t1, cpu_env, t1, t2);
+            tcg_temp_free_i32(t2);
+        }
+    } else if (a->ra == 15) {
+        /* Single saturation-checking addition */
+        gen_helper_add_setq(t1, cpu_env, t1, t2);
+        tcg_temp_free_i32(t2);
     } else {
         /*
-         * This addition cannot overflow 32 bits; however it may
-         * overflow considered as a signed operation, in which case
-         * we must set the Q flag.
+         * We need to add the products and Ra together and then
+         * determine whether the final result overflowed. Doing
+         * this as two separate add-and-check-overflow steps incorrectly
+         * sets Q for cases like (-32768 * -32768) + (-32768 * -32768) + -1.
+         * Do all the arithmetic at 64-bits and then check for overflow.
          */
-        gen_helper_add_setq(t1, cpu_env, t1, t2);
-    }
-    tcg_temp_free_i32(t2);
+        TCGv_i64 p64, q64;
+        TCGv_i32 t3, qf, one;
 
-    if (a->ra != 15) {
-        t2 = load_reg(s, a->ra);
-        gen_helper_add_setq(t1, cpu_env, t1, t2);
+        p64 = tcg_temp_new_i64();
+        q64 = tcg_temp_new_i64();
+        tcg_gen_ext_i32_i64(p64, t1);
+        tcg_gen_ext_i32_i64(q64, t2);
+        tcg_gen_add_i64(p64, p64, q64);
+        load_reg_var(s, t2, a->ra);
+        tcg_gen_ext_i32_i64(q64, t2);
+        tcg_gen_add_i64(p64, p64, q64);
+        tcg_temp_free_i64(q64);
+
+        tcg_gen_extr_i64_i32(t1, t2, p64);
+        tcg_temp_free_i64(p64);
+        /*
+         * t1 is the low half of the result which goes into Rd.
+         * We have overflow and must set Q if the high half (t2)
+         * is different from the sign-extension of t1.
+         */
+        t3 = tcg_temp_new_i32();
+        tcg_gen_sari_i32(t3, t1, 31);
+        qf = load_cpu_field(QF);
+        one = tcg_const_i32(1);
+        tcg_gen_movcond_i32(TCG_COND_NE, qf, t2, t3, one, qf);
+        store_cpu_field(qf, QF);
+        tcg_temp_free_i32(one);
+        tcg_temp_free_i32(t3);
         tcg_temp_free_i32(t2);
     }
     store_reg(s, a->rd, t1);
-- 
2.20.1


