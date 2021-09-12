Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ABF407F12
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:51:49 +0200 (CEST)
Received: from localhost ([::1]:58850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTds-0004Qm-1v
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPTbd-0001m9-QI
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:49:29 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPTbc-0001Sx-3B
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:49:29 -0400
Received: by mail-pf1-x434.google.com with SMTP id m26so6728378pff.3
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fQtXqBogTZDk4DiQ/mOGvcO79rgfTxsq6JIILCX5hOw=;
 b=XcJVWvdhp2s0V2dNdorusBqOPxLWqBeIk9vgXnAPKhaQQOje+dO6SBIAkXwp/abPYH
 Zo0pSXuyisj35NlIAH6ZCBATPMMUSiYJLLCUX3O/eYl+MTfJ+Xu9H76LqxgJxIXZV9e1
 m+CeNtMg5eQXWk/B/yxAoxw3htCzK7W3n9K7DAZnLZDZKhk789QYVzxZAfb30Cuo51Uw
 NsWaaV8TMFJS+HmXSMvHc0/wSljvNXl6Y05XwuILrmajdmFaaNQHQl3PjZ3v3N2K7FMd
 JDKpu9YOGvRrr9qx31wIVTYvJFKanAQJXhx4PC4o1XyWJnUUrnSq9MUyd9QWODGhvq3U
 CPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fQtXqBogTZDk4DiQ/mOGvcO79rgfTxsq6JIILCX5hOw=;
 b=hqwyKVDDZcC4Dg5j6WsJpkz/o4k1ViDcT1rE9sJtka2Ld/BpkbvX4hjd+y3IlYvcHP
 KYMhtT3mdVGxIWZVi3N8LO2ACqa1z9T38EI1lzeeGqAbB+Qy2CEVb/5noYWw51WJtyVt
 oPCKHPxKflsdN8ilK2Q5MGQTjFjGfpHHAtkqVRVpdhoJTWluRNE5ibquLozTujUSY6MK
 GyRMqsHmrbUbV2JJyFaxed75OJ2ZKCl71xx1utGpsD16bfQP3mPU3JHSq29+0NIYljCV
 YO6TNDLPbwqiLPEzYDr0kqOZX4B6Nu63uU7EmiQXlsko/b5Nn9Jx7vXPpYo2XHl9m/Ho
 T8TQ==
X-Gm-Message-State: AOAM5300HoTTuVNCl+uaGCq82KMbwIycQfNwAM085FynFNI32rx0ttIm
 e6GZl3uJXGO8g6NO2L8nEdOaSCIXlR+UnA==
X-Google-Smtp-Source: ABdhPJxEttW12jRrbw8IrX4ahXPeg1NpT9ayIzWavwOQYU+cGCCwfvudTwsjRba4OtTI4acLr04RLw==
X-Received: by 2002:a63:374b:: with SMTP id g11mr7435279pgn.459.1631468966202; 
 Sun, 12 Sep 2021 10:49:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id o14sm5206378pgl.85.2021.09.12.10.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:49:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg/arm: Reduce vector alignment requirement for NEON
Date: Sun, 12 Sep 2021 10:49:25 -0700
Message-Id: <20210912174925.200132-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: peter.maydell@linaro.org, "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With arm32, the ABI gives us 8-byte alignment for the stack.
While it's possible to realign the stack to provide 16-byte alignment,
it's far easier to simply not encode 16-byte alignment in the
VLD1 and VST1 instructions that we emit.

Remove the assertion in temp_allocate_frame, limit natural alignment
to the provided stack alignment, and add a comment.

Reported-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

I haven't seen the assertion with the various arm kernels that I happen
to have laying about.  I have not taken the time to build the combo
from the bug report:

[    0.000000] Linux version 5.14.0-60.fc36.armv7hl (mockbuild@buildvm-a32-12.iad2.fedoraproject.org) (gcc (GCC) 11.2.1 20210728 (Red Hat 11.2.1-1), GNU ld version 2.37-9.fc36) #1 SMP Mon Aug 30 14:08:34 UTC 2021

I thought about parameterizing this patch further, but I can't think of
another ISA that would be affected.  (i686 clumsily changed its abi 20
years ago to avoid faulting on vector spills; other isas so far have
allowed vectors to be unaligned.)


r~
---
 tcg/tcg.c                |  8 +++++++-
 tcg/arm/tcg-target.c.inc | 13 +++++++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 4142d42d77..ca5bcc4635 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3060,7 +3060,13 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
         g_assert_not_reached();
     }
 
-    assert(align <= TCG_TARGET_STACK_ALIGN);
+    /*
+     * Assume the stack is sufficiently aligned.
+     * This affects e.g. ARM NEON, where we have 8 byte stack alignment
+     * and do not require 16 byte vector alignment.  This seems slightly
+     * easier than fully parameterizing the above switch statement.
+     */
+    align = MIN(TCG_TARGET_STACK_ALIGN, align);
     off = ROUND_UP(s->current_frame_offset, align);
 
     /* If we've exhausted the stack frame, restart with a smaller TB. */
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index e5b4f86841..8515717435 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2477,8 +2477,13 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
         tcg_out_vldst(s, INSN_VLD1 | 0x7d0, arg, arg1, arg2);
         return;
     case TCG_TYPE_V128:
-        /* regs 2; size 8; align 16 */
-        tcg_out_vldst(s, INSN_VLD1 | 0xae0, arg, arg1, arg2);
+        /*
+         * We have only 8-byte alignment for the stack per the ABI.
+         * Rather than dynamically re-align the stack, it's easier
+         * to simply not request alignment beyond that.  So:
+         * regs 2; size 8; align 8
+         */
+        tcg_out_vldst(s, INSN_VLD1 | 0xad0, arg, arg1, arg2);
         return;
     default:
         g_assert_not_reached();
@@ -2497,8 +2502,8 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
         tcg_out_vldst(s, INSN_VST1 | 0x7d0, arg, arg1, arg2);
         return;
     case TCG_TYPE_V128:
-        /* regs 2; size 8; align 16 */
-        tcg_out_vldst(s, INSN_VST1 | 0xae0, arg, arg1, arg2);
+        /* See tcg_out_ld re alignment: regs 2; size 8; align 8 */
+        tcg_out_vldst(s, INSN_VST1 | 0xad0, arg, arg1, arg2);
         return;
     default:
         g_assert_not_reached();
-- 
2.25.1


