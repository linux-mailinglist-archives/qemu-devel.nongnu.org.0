Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA292F5735
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 03:26:14 +0100 (CET)
Received: from localhost ([::1]:58042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzsKz-00054Q-UW
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 21:26:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCh-0003rp-Mo
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:39 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:36920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCg-0003YA-2o
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:39 -0500
Received: by mail-pg1-x529.google.com with SMTP id z21so2747968pgj.4
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 18:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iIaMM78IeHTe5CD2a93HOKAFcWJMpXbVz88KGEPcLL4=;
 b=k3u5wUwCwjOPW7JGYT/DFyEanMUvjUKXyKbbIp74A+rMV3WP1d7gKHWPGiBOBIPFEU
 2Ji5c9EddqF5CPSkC8+6YxmsEO/vNrVgyqHCweVoxcy6JFzwlF0FoCvdAywVtJO1Haxr
 7I9HvvdIW0LPovd/obTQTEE6aWh19BTsv5v8OsiDtFEIUuLgS5Bpyta74Lm1u8ZAUNjv
 0b3tYmf0+x/J3ZxHhTNgeRuy9bonoW1FPJqeApyMLcCb+ZBINPIUmvpyHCsfNyJA0r2K
 mydg/IkbOYAyxoHYKKWXBiWrCC84lVn81foA31ZoEtGRuQGWlrRiZkGvGV1y1jQrkiVa
 7rPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iIaMM78IeHTe5CD2a93HOKAFcWJMpXbVz88KGEPcLL4=;
 b=VhbyEunf8gniT1/JbO5z5mU04gBatSqzS+gbuLwMjswQObW8We+DvW+lnjbDeHYdkA
 zRAYHIjxYY2P7oAI510tQaDr7ax+3OPO7Ltd1x3vJ0/uTQmceGdWF6fJX4F3S2rnm6x7
 VW2Tyzat7pffhMCBQOEDVej9KYRe7AJxjx10DR1mITPV5NIMUFOCmPo5mxr3GD2SrFYO
 c8LhB2AdU0uesL6WqFZpWPkgvZrKqc23bNol5EPHvN7SBdzu+U9aVb3IhrIgV7lN0rkg
 6n6r/oIdO5LfTzWvB4DzsJ/Pm5DlYj4jbqwslQ+buJVR/WUb9mbrRNQpoXdePNRcqwnK
 2SqQ==
X-Gm-Message-State: AOAM531Et2AqA9J+2sEKsCQLZenEOeVxxM6ZVi3NQl/tN01qXCwnROtu
 YUSOYerA0X9CojJuydmaowT92NvCkI32GA==
X-Google-Smtp-Source: ABdhPJwHDgMRuvlKxxdj0qY8eygRt1fNtecC10vEUA9a85mi/wGglvAUb2e6dkue23LCZkA8DfyX8Q==
X-Received: by 2002:a62:5a86:0:b029:1ae:6b45:b6a9 with SMTP id
 o128-20020a625a860000b02901ae6b45b6a9mr5041478pfb.7.1610590656490; 
 Wed, 13 Jan 2021 18:17:36 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i7sm3771687pfc.50.2021.01.13.18.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:17:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/24] tcg/aarch64: Use tcg_constant_vec with tcg vec expanders
Date: Wed, 13 Jan 2021 16:16:53 -1000
Message-Id: <20210114021654.647242-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114021654.647242-1-richard.henderson@linaro.org>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Improve rotrv_vec to reduce "t1 = -v2, t2 = t1 + c" to
"t1 = -v2, t2 = c - v2".  This avoids a serial dependency
between t1 and t2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index e370b7e61c..23954ec7cf 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2516,7 +2516,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
     va_list va;
-    TCGv_vec v0, v1, v2, t1, t2;
+    TCGv_vec v0, v1, v2, t1, t2, c1;
     TCGArg a2;
 
     va_start(va, a0);
@@ -2548,8 +2548,8 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
 
     case INDEX_op_rotlv_vec:
         t1 = tcg_temp_new_vec(type);
-        tcg_gen_dupi_vec(vece, t1, 8 << vece);
-        tcg_gen_sub_vec(vece, t1, v2, t1);
+        c1 = tcg_constant_vec(type, vece, 8 << vece);
+        tcg_gen_sub_vec(vece, t1, v2, c1);
         /* Right shifts are negative left shifts for AArch64.  */
         vec_gen_3(INDEX_op_shlv_vec, type, vece, tcgv_vec_arg(t1),
                   tcgv_vec_arg(v1), tcgv_vec_arg(t1));
@@ -2562,9 +2562,9 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
     case INDEX_op_rotrv_vec:
         t1 = tcg_temp_new_vec(type);
         t2 = tcg_temp_new_vec(type);
+        c1 = tcg_constant_vec(type, vece, 8 << vece);
         tcg_gen_neg_vec(vece, t1, v2);
-        tcg_gen_dupi_vec(vece, t2, 8 << vece);
-        tcg_gen_add_vec(vece, t2, t1, t2);
+        tcg_gen_sub_vec(vece, t2, c1, v2);
         /* Right shifts are negative left shifts for AArch64.  */
         vec_gen_3(INDEX_op_shlv_vec, type, vece, tcgv_vec_arg(t1),
                   tcgv_vec_arg(v1), tcgv_vec_arg(t1));
-- 
2.25.1


