Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8652125E1D1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 21:16:55 +0200 (CEST)
Received: from localhost ([::1]:35298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEHCg-0004om-Jd
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 15:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kEH51-0001Yq-Ci
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 15:08:59 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kEH4z-0000o5-D3
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 15:08:59 -0400
Received: by mail-pl1-x644.google.com with SMTP id s10so1604940plp.1
 for <qemu-devel@nongnu.org>; Fri, 04 Sep 2020 12:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C+qOEnrO4mdVdydo87qRuF3WglkeUY/A8QOfETainjE=;
 b=A+542d076QWv/JjfTkpTEbB3xbMX8uv0KcKqHoLPWaCsrYLVoHLZ2KMbH89Jndh7EU
 TcU5bhI0ZWCn4zTYFz5KVaQNjKfHQI5cg6rCGAEl6/mgYbTX2u+3A3GCmDl3424e5TFP
 UrT/2plmPa0vMK73KCYA4SDhBgbPhLhFcPw8i44mYzEdkRVupIR1IFjdtclLyKHXRE6c
 2GQjmrsFKXQW3UKauP6IiOLreo35BEuJxta/ofeaIvtTz2ckH0L5CDu+exq3ktRwctJy
 kNDrQiNucwUVKJIQs/o2A+zE0p7Lo/zH0HNHHq4mlkBx34j1nBr44sMP2hdqo/eKR/Sy
 W+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C+qOEnrO4mdVdydo87qRuF3WglkeUY/A8QOfETainjE=;
 b=pWTTFVSnJs5LcqJCVfpedoh93HVGz+FBS6Zqh0UGw8Z+X98tggGOHTW9Iil78dtzN2
 nzT0iMe6xWAWJ4PwsWI98OfrXrIVSbti1Tzo1OpwDc0kYQC3Ru/8Huoz079e5FbtHwcq
 bpzSC4wzaChyQS4iepTuul/CAEBt07ayyDKjLnd+WJ6PnTDlGVzlcv6mdxyDe1JPHIbo
 FdO5LJZK+bpXh/V5JkXbY0piJPxQ5PrMB7nUapb4Ycd35Id+PbibEKcxi9iFeopUo5O3
 WNrQdj0Pjx6OEaD4uZ6UR2NnQNJs5VTrZq9fGnFlg+p08+u2XDXLsVR7YtSk5wf3kuJ3
 jCaA==
X-Gm-Message-State: AOAM530FSCcOhySFPchCWYCYYpNx0a5yJzEKKPURZY+VTdiJYkBdD1Vc
 1VCTnaIFufesT1fdbeIrvVGVXxktCtDvtA==
X-Google-Smtp-Source: ABdhPJxzGXJ5d1M6tqs3LvCzWo0uqESI8QuRtXhtfsH3+noQ/KLaTvlKapC84ga8NrrGsosYoepXgw==
X-Received: by 2002:a17:902:ea8c:: with SMTP id
 x12mr9872045plb.60.1599246535677; 
 Fri, 04 Sep 2020 12:08:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x19sm1897941pge.22.2020.09.04.12.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 12:08:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/19] target/microblaze: Handle DISAS_EXIT_NEXT in delay
 slot
Date: Fri,  4 Sep 2020 12:08:31 -0700
Message-Id: <20200904190842.2282109-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200904190842.2282109-1-richard.henderson@linaro.org>
References: <20200904190842.2282109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: edgar.iglesias@xilinx.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is legal to put an mts instruction into a delay slot.
We should continue to return to the main loop in that
case so that we recognize any pending interrupts.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 6bf299a826..608d413c83 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1696,6 +1696,10 @@ static void mb_tr_translate_insn(DisasContextBase *dcb, CPUState *cs)
     dc->base.pc_next += 4;
 
     if (dc->jmp_cond != TCG_COND_NEVER && !(dc->tb_flags & D_FLAG)) {
+        /*
+         * Finish any return-from branch.
+         * TODO: Diagnose rtXd in delay slot of rtYd earlier.
+         */
         if (dc->tb_flags & DRTI_FLAG) {
             do_rti(dc);
         } else if (dc->tb_flags & DRTB_FLAG) {
@@ -1703,7 +1707,35 @@ static void mb_tr_translate_insn(DisasContextBase *dcb, CPUState *cs)
         } else if (dc->tb_flags & DRTE_FLAG) {
             do_rte(dc);
         }
-        dc->base.is_jmp = DISAS_JUMP;
+
+        /* Complete the branch, ending the TB. */
+        switch (dc->base.is_jmp) {
+        case DISAS_NORETURN:
+            /*
+             * E.g. illegal insn in a delay slot.  We've already exited
+             * and will handle D_FLAG in mb_cpu_do_interrupt.
+             */
+            break;
+        case DISAS_EXIT:
+            /*
+             * TODO: diagnose brk/brki in delay slot earlier.
+             * This would then fold into the illegal insn case above.
+             */
+            break;
+        case DISAS_NEXT:
+            /* Normal insn a delay slot.  */
+            dc->base.is_jmp = DISAS_JUMP;
+            break;
+        case DISAS_EXIT_NEXT:
+            /*
+             * E.g. mts insn in a delay slot.  Continue with btarget,
+             * but still return to the main loop.
+             */
+            dc->base.is_jmp = DISAS_EXIT_JUMP;
+            break;
+        default:
+            g_assert_not_reached();
+        }
     }
 }
 
-- 
2.25.1


