Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358FC322708
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 09:21:45 +0100 (CET)
Received: from localhost ([::1]:50692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lESwy-0000GA-8V
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 03:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lESvJ-0007VA-RK
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 03:20:01 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lESvH-0001YV-1y
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 03:20:01 -0500
Received: by mail-pf1-x42d.google.com with SMTP id 201so5207300pfw.5
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 00:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=1qrHobv3NrqcH2ghUvMxccLmDGRDxe+jf1v0dL2ZvGc=;
 b=CHe+3qGRmKPjDneLse1yoCmabbOJHPKRRd3negZwA6Dns/gspK+Vp0p5RVrJVrPrHv
 zRbsYTLDPoOPpS2kkKQ3MRMmufKk020InNtDsEkHap6jeo4RY98auhn9pIblb9OWD1zB
 ec+k86HsgEvLuru1/obSbI7d1qXLOhbdXs43ZSFQD/o8/0sdfzEYKHsjLUHXPYoabk8o
 tKNTFY7uj2gNyOvy/QLgJPxno2MXbL4kvjsksWPsytLppkdWqNaUj1MkCSUB/bWeqA1a
 /pvKuwaFAT2ay5tPJ1DK2yIBsRVPXj77X7iOFk6bckRCkFUKlIpD74vSzTPjxU8kcO1z
 e9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1qrHobv3NrqcH2ghUvMxccLmDGRDxe+jf1v0dL2ZvGc=;
 b=tIVzpjG5O6+kOe7ZXqbkmI6xsFWaN/uPqu3raSugeB21gEQOCMaHrolM3QSdXjCndn
 TaNRa/N/7E/pq6cRKtGu8cs1YTck0Yr5Pv37qQnryvme6oVAfMJCKd5Jkh2u3ytMwHKw
 rwv52j4WPfyrfIeHhHb8gub2GaI5qk1bq1TslDQbgYxcuVtAEL7826uTNWaqYfLPF1wr
 4JP4kcB14cSFgzb5aLVWho1p4cQaWkm/VQcBdn8n0az5TWSy8MHXxhHXT1CzbPzjePx/
 dbW2A+tmHBpEbH7dsn8iuY671crkKDUDr3jO00FfFkbw0R0MYJUDuiL/hVizENDhdErl
 baLQ==
X-Gm-Message-State: AOAM533fT5dDa4XhwGh+qgB3nNWh2pB++r235D94yE/WLZ60ePyaIj1b
 CsqQG7Jm4bEc8evcv8qjS1P9udLb0EH2kg==
X-Google-Smtp-Source: ABdhPJynpt1oPBg6mxQ6bAbaDCMYbwM2xs56qmZ2updBWlD1Bvds9RMBgAJ2oe+Kv3GVrse6pvzB3Q==
X-Received: by 2002:a62:7e58:0:b029:1ed:b833:a305 with SMTP id
 z85-20020a627e580000b02901edb833a305mr6050729pfc.66.1614068397429; 
 Tue, 23 Feb 2021 00:19:57 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id fw18sm2057773pjb.46.2021.02.23.00.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 00:19:56 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2] target/riscv: fix TB_FLAGS bits overlapping bug for rvv/rvh
Date: Tue, 23 Feb 2021 16:19:49 +0800
Message-Id: <20210223081951.20226-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

TB_FLAGS mem_idx bits was extended from 2 bits to 3 bits in
commit: c445593, but other TB_FLAGS bits for rvv and rvh were
not shift as well so these bits may overlap with each other when
rvv is enabled.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h       | 12 ++++++------
 target/riscv/translate.c |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 02758ae0eb4..116b16b9362 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -370,7 +370,6 @@ void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
-#define TB_FLAGS_MMU_MASK   7
 #define TB_FLAGS_PRIV_MMU_MASK                3
 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
@@ -379,12 +378,13 @@ typedef CPURISCVState CPUArchState;
 typedef RISCVCPU ArchCPU;
 #include "exec/cpu-all.h"
 
-FIELD(TB_FLAGS, VL_EQ_VLMAX, 2, 1)
-FIELD(TB_FLAGS, LMUL, 3, 2)
-FIELD(TB_FLAGS, SEW, 5, 3)
-FIELD(TB_FLAGS, VILL, 8, 1)
+FIELD(TB_FLAGS, MEM_IDX, 0, 3)
+FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)
+FIELD(TB_FLAGS, LMUL, 4, 2)
+FIELD(TB_FLAGS, SEW, 6, 3)
+FIELD(TB_FLAGS, VILL, 9, 1)
 /* Is a Hypervisor instruction load/store allowed? */
-FIELD(TB_FLAGS, HLSX, 9, 1)
+FIELD(TB_FLAGS, HLSX, 10, 1)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env);
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0f28b5f41e4..9b518cdff46 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -802,7 +802,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     uint32_t tb_flags = ctx->base.tb->flags;
 
     ctx->pc_succ_insn = ctx->base.pc_first;
-    ctx->mem_idx = tb_flags & TB_FLAGS_MMU_MASK;
+    ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
     ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
     ctx->priv_ver = env->priv_ver;
 #if !defined(CONFIG_USER_ONLY)
-- 
2.17.1


