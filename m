Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB93042EC56
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:28:55 +0200 (CEST)
Received: from localhost ([::1]:56868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIaE-0004cJ-Tm
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHys-0003Rx-1Z
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:50:18 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:43843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyp-0004nD-LF
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:50:17 -0400
Received: by mail-pg1-x52c.google.com with SMTP id r2so7847735pgl.10
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vftmpeorgu8v2D6JL3Z3aHTYTVTC2HvkH8DiP0nD1/k=;
 b=iRFiSNrmYAZv0rxfJ1pjrr9LVZWoHBs5xfgJWQ3Nzvws61hNsnzUvym4USaLJzNj3n
 T0zPp6n/WcOkYHNuniwKJAqSQWMLIqw94v9Trspvc6wiFuq5WTUMSeJYXEIJAG5sqO3S
 XFyhqnL8aBR82qxQe/e1sAHRNP026NwtMu4+0BMdtd8Ubi4aEobrqRxaeRgTa8GCaDVO
 vxEGEt/gygHKe8IXp6eRLqeh0T5/luA14mBHOfNmVVMtpeJNjOLc1qhY/lEXFFAu61Gg
 mC8WkGhBtu3mKvwM2F4Z8KQxq9fenu0+o8zadiBZspgYtpplGSC+iA1Z7MEYNqa3Ags8
 8tZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vftmpeorgu8v2D6JL3Z3aHTYTVTC2HvkH8DiP0nD1/k=;
 b=5DCWMI+ngTY9789AeGe/qDxdZ01lR6umuWUMJIXz+qlLRT4cSLYCINDUhcEPkocvjt
 7FtRbwC9QZlXKq5Rr7cMfAwpwDrdMVV35O9Sj5fPqMSEmaQf7F7vfE7aMug7jtbc9TmJ
 eejxlQZYI3YuTxO+1cOMZZHgqSx0FJbr723JT+tErc5wcJEhCIgpUB+O7wbfNImZqcMG
 /uNoVZaTDarF8YG08V2L8i9k/mPPh3D7GaDjd4IRCqk/fqEUzFTgxCc9EoNjqLiczzEV
 i0cfTAxhnT6qNDOhHAlJ2AuU0nZOcTE38s1UZFNC+6Na01/I3kzZyMgr7MCwMXuzQgrk
 WsyQ==
X-Gm-Message-State: AOAM533CXrfFAn2qquyR2vzCt/k3kLWZvoRwO7009zyayHgIWX5faSfc
 ni8yxR/hwlRM6A86OoqOJLAqjx6wGJc2W9dX
X-Google-Smtp-Source: ABdhPJwS8B/z+XEZviKM7m4sXQXw2CaJeI2tKEVBZR2QQG7TIMa/0A3Qi09PNb20LuEG3CpVGdu+rg==
X-Received: by 2002:a63:f62:: with SMTP id 34mr7896442pgp.159.1634284214243;
 Fri, 15 Oct 2021 00:50:14 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:50:13 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 57/78] target/riscv: rvv-1.0: remove vmford.vv and vmford.vf
Date: Fri, 15 Oct 2021 15:46:05 +0800
Message-Id: <20211015074627.3957162-65-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 6 ------
 target/riscv/insn32.decode              | 2 --
 target/riscv/insn_trans/trans_rvv.c.inc | 2 --
 target/riscv/vector_helper.c            | 7 -------
 4 files changed, 17 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index af79570da8f..1727075dce4 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -902,12 +902,6 @@ DEF_HELPER_6(vmfgt_vf_d, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vmfge_vf_h, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vmfge_vf_w, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vmfge_vf_d, void, ptr, ptr, i64, ptr, env, i32)
-DEF_HELPER_6(vmford_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmford_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmford_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmford_vf_h, void, ptr, ptr, i64, ptr, env, i32)
-DEF_HELPER_6(vmford_vf_w, void, ptr, ptr, i64, ptr, env, i32)
-DEF_HELPER_6(vmford_vf_d, void, ptr, ptr, i64, ptr, env, i32)
 
 DEF_HELPER_5(vfclass_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfclass_v_w, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index aee3a6cd01f..82484fda751 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -582,8 +582,6 @@ vmfle_vv        011001 . ..... ..... 001 ..... 1010111 @r_vm
 vmfle_vf        011001 . ..... ..... 101 ..... 1010111 @r_vm
 vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
-vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
-vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
 vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 77cf3682b35..93f94552f5e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2424,7 +2424,6 @@ GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmfne_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmflt_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmfle_vv, opfvv_cmp_check)
-GEN_OPFVV_TRANS(vmford_vv, opfvv_cmp_check)
 
 static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
 {
@@ -2440,7 +2439,6 @@ GEN_OPFVF_TRANS(vmflt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfle_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfgt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfge_vf, opfvf_cmp_check)
-GEN_OPFVF_TRANS(vmford_vf, opfvf_cmp_check)
 
 /* Vector Floating-Point Classify Instruction */
 GEN_OPFV_TRANS(vfclass_v, opfv_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 4840bd938af..dd15010c3da 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3630,13 +3630,6 @@ GEN_VEXT_CMP_VF(vmfge_vf_h, uint16_t, H2, vmfge16)
 GEN_VEXT_CMP_VF(vmfge_vf_w, uint32_t, H4, vmfge32)
 GEN_VEXT_CMP_VF(vmfge_vf_d, uint64_t, H8, vmfge64)
 
-GEN_VEXT_CMP_VV_ENV(vmford_vv_h, uint16_t, H2, !float16_unordered_quiet)
-GEN_VEXT_CMP_VV_ENV(vmford_vv_w, uint32_t, H4, !float32_unordered_quiet)
-GEN_VEXT_CMP_VV_ENV(vmford_vv_d, uint64_t, H8, !float64_unordered_quiet)
-GEN_VEXT_CMP_VF(vmford_vf_h, uint16_t, H2, !float16_unordered_quiet)
-GEN_VEXT_CMP_VF(vmford_vf_w, uint32_t, H4, !float32_unordered_quiet)
-GEN_VEXT_CMP_VF(vmford_vf_d, uint64_t, H8, !float64_unordered_quiet)
-
 /* Vector Floating-Point Classify Instruction */
 #define OPIVV1(NAME, TD, T2, TX2, HD, HS2, OP)         \
 static void do_##NAME(void *vd, void *vs2, int i)      \
-- 
2.25.1


