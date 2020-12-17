Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637F82DD3FC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:20:33 +0100 (CET)
Received: from localhost ([::1]:51154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpv4y-0004hS-BU
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:20:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpue9-0003kM-HM
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:49 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:42570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpue4-00050p-Hz
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:49 -0500
Received: by mail-oi1-x22d.google.com with SMTP id l200so32406243oig.9
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lzQwpKw8YyVUpw0ONL4kM5TrE9yjiczje0Eh4uLUkAs=;
 b=ocVaL31oo6XP2qqR/muUXO6ijrVyl8NfnSc0zVqpg9CcjGPJhE5937YsP7jwOGiGT2
 HAn6FCqrVm+BP6R1j2IeIjLz0T5J67d3ql2o+syD3LQRD6Sxf6/BNkZAH4C+2VTikbnn
 a+Srbsb76hPlEByx4dgFLmnT4qp33xYb90eRizL9rq7D+ccP4TbmY6NslWwwUSiQTXr7
 ySAKCxVkCw5B5I4M8BQiD9UgdhasmyTCY7GhYM9jOu+vF2IITRugV1E6InxWp+c1zUvg
 7NFJA5ZccMWdha40o9oyX7AVJdfQcHkleOBjb42eqRPiOzPSC4HXo5gOFTp2EBuF2Imj
 o/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lzQwpKw8YyVUpw0ONL4kM5TrE9yjiczje0Eh4uLUkAs=;
 b=dLy52LbseEhlVQmcnfAv1pHC5SjNsuumuwcIx3qSwl4y4opIHjvXynbD4EDcT2zfdE
 zqw+YSwtBD7oGy0j4MuIqiMbwBeOqUxtPsqfJngtjnq2y9ZNpnBt3kSXp9Ys9tkiOVJB
 Duz0JoZd3EbZTq0o7VDF9pOGyJf/iKOsE9IleeRX8H5v7O+x9M3TECTjpx1bF093uacA
 b+gtnvn0CvlGQTQXoAVp8aB7nwENJd4WUim9gayrQHvM3ITYGeSojKIrL8lJtXfnWFEw
 oe6iyb1Ph8uUrq8BFLXQ1SvUFTeCtUNuIbF7uQsoV7W06Ibpwtd/Qk4iObbN9K+NQiuI
 CTSw==
X-Gm-Message-State: AOAM530wPFrXf8RBfrycy0WP3EBgCoDndimv7gV/3aadFJlBXMomVsh0
 lubV1u8eSY0PxBl/+ElqDGbFTKXIQRNPCEJz
X-Google-Smtp-Source: ABdhPJzEHdI6sFuypXoUq/U6xkxeTCfJXWoj+PF/VIkCiDmgVLiS0aTvlpw2pwAIl5A0rGxdP8cGIg==
X-Received: by 2002:a05:6808:a90:: with SMTP id
 q16mr4992812oij.107.1608216763239; 
 Thu, 17 Dec 2020 06:52:43 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 23/23] tcg/aarch64: Use tcg_constant_vec with tcg vec
 expanders
Date: Thu, 17 Dec 2020 08:52:15 -0600
Message-Id: <20201217145215.534637-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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

Improve rotrv_vec to reduce "t1 = -v2, t2 = t1 + c" to
"t1 = -v, t2 = c - v2".  This avoids a serial dependency
between t1 and t2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index a6c2d54c4d..c78e809de8 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2511,7 +2511,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
     va_list va;
-    TCGv_vec v0, v1, v2, t1, t2;
+    TCGv_vec v0, v1, v2, t1, t2, c1;
     TCGArg a2;
 
     va_start(va, a0);
@@ -2543,8 +2543,8 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
 
     case INDEX_op_rotlv_vec:
         t1 = tcg_temp_new_vec(type);
-        tcg_gen_dupi_vec(vece, t1, 8 << vece);
-        tcg_gen_sub_vec(vece, t1, v2, t1);
+        c1 = tcg_constant_vec(type, vece, 8 << vece);
+        tcg_gen_sub_vec(vece, t1, v2, c1);
         /* Right shifts are negative left shifts for AArch64.  */
         vec_gen_3(INDEX_op_shlv_vec, type, vece, tcgv_vec_arg(t1),
                   tcgv_vec_arg(v1), tcgv_vec_arg(t1));
@@ -2557,9 +2557,9 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
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


