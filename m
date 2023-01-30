Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A6E68191C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:28:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYqI-00012b-BV; Mon, 30 Jan 2023 13:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqA-000108-9V
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:15 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq4-0008O3-Um
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:13 -0500
Received: by mail-wr1-x42a.google.com with SMTP id t18so12010432wro.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 10:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Jcvd+N8dP8c49YORsITsraMbFg3q5O5eU5IyRhoB5B0=;
 b=Kjw1omPf+0Hh7OwZLbBENhSQhY0B1Rsvd++4cV9RmnQfpTyVzJ/1CECKCXB7ofGcyy
 CAk/f7xVBbFQdfs151DqGymz9pJxq+TNRR7zQalWDL3geeT4dqqXz3Zkiu5R+SVlUH8O
 5/h8u5vD8ankaLCtJelg3lgJQH8yZy1DKgfOpy4ONNgyd6/szbdA4C0S5SRhdJf0B28T
 vTSWw3QzG7MIXiB4RbrS3qzZ8ycgdpJPcgkMmNrvcbKIYyGOvdYTL8ses/mveefJTL83
 kFj0Gsl61NDBpDRxxhRB3C10Ty22mtg6y2WKFJH6RWOg6CHg/nTpDULqkX33VJtfAwoH
 Y54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jcvd+N8dP8c49YORsITsraMbFg3q5O5eU5IyRhoB5B0=;
 b=CNr2iESA9LA97sZRWggQOqjxpaEY0UUuHwI8VXjW1ddG32oRm64KlP87O1wK3z2nrF
 hqPglHBCOfHYqLp3VVHAWObaaZmvq3lnajy0pLLoD52m3XBmFMBq4s4mVQ5OirJ1JwAt
 SYwbGiYbJcr+kgOYiCVn0OJsAFvX2M1CP+rwAbx6LXwrZ+g0hYivQ3lUPoGXfaCg3k0x
 jAKhU95SB+YqDyZPe+FXqc1fxzLZ9mPiyagFUYDycPfDGJmMofSy4DVYtEKPR6WnlJoP
 YN556A/tJXgwcmdYzYDcq/Vouobmqh58QOawfJxgc2qZMcbPj2aVOB07uCixoXHtZtn8
 lBqA==
X-Gm-Message-State: AO0yUKVj6Pio5FHOe3uydlEGZPsa2kYwDtJy5beyQJX6cj/J4Sip+dLu
 wqKyQFGE5TluKMolPbB6DSLT6A==
X-Google-Smtp-Source: AK7set+5fPvL33JJJQcDu6JoaFL01YbvbV/vXkwKQGdI6gjk0aXL6l18fXzOEDfQ8ZFy7SDxcAu0hw==
X-Received: by 2002:adf:a1ce:0:b0:2bf:cfc2:2eae with SMTP id
 v14-20020adfa1ce000000b002bfcfc22eaemr11920743wrv.69.1675103105798; 
 Mon, 30 Jan 2023 10:25:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 04/23] target/arm: Move do_coproc_insn() syndrome
 calculation earlier
Date: Mon, 30 Jan 2023 18:24:40 +0000
Message-Id: <20230130182459.3309057-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Rearrange the code in do_coproc_insn() so that we calculate the
syndrome value for a potential trap early; we're about to add a
second check that wants this value earlier than where it is currently
determined.

(Specifically, a trap to EL2 because of HSTR_EL2 should take
priority over an UNDEF to EL1, even when the UNDEF is because
the register does not exist at all or because its ri->access
bits non-configurably fail the access. So the check we put in
for HSTR_EL2 trapping at EL1 (which needs the syndrome) is
going to have to be done before the check "is the ARMCPRegInfo
pointer NULL".)

This commit is just code motion; the change to HSTR_EL2
handling that will use the 'syndrome' variable is in a
subsequent commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-5-peter.maydell@linaro.org
---
 target/arm/translate.c | 83 +++++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 42 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 365e02fb0b8..9252a464a12 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4718,6 +4718,47 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
     const ARMCPRegInfo *ri = get_arm_cp_reginfo(s->cp_regs, key);
     TCGv_ptr tcg_ri = NULL;
     bool need_exit_tb;
+    uint32_t syndrome;
+
+    /*
+     * Note that since we are an implementation which takes an
+     * exception on a trapped conditional instruction only if the
+     * instruction passes its condition code check, we can take
+     * advantage of the clause in the ARM ARM that allows us to set
+     * the COND field in the instruction to 0xE in all cases.
+     * We could fish the actual condition out of the insn (ARM)
+     * or the condexec bits (Thumb) but it isn't necessary.
+     */
+    switch (cpnum) {
+    case 14:
+        if (is64) {
+            syndrome = syn_cp14_rrt_trap(1, 0xe, opc1, crm, rt, rt2,
+                                         isread, false);
+        } else {
+            syndrome = syn_cp14_rt_trap(1, 0xe, opc1, opc2, crn, crm,
+                                        rt, isread, false);
+        }
+        break;
+    case 15:
+        if (is64) {
+            syndrome = syn_cp15_rrt_trap(1, 0xe, opc1, crm, rt, rt2,
+                                         isread, false);
+        } else {
+            syndrome = syn_cp15_rt_trap(1, 0xe, opc1, opc2, crn, crm,
+                                        rt, isread, false);
+        }
+        break;
+    default:
+        /*
+         * ARMv8 defines that only coprocessors 14 and 15 exist,
+         * so this can only happen if this is an ARMv7 or earlier CPU,
+         * in which case the syndrome information won't actually be
+         * guest visible.
+         */
+        assert(!arm_dc_feature(s, ARM_FEATURE_V8));
+        syndrome = syn_uncategorized();
+        break;
+    }
 
     if (!ri) {
         /*
@@ -4755,48 +4796,6 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
          * Note that on XScale all cp0..c13 registers do an access check
          * call in order to handle c15_cpar.
          */
-        uint32_t syndrome;
-
-        /*
-         * Note that since we are an implementation which takes an
-         * exception on a trapped conditional instruction only if the
-         * instruction passes its condition code check, we can take
-         * advantage of the clause in the ARM ARM that allows us to set
-         * the COND field in the instruction to 0xE in all cases.
-         * We could fish the actual condition out of the insn (ARM)
-         * or the condexec bits (Thumb) but it isn't necessary.
-         */
-        switch (cpnum) {
-        case 14:
-            if (is64) {
-                syndrome = syn_cp14_rrt_trap(1, 0xe, opc1, crm, rt, rt2,
-                                             isread, false);
-            } else {
-                syndrome = syn_cp14_rt_trap(1, 0xe, opc1, opc2, crn, crm,
-                                            rt, isread, false);
-            }
-            break;
-        case 15:
-            if (is64) {
-                syndrome = syn_cp15_rrt_trap(1, 0xe, opc1, crm, rt, rt2,
-                                             isread, false);
-            } else {
-                syndrome = syn_cp15_rt_trap(1, 0xe, opc1, opc2, crn, crm,
-                                            rt, isread, false);
-            }
-            break;
-        default:
-            /*
-             * ARMv8 defines that only coprocessors 14 and 15 exist,
-             * so this can only happen if this is an ARMv7 or earlier CPU,
-             * in which case the syndrome information won't actually be
-             * guest visible.
-             */
-            assert(!arm_dc_feature(s, ARM_FEATURE_V8));
-            syndrome = syn_uncategorized();
-            break;
-        }
-
         gen_set_condexec(s);
         gen_update_pc(s, 0);
         tcg_ri = tcg_temp_new_ptr();
-- 
2.34.1


