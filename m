Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881B6647C1B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:17:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Sml-0006So-Hf; Thu, 08 Dec 2022 21:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3SmB-00067j-FC
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:06:20 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sm7-0001xU-CB
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:06:11 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 p24-20020a0568301d5800b0066e6dc09be5so1982183oth.8
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=21p9NPEj/nCmkIem3oytkyW4EvI66hYE8FrtmQQPev4=;
 b=vl4lxRPDVxcZNhuMmwrorD+eXKw9mgdpiSMGExHtOyAoEIhmzudaCiQMp4TUlTp/99
 Kfc5QTntw/IYl1i0mxAlnbyurFJ+zUh8Fg4V65YUMYWVwQJrTYYxq96TmSvRCxEvSLE0
 jo7U+9tsxvSY8GHdImGW6u4q0GdRkFQgcOAznBL/0+w5M76RalPmAXPEl01gkKGKp0ao
 h72mQvtMOSNrFheAAjfa+f+q6oHpoqUBagVTcyFjrl1U80spVSqRNlZRu5sEaraQOwN9
 gnVOl/k+tFNCPRMEIO+VGMEy+rXtvQG9FBfZuP1sCDiEnNbchxHAZEPlF0UPOA+J7D5d
 3bWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=21p9NPEj/nCmkIem3oytkyW4EvI66hYE8FrtmQQPev4=;
 b=WfUFcEkfm8iKJJrWl1ZlQzfmmjDy/82uVwaavB5sD/3rfDtdDRxGIMf/GB+YgdEZBJ
 BIQGCfcHJAgbk3Tk5EFEpJTL9wYsh5l43IB4YGbdYGgbRSEgYe6UIScljXxNQS2zeobf
 oM/b0T/PYD7cjqoQk3dpUmUGEVYwSuY5aN6J92xSnYy4+qy6xIiAG63cKF8g1oH2cidp
 BpEPDjghBvfdMbu5lVx9c+9/i3bVAtLsQ/N03B+vWF+VHekQzRnfbPDJmNN6Q8OobhdE
 WWK/ZIfUAH7rRReXxLEhO5wuX9w2w/WkikyHcjo3tR/JVrmLFmHkb8lcTW0f2IHIQZfm
 EPzg==
X-Gm-Message-State: ANoB5pkjov3FQjtxp4T/Td5jPCkEt02zbM0dwCsa/liZ/EN+igBXAmuy
 zwVSPmnGyJnEMIMqItS5/o+6b6NzrH0Ve6b5qkk=
X-Google-Smtp-Source: AA0mqf71J/WQfTrrnuBU0qv/zMT3oAqpTiKFvT30n5sJG44QeHCviahoEaWC5FUKGuQ35GpfGxEhsw==
X-Received: by 2002:a05:6830:1517:b0:670:69ac:bb49 with SMTP id
 k23-20020a056830151700b0067069acbb49mr1952676otp.15.1670551563011; 
 Thu, 08 Dec 2022 18:06:03 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:06:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 26/27] tcg/s390x: Cleanup tcg_out_movi
Date: Thu,  8 Dec 2022 20:05:29 -0600
Message-Id: <20221209020530.396391-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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


