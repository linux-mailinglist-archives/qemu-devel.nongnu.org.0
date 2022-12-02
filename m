Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C612E6400BF
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:57:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zuE-0007cK-2u; Fri, 02 Dec 2022 01:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zuC-0007bZ-AP
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:16 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zuA-0003jG-MV
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:16 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 t11-20020a17090a024b00b0021932afece4so7446734pje.5
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 22:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lh58nWvDudjSuhn3rm5AM+63H/4nwM3lp5/LtDDXIfE=;
 b=kD7xCOPTpQFWlssr3hvJtXzO/QEkTaqtF7CXHF7KMriEL9fnKIg15FEdqovFAIcumH
 PKVnjBaBOfUkEfE8v5XBgiGsbyxl4Ixx1Ja0xu2r6pJiFVURT8qgNRVS7+g1zgLv6Bl1
 8yh90XdI8fjobYA6hywnGfBgBH62SgXLBOffF2h55RFF7wSpz4IxwoqVCsW7f8p/Dw0d
 F+r0N81XjuDnKIGrqbaXjtK/ojT2Z/oMqtN3JlV+maEEfIYND8tgbyDyedPs43jnALM0
 W8j+wwlp9gWMMKKyVNQNQw9ZEPKJeI/drC9/ldm6rYk29MmIfqywgpb9rUQbLIWP3Oae
 dvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lh58nWvDudjSuhn3rm5AM+63H/4nwM3lp5/LtDDXIfE=;
 b=de0tyYTVFJWiHwMIyeZjQNnm0PAFhQVRbbmIKrxYoMDzDMYu1dk0YrDP8nBNA5iCmg
 yGALjwKZru+OEwHDAPWJg8ZKhFvgWzIoz+nqig/DzsPxCSVnORL1VQTDSHsX74zCjE8D
 Wijeog4VFNicZbRS8uRCE539qZbRNLgx4LjR2025O9cXR11S3mVwDeb9DXbUi1teT69+
 prO5dPc0nqnRWQu5uRnAxPlVjU1oweO8De+/djLDL6VYh9/DzS0qaWPIOSUdyyB4z//e
 5bE1HUL6+FUhszWmsmD4muV3OZz7s6kPTQArn1PjQZKllSCZt96O2qKsyhZTzFqeXhS+
 LH4w==
X-Gm-Message-State: ANoB5pmJeK8gBIWzVM5dBVoB5oH2mGgtb1VwuHVam7Y7kmc2dzdFUrrC
 0SrzfUU4dxztvBNBm5l1ie0Tpzi3++USCQOc
X-Google-Smtp-Source: AA0mqf56juHjAi6H1cdvAUf1bQe8R6YTUD75eVyL0Il47Vj8KkV8T/xccGU+Yo71AXse7iTRC7WWNg==
X-Received: by 2002:a17:90a:dd82:b0:212:fdb1:720b with SMTP id
 l2-20020a17090add8200b00212fdb1720bmr80782887pjv.66.1669963933342; 
 Thu, 01 Dec 2022 22:52:13 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 q61-20020a17090a17c300b00218d894fac3sm6056649pja.3.2022.12.01.22.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 22:52:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v3 12/13] tcg/s390x: Use tgen_movcond_int in tgen_clz
Date: Thu,  1 Dec 2022 22:51:59 -0800
Message-Id: <20221202065200.224537-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202065200.224537-1-richard.henderson@linaro.org>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |  1 +
 tcg/s390x/tcg-target.c.inc     | 26 +++++++++++---------------
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index 86cdc248f2..cfc0d405b3 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -24,6 +24,7 @@ C_O1_I2(r, 0, rI)
 C_O1_I2(r, 0, rJ)
 C_O1_I2(r, r, r)
 C_O1_I2(r, r, ri)
+C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rJ)
 C_O1_I2(r, rZ, r)
 C_O1_I2(v, v, r)
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 1e4947b598..23cbb10168 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1557,21 +1557,15 @@ static void tgen_clz(TCGContext *s, TCGReg dest, TCGReg a1,
 
     if (a2const && a2 == 64) {
         tcg_out_mov(s, TCG_TYPE_I64, dest, TCG_REG_R0);
-    } else {
-        if (a2const) {
-            tcg_out_movi(s, TCG_TYPE_I64, dest, a2);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I64, dest, a2);
-        }
-        if (HAVE_FACILITY(LOAD_ON_COND)) {
-            /* Emit: if (one bit found) dest = r0.  */
-            tcg_out_insn(s, RRFc, LOCGR, dest, TCG_REG_R0, 2);
-        } else {
-            /* Emit: if (no one bit found) goto over; dest = r0; over:  */
-            tcg_out_insn(s, RI, BRC, 8, (4 + 4) >> 1);
-            tcg_out_insn(s, RRE, LGR, dest, TCG_REG_R0);
-        }
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
@@ -3224,11 +3218,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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


