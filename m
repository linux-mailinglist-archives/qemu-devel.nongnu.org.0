Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D38830E9C1
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 02:57:50 +0100 (CET)
Received: from localhost ([::1]:60220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Tu1-0000sK-MY
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 20:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiN-0004kJ-9j
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:47 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:34179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiH-0003hY-6J
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:46 -0500
Received: by mail-pg1-x52a.google.com with SMTP id o7so1052178pgl.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G2sd+rMiFVhWCMHNvyHgxhZmWKXrzCkUbxixI9tGVCY=;
 b=PQJIOao2XsFp0QdFrRr3TabzEzJjYRZ8p96yXC4PwANz2S7OByxKXuG65V1RbNog1a
 nP33i/SVgvSQj9/E04HJNZpbr49/SFcxkhgF1NpAu+bBHKH5xUDKuoUqZo534NO/DFrS
 BP5iE10oNevH+RJ8NF4o0TXz5TRmiS7UmIY13r5ptemajZSNN4EfbZWujaAszL3cN644
 zd3O0o7acRJB/8eHSxST7u7LY6rw16kc3w2DG3QQ2K1jLK2UD+0YXrgOjTgpFTLIQQ3B
 xSul+ZY6xHTffuzBFCw5bt8V335JGbTspkBIKRC/f1EIyY1vh15dNKuo0RxTwJ+tJiMt
 j1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G2sd+rMiFVhWCMHNvyHgxhZmWKXrzCkUbxixI9tGVCY=;
 b=H/75U8ApxFwBuVZSfrBKYb6+yfrCqx7HHyBMjX6+CdZwtMAUyo8jyG7d4LF5RazjGh
 /xPbc1gPuGzy9zP/T+o1aD6k/pMdb8Lr7lSeKudkA+3XzpEw69nVcfsQvkaOMmsp1sVC
 5+wp+IJppqGJLzTu9PT+zFoPXo0MT3QT7UghOGajLdrYJ6MYAStbP6M2F8mGfEpt6Y+x
 c5RAtGm2+ZuhlWahvbRkBnXDypFU/IDh1w7qU2nV37DS6JmiOoDCYzsIzvmQXct9Zmsn
 7aYpV66jfaEhhu46c7TpnO6nyUbANITlKz6MXAbBEEtmmUW0Y+uDumEpCHrxuApmeYQS
 D5dA==
X-Gm-Message-State: AOAM53341lQNCO1bOGfRrXekzBohDEKoiP8QZXSVT4688PwC2ps4KfaQ
 z+q58GLd3mb61ieL/HuKa5gdNwrehvjqnUqQ
X-Google-Smtp-Source: ABdhPJwLz2lxnpDMNCjGMUBGI6aAYhIb41D/yzHfsPO4Y6MtNoznz8AIhMsr7cbJJzCfCIIbfalyWw==
X-Received: by 2002:a62:3503:0:b029:1aa:6f15:b9fe with SMTP id
 c3-20020a6235030000b02901aa6f15b9femr5735488pfa.65.1612403138970; 
 Wed, 03 Feb 2021 17:45:38 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/93] tcg/tci: Merge INDEX_op_ld8u_{i32,i64}
Date: Wed,  3 Feb 2021 15:43:49 -1000
Message-Id: <20210204014509.882821-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: sw@weilnetz.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 0f56702b93..7e108bcbb3 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -455,6 +455,18 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
 # define qemu_st_beq(X)  stq_be_p(g2h(taddr), X)
 #endif
 
+#if TCG_TARGET_REG_BITS == 64
+# define CASE_32_64(x) \
+        case glue(glue(INDEX_op_, x), _i64): \
+        case glue(glue(INDEX_op_, x), _i32):
+# define CASE_64(x) \
+        case glue(glue(INDEX_op_, x), _i64):
+#else
+# define CASE_32_64(x) \
+        case glue(glue(INDEX_op_, x), _i32):
+# define CASE_64(x)
+#endif
+
 /* Interpret pseudo code in tb. */
 /*
  * Disable CFI checks.
@@ -569,7 +581,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
             /* Load/store operations (32 bit). */
 
-        case INDEX_op_ld8u_i32:
+        CASE_32_64(ld8u)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
@@ -843,12 +855,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
             /* Load/store operations (64 bit). */
 
-        case INDEX_op_ld8u_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(uint8_t *)(t1 + t2));
-            break;
         case INDEX_op_ld8s_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
-- 
2.25.1


