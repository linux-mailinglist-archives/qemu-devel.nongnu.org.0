Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA1223D9CA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 13:18:34 +0200 (CEST)
Received: from localhost ([::1]:51684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3dun-0007TU-Jw
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 07:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSo-0003zO-06
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 06:49:34 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSl-00081q-W3
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 06:49:33 -0400
Received: by mail-pg1-x536.google.com with SMTP id x6so11303920pgx.12
 for <qemu-devel@nongnu.org>; Thu, 06 Aug 2020 03:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ED1AXOJ8rlGoZbaH5JgUAK5qceKoZmdNwkN2oUDIvo8=;
 b=mzksTeaVKAJIm5wxlpZnFBuco0rYdsXhsyvpVVny/KBKYwgcfiCcdF/fOVTaFI+nkO
 YPoqi6UqIzKRiOvcchNE+snIi6+zxRSnkcVQdFcbRp/sMTZYLwQrZX+InfxZiV3oA0ep
 xEhoBKw8LuwxqZjIMR8j+dQlg88DOgtNTjnfek6bh423JJn1ybbDJZzuhhoiYAdJHirY
 dBUmKhA8An0TAbFQqH0TGoo7W6BoVVNUiq8tmWAdGyi3oO+dQgk2CH8qwNmpv/s9vlT/
 jy6GJ9ps9SMLDrMeK2XiXh1zL9pqADCD/1wbFuKH90K+gCgz3luGGZ6K2JRFdMTWLjQE
 /9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ED1AXOJ8rlGoZbaH5JgUAK5qceKoZmdNwkN2oUDIvo8=;
 b=UrEyfjbk4eAr29ikp7nUWrvY0MLyzuTPzjsiSBRRqiakbtOzxfKP1VuNatqBNfxMkP
 FN9sR6eEdAKA4qs7iuzhGIXRSPU9zZtTVhT/6tzLODa17+9pJN5EZOmo2lZxG9pSQJL7
 25PoZseluVF6Yi761MyFMBPhNkkGtFdmlA++Rg0RgG7zJa2CXy4MdLpfYaPPUhrVDHyo
 AMBQcrshUchYwsVMHHzM9Fh3N5KZzYDEE8cSq4W99vsBk3QXauOE5Lu7YLx0KikGVrPb
 /lKTpA39AT6wo2f4fnVNRBp7oyPn6ujD/1YHpOTuoYCgcAilhguoAmwyZuMEeKSlopl5
 Zl3g==
X-Gm-Message-State: AOAM533HlhFSsI64VLFt3lpJQ/AWIeIzaDJMcUj7mw7KLQfTYBmp+oLC
 JgIt1r/Y9KW7U0oXhltZEnc5l/woO1k=
X-Google-Smtp-Source: ABdhPJxnw5P1Rc1qnO4lhxxOq4JyqFyu6tAYNkkBIBdjI2gkCR+/IRAjjoDiUjKnZ241kdj3mcmcpw==
X-Received: by 2002:aa7:8103:: with SMTP id b3mr7519900pfi.72.1596710970324;
 Thu, 06 Aug 2020 03:49:30 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:49:29 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v3 53/71] target/riscv: rvv-1.0: mask-register logical
 instructions
Date: Thu,  6 Aug 2020 18:46:50 +0800
Message-Id: <20200806104709.13235-54-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x536.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

Clear tail elements only if VTA is agnostic.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 3 ++-
 target/riscv/vector_helper.c            | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 0a86d41b0a4..aab51a94bbf 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2975,7 +2975,8 @@ GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
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
index d8aa0825647..59c35343790 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4508,7 +4508,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;          \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
     int a, b;                                             \
@@ -4518,9 +4517,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         b = vext_elem_mask(vs2, i);                       \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
-    for (; i < vlmax; i++) {                              \
-        vext_set_elem_mask(vd, i, 0);                     \
-    }                                                     \
 }
 
 #define DO_NAND(N, M)  (!(N & M))
-- 
2.17.1


