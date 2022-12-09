Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81ED647BF2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:07:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Slg-0005tW-TL; Thu, 08 Dec 2022 21:05:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sle-0005sv-7P
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:38 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slc-0001sJ-EG
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:37 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 m6-20020a9d7e86000000b0066ec505ae93so1979785otp.9
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tLBGpsh6MTEMtw6+WKTyIS5KlZ4TUnE33H/La06GVTk=;
 b=hdAAEQfc1XuN6rLOokMQgTRriEyyMhQE/SABt2hFLnm6XvBVKkF6nBGpPIL0g1IQ+N
 eQ9s3WB5V6IFhn8EMDflqqAWvkK2Wlttj7Mq2DCVLTVeyLr1pczw72xigV28iumbk6/0
 8wPdmRFT5kSQraW58d7HEEixh+jCwBQ7NVYMulC/b2YX3U5qNOiBccdSUHZu2PE7P1c8
 gh2ZRyWMGj0FGOzZfC7lHZOQkM6xBtuwCS5YzLfmKuJvBI4lhE7BCTkLSDmBMIFWJxUo
 Tq/M8Eqavb8giXm/AYCz+c6TkQE5tUzE7LeXcD4dK8PFc+fZ7ydUFN90sR9N5X+yPbPa
 ncJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tLBGpsh6MTEMtw6+WKTyIS5KlZ4TUnE33H/La06GVTk=;
 b=xsYwDtUiJdY1TJNYrFbz8EtS0PYm9O6CrSgRwGom99DVS2Jk+fF7uAMZ4HZDQKmOVt
 jq0YjN+WYLyp3lw5r8bXUpY9eMTByfRNYP/HPmVb/S99VeXE5ZmVsIByTAlb2I0f48bS
 m6UTZzrPpz6RA+mYTTE00Tyom+AhhxLRTUXH1FHWHS1SzOkIlyU78CitKTQRTNa4nv0J
 m82HRJXnx0LVTM5tioqkF5vndHBxYbes7+tQj3a/D3GAYdHlfAVIQLoGqINyi6Z0vVa7
 mb28wPQKXQTaZbeg853w//kLcadJcLh/fYhDwmyPfc8fyHGNovEN9yWRu2JKdr/xermZ
 G80w==
X-Gm-Message-State: ANoB5pklCJourwmxZCjm9/dyPvErWbWOpILi3Rd2R6TVpfe6IHjzQZ8F
 yjPExBGeYnx4hEtUpgiE21Xb1Mu6Kes1bvmMdzc=
X-Google-Smtp-Source: AA0mqf5iKvn2cfjPRoMjwGn+ONKAO4j2dOgXGfNHq46f3oz1518RbFwFcynPooVhRzzz95y9MnsUxw==
X-Received: by 2002:a05:6830:6113:b0:661:dfeb:a95f with SMTP id
 ca19-20020a056830611300b00661dfeba95fmr2827162otb.10.1670551534491; 
 Thu, 08 Dec 2022 18:05:34 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 01/27] tcg/s390x: Use register pair allocation for div and
 mulu2
Date: Thu,  8 Dec 2022 20:05:04 -0600
Message-Id: <20221209020530.396391-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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

Previously we hard-coded R2 and R3.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |  4 ++--
 tcg/s390x/tcg-target-con-str.h |  8 +------
 tcg/s390x/tcg-target.c.inc     | 43 +++++++++++++++++++++++++---------
 3 files changed, 35 insertions(+), 20 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index 426dd92e51..00ba727b70 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -29,8 +29,8 @@ C_O1_I2(v, v, v)
 C_O1_I3(v, v, v, v)
 C_O1_I4(r, r, ri, r, 0)
 C_O1_I4(r, r, ri, rI, 0)
-C_O2_I2(b, a, 0, r)
-C_O2_I3(b, a, 0, 1, r)
+C_O2_I2(o, m, 0, r)
+C_O2_I3(o, m, 0, 1, r)
 C_O2_I4(r, r, 0, 1, rA, r)
 C_O2_I4(r, r, 0, 1, ri, r)
 C_O2_I4(r, r, 0, 1, r, r)
diff --git a/tcg/s390x/tcg-target-con-str.h b/tcg/s390x/tcg-target-con-str.h
index 8bb0358ae5..76446aecae 100644
--- a/tcg/s390x/tcg-target-con-str.h
+++ b/tcg/s390x/tcg-target-con-str.h
@@ -11,13 +11,7 @@
 REGS('r', ALL_GENERAL_REGS)
 REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
 REGS('v', ALL_VECTOR_REGS)
-/*
- * A (single) even/odd pair for division.
- * TODO: Add something to the register allocator to allow
- * this kind of regno+1 pairing to be done more generally.
- */
-REGS('a', 1u << TCG_REG_R2)
-REGS('b', 1u << TCG_REG_R3)
+REGS('o', 0xaaaa) /* odd numbered general regs */
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index b9ba7b605e..cb00bb6999 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2264,10 +2264,18 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_div2_i32:
-        tcg_out_insn(s, RR, DR, TCG_REG_R2, args[4]);
+        tcg_debug_assert(args[0] == args[2]);
+        tcg_debug_assert(args[1] == args[3]);
+        tcg_debug_assert((args[1] & 1) == 0);
+        tcg_debug_assert(args[0] == args[1] + 1);
+        tcg_out_insn(s, RR, DR, args[1], args[4]);
         break;
     case INDEX_op_divu2_i32:
-        tcg_out_insn(s, RRE, DLR, TCG_REG_R2, args[4]);
+        tcg_debug_assert(args[0] == args[2]);
+        tcg_debug_assert(args[1] == args[3]);
+        tcg_debug_assert((args[1] & 1) == 0);
+        tcg_debug_assert(args[0] == args[1] + 1);
+        tcg_out_insn(s, RRE, DLR, args[1], args[4]);
         break;
 
     case INDEX_op_shl_i32:
@@ -2521,17 +2529,30 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_div2_i64:
-        /* ??? We get an unnecessary sign-extension of the dividend
-           into R3 with this definition, but as we do in fact always
-           produce both quotient and remainder using INDEX_op_div_i64
-           instead requires jumping through even more hoops.  */
-        tcg_out_insn(s, RRE, DSGR, TCG_REG_R2, args[4]);
+        /*
+         * ??? We get an unnecessary sign-extension of the dividend
+         * into op0 with this definition, but as we do in fact always
+         * produce both quotient and remainder using INDEX_op_div_i64
+         * instead requires jumping through even more hoops.
+         */
+        tcg_debug_assert(args[0] == args[2]);
+        tcg_debug_assert(args[1] == args[3]);
+        tcg_debug_assert((args[1] & 1) == 0);
+        tcg_debug_assert(args[0] == args[1] + 1);
+        tcg_out_insn(s, RRE, DSGR, args[1], args[4]);
         break;
     case INDEX_op_divu2_i64:
-        tcg_out_insn(s, RRE, DLGR, TCG_REG_R2, args[4]);
+        tcg_debug_assert(args[0] == args[2]);
+        tcg_debug_assert(args[1] == args[3]);
+        tcg_debug_assert((args[1] & 1) == 0);
+        tcg_debug_assert(args[0] == args[1] + 1);
+        tcg_out_insn(s, RRE, DLGR, args[1], args[4]);
         break;
     case INDEX_op_mulu2_i64:
-        tcg_out_insn(s, RRE, MLGR, TCG_REG_R2, args[3]);
+        tcg_debug_assert(args[0] == args[2]);
+        tcg_debug_assert((args[1] & 1) == 0);
+        tcg_debug_assert(args[0] == args[1] + 1);
+        tcg_out_insn(s, RRE, MLGR, args[1], args[3]);
         break;
 
     case INDEX_op_shl_i64:
@@ -3226,10 +3247,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_div2_i64:
     case INDEX_op_divu2_i32:
     case INDEX_op_divu2_i64:
-        return C_O2_I3(b, a, 0, 1, r);
+        return C_O2_I3(o, m, 0, 1, r);
 
     case INDEX_op_mulu2_i64:
-        return C_O2_I2(b, a, 0, r);
+        return C_O2_I2(o, m, 0, r);
 
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-- 
2.34.1


