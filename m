Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776AB2F1CEB
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:47:13 +0100 (CET)
Received: from localhost ([::1]:40174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1Hc-0006js-9q
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:47:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0ry-0003NQ-Ui
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:46 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rm-0000Nt-Gy
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:42 -0500
Received: by mail-pg1-x529.google.com with SMTP id 15so85545pgx.7
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iIaMM78IeHTe5CD2a93HOKAFcWJMpXbVz88KGEPcLL4=;
 b=U5QVe5cxFIm0/FHeSvhJftiMY7vPjp5/ZvhN7DSATKWA78jb6MSV1SgevDo8KizSit
 JXggddzr+YKEVzBv/lmJxAzGCSG6KJxP2Nnxyf2rOkMT5/38lRl6zyxGSczbUqDSiiOd
 tJyLI2KFEMb0bV3Z6BIvGddyw7p+Xm71Ojhv5ryZQiDqRe9iKnPCY3WqE0+hF7SUpzM0
 DlNjx0oaSk/ZBL9s9q8yFthhncfuoKanJMkg40/av5GswYftMD52Qsx1wRzCKItdlCWY
 GAzADdoAJHKGHEe/vNEqe05cg0ypKCvNvsXMH2GaCAXdMhF08GFhKVbTkZivee05BL0V
 EPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iIaMM78IeHTe5CD2a93HOKAFcWJMpXbVz88KGEPcLL4=;
 b=n6SutHyOMDFYYnQZtewE1MMz3rulsI+JmkfQnPEQm2xj2PwNtTjob3hRO1NTic49KO
 IAuECH3HL4xkZCxdpeLh+qiIEkHw4mxP3msJVlNVfv3XKm2rXIJfedUHc4KdaaHY3TaZ
 b5V9Zl+d7/UzNs9R6/4k0Bkqto7IlfqSIPD5DtXUU2Pz6gpPXPkd6RQOrkDiKWDds1CG
 KRM2euyoR1+Hf1+VLkeIy8tkRNngsS0UQ0ZfLmaEwzJ1RAr1dVTZjMhf2VOciTglQx6O
 QhTEi8KAayjqPPfZi/RdaVsqmwcdYJ/JyYH1AnGNKq+U6ALOAnNzpHdlBIZadYR0/1qY
 1w/Q==
X-Gm-Message-State: AOAM532N7Zt3dj10wlSwNPWK3A4DqgHaVXIJ66GWr0vzoPoxxqNGqnH2
 0Iw2e2fDTq8RvF3G3b9Wfs1tusRXKEQZ+g==
X-Google-Smtp-Source: ABdhPJwShRGWAz0Wi83xbfrbWqFL3WQDXXugFTv8y131GR2Cn7F14tIGXMmZAaajBGB4lbGhcK/zYQ==
X-Received: by 2002:aa7:87d2:0:b029:1a5:43da:b93c with SMTP id
 i18-20020aa787d20000b02901a543dab93cmr631138pfo.6.1610385627463; 
 Mon, 11 Jan 2021 09:20:27 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k64sm206666pfd.75.2021.01.11.09.20.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:20:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 23/23] tcg/aarch64: Use tcg_constant_vec with tcg vec
 expanders
Date: Mon, 11 Jan 2021 07:19:46 -1000
Message-Id: <20210111171946.219469-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111171946.219469-1-richard.henderson@linaro.org>
References: <20210111171946.219469-1-richard.henderson@linaro.org>
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


