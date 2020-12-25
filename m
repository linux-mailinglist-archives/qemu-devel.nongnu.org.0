Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B272E2C61
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 21:35:29 +0100 (CET)
Received: from localhost ([::1]:34394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksto8-0001FL-KQ
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 15:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZU-0003MF-8a
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:20 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZR-0005HQ-H6
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:19 -0500
Received: by mail-pl1-x62c.google.com with SMTP id v3so2698055plz.13
 for <qemu-devel@nongnu.org>; Fri, 25 Dec 2020 12:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=abCFmcdljX+t9z34gD3bXt4KVs6SigpcHBBDndfp4Sc=;
 b=rnnJfibQk+eqdFAThgEifjI2k3/vpK89dWT3/b4dtyawN79+oC8dTNNL8kLqW+NohG
 VR9fFohKILYKdTfRkuQZKnfWBKA00raAwQOHLrDJ+vhiHHF0b6kZJ/63oLoeDp2OCjHA
 MNVQ79LJeKz6ZZyYhggHA3HRf/JHAnz25pAR21hEeag9kuSkWmXtX8hvBFA+PJNZXrBF
 mgZ5qAEOmBCV4+x/vofcPaihQxtw4WwbbUPNCmz8rgJhI/iHkwR6za9b5JRXCGjvYM1i
 TjcBmQgHTRAOBrWg3+bAV1ygvDTQPcjndAS0+X59eaUvIAGY81qFZk9XnDKOi7GL09aA
 kbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=abCFmcdljX+t9z34gD3bXt4KVs6SigpcHBBDndfp4Sc=;
 b=uhFWQB+xvCr/laZOXI6NEATSNY2BB0g4lRGGaVggN0Asgi55Li47qsv56jJIoavAxh
 ZTU5dS+hlDuh1l6EcOKSMfXVhc7nRUxJy965FLMmAYD/pusw/489x1OzDWtiINaFiNtx
 tOO9vMuubqE6DG9xz9hurES8MVCPUCcIgK1FKHybItVrfgIGsCl5rgGZbwSqNPdhwuxS
 GdGYgymfV10Yz04N888JLgFbkmryZJIRG1kttaYkSa6k/YL2DMr0q089rTonGqHxzKMQ
 LLK5MH/UW7QQCQ1f1UyVlUXwQQRixt7Buk3jo6WsNeSNt5X57BTqKwGBX8Lnz/S+Bg4O
 8E8g==
X-Gm-Message-State: AOAM531i2on/AqYdz+OJeXDj+tSMhskA0eFADTDpCAfAR0VuU4EOWgN4
 m3rquDFyx02KbHMdQYyuOaf/bTOBTcQycg==
X-Google-Smtp-Source: ABdhPJxzWYBmfmN1C3xeNGP/XItUBCLy5b2PS4PdfzErEsfr6HOtfpwZK2JnQxY5SHjxaBDfBhl7Ww==
X-Received: by 2002:a17:90a:a10e:: with SMTP id
 s14mr9615418pjp.133.1608927615924; 
 Fri, 25 Dec 2020 12:20:15 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id l8sm5816497pjt.32.2020.12.25.12.20.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 12:20:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/16] tcg/s390x: Implement TCG_TARGET_HAS_cmpsel_vec
Date: Fri, 25 Dec 2020 12:19:56 -0800
Message-Id: <20201225201956.692861-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201225201956.692861-1-richard.henderson@linaro.org>
References: <20201225201956.692861-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

This is via expansion; don't actually set TCG_TARGET_HAS_cmpsel_vec.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 251287dd29..a345775e60 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2830,6 +2830,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_xor_vec:
         return 1;
     case INDEX_op_cmp_vec:
+    case INDEX_op_cmpsel_vec:
     case INDEX_op_rotrv_vec:
         return -1;
     case INDEX_op_mul_vec:
@@ -2892,6 +2893,21 @@ static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
     }
 }
 
+static void expand_vec_cmpsel(TCGType type, unsigned vece, TCGv_vec v0,
+                              TCGv_vec c1, TCGv_vec c2,
+                              TCGv_vec v3, TCGv_vec v4, TCGCond cond)
+{
+    TCGv_vec t = tcg_temp_new_vec(type);
+
+    if (expand_vec_cmp_noinv(type, vece, t, c1, c2, cond)) {
+        /* Invert the sense of the compare by swapping arguments.  */
+        tcg_gen_bitsel_vec(vece, v0, t, v4, v3);
+    } else {
+        tcg_gen_bitsel_vec(vece, v0, t, v3, v4);
+    }
+    tcg_temp_free_vec(t);
+}
+
 static void expand_vec_sat(TCGType type, unsigned vece, TCGv_vec v0,
                            TCGv_vec v1, TCGv_vec v2, TCGOpcode add_sub_opc)
 {
@@ -2933,7 +2949,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
     va_list va;
-    TCGv_vec v0, v1, v2, t0;
+    TCGv_vec v0, v1, v2, v3, v4, t0;
 
     va_start(va, a0);
     v0 = temp_tcgv_vec(arg_temp(a0));
@@ -2945,6 +2961,12 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         expand_vec_cmp(type, vece, v0, v1, v2, va_arg(va, TCGArg));
         break;
 
+    case INDEX_op_cmpsel_vec:
+        v3 = temp_tcgv_vec(arg_temp(va_arg(va, TCGArg)));
+        v4 = temp_tcgv_vec(arg_temp(va_arg(va, TCGArg)));
+        expand_vec_cmpsel(type, vece, v0, v1, v2, v3, v4, va_arg(va, TCGArg));
+        break;
+
     case INDEX_op_rotrv_vec:
         t0 = tcg_temp_new_vec(type);
         tcg_gen_neg_vec(vece, t0, v2);
-- 
2.25.1


