Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76938670CED
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:13:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv6u-0003VG-Og; Tue, 17 Jan 2023 18:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6r-0003Ur-PI
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:17 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6o-0001LG-KO
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:16 -0500
Received: by mail-pg1-x533.google.com with SMTP id d10so23165009pgm.13
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C8I4+mJMeosNhEeYuN1im3ukwAK8jCvEie8FNFPIOwY=;
 b=Gc0FK5I2BwXgMzI0NJH8mpoblowEkJI32Y0Iqmt1+/rznvMCCkCjifDoJ7NcqSEN3i
 tlEee02u9oIDL06ERdXp3lzxMwhEYH8qtgemmfyPCc4YGD0OY7QV+w9s8XgM/bGiHCAa
 20l9QfrV++ktt/VofuEf89FsnJut9OaQFSqZbKtUp8PvmeLavrjl/pbdoCMuMh/u02K9
 q/V4jIEoex3UH3A3wXWkexZknUrNbr6ktBSUu+QtyKYVirXtNnXx2mYbbdcRAp1n7CFI
 iMqjfhVBEQUCAUd6KWW2HCOKuD0uW1DiQ8c/JmqMQCdOqmNVzuxNUN3Z3ydxQdIblTQv
 2YPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C8I4+mJMeosNhEeYuN1im3ukwAK8jCvEie8FNFPIOwY=;
 b=02TfDyEgj2yntQDVdSaO5OY5TS5ZGFFk6C/Un4oxIYr1WBui3nhglJSgjYDWYg11WV
 ouQBEDxujO3ERLfwtMf/ibjEzm3UphdWLTqwJmA3FQMZ4CdusgN91GvG/l+Fb/tr3Vkq
 Et8u7ZbD50ZbIgMl/8sl9FlzqTUtP9CTZZ2IkgNr3ieSJpzOR3hJY8sO7Elcnde+Kucd
 pyH6Zso+JySMndkAkWrA8PbuzL+dgiUWnhnlLb2/cgIPTsHxLBQj680IT74HrsNG3VUp
 ZeDQrX5VT8LBu2tNuIgWTYbvRtLfxR1qqIkrnPWYiJtv9iPouQY5181rJs3ibhs5+n6t
 cE8A==
X-Gm-Message-State: AFqh2kr3fALPte9Hl/VaB0GT9envRAfuIIGO45bFgPCAAmDAH9SPbVo7
 779sbGukn312LikgHylr93h2fcy3F80i9iw1
X-Google-Smtp-Source: AMrXdXsVZs7h7Nwt3uTinP1JJhEvZ+Gkv8QB2lFaiRHLGItRQZ6fCNypJtVQJ5umDgdRTt8A2AXztw==
X-Received: by 2002:a62:ea0e:0:b0:577:d10d:6eab with SMTP id
 t14-20020a62ea0e000000b00577d10d6eabmr5318305pfh.21.1673997073037; 
 Tue, 17 Jan 2023 15:11:13 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:11:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 11/22] tcg: Add TranslationBlock.jmp_insn_offset
Date: Tue, 17 Jan 2023 13:10:40 -1000
Message-Id: <20230117231051.354444-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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
index 8927092537..25c4b04445 100644
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
index 4ac7086afe..af2af99583 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -321,7 +321,7 @@ static void G_GNUC_UNUSED set_jmp_insn_offset(TCGContext *s, int which)
      * tcg_gen_code, where we bound tcg_current_code_size to UINT16_MAX.
      */
     tcg_debug_assert(TCG_TARGET_HAS_direct_jump);
-    s->gen_tb->jmp_target_arg[which] = tcg_current_code_size(s);
+    s->gen_tb->jmp_insn_offset[which] = tcg_current_code_size(s);
 }
 
 static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
@@ -330,7 +330,7 @@ static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
      * Return the read-execute version of the pointer, for the benefit
      * of any pc-relative addressing mode.
      */
-    return (uintptr_t)tcg_splitwx_to_rx(s->gen_tb->jmp_target_arg + which);
+    return (uintptr_t)tcg_splitwx_to_rx(&s->gen_tb->jmp_target_addr[which]);
 }
 
 /* Signal overflow, starting over with fewer guest insns. */
@@ -4668,6 +4668,8 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
     /* Initialize goto_tb jump offsets. */
     tb->jmp_reset_offset[0] = TB_JMP_OFFSET_INVALID;
     tb->jmp_reset_offset[1] = TB_JMP_OFFSET_INVALID;
+    tb->jmp_insn_offset[0] = TB_JMP_OFFSET_INVALID;
+    tb->jmp_insn_offset[1] = TB_JMP_OFFSET_INVALID;
 
     tcg_reg_alloc_start(s);
 
-- 
2.34.1


