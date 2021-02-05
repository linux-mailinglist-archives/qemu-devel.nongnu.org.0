Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F8531166C
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:10:14 +0100 (CET)
Received: from localhost ([::1]:52986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AEv-00021A-9k
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2T-00026N-8I
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:21 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:37867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2R-0003Li-Nl
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:21 -0500
Received: by mail-pg1-x52a.google.com with SMTP id z21so5584816pgj.4
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G2sd+rMiFVhWCMHNvyHgxhZmWKXrzCkUbxixI9tGVCY=;
 b=dmjhXO+PEPjleCmwixqeNYYmo16Ktxg8qXT3ryFx38P/z2NLdygFLG3i2vW4ZEjccq
 xiKTGZvceEqzx1b0CyHeH+k1rr4RIEosnr0OxeCBsQugkvWpq80Sofrc7IECKVOHG+Tq
 4Fh9weIUT7qeXCplHGeDBKXrZy2s+cPNU9WfcdJKp41tngvxDOntGasqxE4aIycnS/Y8
 fPzYlhsP4O3bccrmuL7HOi5Pj99QZgW1gA8dPkD9aDW+soezrWW4eLC6tbLtg3KNjry7
 +PUlBpc4/FmJD/cpp6V0PWmqREO28KzKD+UhyaL/kpCp5OS3661vMrQuc9VuCXs91Wu9
 S01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G2sd+rMiFVhWCMHNvyHgxhZmWKXrzCkUbxixI9tGVCY=;
 b=XM19McAmmr3y3HkkiRzG4s8Vq25g9ipwuMtIZg24LdRFCtY/dCLimAtiKf44tFLiCA
 e+PcaTBnyhuWexujcK7Oi0CZSaJSWOa5anL1ur2us9SZ+8jwmI7I77swDUnayl8T36Br
 miSfaaqmm3ih5JLTc69tpnWfyD+ECtFVjU8MKUGAQNKW7uUVthpVzbykQFVn23yR/4cU
 eRDfbS6wdbrfRVvO+p3ASSfPKiQc9LRc2hdYJ2tEQnH74yXNBK12//gQ4A7Evu648PXi
 tyomVN7x9UQ5q6PBxh+xRx+b3cm3TlL4V06y08YBz+ZFoFYu3kYhGUglH8T5TSXPt1Xo
 3QqQ==
X-Gm-Message-State: AOAM532rn8aIiGplhcMqS1gj9bliFqZNf+x7bRqEzsURsEz2V0ivyR5I
 z9TJX3fyZU1IRtJb++juMDZFHYt1Jtj2gACG
X-Google-Smtp-Source: ABdhPJyTDMhQPBBMnO3UaftMux4PIU6aHzE0UabuHAc7D0fE7XwgWjlIyWB+3146qpBKAHjwF7qD2A==
X-Received: by 2002:a62:190d:0:b029:1bd:e11c:4eff with SMTP id
 13-20020a62190d0000b02901bde11c4effmr6608317pfz.22.1612565838346; 
 Fri, 05 Feb 2021 14:57:18 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/46] tcg/tci: Merge INDEX_op_ld8u_{i32,i64}
Date: Fri,  5 Feb 2021 12:56:17 -1000
Message-Id: <20210205225650.1330794-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


