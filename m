Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D313031294B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:23:44 +0100 (CET)
Received: from localhost ([::1]:33408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8x9L-0002NQ-Tp
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:23:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSR-0002TM-TC
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:23 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSP-00067d-TT
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:23 -0500
Received: by mail-pg1-x534.google.com with SMTP id e7so315447pge.0
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RzFAVc3cWW3yr0pGO36GqM64ymG+VJfs9mt8bjfFgIQ=;
 b=O8xW3oxgYeRAE9z7RZOLPggDgMjfBxSM6yVRVHj2iw+p9zB+Og3C4shZYwNxq+Io1F
 uV+HdpoDSzRObGAKs+HPVYcE5eKpjAIJegS+IrhQ/Zp6g8P4RPfFMJnP5tdDJv2mb5T4
 1H+tSKLqbpFwqDMfrVkxD1y7vvKlknc7auc175HrngJGdjoyCwhntcDIfFwSHoYg0NXi
 ZtBz5zcLJFqktaoJyG3V2c4VSkNmTjDq7iFq2ssjaUJuxfn1JWynLQlVpjW2Db32Mqei
 le4oQCC85AFJLAjYqQmmoIQd8OgnrxMUs1A/3YcRAXvN1i5NxyPPh7df0rqkr7Yvjtc4
 vbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RzFAVc3cWW3yr0pGO36GqM64ymG+VJfs9mt8bjfFgIQ=;
 b=OTleYVHVA/TvNDJMtqbXj6+8OpIs+6I62vqkOHLnP22G8dRaPG67dUSH+eVZcS/uoJ
 x2yHaJxiqOrCHh0PlON7ITxBkx5j1+G1u26dz6ErvseJwsqdGO15VAgqrTVXRBWrv/96
 XNTDE99PphGZYLHMnCydvgzWF+SUzXjC60lpEXw1ncF2Sghb5lhev67HoYLoTtwAixDS
 WJTEP83xMCiLUI6Ua+hSKHeuzgU2BF0mUIMMGW5lhnBVtINMmnyaciQzt5JKEyMe9Rrc
 pp9+msA3FcI8jCpfUdMLjQgej7EV0B5CE6c/L3vDa4tPj+z923nyIQxQBcgkU3DbLAks
 M5sA==
X-Gm-Message-State: AOAM533HG1xEuF2K7LqsPol8O2HiCUCkxnKLmVzrehh4mRg5O0kjxnYG
 yP0wf6l4WFq2YbpT0WnCJJtFotm078vXxA==
X-Google-Smtp-Source: ABdhPJwJlf6LXtPANgbbYOUu55vq22WD3Pfjo1BLfb3gNB/6MvLhNFxYr9E3Hf0LYZdOE9MbG5USgg==
X-Received: by 2002:aa7:983c:0:b029:1d0:1014:3d46 with SMTP id
 q28-20020aa7983c0000b02901d010143d46mr16102709pfl.43.1612751960361; 
 Sun, 07 Feb 2021 18:39:20 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 46/70] tcg/tci: Split out tcg_out_op_rrr
Date: Sun,  7 Feb 2021 18:37:28 -0800
Message-Id: <20210208023752.270606-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 272e3ca70b..546424c2bd 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -314,6 +314,19 @@ static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrr(TCGContext *s, TCGOpcode op,
+                           TCGReg r0, TCGReg r1, TCGReg r2)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, intptr_t i2)
 {
@@ -500,11 +513,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     CASE_32_64(divu)     /* Optional (TCG_TARGET_HAS_div_*). */
     CASE_32_64(rem)      /* Optional (TCG_TARGET_HAS_div_*). */
     CASE_32_64(remu)     /* Optional (TCG_TARGET_HAS_div_*). */
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrr(s, opc, args[0], args[1], args[2]);
         break;
 
     CASE_32_64(deposit)  /* Optional (TCG_TARGET_HAS_deposit_*). */
-- 
2.25.1


