Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90392460D40
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:26:22 +0100 (CET)
Received: from localhost ([::1]:34132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXJ7-00009K-KV
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:26:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX1G-0000st-QS
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:07:54 -0500
Received: from [2607:f8b0:4864:20::1033] (port=42893
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX1F-0000hZ-Ax
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:07:54 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so12843496pjb.1
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b2VQJZ4SVd/BHGvUsiIojNw2Inf+6+8BGAFntZKL6Wc=;
 b=FVt8i/LtqfxIRmSRUDk1N/QWEcnS5qz833Au5lZAVJJMHw/us8ZUiuTib0tuN8ycU8
 fH/+uei4RpaD9tN7kSsl0VFJDYmMBGbKJrp6aASg59MSVRSEkCkQ9fi5We6lKZyBxTXi
 vLcHsFYQeEc8uK/IB36ovaS/FVotNfOWHK1yvpVlvptrcQ+q1nj7Qps926DKUly50cjT
 zR8K2Cbm7xHgVEKGHsiPs0PO0EXZaOGFVXVys0L/hKQi1tB/er+M8VC2kFZpJUpXvLx+
 zsjlCCV5ok/ArOdrEp5zRaAONAlkql/v1HOGXuE5hX1PkGWT9YW9XFJZLwQiTheDoHhr
 drMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b2VQJZ4SVd/BHGvUsiIojNw2Inf+6+8BGAFntZKL6Wc=;
 b=BDpDHZUFlX2E992DCLATlQ5HARnj/VFduIOSlXhw7X+qMMPl3pT/kVwwEXc7R1GVtH
 LwWCMART0/jQ9EokjpWEFQyw09qTNf0Stg2zC74ICFe2+ZzskDUNv0Xv+nWxEmOlSXSR
 OWD0VJYPF/33N1DzzaStf/YHgOOCXipEUlTx2nY1O67FH/oSnE5dLyQacjQWf4oZ3MVl
 srzIC/2SyNAN2hi01efM+XwA8QEV8j2NdRDeYIh7PQ1ATZwkwPhwsAkrS4Z3sh09h39o
 dhNZ9P7XCVcGpdxXLQvHkF2XxaLMvJ6zeZoSYAtbOOyVXxLfMARtadbej/pNFDI/tzGQ
 Q/RQ==
X-Gm-Message-State: AOAM530BMPETqV6j0bqDTXFBdTOFzdaJ+XTL6Xzkfl3mFea4OUlE83df
 l6ofVqzJsITsWnf8uj5BzqAs+zjmWttYExkY
X-Google-Smtp-Source: ABdhPJx1gq381OcClqDODYwg2qI1wC4q0EGcu747bYRh+sjw+1N4SNw7KWGSctwJKj5VNyzBs/RKjw==
X-Received: by 2002:a17:90a:df8d:: with SMTP id
 p13mr34948048pjv.197.1638155270912; 
 Sun, 28 Nov 2021 19:07:50 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:07:50 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 49/77] target/riscv: rvv-1.0: mask-register logical
 instructions
Date: Mon, 29 Nov 2021 11:03:09 +0800
Message-Id: <20211129030340.429689-50-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 target/riscv/vector_helper.c            | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 804f423d5bb..5c0c3d25478 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2652,7 +2652,8 @@ GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
 #define GEN_MM_TRANS(NAME)                                         \
 static bool trans_##NAME(DisasContext *s, arg_r *a)                \
 {                                                                  \
-    if (vext_check_isa_ill(s)) {                                   \
+    if (require_rvv(s) &&                                          \
+        vext_check_isa_ill(s)) {                                   \
         uint32_t data = 0;                                         \
         gen_helper_gvec_4_ptr *fn = gen_helper_##NAME;             \
         TCGLabel *over = gen_new_label();                          \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 71d7b1e8796..f883fdf4749 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4231,7 +4231,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;          \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
     int a, b;                                             \
@@ -4241,9 +4240,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         b = vext_elem_mask(vs2, i);                       \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
-    for (; i < vlmax; i++) {                              \
-        vext_set_elem_mask(vd, i, 0);                     \
-    }                                                     \
 }
 
 #define DO_NAND(N, M)  (!(N & M))
-- 
2.25.1


