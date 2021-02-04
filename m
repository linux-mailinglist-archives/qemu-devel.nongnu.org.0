Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE16930E9EE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:06:44 +0100 (CET)
Received: from localhost ([::1]:60232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7U2d-0004At-R2
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tiq-0005C3-2o
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:19 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tif-0003tu-DK
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:15 -0500
Received: by mail-pl1-x634.google.com with SMTP id u11so864851plg.13
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LkYGLsnE5odHBLHKRYujD0SaJ6+i8O1fF0r+gNXotZQ=;
 b=eZsQKtecqisRl1xpSbVWYv80cWI/zD78JCH1ptNNjh2+TC8Fc+Ja6NzYWeK+ZRnzaZ
 Q/PzfWCgMdQlmJcDKwyxIIxpDRPtaud1B4Vu/bxujwbdXvTVa1cc/LKHHVTKxF/JGyqu
 6as0fNPk94jAdE/BMUok5nzGN6KV7QvEdyvEtKnMOA5T/8wRf3MNMGt1dOvQ9xLmLhxI
 a4LbpVvw5xTTCZ5ogHPpZqbovD1MyTvvqoPjSzs9irbvfbbucN9QRGpC9A3ihvunaxIH
 gGmNQz9U5wJqgwSPOP2sGnddPIE68hzk984hqcv2d/74Ry8k5QUa1ORUvWG6IFdI1/zt
 OxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LkYGLsnE5odHBLHKRYujD0SaJ6+i8O1fF0r+gNXotZQ=;
 b=o0YSqnxc9SfLU+TeTNNHbncqhqFg5QCRuaSN0SRqvcAomsd/DoVG2+MiZlYfF/9dT2
 A7JLGrJ6HJPeuM2g9L8CYc/2pIOPaTCwjyACQ+OnbkGn5fvmFEEDK+AWPB+8vDxDki0U
 DM/PUJO++C5ntlJIG78nJwRKNtbF6HOGqa2diDj/l59YrRjjil9hmdKQE3krlu0kD6lA
 7Fx80LFUPkbeztUqfduP2uv1fvWC4nI9CyBCDa3KiXWq9PmDmRSZlhFA3JFOpzXEXnpg
 RtpeTYLz1OUxPr7fcjTnhUwKcC5s1Bm3P3LphYeL9Vv8+yY94iQoHM4Ke1dDoBDryCnZ
 Jl1Q==
X-Gm-Message-State: AOAM533n1Nd3WIn2b2CsNix4vy2Nrl4wcjXu5tYgHbZMCH9eBILjC8T2
 WxM8ufa9jR9bwnaAMwVpMak6AZzjLMSgiugd
X-Google-Smtp-Source: ABdhPJw0Z7Csiq2aFoyILS746Jo7sJbpXwdRYkFY5XG/9dwjWf2+sagxsx1QhqsADxrUwVlh3dqrAw==
X-Received: by 2002:a17:90a:43a7:: with SMTP id
 r36mr6029354pjg.189.1612403164202; 
 Wed, 03 Feb 2021 17:46:04 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/93] tcg/tci: Use bool in tcg_out_ri*
Date: Wed,  3 Feb 2021 15:44:04 -1000
Message-Id: <20210204014509.882821-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the intended behavior. Remove the assert on
the specific value passed, which can now never be
anything besides false/true (0/1).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index aba7f75ad1..1b66368c94 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -295,10 +295,9 @@ static void tcg_out_r(TCGContext *s, TCGArg t0)
 }
 
 /* Write register or constant (native size). */
-static void tcg_out_ri(TCGContext *s, int const_arg, TCGArg arg)
+static void tcg_out_ri(TCGContext *s, bool const_arg, TCGArg arg)
 {
     if (const_arg) {
-        tcg_debug_assert(const_arg == 1);
         tcg_out8(s, TCG_CONST);
         tcg_out_i(s, arg);
     } else {
@@ -307,10 +306,9 @@ static void tcg_out_ri(TCGContext *s, int const_arg, TCGArg arg)
 }
 
 /* Write register or constant (32 bit). */
-static void tcg_out_ri32(TCGContext *s, int const_arg, TCGArg arg)
+static void tcg_out_ri32(TCGContext *s, bool const_arg, TCGArg arg)
 {
     if (const_arg) {
-        tcg_debug_assert(const_arg == 1);
         tcg_out8(s, TCG_CONST);
         tcg_out32(s, arg);
     } else {
@@ -320,10 +318,9 @@ static void tcg_out_ri32(TCGContext *s, int const_arg, TCGArg arg)
 
 #if TCG_TARGET_REG_BITS == 64
 /* Write register or constant (64 bit). */
-static void tcg_out_ri64(TCGContext *s, int const_arg, TCGArg arg)
+static void tcg_out_ri64(TCGContext *s, bool const_arg, TCGArg arg)
 {
     if (const_arg) {
-        tcg_debug_assert(const_arg == 1);
         tcg_out8(s, TCG_CONST);
         tcg_out64(s, arg);
     } else {
-- 
2.25.1


