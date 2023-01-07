Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F53660CE2
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 09:01:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zc-0003qD-7E; Sat, 07 Jan 2023 02:51:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zX-0003o8-TI
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:47 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zW-0004H2-90
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:47 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 cp9-20020a17090afb8900b00226a934e0e5so7184942pjb.1
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZuURL0Ztzr8btVR749avb0V6dgHEYwxAMwyivvvug7o=;
 b=BR/vDp1siPmEjxAOkeQDS6NMzwh3PuOTTJoYv21gI6J0ET1tOMsb+55+AqC0VM0mip
 uU7MPSKT4rDrlT0XXidZTbNPwUazh4+Pf2ZeC2UWgMvMc7wzx6FwRMvAHPvH86RVq+oR
 XfEFIkCxfeMBGa4KHGJRkM6MxkK3sfm8KMXyBdbcr4bTG+f/whAhQTdmgps2krcxEyct
 93P7IhqrFZUVBltWtka89INA1LqTUdfmhphHd9gm9+KWULG0AIuFJjKzEuivCz/oDdsw
 ZznzZngcAwv3hMmdT2yn27aDJJgAeUwvWfqsmRhwobJ8KddHQBpZVcIqjQpvvb795biK
 KkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZuURL0Ztzr8btVR749avb0V6dgHEYwxAMwyivvvug7o=;
 b=pmZk887bqlS+FprtB6/L4QsrxtQ092kBYqvQ0Yqv85lglKuT1lrNH8wbLDJsifEzx0
 gh8Ud13R6REXnnSQ64NM6Stao/uAoewT9tS4RtyDdFZzsqpNh8S8Xiy7WvIXf8+/IIlc
 aZxadeedCtrrXxR2Ako/IIu8GAF2a1iISVIZPFQeyLYoFC5zINMDlVr/BfcxHhekzzqv
 Gxl6D29OkcV7dmbxNa5FU6aVfBhDCwlzpgI5fZZ7Nfm74whsTDmK1PJgHNXbH//A19y2
 vvzewC3gp6Ht/Fqs+qHulE0vlCaQmxQ+WYc7N/1JsH6kIoqxiixKznmAk/Em46Ctcx40
 1LeQ==
X-Gm-Message-State: AFqh2kqwBhHBwnSjOtJ8hh4Y/X/+jmlI6pIeXE4DQkrTRQNwI88Cr494
 CBGp6jckn22RYjqlWdP2Jp/mcV0jWbDeAmnk
X-Google-Smtp-Source: AMrXdXvA/Cbi3bnLJvrLjLnv/X18cFZ482kI6hyIFYpG2M2ZWLCuC0GUPbr6qfqFHgzkzCcsPYmMJQ==
X-Received: by 2002:a17:90b:3797:b0:226:3981:1ae3 with SMTP id
 mz23-20020a17090b379700b0022639811ae3mr30561499pjb.28.1673077904998; 
 Fri, 06 Jan 2023 23:51:44 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 27/27] tcg/s390x: Avoid the constant pool in tcg_out_movi
Date: Fri,  6 Jan 2023 23:51:18 -0800
Message-Id: <20230107075118.1814503-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
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

Load constants in no more than two insns, which turns
out to be faster than using the constant pool.

Suggested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index b72c43e4aa..2b38fd991d 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -877,6 +877,9 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
 static const S390Opcode li_insns[4] = {
     RI_LLILL, RI_LLILH, RI_LLIHL, RI_LLIHH
 };
+static const S390Opcode oi_insns[4] = {
+    RI_OILL, RI_OILH, RI_OIHL, RI_OIHH
+};
 static const S390Opcode lif_insns[2] = {
     RIL_LLILF, RIL_LLIHF,
 };
@@ -928,9 +931,20 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
         return;
     }
 
-    /* Otherwise, stuff it in the constant pool.  */
-    tcg_out_insn(s, RIL, LGRL, ret, 0);
-    new_pool_label(s, sval, R_390_PC32DBL, s->code_ptr - 2, 2);
+    /* Otherwise, load it by parts. */
+    i = is_const_p16((uint32_t)uval);
+    if (i >= 0) {
+        tcg_out_insn_RI(s, li_insns[i], ret, uval >> (i * 16));
+    } else {
+        tcg_out_insn(s, RIL, LLILF, ret, uval);
+    }
+    uval >>= 32;
+    i = is_const_p16(uval);
+    if (i >= 0) {
+        tcg_out_insn_RI(s, oi_insns[i + 2], ret, uval >> (i * 16));
+    } else {
+        tcg_out_insn(s, RIL, OIHF, ret, uval);
+    }
 }
 
 /* Emit a load/store type instruction.  Inputs are:
@@ -1160,9 +1174,6 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 
 static void tgen_ori(TCGContext *s, TCGReg dest, uint64_t val)
 {
-    static const S390Opcode oi_insns[4] = {
-        RI_OILL, RI_OILH, RI_OIHL, RI_OIHH
-    };
     static const S390Opcode oif_insns[2] = {
         RIL_OILF, RIL_OIHF
     };
-- 
2.34.1


