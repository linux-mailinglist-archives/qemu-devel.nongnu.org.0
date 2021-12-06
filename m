Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD53146A577
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 20:16:26 +0100 (CET)
Received: from localhost ([::1]:32938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muJTM-0008Mz-Ce
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 14:16:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1muJQk-00072z-39
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 14:13:42 -0500
Received: from [2607:f8b0:4864:20::42d] (port=43627
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1muJQh-0003As-4Z
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 14:13:41 -0500
Received: by mail-pf1-x42d.google.com with SMTP id k26so6690536pfp.10
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 11:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WjqoCFhhU0NSlyqmIIsvxuxgvsS/iCoRS6x2+0hu668=;
 b=dPxW2q0d2unJ7vObbvo9pxYROrRA0O0qG1rLE2Gzgn3ur7KJ4fDoCkM8WZH+pfCR6u
 pB8Nsup+X/TjTbfYo/RJ0QGaO6ET/1oX75RgGlG9B41Yy3HmzpndmyC9A2o9rw8oUPUh
 8VV7og7xaMVUa8iUs/8OjWeV5/t2mdhGcEZQb0U535BXLJoJfgGJPClq1j1M5gFA5x+4
 ovAxYRKWf7IdAYswQY8YUT3aCUlYZXEdPOiaraBoP0ND1aYVsdywhnM2P+eHwhgWKw2/
 WIV6uFnd+MtMl6YHjs5VgQ+d70AirhTE0PMylQKkUeSvOIGGwKTEqh7GNJJ0bWAVXYLt
 wCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WjqoCFhhU0NSlyqmIIsvxuxgvsS/iCoRS6x2+0hu668=;
 b=pxVtGbQ4U61ICpJ4o2uXy2FIRoH00+SW6kF360vt/tJwWXuamsi6NpxMEVv1DoXo2S
 0UoX8dBKcw3k8SO5iXR/4hII3nosyIU0nDeilnMIB5FhZiPTzdYGejeVFtaKEzz4pnJW
 B4hRNbpIRBFpU+JEp3xjnMOY5CpmoV5rl2K2AGxijztayFloW7oOaPjxM0eGxA6KXp6x
 PjkCQU1bL6JCdKWVSVHBQ2TP/FD3wKcNkXtZn9OmhXZS77qais1KsdGUbA/5WUFe9E+6
 KVIouOdYQdfL+TEwEDNKiKHZ9yY79L3Xx7by63ufKP9Pw65+xlF3mKyr7JfvMKUAL5te
 XPsA==
X-Gm-Message-State: AOAM532xTv6MGMKRbEWQxxHL2GTQycKek60QXrEIquSnmEKKnv/00A+B
 iP47AceJ+nYKwgoGfEfKjRZszUawJfcPbA==
X-Google-Smtp-Source: ABdhPJyo41moMIzbEGFry7ivRGCFP2wLH8r0MRft7lvDyN3Wz9N3muxoVhTjpcPTzY92aU6xSY/V/A==
X-Received: by 2002:a63:db14:: with SMTP id e20mr19969434pgg.177.1638818017358; 
 Mon, 06 Dec 2021 11:13:37 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k6sm131225pjt.14.2021.12.06.11.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 11:13:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 1/1] tcg/arm: Reduce vector alignment requirement for
 NEON
Date: Mon,  6 Dec 2021 11:13:35 -0800
Message-Id: <20211206191335.230683-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211206191335.230683-1-richard.henderson@linaro.org>
References: <20211206191335.230683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, elima@redhat.com, alex.bennee@linaro.org,
 rjones@redhat.com
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
Message-Id: <20210912174925.200132-1-richard.henderson@linaro.org>
---
 tcg/tcg.c                |  8 +++++++-
 tcg/arm/tcg-target.c.inc | 13 +++++++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 57f17a4649..934aa8510b 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3061,7 +3061,13 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
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
index 633b8a37ba..9d322cdba6 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2523,8 +2523,13 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
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
@@ -2543,8 +2548,8 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
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


