Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931015F1C9B
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:14:55 +0200 (CEST)
Received: from localhost ([::1]:40568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedGY-0008J8-67
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBu-0002cI-An
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:06 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:35787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBq-00040F-Sr
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:05 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id i12so4539431qvs.2
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qy6spyF8kU4SzDKUd7+T3Em9WIf6wXpgrIpvZpNfA88=;
 b=T85RyYw8tWvUJ8L2l9TjA+RIAfGkKaVi4MhmbREJgTVVP9LSBxFTiavh90QxhhA43m
 Fbm5bLfLY1bacY7FW4Ij3iqfErH9w80DKkzpFS9qMFJh6pFFP4G48XTa2lnaXRnoufsr
 jIO4E4kk+TV0vcnbEf74Is41N09/oHRdjOkdtwgbwGqakslOI0LjCASzFF3pCqPBvu/H
 +QTSsnJVo2y+MRoknadpg/ZJMJoqOo7CCGkROOpSFyTvgjh4j37tWOPcxkWfwJ5LnvMH
 nBuzpZMfItTIRtxPgqNw7FWwceetD0H15jZwO6KAR2X/TQ3X7l266QBHa6HtL/aToe8V
 Ncew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qy6spyF8kU4SzDKUd7+T3Em9WIf6wXpgrIpvZpNfA88=;
 b=3LzxTLwu7Ca8IboL6ylx0xq2KofMtfNlv0/6imc33Cylq5tnffe5LtiS6A3B92q+gc
 oaJkFYMzACfhRn7yj3azfvGGP1l6ELawJxRq9CxQ6aNQnl/UX7PqwWznlhNz3WtY/Ab6
 cc4dUCY2UV/EGIz13KPbum4712iP7DgYaLR/OQFUGcdjewHRnQSj0nCgyeBuJCAWqFUX
 HAZ/E5qeS7N4RNtztJPaNv17Etkclwam1Dp6eu9rnzWcWLEvdsk/fJEU/i6oL1Gpnwe5
 xdFRgpbnuVKQ62js+nEPayPDZ8cBcC2K5V2lpMcCJ5YauqxP4C7stlNQD5o835Y/uZc3
 lM+A==
X-Gm-Message-State: ACrzQf0ojh1JDZUIGOHMq1NDWRIHfZJGw9ILEdedt3S5zsp9I0hh18nP
 hcFnSa7InuLVaO8ouJAoIyRpf5IZqZa7kG5C
X-Google-Smtp-Source: AMsMyM45ZeobZdiRtznQoTIcuTwOFwMVrTEmol5ivMGS+qI9mPgm+uuBgl+c2UAfwWDPeCADiJ1OCQ==
X-Received: by 2002:a0c:9001:0:b0:4af:8c5a:511f with SMTP id
 o1-20020a0c9001000000b004af8c5a511fmr10756885qvo.61.1664633397727; 
 Sat, 01 Oct 2022 07:09:57 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:09:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 07/26] target/i386: Introduce DISAS_EOB*
Date: Sat,  1 Oct 2022 07:09:16 -0700
Message-Id: <20221001140935.465607-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a few DISAS_TARGET_* aliases to reduce the number of
calls to gen_eob() and gen_eob_inhibit_irq().  So far,
only update i386_tr_translate_insn for exiting the block
because of single-step or previous inhibit irq.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 4c1548da8e..caa22af5a7 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -132,6 +132,10 @@ typedef struct DisasContext {
     TCGOp *prev_insn_end;
 } DisasContext;
 
+#define DISAS_EOB_ONLY         DISAS_TARGET_0
+#define DISAS_EOB_NEXT         DISAS_TARGET_1
+#define DISAS_EOB_INHIBIT_IRQ  DISAS_TARGET_2
+
 /* The environment in which user-only runs is constrained. */
 #ifdef CONFIG_USER_ONLY
 #define PE(S)     true
@@ -8849,7 +8853,7 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
                  * the flag and abort the translation to give the irqs a
                  * chance to happen.
                  */
-                dc->base.is_jmp = DISAS_TOO_MANY;
+                dc->base.is_jmp = DISAS_EOB_NEXT;
             } else if (!is_same_page(&dc->base, pc_next)) {
                 dc->base.is_jmp = DISAS_TOO_MANY;
             }
@@ -8861,9 +8865,24 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    if (dc->base.is_jmp == DISAS_TOO_MANY) {
+    switch (dc->base.is_jmp) {
+    case DISAS_NORETURN:
+        break;
+    case DISAS_TOO_MANY:
+    case DISAS_EOB_NEXT:
+        gen_update_cc_op(dc);
         gen_update_eip_cur(dc);
+        /* fall through */
+    case DISAS_EOB_ONLY:
         gen_eob(dc);
+        break;
+    case DISAS_EOB_INHIBIT_IRQ:
+        gen_update_cc_op(dc);
+        gen_update_eip_cur(dc);
+        gen_eob_inhibit_irq(dc, true);
+        break;
+    default:
+        g_assert_not_reached();
     }
 }
 
-- 
2.34.1


