Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF78647C26
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:18:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3SmZ-00066B-HT; Thu, 08 Dec 2022 21:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sm8-000647-JK
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:06:08 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sm0-0001zB-Gq
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:06:02 -0500
Received: by mail-oi1-x232.google.com with SMTP id h132so3283830oif.2
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r0wyYihsWPXw8Yqko2NtqMR1/ytj9ZC8grnAJG95FjU=;
 b=LbWX84ncUDHd2MaOjUWUgnXe4k+BVgd6DbQwhcmbUBhIYmIoYIVnxv+h9QJ6PvCKyB
 t2J9DzjgIZ7WdW6e9eKwtZt1A/OulN2PWmHT2M49h7j7sQrqtwpeuPu3MSZHo4fmFvtX
 CT98MhO/aln4qlXX6YkdpkHPratQaFgKWLK94jITEIKugNW3kF2rg/nL7XcZc6hP4WAY
 AQlMixl3jhFzIs8UFlz2wVr2+J5s7P+UGCEWd4eOpvvZaQGRcwfFxjML0Fhx83+l8Wi3
 mopc2OS3WS1WK5YNimPP0JXe7f9BVa1kwBOnhUO1Q+XtPZD9NaPOPeopeVleaF66vbve
 NfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r0wyYihsWPXw8Yqko2NtqMR1/ytj9ZC8grnAJG95FjU=;
 b=DfHVdFnqE6zlBNHD1A7DnW7tT9c0V2QA0fA+9H4RjwCDFQj9egIH3fkD+xx7KUqkEI
 gaMYFa5hSwFMBzxJRmb4ZULdVfDkmkRAnDWSdNxtu7xVmJkrV7CZPscerB1U+vukVzwT
 xx6itNEpLEjZ1jpSQladKMA/T7bb4pdDd617RIYsR23rChaZ4VEb4t6f/CKcy38r80oN
 7xQnhZ8/uN69lghuTD8gzKmhXqeJG/0vnQWMQ25KDsXkxjd7WJ01F7wtGLJW+3ZPHjOZ
 fXnwV3rqsQJ0AMY63YrusE7vEtsDDL1wL0rYzOuk/m/UlqQ8AUoAt8Wj+WnjbBgE6zAn
 +YwA==
X-Gm-Message-State: ANoB5pk7kpNCu40FnjBE5Gu84xWAgPDtxIBjbeeIkELvEoBlUIU25psT
 iY81cOCZIujbZvf7MkTgLNcEZttvTKIng6T4M6A=
X-Google-Smtp-Source: AA0mqf4SC4jivd3mW6XyEcBy7R5y9Fr4HICXt3qhs1RbRjFyA4APZ/ARJm/P6N8ytcGUr/6Oyf6XwA==
X-Received: by 2002:a05:6808:98e:b0:35e:5aac:716a with SMTP id
 a14-20020a056808098e00b0035e5aac716amr23733oic.45.1670551559527; 
 Thu, 08 Dec 2022 18:05:59 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 23/27] tcg/s390x: Use tgen_movcond_int in tgen_clz
Date: Thu,  8 Dec 2022 20:05:26 -0600
Message-Id: <20221209020530.396391-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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


