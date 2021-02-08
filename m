Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD169312988
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:48:59 +0100 (CET)
Received: from localhost ([::1]:57702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xXm-0002GI-Ox
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8we4-0008T3-0x
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:24 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8we2-0001Q5-B8
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:23 -0500
Received: by mail-pl1-x62f.google.com with SMTP id u11so7010198plg.13
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CLrUDTIhbtGAsWgOYvJT4xjXL39Hm5cBXAIplJGdRpg=;
 b=vlRnMGPJVEmDLno5B6/hvrOGcBHqwJjgdgsd1JtSSC1+s0SeEbO26ZNTitLxyQtCyU
 pcEUEEzlZrJQNIRMksC7/ILCQAr35lOUvmfI8oJUvhRdgPdxc7vYhKArzpT7DP5kExqY
 NnShh2EtEfvSLemCoM61/sUFGFXubwsXx4sEomgLAQozvFwHaxtapX59kTYdF0jDFexZ
 tjMSQF754o4b6OPKSyf3/xeVkfrZkj89y9Fjf+K6kmAbhcfCjKgCx9utuJ9J6OZ6unbd
 fsdfcf2sbX3k3T6SHYoD3Rgy/MoGybaS7YRcrosfMfJo/NFuFAARjstPEAcwVCO/ftdz
 gNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CLrUDTIhbtGAsWgOYvJT4xjXL39Hm5cBXAIplJGdRpg=;
 b=WZTic0tBHlxrJxAgId0b55julq203CPF1R6laosPjI0Ibx32SmYd4vmcwkcIbKzZQp
 0ZGI81D2KWi5PvvXVvnAAA43YLUcJpkEkPhZckNfAkZNY0UDNhsaFxl01sEbf71nO0gZ
 kKST/AfJNiw6FFEeKuUE/Zr0ajskJpgETm/eWqLaSaTFj12KNhmF/ZLab1pwA0xoZIaa
 5g6j3HUbQFRrv+jfUyIEcphB5wXsLOAd9cMnIntl8u8YBTr9VbmTKbOq7IZ7SiBVsiMG
 a/ODV+2lWk0hILVTNLUAK7psJZrFJERoPvmAKgMxe3bzXMHWXVx2MKM72F7m3suCVIy3
 zFCg==
X-Gm-Message-State: AOAM533gR1aZrbZQ4ekIkeGOCO9TpQij3FMu0wb2UjWqCzwJbFp3bDKY
 9xUjiv+OjHeJ5YoP8Jr3mqJ4NexX5bNgnw==
X-Google-Smtp-Source: ABdhPJwdiRjib49t0S2xyLkeyac54AfR+6uaSs/RQp9wrqrp86i803E/Y8TQ6Tb1jDrgbT9vJhqLgw==
X-Received: by 2002:a17:90b:4a02:: with SMTP id
 kk2mr15009184pjb.115.1612752681072; 
 Sun, 07 Feb 2021 18:51:21 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id p12sm10308690pju.35.2021.02.07.18.51.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:51:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/16] tcg/s390x: Implement TCG_TARGET_HAS_cmpsel_vec
Date: Sun,  7 Feb 2021 18:51:01 -0800
Message-Id: <20210208025101.271726-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208025101.271726-1-richard.henderson@linaro.org>
References: <20210208025101.271726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
index 3c86b233b0..1888c7a5b4 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2834,6 +2834,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_xor_vec:
         return 1;
     case INDEX_op_cmp_vec:
+    case INDEX_op_cmpsel_vec:
     case INDEX_op_rotrv_vec:
         return -1;
     case INDEX_op_mul_vec:
@@ -2896,6 +2897,21 @@ static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
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
@@ -2937,7 +2953,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
     va_list va;
-    TCGv_vec v0, v1, v2, t0;
+    TCGv_vec v0, v1, v2, v3, v4, t0;
 
     va_start(va, a0);
     v0 = temp_tcgv_vec(arg_temp(a0));
@@ -2949,6 +2965,12 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
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


