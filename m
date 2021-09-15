Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40AF40CEEE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 23:38:30 +0200 (CEST)
Received: from localhost ([::1]:45000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQcbu-0000N8-0H
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 17:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV4-0003aS-EH
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:26 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV2-0003J0-Jv
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:26 -0400
Received: by mail-pg1-x530.google.com with SMTP id 17so4073061pgp.4
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 14:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tXv7oNi7xh6NpAOlqjCW4W7DgPGN1qKEQBh9TEf1NeA=;
 b=K5ke8Os3s8EzwAmGh4eZKdefzrmYPARTB/4EDWz+gmDZ9DLdlrlD8SePwldaq0cGxU
 We1wkr3LJNj7XkAXr0ze7qAQlUhNu7B4sVf2hHNVpM05DJTl2+8GXdM+OCTglxZWA8zV
 7NbexzNuCdRCZkFWMzQsxUmmmK6zIygbA3iff78yCAN+W9gGx5I4eCYeErrK/U8nRdSO
 bP4v5qJYmCzMv1VWs7SvQedM4H4Y9gfL5udOiFCBqNRmzsqPp76iwiOcr0lt5ULnQDrS
 CkjkpGLv+5pvSoGWy6uq921tgRquNWbUNYGyil/335b/9TEcGB9hrPxMctxXvznCkWi4
 qtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tXv7oNi7xh6NpAOlqjCW4W7DgPGN1qKEQBh9TEf1NeA=;
 b=xXVM4KguAr6SGfeKtOXVQn+mKENQWYBfuMV1vPoR58LD3cwFFilY2rZS8XPyMmciGE
 6vXudvXnxiv/pppaqGE5t4MOxQmOyw7SmgPJt49ipV68RZe+oGq9HV4eD+akF6qP6L1e
 3hnFor8uwFj+3CJeoI+hIW5ivoEZAvHD/FlvYPRii0MS/cNLwNUYx3YGQgxaMjsxJbGF
 OlFw8KSZ1IjrpOAp6UbfxmuRbV75QCEMVJwmpl8xUP1xCorCVVxQdaSQAQyueOqB5h05
 yv7MntPYmy8251uSeKvd/kJq09ePGr801bphLt96cFtqivxA8DC++4vFYxmIY9qjMvgc
 k4AA==
X-Gm-Message-State: AOAM530xTnAiqrP3XROYgukqAnrpnBf+Mwo1N+najPduv6xcwUo6FPds
 816opC0N6g5oVRVttXdcOvrtGRqmQ5ENVA==
X-Google-Smtp-Source: ABdhPJzaABdLd5c2oevzAZPrtlYXdl5OoqyNOo7wFM52GOZ1/UfXdaZ9Dh4tR/peyloXvQwvi6LIbQ==
X-Received: by 2002:a05:6a00:1706:b0:434:9def:d275 with SMTP id
 h6-20020a056a00170600b004349defd275mr1727745pfc.1.1631741483171; 
 Wed, 15 Sep 2021 14:31:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q20sm837879pgu.31.2021.09.15.14.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 14:31:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/16] tcg/s390x: Implement tcg_out_mov for vector types
Date: Wed, 15 Sep 2021 14:31:05 -0700
Message-Id: <20210915213114.1923776-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915213114.1923776-1-richard.henderson@linaro.org>
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 72 +++++++++++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 4 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index ea04aefe98..76061bfd80 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -265,6 +265,11 @@ typedef enum S390Opcode {
     RX_STC      = 0x42,
     RX_STH      = 0x40,
 
+    VRRa_VLR    = 0xe756,
+
+    VRSb_VLVG   = 0xe722,
+    VRSc_VLGV   = 0xe721,
+
     VRX_VL      = 0xe706,
     VRX_VLLEZ   = 0xe704,
     VRX_VST     = 0xe70e,
@@ -558,6 +563,39 @@ static int RXB(TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
          | ((v4 & 0x10) << (4 + 0));
 }
 
+static void tcg_out_insn_VRRa(TCGContext *s, S390Opcode op,
+                              TCGReg v1, TCGReg v2, int m3)
+{
+    tcg_debug_assert(is_vector_reg(v1));
+    tcg_debug_assert(is_vector_reg(v2));
+    tcg_out16(s, (op & 0xff00) | ((v1 & 0xf) << 4) | (v2 & 0xf));
+    tcg_out32(s, (op & 0x00ff) | RXB(v1, v2, 0, 0) | (m3 << 12));
+}
+
+static void tcg_out_insn_VRSb(TCGContext *s, S390Opcode op, TCGReg v1,
+                              intptr_t d2, TCGReg b2, TCGReg r3, int m4)
+{
+    tcg_debug_assert(is_vector_reg(v1));
+    tcg_debug_assert(d2 >= 0 && d2 <= 0xfff);
+    tcg_debug_assert(is_general_reg(b2));
+    tcg_debug_assert(is_general_reg(r3));
+    tcg_out16(s, (op & 0xff00) | ((v1 & 0xf) << 4) | r3);
+    tcg_out16(s, b2 << 12 | d2);
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, 0, 0) | (m4 << 12));
+}
+
+static void tcg_out_insn_VRSc(TCGContext *s, S390Opcode op, TCGReg r1,
+                              intptr_t d2, TCGReg b2, TCGReg v3, int m4)
+{
+    tcg_debug_assert(is_general_reg(r1));
+    tcg_debug_assert(d2 >= 0 && d2 <= 0xfff);
+    tcg_debug_assert(is_general_reg(b2));
+    tcg_debug_assert(is_vector_reg(v3));
+    tcg_out16(s, (op & 0xff00) | (r1 << 4) | (v3 & 0xf));
+    tcg_out16(s, b2 << 12 | d2);
+    tcg_out16(s, (op & 0x00ff) | RXB(0, 0, v3, 0) | (m4 << 12));
+}
+
 static void tcg_out_insn_VRX(TCGContext *s, S390Opcode op, TCGReg v1,
                              TCGReg b2, TCGReg x2, intptr_t d2, int m3)
 {
@@ -591,12 +629,38 @@ static void tcg_out_sh32(TCGContext* s, S390Opcode op, TCGReg dest,
 
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
 {
-    if (src != dst) {
-        if (type == TCG_TYPE_I32) {
+    if (src == dst) {
+        return true;
+    }
+    switch (type) {
+    case TCG_TYPE_I32:
+        if (likely(is_general_reg(dst) && is_general_reg(src))) {
             tcg_out_insn(s, RR, LR, dst, src);
-        } else {
-            tcg_out_insn(s, RRE, LGR, dst, src);
+            break;
         }
+        /* fallthru */
+
+    case TCG_TYPE_I64:
+        if (likely(is_general_reg(dst))) {
+            if (likely(is_general_reg(src))) {
+                tcg_out_insn(s, RRE, LGR, dst, src);
+            } else {
+                tcg_out_insn(s, VRSc, VLGV, dst, 0, 0, src, 3);
+            }
+            break;
+        } else if (is_general_reg(src)) {
+            tcg_out_insn(s, VRSb, VLVG, dst, 0, 0, src, 3);
+            break;
+        }
+        /* fallthru */
+
+    case TCG_TYPE_V64:
+    case TCG_TYPE_V128:
+        tcg_out_insn(s, VRRa, VLR, dst, src, 0);
+        break;
+
+    default:
+        g_assert_not_reached();
     }
     return true;
 }
-- 
2.25.1


