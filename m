Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B17660CDB
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 08:55:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zW-0003lZ-Js; Sat, 07 Jan 2023 02:51:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zU-0003ke-7E
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:44 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zS-0004GI-Jx
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:43 -0500
Received: by mail-pl1-x632.google.com with SMTP id jl4so4063042plb.8
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r0wyYihsWPXw8Yqko2NtqMR1/ytj9ZC8grnAJG95FjU=;
 b=EnxeAfDwKPYZYM9PxTjlO4WL/9IMiofhbvkIvSqds0qpzwm8FfT5I5EovuhyB7hHN4
 gbliX4/ZyNtS5yBuEIfVguFSuXJJERnRsvQuqEupFF64WmtiX8AvT9/9TBGAnW/x2jjq
 /iEkMGY8w5VyYSJogocYUgCPVgMlLMOXlPUgQnQgGkNkRXqbDoaYHJaGv0F8Cdkoavi+
 YeO0RgB7Ts9wNkKfC1B+4NnX+BMiGy1Ir3PtXfjKNYhOTfrCK0LTyNwGBfzOcJOOpEZD
 KlNNda3IFO7E8DHb/sikgACX9WUXPfntDk6R2sZcSd+5FwTf+ISNfmaIAm46YkY6yJ3p
 ZzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r0wyYihsWPXw8Yqko2NtqMR1/ytj9ZC8grnAJG95FjU=;
 b=RWjUKypAZdn6aoRVh0glCDXLP5ybEcBB4EmmwzIXHHrDmnrqNMPxve+oQXw9xYKFHa
 11djcCVKYDpaouEfoja/FEvA4iUwf9e6v4ZfSzkPEe3/gOpV2I3jCKugZKNuQSVQR6BF
 Byqez8XH5czNu/CcbkHrbLzAm+B71GvoQ+sRBG0DSWy7HVwTeGdNIojaZP4Lq8ddkZXd
 dclq0zmRcuFMgOq2hNqvGN45PX+i9apUqS2pM0J8cjPBFQklPhFhlKUxo9KWp9vhpDw9
 E2QN0MX7csRNfe8LLPWdDIG2mkHaj627k3UODaRdBklQIwK5RZcOuJ78TtP/IKXmxYam
 q7Zg==
X-Gm-Message-State: AFqh2kpq1DT8WtHpho1vK9FiD6AQ27Rwbsoq4nW72WPRfOT0ziEGIq/W
 71hukgkWGdJWFgpHd+wzFMzAu+Kl7ZiYbZ/i
X-Google-Smtp-Source: AMrXdXtD+XfA6xPL3ETbDtTMNev656oCEx9M6DuSUI7dl7TNans/Lbch2NpKBtCRl3vl1lBvvVvDeA==
X-Received: by 2002:a17:90a:3985:b0:226:df9e:9147 with SMTP id
 z5-20020a17090a398500b00226df9e9147mr5422045pjb.38.1673077901373; 
 Fri, 06 Jan 2023 23:51:41 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 23/27] tcg/s390x: Use tgen_movcond_int in tgen_clz
Date: Fri,  6 Jan 2023 23:51:14 -0800
Message-Id: <20230107075118.1814503-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Reuse code from movcond to conditionally copy a2 to dest,
based on the condition codes produced by FLOGR.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |  1 +
 tcg/s390x/tcg-target.c.inc     | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index 8cf8ed4dff..baf3bc9037 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -24,6 +24,7 @@ C_O1_I2(r, 0, rI)
 C_O1_I2(r, 0, rJ)
 C_O1_I2(r, r, r)
 C_O1_I2(r, r, ri)
+C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rJ)
 C_O1_I2(r, r, rK)
 C_O1_I2(r, r, rKR)
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index ab1fb45cc2..8254f9f650 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1424,15 +1424,15 @@ static void tgen_clz(TCGContext *s, TCGReg dest, TCGReg a1,
 
     if (a2const && a2 == 64) {
         tcg_out_mov(s, TCG_TYPE_I64, dest, TCG_REG_R0);
-    } else {
-        if (a2const) {
-            tcg_out_movi(s, TCG_TYPE_I64, dest, a2);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I64, dest, a2);
-        }
-        /* Emit: if (one bit found) dest = r0.  */
-        tcg_out_insn(s, RRFc, LOCGR, dest, TCG_REG_R0, 2);
+        return;
     }
+
+    /*
+     * Conditions from FLOGR are:
+     *   2 -> one bit found
+     *   8 -> no one bit found
+     */
+    tgen_movcond_int(s, TCG_TYPE_I64, dest, a2, a2const, TCG_REG_R0, 8, 2);
 }
 
 static void tgen_deposit(TCGContext *s, TCGReg dest, TCGReg src,
@@ -3070,11 +3070,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rotl_i64:
     case INDEX_op_rotr_i32:
     case INDEX_op_rotr_i64:
-    case INDEX_op_clz_i64:
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
         return C_O1_I2(r, r, ri);
 
+    case INDEX_op_clz_i64:
+        return C_O1_I2(r, r, rI);
+
     case INDEX_op_sub_i32:
     case INDEX_op_sub_i64:
     case INDEX_op_and_i32:
-- 
2.34.1


