Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712515048B5
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 19:58:10 +0200 (CEST)
Received: from localhost ([::1]:51476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9A1-0000pK-Gr
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 13:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wu-0000eW-SZ
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:39 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:44579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wt-0003G1-7n
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:36 -0400
Received: by mail-pg1-x52c.google.com with SMTP id j71so1443550pge.11
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QU3oeydO4deqKs71AOrHq4mL0RBHni0rDESBhTtVtZg=;
 b=QuHfkcAa45CVHNhWIt5J9EguM6s0DglhM2qCMAOia+jzJ5jEmbq/eZgmSZMXu+9Jcz
 evGbGUhTefzInCOFnHboL4DEIFTv1RUGO3o1lG+l5SYB29R2ikvOifJxIZuUbnq65sad
 PPxeIJKD0T19WIEoi6axKLrZS8cGM3JIYZ8QcfpFJYVoUTBTtoEjCWLHJAgyP5Hm5gFj
 li8G0ND1j/RVNoREFGSURvmPCFxuO4wUp08jOO7qLz2lFvB7F3Uli7KBdj8+8IzdFeze
 e929xuBSZAWfFrjvf15McWULdX/kfJWrVy5qUKXQiY39vxAn7Lfig0wczP5JEApAErX0
 SK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QU3oeydO4deqKs71AOrHq4mL0RBHni0rDESBhTtVtZg=;
 b=yPITRyyGRwpA26lHidiSuvsgk/X1O3X7nzaQMXSnN/zNK0s4DG+IPoKfRwtImSwie7
 Gs4A3YKbtUBXr0mEYkha7g4w4yPTewbBPgRiM+GyfYtAMuycamqvQ2At5xGnZWkNztRp
 sTR90MdRYaUkqLhCGhbwDacoowftOtVw9soJmm4kroyEfm0KI/Ux0sBl8x8spAF8Ncf8
 rmufcVy9T2arASZzxcQFeJs4glX6gpc8uciMUOiCBtUXnldXfmBCTitGRQnV7Z560KA0
 v0hUckEM/0oFug6jnEP1t9bwZMapCPlFbf62tkQeoZLy6A4wea3FL/UUPqxvo3YEqatv
 nlmg==
X-Gm-Message-State: AOAM532coOkSYYD+AoaHoyFAC/rnxYWaTpJTqkv7l9UtGif3/VXRgvwR
 uYlf59Az398YD79Mu9uogM32WQZHxcnzBQ==
X-Google-Smtp-Source: ABdhPJyIUrhaNGX913yNF2s9iULMRmpnYJ34k60apYo3YK88J0WprPqzTLMQPNiRrwMA16BXajJHGA==
X-Received: by 2002:a05:6a00:997:b0:506:1e25:435e with SMTP id
 u23-20020a056a00099700b005061e25435emr8268538pfg.9.1650217473977; 
 Sun, 17 Apr 2022 10:44:33 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/60] target/arm: Change DisasContext.aarch64 to bool
Date: Sun, 17 Apr 2022 10:43:31 -0700
Message-Id: <20220417174426.711829-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Bool is a more appropriate type for this value.
Move the member down in the struct to keep the
bool type members together and remove a hole.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 2 +-
 target/arm/translate-a64.c | 2 +-
 target/arm/translate.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 3a0db801d3..8b7dd1a4c0 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -59,12 +59,12 @@ typedef struct DisasContext {
      * so that top level loop can generate correct syndrome information.
      */
     uint32_t svc_imm;
-    int aarch64;
     int current_el;
     /* Debug target exception level for single-step exceptions */
     int debug_target_el;
     GHashTable *cp_regs;
     uint64_t features; /* CPU features bits */
+    bool aarch64;
     /* Because unallocated encodings generate different exception syndrome
      * information from traps due to FP being disabled, we can't do a single
      * "is fp access disabled" check at a high level in the decode tree.
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9333d7be41..4dad23db48 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14664,7 +14664,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->isar = &arm_cpu->isar;
     dc->condjmp = 0;
 
-    dc->aarch64 = 1;
+    dc->aarch64 = true;
     /* If we are coming from secure EL0 in a system with a 32-bit EL3, then
      * there is no secure EL1, so we route exceptions to EL3.
      */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index bf2196b9e2..480e58f49e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9334,7 +9334,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->isar = &cpu->isar;
     dc->condjmp = 0;
 
-    dc->aarch64 = 0;
+    dc->aarch64 = false;
     /* If we are coming from secure EL0 in a system with a 32-bit EL3, then
      * there is no secure EL1, so we route exceptions to EL3.
      */
-- 
2.25.1


