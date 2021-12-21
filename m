Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32E947C4B1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:07:47 +0100 (CET)
Received: from localhost ([::1]:59004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzic7-0000IV-1Y
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:07:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJE-0001DA-87
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:16 -0500
Received: from [2607:f8b0:4864:20::42c] (port=43923
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIx-0007eF-LO
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:15 -0500
Received: by mail-pf1-x42c.google.com with SMTP id 196so8739821pfw.10
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FxXmSlGOk/9Dm6KmrtZ80VxSHDJ4OcOjOwKCOUUserI=;
 b=kNS5MkhXoZslnCL0zt/K1WfqMFWVQ/PyWrMwVM6Dxp+CY/Gt9o3zT8Gyp/8mwjgVnN
 SeL3MXEX6IvKw7fWw38Zr0V2JSyXdYFCyQ4WUpeHk+meTg4QpeVMCIew0KZcmnqKR+PP
 A5VYaJYoFw7lSWsHS0hIiwLhJZJUz8etqBr5oa46OYmPlO20m+rhW8koRn/jB4yTNmre
 eG6hJfoyTxyBaAO32p1/fNZ7SxF25chXH0gr08Y8GgRkFNSesehGCagwVu4UC9tEqUkK
 oPvtTVHcq7sPNrHsgrIrYpl9LOpUB3qsU1lAB5DHAAHi3Ml0MvNRTqtfwzHftjbytjf7
 GWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FxXmSlGOk/9Dm6KmrtZ80VxSHDJ4OcOjOwKCOUUserI=;
 b=VuKJZt3kF4HF4TQ+REDOViae+pHAMIxRwN88yE4P/1xXTqGdZDlqwrYfvnI6dzrW58
 YENSbZex26A/K50Yy7A/YSA0+bXutmflneWSE644qKH8jtaf8ithqDb1oc0c9FwfQzuk
 5wYNSFi1sLcvgKaNKPDts1g6kSBRjJPS69p8//ujOxdrb9+Op4RMD9VeVF4I8qz+u812
 eyZUHnv3wH8WFIJvwpVAZa3PO0AuBOu31lCkJUsiE128XWaapYYcm3rfAN/UWDx61Xyk
 1Afbk7KO7XBT4GhPLdxB5nv1StRqNa2zRoFvYaGPaFb7IUTaCN2CK+po3L0pPctKDIfS
 xJ5Q==
X-Gm-Message-State: AOAM530LMbrmmLrfDH82BKzNhSNMYIRwmpAHPe6GQLSJe6WLh7a/sMgx
 31I4+69F2R4ZRCaPWOdKbwldsVEmU+4vEQ==
X-Google-Smtp-Source: ABdhPJwCyg4wzNEmwLoyR6KGbAQr4wn9fjlNCZVbdF25tgtNomj57mUaKyVHH+1hHjLzSCeG7YW7qg==
X-Received: by 2002:a63:255:: with SMTP id 82mr3704342pgc.167.1640105278349;
 Tue, 21 Dec 2021 08:47:58 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/31] tcg/loongarch64: Implement tcg_out_call
Date: Tue, 21 Dec 2021 08:47:27 -0800
Message-Id: <20211221164737.1076007-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211221054105.178795-22-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 23c151f473..151d3308ea 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -532,6 +532,39 @@ static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
     tcg_out32(s, encode_djsk16_insn(op, arg1, arg2, 0));
 }
 
+static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
+{
+    TCGReg link = tail ? TCG_REG_ZERO : TCG_REG_RA;
+    ptrdiff_t offset = tcg_pcrel_diff(s, arg);
+
+    tcg_debug_assert((offset & 3) == 0);
+    if (offset == sextreg(offset, 0, 28)) {
+        /* short jump: +/- 256MiB */
+        if (tail) {
+            tcg_out_opc_b(s, offset >> 2);
+        } else {
+            tcg_out_opc_bl(s, offset >> 2);
+        }
+    } else if (offset == sextreg(offset, 0, 38)) {
+        /* long jump: +/- 256GiB */
+        tcg_target_long lo = sextreg(offset, 0, 18);
+        tcg_target_long hi = offset - lo;
+        tcg_out_opc_pcaddu18i(s, TCG_REG_TMP0, hi >> 18);
+        tcg_out_opc_jirl(s, link, TCG_REG_TMP0, lo >> 2);
+    } else {
+        /* far jump: 64-bit */
+        tcg_target_long lo = sextreg((tcg_target_long)arg, 0, 18);
+        tcg_target_long hi = (tcg_target_long)arg - lo;
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP0, hi);
+        tcg_out_opc_jirl(s, link, TCG_REG_TMP0, lo >> 2);
+    }
+}
+
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
+{
+    tcg_out_call_int(s, arg, false);
+}
+
 /*
  * Entry-points
  */
@@ -882,6 +915,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
+    case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         g_assert_not_reached();
     }
-- 
2.25.1


