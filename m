Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210FC3F0CB8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:27:35 +0200 (CEST)
Received: from localhost ([::1]:60026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGS9u-0005gL-50
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2M-00083y-0u
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:46 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2I-0006BK-Hl
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:45 -0400
Received: by mail-pf1-x430.google.com with SMTP id m26so3335588pff.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZAJvKrninoDXi86yNb6pa5/NGflGIWCBcmCsKqBF7oE=;
 b=Xym+ooOPjszCLlRySpY5JoUHTx/B5Kuugcev6d//nnw6wsowaOzDz1wk9LMdotHdAE
 v0yEqziGlidu8gVQH8bLl5SoqLjgV1H0fDMKRPGy7sXWsHCQ6QP0eBq+9BrWh64QVTdk
 tSMld+MZLrAxTxForOe5gbk6tj+shbrABqt9FzK3mxOuPEJC4FqVrtP5USV9pYtT0MRe
 Ur9ejROnRIsqPk89WlG6oNRQqtEQk9HJ3ieQJCuHJQgA0Nw9NJmpgJlP3QlBFx6Tu2ni
 l1+8PWDw/cCVUXxUaOqgryBj2VffFSI03Q8i0/yvQj4snVMbfdr3Nhsa+xsZrVzLOeNP
 YkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZAJvKrninoDXi86yNb6pa5/NGflGIWCBcmCsKqBF7oE=;
 b=XVCvh9q/ktyh1yGJjUQjNXRxNPer7kz6Un/4WXmJxZu/BipWqLH+qYepdVa5nLq639
 ZPffWAVvWQW1C8fHC+MMAMKaHYGzJymOyCGDl1pEiB3+n6WWu22/uo295ybqCCprBfmY
 s4DZ2fjosH5AX9jsg8reSqF528nFG/txxWd7SGQahFGyhRszPos53L3yGnvgxJNVlrHr
 o1UTNl+60wVRbAgcIqIlY80JzSIeRLDXuHche3Rwi8cwxppKn8/Lnp6kYmUPTSeLRO7z
 xUbY+silL8FQA0DkljIvkJQZ0IPvqxGUnT41L4xnbZb7ZrGsb83D3Z72AgCck4IwMcKT
 uRVw==
X-Gm-Message-State: AOAM533ascIFHkJi4qSOgXZ2DiQUCM8QbCnZ7TwtDRIw0h0LIRf0+kX1
 1Kg4jF1FdzJlYPsPBx+e0HM4SAYhp2yPNQ==
X-Google-Smtp-Source: ABdhPJx25XtPPJDGPufYgKUi6zk1M/p17cpSYy8ProH9TVSH4o0Q2oG+yhrUxTvrh81dodDuiqwaCg==
X-Received: by 2002:a63:88c7:: with SMTP id
 l190mr10485873pgd.438.1629317981121; 
 Wed, 18 Aug 2021 13:19:41 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x13sm619621pjh.30.2021.08.18.13.19.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:19:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/16] tcg/mips: Allow JAL to be out of range in
 tcg_out_bswap_subr
Date: Wed, 18 Aug 2021 10:19:22 -1000
Message-Id: <20210818201931.393394-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818201931.393394-1-richard.henderson@linaro.org>
References: <20210818201931.393394-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Weaning off of unique alignment requirements, so allow JAL
to not reach the target.  TCG_TMP1 is always available for
use as a scratch because it is clobbered by the subroutine
being called.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 4019c22f3c..c65c4ee1f8 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -585,8 +585,10 @@ static void tcg_out_bswap16(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
 
 static void tcg_out_bswap_subr(TCGContext *s, const tcg_insn_unit *sub)
 {
-    bool ok = tcg_out_opc_jmp(s, OPC_JAL, sub);
-    tcg_debug_assert(ok);
+    if (!tcg_out_opc_jmp(s, OPC_JAL, sub)) {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_TMP1, (uintptr_t)sub);
+        tcg_out_opc_reg(s, OPC_JALR, TCG_REG_RA, TCG_TMP1, 0);
+    }
 }
 
 static void tcg_out_bswap32(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
-- 
2.25.1


