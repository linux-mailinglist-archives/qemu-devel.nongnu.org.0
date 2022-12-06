Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97C7643C23
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:18:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POk-0003Pl-0M; Mon, 05 Dec 2022 23:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POh-0003OD-Ku
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:35 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POg-0006yh-1H
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:35 -0500
Received: by mail-oi1-x22b.google.com with SMTP id v70so7210210oie.3
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MgfIKhOnV5J4W2WjGszVQvaIMC5JwI5x8TLYbia9Zpk=;
 b=IH8r5UiU0zZnyW2nz5tm/3qHB99mNsXtSKKGga3rnDcnAsxOpNvXxyhlYc4VqD6S5m
 Km6xLD609sAgZm8dD8aTsktFnN2Bu7oHUPb5L0rNbW3RggbpI2c7VGENGarW1jf8ToO2
 DDHmZOYkYWwImepWG3/dgLd7zUWL2cRLxEzox1vCA+29rqjv9FWN0X2eDFYLbE/e7Fic
 YynVgvwqz8jZvwSApW08liFg8ZgoHIHtSi0iQYMK2elJt0EDLkDz9WwWdKV9cmYwUZMq
 4ZJtZovrs3a/MYUHplpc5+HUYbvRihUoZZmilfIxq9O3yMF1U9NBHDdZbQ6nrVRgkrhC
 FEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MgfIKhOnV5J4W2WjGszVQvaIMC5JwI5x8TLYbia9Zpk=;
 b=wAo19/3W0Tfi1CUAzBxOqb6GoM+KFtIorwpIStUUXcAKVm/0ONIYZC3uh0h59Jhgi5
 fC50zbhC0h4BGcQzczv6NfPMNZqoP9NgFfbzyj7KruMC5knudXH4tBjQX9xHQ3PY3re1
 OGxYnLQpgH9/XbnJaDQmqAYRekygJWNPMKnGkEaCIl6zL7K+urDGu77d8/m6oEYBUKnZ
 XhPJlLvv3AlKlC/2Llzt+v+B3iU1lN4C/tn8r2cNObTk90y9MCqfzsBjz90CsYrhrY6C
 t+26rw4LMFUNYzv1ddka1ZQoGMIEalpZdFaG63g/Mt9CGM6Bn5AAXH1UqUriDJhMv2ph
 Fs4w==
X-Gm-Message-State: ANoB5pmeqgLsxspExOc+9DfL4TH44mvF3bDk12QnT1ofyseRhCmjheAD
 2kWpKrbw+RGAs6KSK2stHrYSwVAqwxQ25bcWRQE=
X-Google-Smtp-Source: AA0mqf5WLCpVjsjbn8Y1/6K0Gh8RDRlqINqAz5xw//8dF6p5pbH7ymFO0EMcQbbH1b+nSsY9e3RewQ==
X-Received: by 2002:a05:6808:148c:b0:35b:da57:5d85 with SMTP id
 e12-20020a056808148c00b0035bda575d85mr12577959oiw.168.1670300252865; 
 Mon, 05 Dec 2022 20:17:32 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 11/22] tcg: Add TranslationBlock.jmp_insn_offset
Date: Mon,  5 Dec 2022 22:17:04 -0600
Message-Id: <20221206041715.314209-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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

Stop overloading jmp_target_arg for both offset and address,
depending on TCG_TARGET_HAS_direct_jump.  Instead, add a new
field to hold the jump insn offset and always set the target
address in jmp_target_addr[].  This will allow a tcg backend
to use either direct or indirect depending on displacement.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 3 ++-
 accel/tcg/cpu-exec.c    | 5 ++---
 tcg/tcg.c               | 6 ++++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 7566ad9e7f..bb01508b4b 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -577,7 +577,8 @@ struct TranslationBlock {
      */
 #define TB_JMP_OFFSET_INVALID 0xffff /* indicates no jump generated */
     uint16_t jmp_reset_offset[2]; /* offset of original jump target */
-    uintptr_t jmp_target_arg[2];  /* target address or offset */
+    uint16_t jmp_insn_offset[2];  /* offset of direct jump insn */
+    uintptr_t jmp_target_addr[2]; /* target address */
 
     /*
      * Each TB has a NULL-terminated list (jmp_list_head) of incoming jumps.
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 356fe348de..a87fbf74f4 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -572,14 +572,13 @@ void cpu_exec_step_atomic(CPUState *cpu)
 
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr)
 {
+    tb->jmp_target_addr[n] = addr;
     if (TCG_TARGET_HAS_direct_jump) {
-        uintptr_t offset = tb->jmp_target_arg[n];
+        uintptr_t offset = tb->jmp_insn_offset[n];
         uintptr_t tc_ptr = (uintptr_t)tb->tc.ptr;
         uintptr_t jmp_rx = tc_ptr + offset;
         uintptr_t jmp_rw = jmp_rx - tcg_splitwx_diff;
         tb_target_set_jmp_target(tc_ptr, jmp_rx, jmp_rw, addr);
-    } else {
-        tb->jmp_target_arg[n] = addr;
     }
 }
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index c7ad46ff45..c103dd0037 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -328,7 +328,7 @@ static void G_GNUC_UNUSED set_jmp_insn_offset(TCGContext *s, int which)
      * tcg_gen_code, where we bound tcg_current_code_size to UINT16_MAX.
      */
     tcg_debug_assert(TCG_TARGET_HAS_direct_jump);
-    s->gen_tb->jmp_target_arg[which] = tcg_current_code_size(s);
+    s->gen_tb->jmp_insn_offset[which] = tcg_current_code_size(s);
 }
 
 static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
@@ -337,7 +337,7 @@ static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
      * Return the read-execute version of the pointer, for the benefit
      * of any pc-relative addressing mode.
      */
-    return (uintptr_t)tcg_splitwx_to_rx(s->gen_tb->jmp_target_arg + which);
+    return (uintptr_t)tcg_splitwx_to_rx(&s->gen_tb->jmp_target_addr[which]);
 }
 
 /* Signal overflow, starting over with fewer guest insns. */
@@ -4252,6 +4252,8 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
     /* Initialize goto_tb jump offsets. */
     tb->jmp_reset_offset[0] = TB_JMP_OFFSET_INVALID;
     tb->jmp_reset_offset[1] = TB_JMP_OFFSET_INVALID;
+    tb->jmp_insn_offset[0] = TB_JMP_OFFSET_INVALID;
+    tb->jmp_insn_offset[1] = TB_JMP_OFFSET_INVALID;
 
     tcg_reg_alloc_start(s);
 
-- 
2.34.1


