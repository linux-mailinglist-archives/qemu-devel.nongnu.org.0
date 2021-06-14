Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F373A5E7F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:42:16 +0200 (CEST)
Received: from localhost ([::1]:48500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiAh-0000Uk-N3
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6p-0002BA-JV
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:17 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6h-0003Wt-PN
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:15 -0400
Received: by mail-pf1-x42f.google.com with SMTP id h12so10032568pfe.2
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3XaCQaiofWlp2RkjtaKGiOMhxyWGMuQ5bASRK7Oic+8=;
 b=TSrXbgYl29YXvO1rY1NUkuYqiIZ1xZ+9zhmuY0tIXqFD0yFbxckrOj5V523Q7d2zVb
 hI5nyyL+QeZphmfhtX4n2lKnCQIdPmiyek6taHqIKihFYnvZK9dpvvUoZhRko63DQOxo
 PWDTno1V8Fmi5/RufSPM3SEVRoCd1cpA7+k8YDrXczwALV/GCh6WfI3gbLjY8G0/UhrU
 CFBuGGOCkh3CwMgC0rZgDP8JKBK67Ic9KCeSW9+pFIAt+364a9ZrrJjwzRr7glnLd7Iu
 zG7I6aF9KP+aUR/Y2LP9Jr8yj1gvEmzgCH6A3MFANJt99kLBGbqxWNS+LVoGwesqxOW4
 K/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3XaCQaiofWlp2RkjtaKGiOMhxyWGMuQ5bASRK7Oic+8=;
 b=tEwzjz96DbIVARIKYXnxzgBeWdKV7LKTbBZ/03XG7SKSks0H19BdqzCjpfT31gOJ9Y
 dO7RXf974SuobsmmvoJMY5yF1+l8iWuuuPoUcxpH7ICvrbqPSa/s7kHx9Uiq4Eiku88t
 FRiHw4e2h1pHAVzyg0EcFGWjqZHWVzQUJcysa3JNh17KgqQRLVwzh+1Ufo7S862n/RZi
 p6QCuttmmC3Wlpyi8xqyaZA9Y2tjf3RozLju7JgAPTd7K5KZ8el0EahyNF+Bnek2IK0V
 TDuIOIaf455f26ZeehF53v4NYK4fm5GfUC8tYAmb/+wewdJt5KTZpaIMGtqXZwPdC946
 j4pw==
X-Gm-Message-State: AOAM533DvgDydvEPn+cBGlgDvVSg4NBY3X9ruTdU8VcQsdaEBOhBE0uP
 +BIJMOotM8v/qk1VQWRwgIY5Blnq97VcQA==
X-Google-Smtp-Source: ABdhPJzLbCzTvuvGzJL3lY/6aPIdHd13MOGR1rV+9n8avpeT8QatmgUo4EwJhj0DSqEKnWVoGjapfA==
X-Received: by 2002:a62:3344:0:b029:24c:735c:4546 with SMTP id
 z65-20020a6233440000b029024c735c4546mr21067512pfz.1.1623659886479; 
 Mon, 14 Jun 2021 01:38:06 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/28] tcg/ppc: Split out tcg_out_bswap32
Date: Mon, 14 Jun 2021 01:37:40 -0700
Message-Id: <20210614083800.1166166-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 64c24382a8..f0e42e4b88 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -798,6 +798,17 @@ static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
 }
 
+static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
+
+    /* Stolen from gcc's builtin_bswap32.             src = abcd */
+    tcg_out_rlw(s, RLWINM, tmp, src, 8, 0, 31);    /* tmp = bcda */
+    tcg_out_rlw(s, RLWIMI, tmp, src, 24, 0, 7);    /* tmp = dcda */
+    tcg_out_rlw(s, RLWIMI, tmp, src, 24, 16, 23);  /* tmp = dcba */
+    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+}
+
 /* Emit a move into ret of arg, if it can be done in one insn.  */
 static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
 {
@@ -2791,24 +2802,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_bswap16_i64:
         tcg_out_bswap16(s, args[0], args[1]);
         break;
-
     case INDEX_op_bswap32_i32:
     case INDEX_op_bswap32_i64:
-        /* Stolen from gcc's builtin_bswap32 */
-        a1 = args[1];
-        a0 = args[0] == a1 ? TCG_REG_R0 : args[0];
-
-        /* a1 = args[1] # abcd */
-        /* a0 = rotate_left (a1, 8) # bcda */
-        tcg_out_rlw(s, RLWINM, a0, a1, 8, 0, 31);
-        /* a0 = (a0 & ~0xff000000) | ((a1 r<< 24) & 0xff000000) # dcda */
-        tcg_out_rlw(s, RLWIMI, a0, a1, 24, 0, 7);
-        /* a0 = (a0 & ~0x0000ff00) | ((a1 r<< 24) & 0x0000ff00) # dcba */
-        tcg_out_rlw(s, RLWIMI, a0, a1, 24, 16, 23);
-
-        if (a0 == TCG_REG_R0) {
-            tcg_out_mov(s, TCG_TYPE_REG, args[0], a0);
-        }
+        tcg_out_bswap32(s, args[0], args[1]);
         break;
 
     case INDEX_op_bswap64_i64:
-- 
2.25.1


