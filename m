Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20E6479C67
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:48:25 +0100 (CET)
Received: from localhost ([::1]:52710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfgv-0000Lf-3L
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:48:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbg-0000cy-Nm
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:00 -0500
Received: from [2607:f8b0:4864:20::62b] (port=43874
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbf-0003TS-7q
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:00 -0500
Received: by mail-pl1-x62b.google.com with SMTP id m24so4751192pls.10
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HfHYaZNB0V22mnQelQb5DJf7nmoyesrxg45mPLAArN4=;
 b=krJFl/zfnZsaBG1nwGU6OXYzWI9rbCBAh8TznBwNMKjIu/fgilswRX/9uEqRXKcqy6
 WY/Y3exWNS16+OX+/7qoKnqpetimS9TtQd6nTCWmeZI8bwnnBZIStBvpAe1XZpqnBLQV
 cuaZc9ZCwkiearS6NzVnLUFzD9sDlbpo5JWSp8/qJsngnC7G8UELfZAQEipbW8hF75L/
 fQl06HcZQLwVsKXXsb2OOgntTqK7xOL813rOU3hHFlkrE3plN60yULyAszU09Lu81N+u
 VH2SSts/Lxm37o/hrCrGSe82qszSv33yP0LeqdelbT0GXg7CWHweQUdqUP1YZPtJBMLc
 BdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HfHYaZNB0V22mnQelQb5DJf7nmoyesrxg45mPLAArN4=;
 b=6aPJ6HXfPrJ5kS3Uu9O9oGXl8dyrWSUwQHtpwqZemen/QEYOnBmik3vcJsXr+UkWUE
 ohGXC+djlHANEngo73T/xvioHyUwcFkUsBeHbNfADYveHRKPaqwE9ikFxvvqshcXGYum
 eotf4n3vn/fwiipv69DW2QQIuq60jgQiINHFlWiSoYQkHNqI2Ir25DbMx7mxTKEgZtTo
 VI5uaX4RRb46S2Zgy53AXLxTmEQtOsk6/pGEMITIKLFNhLWhUlOHsHRKnfa500oMxk+f
 221m29f6+xZSSeXtU4Y3MC63hzoM697qbgnJnp1Y5Mu9qZRlN1bHdMgYlER5rJkVBXwK
 Pkuw==
X-Gm-Message-State: AOAM530SCWDIIFmGqNRTxtz7tH/5qXCmupHdwOm5nHOhgqnLEdtLxD6t
 lSzf6ljsQjErhHslAGBMOcp/41PTMmUrKg==
X-Google-Smtp-Source: ABdhPJwZCLlGHOUhld7u79g+yFFz/CG5nKOnx9Q0KggyHz5K9ffYgUC9MVmHKgOMqhOMF9TxUDc20A==
X-Received: by 2002:a17:90b:2252:: with SMTP id
 hk18mr10858081pjb.218.1639856577970; 
 Sat, 18 Dec 2021 11:42:57 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.42.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:42:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/20] tcg/i386: Implement avx512 immediate sari shift
Date: Sat, 18 Dec 2021 11:42:40 -0800
Message-Id: <20211218194250.247633-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AVX512 has VPSRAQ with immediate operand, in the same form as
with AVX, but requires EVEX encoding and W1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 69481c188c..c4e6f2e5ea 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2893,17 +2893,21 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_shli_vec:
+        insn = shift_imm_insn[vece];
         sub = 6;
         goto gen_shift;
     case INDEX_op_shri_vec:
+        insn = shift_imm_insn[vece];
         sub = 2;
         goto gen_shift;
     case INDEX_op_sari_vec:
-        tcg_debug_assert(vece != MO_64);
+        insn = shift_imm_insn[vece];
+        if (vece == MO_64) {
+            insn |= P_VEXW | P_EVEX;
+        }
         sub = 4;
     gen_shift:
         tcg_debug_assert(vece != MO_8);
-        insn = shift_imm_insn[vece];
         if (type == TCG_TYPE_V256) {
             insn |= P_VEXL;
         }
@@ -3223,16 +3227,23 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return vece == MO_8 ? -1 : 1;
 
     case INDEX_op_sari_vec:
-        /* We must expand the operation for MO_8.  */
-        if (vece == MO_8) {
+        switch (vece) {
+        case MO_8:
             return -1;
-        }
-        /* We can emulate this for MO_64, but it does not pay off
-           unless we're producing at least 4 values.  */
-        if (vece == MO_64) {
+        case MO_16:
+        case MO_32:
+            return 1;
+        case MO_64:
+            if (have_avx512vl) {
+                return 1;
+            }
+            /*
+             * We can emulate this for MO_64, but it does not pay off
+             * unless we're producing at least 4 values.
+             */
             return type >= TCG_TYPE_V256 ? -1 : 0;
         }
-        return 1;
+        return 0;
 
     case INDEX_op_shls_vec:
     case INDEX_op_shrs_vec:
-- 
2.25.1


