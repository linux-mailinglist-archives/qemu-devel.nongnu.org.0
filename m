Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EF2424176
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:39:05 +0200 (CEST)
Received: from localhost ([::1]:42000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY90a-0007xv-53
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8j8-0002fk-Ub
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:21:04 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8ip-0007sz-3F
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:21:02 -0400
Received: by mail-pf1-x429.google.com with SMTP id m26so2664822pff.3
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KmlN7FSjNCfwx0yApjt/9T2RDpf6AV9m+Nkn8IGsnKE=;
 b=fHMYZbWEQpV1eM6ajKIbOHEaRmg4jfsZ7hLu6BDGC8cvgiI2VPWbPhWosxI37TQrGw
 F0290qa77W9koClJQPCv0lELYFUbViCZUHIUsVWT4653zxlBR9qsdMmQ8DNTedABnDSo
 Ffnd4F6ApnyJUfMjuLH6A1iH9hW8L8kale+T3KvfdIiocvusIpZvfShXPovicI7ooPFu
 55EjlhZhe1AOPlRrzvHi3jICKo/hbvi0fqLsr3Gi7NAUtJ+JFduACS3GBk4Z2APNFmkM
 3okO9GG6e1chK6sqBJTxpqZZir+hp5FzuubBxWsfhSn8PG5LitQ8VORhBMMNBNxk+Ye+
 0EWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KmlN7FSjNCfwx0yApjt/9T2RDpf6AV9m+Nkn8IGsnKE=;
 b=Ap71OdTpAboFNbX+N8rtJnchyrqxTtOP8K4Xeu6L2R9f4Sm5cZyNOYoTyit/dDw4f5
 MXTaO9Z0Nw2fEztr6md0TbgJqp2uyXjBxTvt8MWAKIoC3kmw1WB6zaLFWIrp4eVnkBqT
 4BBlGob7zPy/VHJKYFdhdJ7eSiubN6dTkvnQkEM8ecHun3apaoIK1EckgyLU0VwWvmHH
 zVvnyDH9quqsPb+Eglzw/H1IDGW1eTY60LMTUw3pHQy5NI6/a5pC1iAGKY/AqprmEMdw
 p+h4Oua9bwHgdCszsw0Ual7BsWOagJn3Rgswh4n08ahJBhL0Mx761HvVeWuZyquT1x6y
 HiNQ==
X-Gm-Message-State: AOAM531PfHR3mCUWu0XI4PrGyXJelxqxCd09iApQPhJjjQwOXQwwFZ8j
 bDcbNcnLtANsohjXpwhbktPbSe3Eka1Uzw==
X-Google-Smtp-Source: ABdhPJyewIN5mfpvqnX4mjNAJp3rM3mVMBd6EbB0Ti6xENmEO/akTv5GXJvRygmI1rLjIDpDpXXLlA==
X-Received: by 2002:a62:8f8a:0:b0:44c:6e3c:4807 with SMTP id
 n132-20020a628f8a000000b0044c6e3c4807mr14220551pfd.68.1633533639931; 
 Wed, 06 Oct 2021 08:20:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/28] tcg/s390x: Implement TCG_TARGET_HAS_cmpsel_vec
Date: Wed,  6 Oct 2021 08:20:14 -0700
Message-Id: <20211006152014.741026-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
index ae132e1b75..8938c446c8 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2869,6 +2869,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_xor_vec:
         return 1;
     case INDEX_op_cmp_vec:
+    case INDEX_op_cmpsel_vec:
     case INDEX_op_rotrv_vec:
         return -1;
     case INDEX_op_mul_vec:
@@ -2931,6 +2932,21 @@ static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
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
@@ -2972,7 +2988,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
     va_list va;
-    TCGv_vec v0, v1, v2, t0;
+    TCGv_vec v0, v1, v2, v3, v4, t0;
 
     va_start(va, a0);
     v0 = temp_tcgv_vec(arg_temp(a0));
@@ -2984,6 +3000,12 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
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


