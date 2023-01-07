Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06C3660CF1
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 09:14:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zb-0003qA-Lz; Sat, 07 Jan 2023 02:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zX-0003nG-7v
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:47 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zV-0004Gq-LQ
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:46 -0500
Received: by mail-pl1-x631.google.com with SMTP id p24so4052045plw.11
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KvZtdn0NTISLlVSqR+QnPBDzgwAfic/E3RNSqt0zSa8=;
 b=vcaqpOZ9tx6JYPJCBo1hLbxSd7n3Z9r/XHz+bBl0jk76AliaIyIs+C5WEzrtg9+Agl
 fAsstH7fhX1YgyPEsCZ4DrveMPPKXOA8jxSJIeaqAEImzkYaK3EWRMZlhOb4geHxup41
 VxlRaSvOJ8kzo7Y+12O4faf0knTFBozcyT+3U/g34XF/FxJPDpn7kSl0+jek4/R2yuLb
 IWF4OfR0sCoTLuo7kQMEs/EAMSx/H7bVhk44m4JR0Ugzz87Yo8fUs1pjW23uiCUjtord
 I5+5srHL3o9fYkbJIRsOi1f2sDU3Xm2r1ykj+gNIQXsFxcX859ShKHrx9zBS/SedqOr1
 pMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KvZtdn0NTISLlVSqR+QnPBDzgwAfic/E3RNSqt0zSa8=;
 b=eS2tm6EpYeJ14n/5hqJSE6uOD+CV6PwifWTwK24A6yJCoODC2dixcP+PC/hq0JsH8s
 LR5wLjwhA4G5wrRUQ2sMnJ8jMtoa4mYh8tYPubhWsGLQOVyzVogQKZJO7RV9HByrM5Jr
 Blr8M3vs11zRg52/7DMSCKMR51yi8uqxbYCQ9HaONDk98ywWbdZcYq9+tpX3TVCw7/sf
 rjoGAhdXMzRZhZkWt4FXNlHRUqI3IKky0ZgC9KKwsKRygJ0NJnlLu7wIiLcXoN47lAaM
 wuf3qDZ6H+pp9PyYwJhEJ8lHNu52Cfc+65ZaaOe+XohryA2xUtKKP2JDBwtQxvXxPMvX
 21Qg==
X-Gm-Message-State: AFqh2koHdsf7NTF6vj1FdRAgr+IV83mjmW1uk4gB0slUpZp/GKHviJng
 Y9GNiYSrysBf4xPq9Zb2VcseJw1Yx0FUNISb
X-Google-Smtp-Source: AMrXdXtitqJjKK2d8Ibby1CiOpWgsGUG4olQVLW0KncsUjMrpW+D13wjf921t36J6ilDFk6tMqrlcg==
X-Received: by 2002:a17:90a:db8b:b0:226:a826:9d1a with SMTP id
 h11-20020a17090adb8b00b00226a8269d1amr13994513pjv.31.1673077904024; 
 Fri, 06 Jan 2023 23:51:44 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 26/27] tcg/s390x: Cleanup tcg_out_movi
Date: Fri,  6 Jan 2023 23:51:17 -0800
Message-Id: <20230107075118.1814503-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Merge maybe_out_small_movi, as it no longer has additional users.
Use is_const_p{16,32}.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 52 ++++++++++++--------------------------
 1 file changed, 16 insertions(+), 36 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 4d113139e5..b72c43e4aa 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -874,14 +874,19 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
     return true;
 }
 
-static const S390Opcode lli_insns[4] = {
+static const S390Opcode li_insns[4] = {
     RI_LLILL, RI_LLILH, RI_LLIHL, RI_LLIHH
 };
+static const S390Opcode lif_insns[2] = {
+    RIL_LLILF, RIL_LLIHF,
+};
 
-static bool maybe_out_small_movi(TCGContext *s, TCGType type,
-                                 TCGReg ret, tcg_target_long sval)
+/* load a register with an immediate value */
+static void tcg_out_movi(TCGContext *s, TCGType type,
+                         TCGReg ret, tcg_target_long sval)
 {
     tcg_target_ulong uval = sval;
+    ptrdiff_t pc_off;
     int i;
 
     if (type == TCG_TYPE_I32) {
@@ -892,36 +897,13 @@ static bool maybe_out_small_movi(TCGContext *s, TCGType type,
     /* Try all 32-bit insns that can load it in one go.  */
     if (sval >= -0x8000 && sval < 0x8000) {
         tcg_out_insn(s, RI, LGHI, ret, sval);
-        return true;
-    }
-
-    for (i = 0; i < 4; i++) {
-        tcg_target_long mask = 0xffffull << i * 16;
-        if ((uval & mask) == uval) {
-            tcg_out_insn_RI(s, lli_insns[i], ret, uval >> i * 16);
-            return true;
-        }
-    }
-
-    return false;
-}
-
-/* load a register with an immediate value */
-static void tcg_out_movi(TCGContext *s, TCGType type,
-                         TCGReg ret, tcg_target_long sval)
-{
-    tcg_target_ulong uval;
-    ptrdiff_t pc_off;
-
-    /* Try all 32-bit insns that can load it in one go.  */
-    if (maybe_out_small_movi(s, type, ret, sval)) {
         return;
     }
 
-    uval = sval;
-    if (type == TCG_TYPE_I32) {
-        uval = (uint32_t)sval;
-        sval = (int32_t)sval;
+    i = is_const_p16(uval);
+    if (i >= 0) {
+        tcg_out_insn_RI(s, li_insns[i], ret, uval >> (i * 16));
+        return;
     }
 
     /* Try all 48-bit insns that can load it in one go.  */
@@ -929,12 +911,10 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
         tcg_out_insn(s, RIL, LGFI, ret, sval);
         return;
     }
-    if (uval <= 0xffffffff) {
-        tcg_out_insn(s, RIL, LLILF, ret, uval);
-        return;
-    }
-    if ((uval & 0xffffffff) == 0) {
-        tcg_out_insn(s, RIL, LLIHF, ret, uval >> 32);
+
+    i = is_const_p32(uval);
+    if (i >= 0) {
+        tcg_out_insn_RIL(s, lif_insns[i], ret, uval >> (i * 32));
         return;
     }
 
-- 
2.34.1


