Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14C6661C10
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:44:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBp-0000oF-2j; Sun, 08 Jan 2023 20:43:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBm-0000nI-Rs
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:02 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBl-0001Xz-0q
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:02 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so11221511pjk.3
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NEPoewYIYUX4/fFFzLfNsZVv8UqWZ3zn3T6sHH/Cx9k=;
 b=cqZY7Kfg+UCDjpxz9N6rHgaUUQ+ojPM7AAmXCfO53VZ3UVsRztL7W3VDhPFE/efpaK
 BNbvRtIWpU/4UMoyMuerb1zbV7a7aMQksBVX7cgbf6wwtZ7MJll22M2lBJDWutznpuaR
 C3fnJ2lHTmHGaj1WCxK61RwO1Auk+/BGyBguHwSkECdHfR0GwKRugkCxKIbjhqjAFx1s
 ggkMyz28GPeM5ay8b/mA3qvke343vmb7mztUlqv/lgK2UgdN0eCcVtinIxldjuMJF4Ty
 AmVnB6RZ9PYv2BaKKLNdJWkdnP8HXE/mOiJzyZp+OAJP/tvRlDnWp216RKLSrlgnG3Gn
 AyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NEPoewYIYUX4/fFFzLfNsZVv8UqWZ3zn3T6sHH/Cx9k=;
 b=6G1ro4eARcQk5UwlqrqzvOvDOjSUaYwsSrktfU5d933KK2+15rHZgaIprgmNsJET1/
 kf0tijnZQpxXl4MqVOqhZd3GnOgO+abbiwnYMgD+vZ7A/rs+wZynFJ6/PJ3UCpD5ZEqE
 fsGNo6SZDomw0DCMmqN+mY+7Q9WaRbfHnt9jxKT/RLHRkr9Z45UfwK4Y1lL0c3rlXu1n
 u36phK+k70HU2PRDXUnHrymZ3IacWkjm00cbx8hnxINXqyzWFnjf+Z1bPnGgeZiXPfg3
 1OndkQ28BWOp0jP3AE1erT50NJ6Budi/ym3CySSC72oQz5bSyQEv4BzlOOOLk8DKrho5
 hGQg==
X-Gm-Message-State: AFqh2koRedvq6i5K/nXZU4lLVaEteg/MyySuYO/TOFuZLCkoMfnJjHB2
 7O6O8blY+SHBWbO830STWdPYjggc5ofZR3/j
X-Google-Smtp-Source: AMrXdXvvm9WUGR6ruAjfTZP4l4h7IJbVCd9oANkTopbJzDsV5bUHpuefAU53isfQ4vw1WqZWS1yUHw==
X-Received: by 2002:a17:902:cad5:b0:193:12fd:a2e3 with SMTP id
 y21-20020a170902cad500b0019312fda2e3mr7718168pld.55.1673228579598; 
 Sun, 08 Jan 2023 17:42:59 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.42.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:42:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/22] tcg: Add TranslationBlock.jmp_insn_offset
Date: Sun,  8 Jan 2023 17:42:37 -0800
Message-Id: <20230109014248.2894281-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
index b4d09c89ab..54585a9954 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -587,7 +587,8 @@ struct TranslationBlock {
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
index c1f77f4392..7b16af17da 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -320,7 +320,7 @@ static void G_GNUC_UNUSED set_jmp_insn_offset(TCGContext *s, int which)
      * tcg_gen_code, where we bound tcg_current_code_size to UINT16_MAX.
      */
     tcg_debug_assert(TCG_TARGET_HAS_direct_jump);
-    s->gen_tb->jmp_target_arg[which] = tcg_current_code_size(s);
+    s->gen_tb->jmp_insn_offset[which] = tcg_current_code_size(s);
 }
 
 static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
@@ -329,7 +329,7 @@ static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
      * Return the read-execute version of the pointer, for the benefit
      * of any pc-relative addressing mode.
      */
-    return (uintptr_t)tcg_splitwx_to_rx(s->gen_tb->jmp_target_arg + which);
+    return (uintptr_t)tcg_splitwx_to_rx(&s->gen_tb->jmp_target_addr[which]);
 }
 
 /* Signal overflow, starting over with fewer guest insns. */
@@ -4666,6 +4666,8 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
     /* Initialize goto_tb jump offsets. */
     tb->jmp_reset_offset[0] = TB_JMP_OFFSET_INVALID;
     tb->jmp_reset_offset[1] = TB_JMP_OFFSET_INVALID;
+    tb->jmp_insn_offset[0] = TB_JMP_OFFSET_INVALID;
+    tb->jmp_insn_offset[1] = TB_JMP_OFFSET_INVALID;
 
     tcg_reg_alloc_start(s);
 
-- 
2.34.1


