Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A1E337649
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:58:41 +0100 (CET)
Received: from localhost ([::1]:41786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMls-0002q7-9d
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:58:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUx-0003ti-Qr
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:12 -0500
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:35042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUf-0006ek-De
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:11 -0500
Received: by mail-qk1-x72c.google.com with SMTP id d20so20806716qkc.2
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RltB6tJRO1PShAvoUlO75Uo0j450X071u7i11eDg0EU=;
 b=c85sGVMz3JyN/FaEnc7QIfst3OXfclRQHs9fhY2aL1TX28gRB49bqqhsDWK0sroXA+
 0AMRBHgcPSxA+F3VncuNSutJptkCNR7FKFei5CBLJklH24R0Erj1DrbmFtLBEF1bSXp8
 CrMFHltYl1m/8YmyucTJLgWMgzrU1d+SJUxbTA1L6vlvL8Y1xVKrVUCNNJ2CoVGPAEFg
 B+7K0RWE19j4/tv/kQ3bQZGVU6l54tRezDM1ZslCBwRc1o2e6xUCoG0nAuBOlQKxaGvy
 GIU7QtaaCVTeKyJmJHL++I6NnkAIjJpfSp1r1h2jBHB2o/MAFHk7abf6MH3PJEoVutmF
 CzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RltB6tJRO1PShAvoUlO75Uo0j450X071u7i11eDg0EU=;
 b=P1oBNncut5Cot6lp5FdeRDJXqVipzVvOyFXyv9MbmGpIYK2le0FyPOkwKyLCbSNXax
 xxAyy8XL8mQJ6bxZuqDTm0/JHu58UZj4YDsy0MfU17uYZW6LOStfLGtBpdPPgtCG0s0o
 ph50BHhUmikIHrptoZq/9R5mnfITrcFAFdDbV2aaFytGGrdXf8KUnk3mHA8tpW/JrrrE
 J/k5rRHQ2JmwxWjFg9jA6JjVD701REpcEusEseWM6A762kXhLCek11iOkshIPzoALd/B
 qTVlPhtoUZO8UzV9huSQlqNXrnCuio091uAdrLleH65oTXFXHraej5CfbJcccm41XhE3
 Y/rA==
X-Gm-Message-State: AOAM531Gfhjgx+fkLzF3EVOpjDLYYIi2W8o1RZsNaFmVuMJ9wFyVfXZA
 biXSgKkFnhLBFXq3TjC4beV4B3qDa3xg1WiM
X-Google-Smtp-Source: ABdhPJxgs/Tw/g/GXcsM08R0yOCyL+cD2+LvBSiAy3ITKxW8h4gZNEbbwioq1/TygtJNAFmx2ntVZg==
X-Received: by 2002:a37:78b:: with SMTP id 133mr7873790qkh.109.1615473651236; 
 Thu, 11 Mar 2021 06:40:51 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 37/57] tcg/tci: Split out tcg_out_op_rrrr
Date: Thu, 11 Mar 2021 08:39:38 -0600
Message-Id: <20210311143958.562625-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f7595fbd65..c2bbd85130 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -385,6 +385,20 @@ static void tcg_out_op_rrrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
 }
 
 #if TCG_TARGET_REG_BITS == 32
+static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
+                            TCGReg r0, TCGReg r1, TCGReg r2, TCGReg r3)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out_r(s, r3);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGCond c5)
@@ -632,12 +646,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
     case INDEX_op_mulu2_i32:
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out_r(s, args[3]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrr(s, opc, args[0], args[1], args[2], args[3]);
         break;
 #endif
 
-- 
2.25.1


