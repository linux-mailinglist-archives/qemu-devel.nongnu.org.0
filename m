Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5FF670CDC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:12:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv6o-0003TB-Ud; Tue, 17 Jan 2023 18:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6g-0003OT-Fb
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:08 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6e-0001IT-4X
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:06 -0500
Received: by mail-pg1-x52b.google.com with SMTP id b12so23195057pgj.6
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NO4fzjlEVA7J5t8w4NvQgWpWht1iaiJodr+jf2YhjJI=;
 b=IKC1mC5LZNpf8kCjxDVBBpd3jWkxBtHKqMCrtG4ogslgfwBtcmcFSK/oreexpRtgNm
 B5pmJ44JrXjbCbQygy6lK/dyKkGiTep2dFVvyTDRrFF4VxPOX2KdcMVIsUOQNuVhqCBx
 qUpIpkuFXBb3r9IG1T4QfGPEXr1jOp+VNvj2vk3bPdgJRNvD1iqfqOvldDFXLyNMhMcS
 IzJU9NTM3DrNCB3RwC8zmNVK3Xw+24tedfqS68rtghPTpNDLa1eYb4U4Dfcxlnz73O9u
 Ox7DC5+Y8440Zmg57CUuZjsZlKFCpiTnkEl2aq4ixZvz50sr9t+OA6Gk/DG3+9KAyX4/
 c4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NO4fzjlEVA7J5t8w4NvQgWpWht1iaiJodr+jf2YhjJI=;
 b=1AwK6IoRk4c89S/DzxH0SHXPIFZIE4YQROqbmmq0Ctgl6lmk159hQE3l79xuS9JDon
 rgV0PQwCUjjZSV6t5fueSem0XZbo6R4tx3FfEiDGCq+PaPyZhTbDkYNcSlqOwp+9ePX7
 VgObF02eDEXVpLJxpTOn0rxVy2nymIgRmDEtOd9ssfrGfjz6q7yaCvyTTfdD/YVlTgPC
 k/egTNHMykKupveuzjMhEKSBrj/tV8n3AhlH6moC9pzAWR4uHJdYfdxrBte4T41quTQw
 jiHbRler9b85Y91iwRu13mdNVNZ414EEo88eJ2DrH8K7sMWh2Jl+eLwbUuq+1Q0bawwF
 HTLQ==
X-Gm-Message-State: AFqh2krXz9cBjO3R2J9INRmv5zhR7SXOdfxdfWAZCqu5t3uo8iSTl2Ib
 a/s7+EBloippiiaWzhZ0Sz63+oqckWBuf730
X-Google-Smtp-Source: AMrXdXshcHj3qUHuAij8B1mjZ6O3dFBvBJf6/3bEyDE4mQqEhC7SlbRNUlzLLPO3ojnspXS0P6jMOA==
X-Received: by 2002:a05:6a00:181f:b0:58b:d244:b525 with SMTP id
 y31-20020a056a00181f00b0058bd244b525mr7233576pfa.17.1673997063338; 
 Tue, 17 Jan 2023 15:11:03 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:11:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 05/22] tcg: Replace asserts on tcg_jmp_insn_offset
Date: Tue, 17 Jan 2023 13:10:34 -1000
Message-Id: <20230117231051.354444-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Test TCG_TARGET_HAS_direct_jump instead of testing an
implementation pointer.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc     | 2 +-
 tcg/arm/tcg-target.c.inc         | 2 +-
 tcg/loongarch64/tcg-target.c.inc | 2 +-
 tcg/mips/tcg-target.c.inc        | 2 +-
 tcg/riscv/tcg-target.c.inc       | 2 +-
 tcg/tci/tcg-target.c.inc         | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 501b77c215..90af096c11 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1918,7 +1918,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        tcg_debug_assert(s->tb_jmp_insn_offset != NULL);
+        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
         /*
          * Ensure that ADRP+ADD are 8-byte aligned so that an atomic
          * write can be used to patch the target address.
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 799cf13536..033ff90daa 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1953,7 +1953,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
             intptr_t ptr, dif, dil;
             TCGReg base = TCG_REG_PC;
 
-            tcg_debug_assert(s->tb_jmp_insn_offset == 0);
+            qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
             ptr = (intptr_t)tcg_splitwx_to_rx(s->tb_jmp_target_addr + args[0]);
             dif = tcg_pcrel_diff(s, (void *)ptr) - 8;
             dil = sextract32(dif, 0, 12);
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 29e4bfcb49..5dd645fd17 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1090,7 +1090,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        tcg_debug_assert(s->tb_jmp_insn_offset != NULL);
+        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
         /*
          * Ensure that patch area is 8-byte aligned so that an
          * atomic write can be used to patch the target address.
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 52881abd35..02887d7cb1 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1987,7 +1987,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     switch (opc) {
     case INDEX_op_goto_tb:
         /* indirect jump method */
-        tcg_debug_assert(s->tb_jmp_insn_offset == 0);
+        qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
                    (uintptr_t)(s->tb_jmp_target_addr + a0));
         tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 9b42cb4b2e..b977c8025d 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1311,7 +1311,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        assert(s->tb_jmp_insn_offset == 0);
+        qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
         /* indirect jump method */
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
                    (uintptr_t)(s->tb_jmp_target_addr + a0));
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 2f3bcce3a7..ad356f1875 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -603,7 +603,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        tcg_debug_assert(s->tb_jmp_insn_offset == 0);
+        qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
         /* indirect jump method. */
         tcg_out_op_p(s, opc, s->tb_jmp_target_addr + args[0]);
         set_jmp_reset_offset(s, args[0]);
-- 
2.34.1


