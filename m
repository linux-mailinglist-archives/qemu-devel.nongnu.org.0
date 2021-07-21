Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3C03D0956
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 09:02:43 +0200 (CEST)
Received: from localhost ([::1]:38240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m66Fe-000521-LC
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 03:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65w0-0005EI-7k
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:25 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vy-0005jA-Mo
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:24 -0400
Received: by mail-pf1-x42d.google.com with SMTP id a127so1472128pfa.10
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CzixB+E3HvHFDcaZAYJPFRD8OKsUYwozrqwpEEKECyQ=;
 b=GmkqcrUtU38YAtSNGA1iNcS1GCx4koVU3gUH9HgaJhH0A9xDfzoX6k8sKXLaNSE0X1
 nsirOcb5sW8Vnua3AVMAkR4viPEayvQqJAS6weRHUL5nW1dtMO7e49gtcN5eAzhtNvAk
 5Ki/LSpSlmjGvy2kJweAA2DHhEB0BQrvcDSDnET7cmHz0nAOwwBSE26SHJqLKZkhbPb/
 ttUs29upGQDszpnBZLOS9tUSZOW/YgCAFP+If5J3SYXk+PUhysBl/ORXoYPM1aAuPuoF
 fYZ5viehPVDRhYIryf6pSM//lioT/Ev2+Y6BADdWDyJxwvMtm502OSafMqz4Zt5Mq0W2
 1TSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CzixB+E3HvHFDcaZAYJPFRD8OKsUYwozrqwpEEKECyQ=;
 b=QH7YjIM/PLT46Arzepl/RoVB6wUoqWxvv1L3bPW0MvzJvzy6XihxX5/EnEOGXJjo+o
 3FHLG2cTnqrwYq5k36b3pwye6CMgdME4NjTF09qXWAeIRRkkxoQ3qZFw/XyAdcGfxr91
 aJ3Nniu8ExjtRQdyLQbAO16Pypj+E5nqW1yIK46Jj/yXktqhIp4M2wqOy0JG+QaCXRPq
 W5DWj+aX8NL+9h+DrNP+hDsfQwYB23bDMBjtl2mKg4swtHk1W9nBWGOP9daN46Ev+3lO
 cjqntgjYcPsgmKKUVF2Jy0FaZ2VZkNOQG/7oZuciqnBocWw+g6LqsWLD44WB8Q39ZnzY
 NUrw==
X-Gm-Message-State: AOAM532gAdfn9uOZXIAQ9gVoFfIwK9+RR8WJiWgzE0pDPDj91zxvRqqA
 96u6cQ6FUrKhVcIE1yd5jpVxKJMPE3c33A==
X-Google-Smtp-Source: ABdhPJzFI/lsPdM9C17EHqYajufQzpFKrp2c3BxFPHWZ9YXgfwXIcBFyWRBShtmIvsfGEo/dz8nLew==
X-Received: by 2002:a65:610c:: with SMTP id z12mr35074816pgu.453.1626849741319; 
 Tue, 20 Jul 2021 23:42:21 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 23/23] target/xtensa: Drop check for singlestep_enabled
Date: Tue, 20 Jul 2021 20:41:55 -1000
Message-Id: <20210721064155.645508-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 20399d6a04..3fbf76f4dd 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -382,18 +382,14 @@ static void gen_jump_slot(DisasContext *dc, TCGv dest, int slot)
     if (dc->icount) {
         tcg_gen_mov_i32(cpu_SR[ICOUNT], dc->next_icount);
     }
-    if (dc->base.singlestep_enabled) {
-        gen_exception(dc, EXCP_DEBUG);
+    if (dc->op_flags & XTENSA_OP_POSTPROCESS) {
+        slot = gen_postprocess(dc, slot);
+    }
+    if (slot >= 0) {
+        tcg_gen_goto_tb(slot);
+        tcg_gen_exit_tb(dc->base.tb, slot);
     } else {
-        if (dc->op_flags & XTENSA_OP_POSTPROCESS) {
-            slot = gen_postprocess(dc, slot);
-        }
-        if (slot >= 0) {
-            tcg_gen_goto_tb(slot);
-            tcg_gen_exit_tb(dc->base.tb, slot);
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
+        tcg_gen_exit_tb(NULL, 0);
     }
     dc->base.is_jmp = DISAS_NORETURN;
 }
@@ -1292,12 +1288,7 @@ static void xtensa_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     case DISAS_NORETURN:
         break;
     case DISAS_TOO_MANY:
-        if (dc->base.singlestep_enabled) {
-            tcg_gen_movi_i32(cpu_pc, dc->pc);
-            gen_exception(dc, EXCP_DEBUG);
-        } else {
-            gen_jumpi(dc, dc->pc, 0);
-        }
+        gen_jumpi(dc, dc->pc, 0);
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1


