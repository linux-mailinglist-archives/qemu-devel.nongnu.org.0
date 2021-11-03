Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4BD443C18
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 05:07:24 +0100 (CET)
Received: from localhost ([::1]:42284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi7YZ-0000WY-IE
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 00:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VI-00057S-0x
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:04:00 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:44638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VF-0000uH-Ku
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:03:59 -0400
Received: by mail-qv1-xf32.google.com with SMTP id v2so1470254qve.11
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 21:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ztwm/zJmHHIzh4HcML3vD8itiNyqlXeIngv750qW5RU=;
 b=wKWi/ht91swZXZ9MgbRYW1cIHg1UDoucdL4PhT0B1oxyOL0thai9m5NWbPn6hB6jld
 B4jXntWQlxGkjflg3CeiaC4vyvF4xNZ1Czt5cc8UBWD8u97P+7AIXT72FJweaRBWaIiW
 WlzUYC3EBBxKlYLVAEoP4hiSCq1ARO/jyNEsTfjQNNbXTsi/e30A3J3rbuHTtcM8Azh0
 /riDzkuq0EpfGwbZxhYj/hLGYSSa+uhSWTC2iCns8UCKyJhh3gTX65DTjgvku/QN8M3g
 y2/qY69bjoghrd1nYCoja2GMESOIE8BhI6p+KFbZ8Rm+tEh07UtcFA/i8fhYdHdNOcvN
 fNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ztwm/zJmHHIzh4HcML3vD8itiNyqlXeIngv750qW5RU=;
 b=GwJP3Jr45lr9hs8fop267N5vxD/lZGCaCcYZIXcAmg/Xpp0eWkJ52Gw5K0MF2bobeL
 eUzraHoYgfaTwd90A6TsVlhxu8OJTtBXNY6i1/Fg+xs0bos+5Rtcw1pRY+6dZ2qmlW4e
 5TLwLLv4TcOYMFP3THHrgFhIW0Vsxd+jN9j6Ra99768F7yVr5DMOHA5fKrdRMER38/KP
 yClNrZbzmI0+XWKeUXLBhskO4ADbDLoanifm3/mZKmmSU168v/yy+Qs/EQWwRJe3QeaO
 BUEwJ/860rt4TzEIo1NwqCd0OJVsc4zjBEpIwrbwEGV9bDudn16hiB7CqgJyj2zdaA//
 a4AQ==
X-Gm-Message-State: AOAM532bNvthgtDmCHoJqUEiEn/z6Bj9qQm4/sInqxDe/llOUk9yRK05
 F2DZta6pOYaJ+L1+agAwPYcz/exEMams5Q==
X-Google-Smtp-Source: ABdhPJznIRFJrr1VoBS3QXam76El/7jf+KNQsyiHOkzU9yhZkc6oI/UPWknyYpvW0UJw4Whu5OcYag==
X-Received: by 2002:a0c:eec3:: with SMTP id h3mr33999810qvs.17.1635912236757; 
 Tue, 02 Nov 2021 21:03:56 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id br20sm730408qkb.104.2021.11.02.21.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:03:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/10] target/arm: Split arm_pre_translate_insn
Date: Wed,  3 Nov 2021 00:03:46 -0400
Message-Id: <20211103040352.373688-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103040352.373688-1-richard.henderson@linaro.org>
References: <20211103040352.373688-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create arm_check_ss_active and arm_check_kernelpage.

Reverse the order of the tests.  While it doesn't matter in practice,
because only user-only has a kernel page and user-only never sets
ss_active, ss_active has priority over execution exceptions and it
is best to keep them in the proper order.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a39456ea98..82d4e24c27 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9513,7 +9513,7 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     dc->insn_start = tcg_last_op();
 }
 
-static bool arm_pre_translate_insn(DisasContext *dc)
+static bool arm_check_kernelpage(DisasContext *dc)
 {
 #ifdef CONFIG_USER_ONLY
     /* Intercept jump to the magic kernel page.  */
@@ -9525,7 +9525,11 @@ static bool arm_pre_translate_insn(DisasContext *dc)
         return true;
     }
 #endif
+    return false;
+}
 
+static bool arm_check_ss_active(DisasContext *dc)
+{
     if (dc->ss_active && !dc->pstate_ss) {
         /* Singlestep state is Active-pending.
          * If we're in this state at the start of a TB then either
@@ -9562,7 +9566,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t pc = dc->base.pc_next;
     unsigned int insn;
 
-    if (arm_pre_translate_insn(dc)) {
+    if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
         dc->base.pc_next = pc + 4;
         return;
     }
@@ -9633,7 +9637,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t insn;
     bool is_16bit;
 
-    if (arm_pre_translate_insn(dc)) {
+    if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
         dc->base.pc_next = pc + 2;
         return;
     }
-- 
2.25.1


