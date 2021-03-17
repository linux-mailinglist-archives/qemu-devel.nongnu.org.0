Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562D433F536
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:14:13 +0100 (CET)
Received: from localhost ([::1]:47532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYoF-00074E-38
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCn-0005Jp-T5
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:29 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:37854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCc-0007I6-St
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:29 -0400
Received: by mail-oi1-x234.google.com with SMTP id u198so37226533oia.4
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N/QfbjLf5co+LZFn6W3l+/yR9yA2JEjJarf6EF+7jdc=;
 b=IjvE59QG2SCq+q0G0gHV+f2Twh3xkUOfh6fVurFjOyd0MkVEXDVbuuwkALQooMM07J
 qPM9tgz2Ofj7LQ3wobbDAXFWfRTsY7IfVyX2SCSwMLtXwb6C4wpNMc8oYMqsnu/IIjOJ
 Ec19C4la0DCVM2EtRDXZWGh4lyfwNM7nfO0W/mSk7KJCGrSDDCsAH4lliNf4IRhIC4qB
 hY3qicSpUMW9k2c0S9XXvCf26y9YlxrKQY9Ref2QHG6zBVLrqxUqm/M+1/KcH5+iN8QN
 GVXUQF+KoLy1TVGaRHk5iok8+xGerMUc9UPC9QM+1nsCBehjBXz1VaW0hsGhwRcNjM3+
 aUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N/QfbjLf5co+LZFn6W3l+/yR9yA2JEjJarf6EF+7jdc=;
 b=ZwEP+fLlFHmZpJAAK0Adp3xw8n4m0E5NuULEgSPWfjbKWtmnQUKF8ore4/nRZHMevx
 aDp/2ufgXIH5dApCQygXHm5WgTXSxdTb5Yi4XolSm8rlNaF9K2K5P8s+Pq6qmNgw2/45
 MB0AVWG0RRODnFz29O8CBUg9es8SMTh50gHpnFIUrrhL89x7ulyuRg8p32+R5Pw5pFOT
 j33zmTiyAhpUmZTy/yzz7bEj7INY18AUWR0Xd7Za/rchetinKcb+ehKg6t+EVBuXNBlO
 Da9TE0FjrgTb+gD8KgWM9zYzaKowMuWjvGv7mIy2SRulXJGY+nzj9oy5AKKGdu/niN2i
 wC5A==
X-Gm-Message-State: AOAM531oO6XajBs1tTJveOFjrkvlYBqcpHNZ5VFeQhyZ/GoVg/muk+Re
 WLe8AJiwfj2AYRV0Me2XIaY7BP/p8ycdTCK0
X-Google-Smtp-Source: ABdhPJxIkDRXXrhmYhM6DBdqIA39m4qss/lc/N3BeAa3kUuEcTn3F4gDUzuEsJeBxIHEhECT0GweXQ==
X-Received: by 2002:aca:d442:: with SMTP id l63mr3236343oig.49.1615995317407; 
 Wed, 17 Mar 2021 08:35:17 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/38] tcg/tci: Split out tcg_out_op_rrcl
Date: Wed, 17 Mar 2021 09:34:37 -0600
Message-Id: <20210317153444.310566-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index b153334dfb..d0036c9519 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -355,6 +355,20 @@ static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrcl(TCGContext *s, TCGOpcode op,
+                            TCGReg r0, TCGReg r1, TCGCond c2, TCGLabel *l3)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out8(s, c2);
+    tci_out_label(s, l3);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
                             TCGReg r0, TCGReg r1, TCGReg r2, TCGCond c3)
 {
@@ -565,12 +579,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     CASE_32_64(brcond)
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out8(s, args[2]);           /* condition */
-        tci_out_label(s, arg_label(args[3]));
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrcl(s, opc, args[0], args[1], args[2], arg_label(args[3]));
         break;
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
-- 
2.25.1


