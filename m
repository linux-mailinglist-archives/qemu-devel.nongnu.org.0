Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDAA2E2920
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 23:59:57 +0100 (CET)
Received: from localhost ([::1]:35976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksZaO-0000Ou-W4
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 17:59:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMZ-00024f-VG
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:40 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:41810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMU-0008M9-Tl
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:38 -0500
Received: by mail-pg1-x533.google.com with SMTP id i7so2265221pgc.8
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 14:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DlWfAj1V1HobWppM64IvoZnE5XLLBPkiFuCARKLkZeU=;
 b=rBL+J3LfRAKvMuW8p16dvFjIAKrRwx/CzBqTuHMhX+E+Q+rhs109W/iAjyZ8OzwOVy
 y74PAj1NYMZ3fuPNtu6r5fSooVnEfxM9ejpB38r/PZDkhPzioP9EGYHk1Tbj6ESGIYcc
 BRsj9pBt/zt4GEkH7sXzfzMti/sfdqq1hmqFyDK4xGd1iadKqBPHNekZcTPBUccr7Im0
 Sf+/+UAM7uexy7I12XW/8nkA2tkA85AVQOeOeMacKTvb1MhSLlAyBBTxBz6SrRSE9X63
 kSo7nsIBfw9l4j1tE9pFUf4d/2t13F+JKyhMtm1g0YPGGP7XUbJF/zM4qbQDC6A6sPh7
 z+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DlWfAj1V1HobWppM64IvoZnE5XLLBPkiFuCARKLkZeU=;
 b=g3kb3D3TA7e97W5+CU2z3L2IIFSwwj8nKWujt2DjPQ12vaK9lL5uQOEahjFj+PwSE5
 fuSdyfiRQxeVTrRRAX1EW1qJwD/M9gsMA31+aaR6cIBPlsk73VVTpqD/Dt0c3oKnhxtj
 WkrdDv4SnKYuuNjAT8mf48MXdu8P08JQJWmgWb28E5ZhYs0vWr+ZWmhBZ9AYYhQ5jbFS
 nGtsKRi9ETYVRhcJViRRAfmg0WI8EL66MOIjfncAZ4Yw7nFJZ5yPWXFX3wA4XaUu+RIN
 FIuju8jUrixcreRozBwc3LY0ZivyGR8p5zidaiENEyMCQk8cZu5lyl+guQ4+/35MON3e
 Yxbw==
X-Gm-Message-State: AOAM532ByU9kRRHO2BeYvNXrxun7yYkgOTj4kh2NdaqPpIlCs0OXjgjv
 SN6Vl9tHcP+1QN/3A0NRTsO/98VnorqYDA==
X-Google-Smtp-Source: ABdhPJz2S+j8KYoudr4nVSlJxN5G5MB30Q1SvdRdziMrYe2lpK4Cm/EeqsZZbrVYCwTWjWYH2QP1RA==
X-Received: by 2002:a62:2cc3:0:b029:197:dda8:476a with SMTP id
 s186-20020a622cc30000b0290197dda8476amr7742078pfs.37.1608849932058; 
 Thu, 24 Dec 2020 14:45:32 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id w11sm11844123pge.28.2020.12.24.14.45.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 14:45:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/15] tcg/arm: Implement TCG_TARGET_HAS_rotv_vec
Date: Thu, 24 Dec 2020 14:45:14 -0800
Message-Id: <20201224224514.626561-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224224514.626561-1-richard.henderson@linaro.org>
References: <20201224224514.626561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Implement via expansion, so don't actually set TCG_TARGET_HAS_rotv_vec.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 5cae6b2749..f107478877 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2950,6 +2950,8 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
     case INDEX_op_rotli_vec:
+    case INDEX_op_rotlv_vec:
+    case INDEX_op_rotrv_vec:
         return -1;
     default:
         return 0;
@@ -2960,7 +2962,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
     va_list va;
-    TCGv_vec v0, v1, v2, t1;
+    TCGv_vec v0, v1, v2, t1, t2, t3;
     TCGArg a2;
 
     va_start(va, a0);
@@ -3003,6 +3005,35 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         tcg_temp_free_vec(t1);
         break;
 
+    case INDEX_op_rotlv_vec:
+        t1 = tcg_temp_new_vec(type);
+        t2 = tcg_constant_vec(type, vece, 8 << vece);
+        tcg_gen_sub_vec(vece, t1, v2, t2);
+        /* Right shifts are negative left shifts for AArch64.  */
+        vec_gen_3(INDEX_op_arm_ushl_vec, type, vece, tcgv_vec_arg(t1),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(t1));
+        vec_gen_3(INDEX_op_arm_ushl_vec, type, vece, tcgv_vec_arg(v0),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(v2));
+        tcg_gen_or_vec(vece, v0, v0, t1);
+        tcg_temp_free_vec(t1);
+        break;
+
+    case INDEX_op_rotrv_vec:
+        t1 = tcg_temp_new_vec(type);
+        t2 = tcg_temp_new_vec(type);
+        t3 = tcg_constant_vec(type, vece, 8 << vece);
+        tcg_gen_neg_vec(vece, t1, v2);
+        tcg_gen_sub_vec(vece, t2, t3, v2);
+        /* Right shifts are negative left shifts for AArch64.  */
+        vec_gen_3(INDEX_op_arm_ushl_vec, type, vece, tcgv_vec_arg(t1),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(t1));
+        vec_gen_3(INDEX_op_arm_ushl_vec, type, vece, tcgv_vec_arg(t2),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(t2));
+        tcg_gen_or_vec(vece, v0, t1, t2);
+        tcg_temp_free_vec(t1);
+        tcg_temp_free_vec(t2);
+        break;
+
     default:
         g_assert_not_reached();
     }
-- 
2.25.1


