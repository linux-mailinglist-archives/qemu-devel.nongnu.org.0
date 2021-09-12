Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D26B407E69
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:06:58 +0200 (CEST)
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPS0P-0006zp-BY
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPRs4-0002QN-OU
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:58:21 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:37719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPRs1-0003xF-CI
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:58:19 -0400
Received: by mail-pl1-x630.google.com with SMTP id f21so2021864plb.4
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m7emFn9ZXxGGMcBZFosB1EnmF9R96t2zGLMZbzq44mc=;
 b=X1HK1FUm3HBpdWLlIShTQXfxDBn3QbTNqlzrS2uIb2MVZ+Vq/9RTQYFdj9FZQNuW1H
 PfenExM/qaeu4FWMFX2+c2yfYBeH3t1Vp+zCXFJA5DY/ZicbtpVS//vvUPDuV3c+fxLS
 7KQg+W+JAV5oTG4qoGrIhP/R05GTJ84iPRtBnyHtXht/rbP241blCqTjdOpjjDfTiVRK
 K0tL3rchaTRfAVkPeq6xAces2OKPG55W09SXvoMbMOBDcp17VeE7x97gpmGv+T48Hf0x
 /GSKLz2J+mBWMoWveB24N85WYIz1bzznN9rpQOfsDtsmt5kbJKvmoQLLffjqtpt5GMhT
 r36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m7emFn9ZXxGGMcBZFosB1EnmF9R96t2zGLMZbzq44mc=;
 b=YlN+9i2cuYuguezfVc9ZM4cTX/aqVAi+fMMybfEtC48HLvtNXQRxsWFKtLePW8FSlF
 JbVaUtWa0jveMrDsEnY+1eGw/T1DCPX+1vp3GtcBwqbMSBn2fAbQFrPMSvpn9X1aAvVr
 1LKLi9R/FEygkpzPo9RXgloBd6Jn1zsEbd9Evtt1EdiXb9lM/xO0esI1BGZxg5NueO3J
 XRTLTZnEwKzN7REBQAgrxOWMDjW4lWl52CC1FGyoTHwDnodYo/SmTc/gaCjBK3sTevs8
 oKBtrYwPOB1wH2BhQE3JFbh+0ZDVCIPDeks4p4riRofuxLaqBv8uyF0d1BsO7nnOAOe7
 o7hA==
X-Gm-Message-State: AOAM530RWN7SuOqJQzqSKOn7kzS/Pm9Db596HlB99PrEyPG9i4ezTzjm
 /6EgkQRn78lxyGGyyZSNjvBL6EPw7HCVAw==
X-Google-Smtp-Source: ABdhPJw2/GR3tElLTTiOSDuEsKeOAYl9oRnGNBrht8YiYJnuXzW4iFmWieqWG94lxpf9oZMbzZXYfQ==
X-Received: by 2002:a17:90b:814:: with SMTP id
 bk20mr8255580pjb.108.1631462295989; 
 Sun, 12 Sep 2021 08:58:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v13sm4439415pfm.16.2021.09.12.08.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 08:58:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 7/9] tcg/ppc: Replace TCG_TARGET_CALL_DARWIN with _CALL_DARWIN
Date: Sun, 12 Sep 2021 08:58:07 -0700
Message-Id: <20210912155809.196236-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912155809.196236-1-richard.henderson@linaro.org>
References: <20210912155809.196236-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

If __APPLE__, ensure that _CALL_DARWIN is set, then remove
our local TCG_TARGET_CALL_DARWIN.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e0f4665213..2202ce017e 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -25,8 +25,8 @@
 #include "elf.h"
 #include "../tcg-pool.c.inc"
 
-#if defined _CALL_DARWIN || defined __APPLE__
-#define TCG_TARGET_CALL_DARWIN
+#if !defined _CALL_DARWIN && defined __APPLE__
+#define _CALL_DARWIN 1
 #endif
 #ifdef _CALL_SYSV
 # define TCG_TARGET_CALL_ALIGN_ARGS   1
@@ -169,7 +169,7 @@ static const int tcg_target_call_oarg_regs[] = {
 };
 
 static const int tcg_target_callee_save_regs[] = {
-#ifdef TCG_TARGET_CALL_DARWIN
+#ifdef _CALL_DARWIN
     TCG_REG_R11,
 #endif
     TCG_REG_R14,
@@ -2372,7 +2372,7 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 # define LINK_AREA_SIZE                (6 * SZR)
 # define LR_OFFSET                     (1 * SZR)
 # define TCG_TARGET_CALL_STACK_OFFSET  (LINK_AREA_SIZE + 8 * SZR)
-#elif defined(TCG_TARGET_CALL_DARWIN)
+#elif defined(_CALL_DARWIN)
 # define LINK_AREA_SIZE                (6 * SZR)
 # define LR_OFFSET                     (2 * SZR)
 #elif TCG_TARGET_REG_BITS == 64
-- 
2.25.1


