Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D593E3F0CFD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:52:22 +0200 (CEST)
Received: from localhost ([::1]:35778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSXt-0005Et-Qk
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGSRy-0000OX-4T
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:46:14 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGSRw-00089A-GF
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:46:13 -0400
Received: by mail-pf1-x42b.google.com with SMTP id x16so3411878pfh.2
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JZiqz6o6Xj+jMjnO5DlRRpE4nRwaHpEQrs1cPBmCDrY=;
 b=fRYGHWEH0og0MJvS9rspIAy7W306YUvrBZcSFClsM+tJ1GEvoDK5jEmp5S3a2R8i0J
 1449jtYDgoBXa0zXqcUMr+RrQPqj+4lcyd5IHc6H0J4ggPOBZJho29tMpfyzusZv8WhK
 BJmgcuFNr7HbzFpbxbCtS6SR/We0rDg4jSllwpJLu0OfEim2LUMlxuutQhzolvk402HQ
 pxHN/iDk0E4I5pOS+mH1wgz80Lm0PofCQ0w3n8t/vZw9hrAI2R4luk3T8/2XWE7FKQ0l
 LBoKeKGZGF7LaVeCXy6mMSqIez6bX88PaUq7BZHVwOpOb4k3iPQiUANw+3lbLJy3XnJz
 4sRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JZiqz6o6Xj+jMjnO5DlRRpE4nRwaHpEQrs1cPBmCDrY=;
 b=VufCjlHFVynia+bvGNfYFUxcdGFhQuX5Y/KSABza0eOGgEpXf13haC5CGyf0YI1fIA
 BhB9UasZgnXiq2DT80OwVfJrHIGAdYoPom5qwCGDZqlrS6fXhFNaYzWXAQWrRHgJ3P/N
 m2pI+S673bjT+oWiAC3TN+Y4oqsF6q4CilDD1ogU0MugIk+FvT7V11/t1/B1+2jLJhKu
 fX4qffPAxQLpXlt2HlN9hqqxblcMC3gfu27xHPGg1VxA0JRiCvKnu3Wrcf1h9ur+wiT6
 N7aPu26pvP9OgYmOmOcurZqVcsVj4lCUuMQnqpQrSn2Fu80L3Aqp8Zr+dHBFhC/tw2HD
 9E3Q==
X-Gm-Message-State: AOAM532JwmJe6HgmEPx4oMHv6gT3dcQxScQYAR32hOYn18a+07tPG/fK
 KrNbW2cfOycNmPfkcotP9uzxc+dRMB5KMw==
X-Google-Smtp-Source: ABdhPJzDdX+F6+xQlYIZqv0tmVeJvij9rKpeUuWOCRGKVNVeVNpyJVyx5wD/Sz+QlZz2NVKAVjzh8w==
X-Received: by 2002:a63:a46:: with SMTP id z6mr10631045pgk.167.1629319571262; 
 Wed, 18 Aug 2021 13:46:11 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id 143sm739815pfz.13.2021.08.18.13.46.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:46:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/7] tcg/sparc: Add tcg_out_jmpl_const for better tail calls
Date: Wed, 18 Aug 2021 10:46:01 -1000
Message-Id: <20210818204602.394771-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818204602.394771-1-richard.henderson@linaro.org>
References: <20210818204602.394771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Due to mapping changes, we now rarely place the code_gen_buffer
near the main executable.  Which means that direct calls will
now rarely be in range.

So, always use indirect calls for tail calls, which allows us to
avoid clobbering %o7, and therefore we need not save and restore it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index b64760e736..8c1a0277d5 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -845,6 +845,19 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
     tcg_out_mov(s, TCG_TYPE_I64, rl, tmp);
 }
 
+static void tcg_out_jmpl_const(TCGContext *s, const tcg_insn_unit *dest,
+                               bool in_prologue, bool tail_call)
+{
+    uintptr_t desti = (uintptr_t)dest;
+
+    /* Be careful not to clobber %o7 for a tail call. */
+    tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_REG_T1,
+                     desti & ~0xfff, in_prologue,
+                     tail_call ? TCG_REG_G2 : TCG_REG_O7);
+    tcg_out_arithi(s, tail_call ? TCG_REG_G0 : TCG_REG_O7,
+                   TCG_REG_T1, desti & 0xfff, JMPL);
+}
+
 static void tcg_out_call_nodelay(TCGContext *s, const tcg_insn_unit *dest,
                                  bool in_prologue)
 {
@@ -853,10 +866,7 @@ static void tcg_out_call_nodelay(TCGContext *s, const tcg_insn_unit *dest,
     if (disp == (int32_t)disp) {
         tcg_out32(s, CALL | (uint32_t)disp >> 2);
     } else {
-        uintptr_t desti = (uintptr_t)dest;
-        tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_REG_T1,
-                         desti & ~0xfff, in_prologue, TCG_REG_O7);
-        tcg_out_arithi(s, TCG_REG_O7, TCG_REG_T1, desti & 0xfff, JMPL);
+        tcg_out_jmpl_const(s, dest, in_prologue, false);
     }
 }
 
@@ -947,11 +957,10 @@ static void build_trampolines(TCGContext *s)
 
         /* Set the retaddr operand.  */
         tcg_out_mov(s, TCG_TYPE_PTR, ra, TCG_REG_O7);
-        /* Set the env operand.  */
-        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O0, TCG_AREG0);
         /* Tail call.  */
-        tcg_out_call_nodelay(s, qemu_ld_helpers[i], true);
-        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O7, ra);
+        tcg_out_jmpl_const(s, qemu_ld_helpers[i], true, true);
+        /* delay slot -- set the env argument */
+        tcg_out_mov_delay(s, TCG_REG_O0, TCG_AREG0);
     }
 
     for (i = 0; i < ARRAY_SIZE(qemu_st_helpers); ++i) {
@@ -993,14 +1002,14 @@ static void build_trampolines(TCGContext *s)
         if (ra >= TCG_REG_O6) {
             tcg_out_st(s, TCG_TYPE_PTR, TCG_REG_O7, TCG_REG_CALL_STACK,
                        TCG_TARGET_CALL_STACK_OFFSET);
-            ra = TCG_REG_G1;
+        } else {
+            tcg_out_mov(s, TCG_TYPE_PTR, ra, TCG_REG_O7);
         }
-        tcg_out_mov(s, TCG_TYPE_PTR, ra, TCG_REG_O7);
-        /* Set the env operand.  */
-        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O0, TCG_AREG0);
+
         /* Tail call.  */
-        tcg_out_call_nodelay(s, qemu_st_helpers[i], true);
-        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O7, ra);
+        tcg_out_jmpl_const(s, qemu_st_helpers[i], true, true);
+        /* delay slot -- set the env argument */
+        tcg_out_mov_delay(s, TCG_REG_O0, TCG_AREG0);
     }
 }
 #endif
-- 
2.25.1


