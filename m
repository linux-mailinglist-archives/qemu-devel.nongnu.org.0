Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A3953F288
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:28:48 +0200 (CEST)
Received: from localhost ([::1]:46234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyM9P-0006vJ-HR
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwK-0001gc-FX
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:16 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwG-0003xy-3e
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:14 -0400
Received: by mail-pf1-x430.google.com with SMTP id u2so13942735pfc.2
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nOuDGFxAusFS/PpExRhshSbU+VGlC+nQqO8cUZX/C/U=;
 b=sVBQM69oFrFiKCe4B1Tw6eBXC4dYH2eUQrkht37KcXfjUzNVYb9a61VV+UkDE7VW3Q
 Oo2Bf4z3fCx9h/7YidbTQrQ48n8YyOyfwul87tmBFCEoytUE7rN3sQ7a3C1gNHBaeEpE
 0qccEaHbnQqW6H5qcLehh2Xfxh/zra5p68WjUuLaWwx5RrythYZOLpshqsTFDaJQyT4n
 GxGfaXnABD8sgwhp2nSKc08Xua7ZAxc55bhxHC6KGewe0LKnicl2++c/euNvfIEIfbXW
 Fhw0J6TBHTZ+d0zEm4zjxiM7RQJ4vqAwk1ygy/u5gzfVNYJ8wxQA9LLbSLCyMX/rAeaV
 JGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nOuDGFxAusFS/PpExRhshSbU+VGlC+nQqO8cUZX/C/U=;
 b=2WKaQn4JyYbShoZu9Laag6YZAXcaiYsn+SMzimGMINkfVi3d195n0U7uCNxaPKazmP
 KSF9zIvpAuTKizWYvFtLat3yba+IgZ0dTT/zx3+I7Ad7mcX9di4vdxAHx53Y8mblZsPB
 HfKrge5r2scxT2GUVeA+CspRU8QbuxEQ0D3EyjAGWaEucbhl65+452cy8/QzcF39v4Jm
 lkRPMPJhxqfHoDEHzP7Huf1I6fnU7Iq3a9MWtc35R+m9KrjdTFDXslJUSLe4g8SoKcqB
 GPaSu5D8hUrHBGZH+tXH6oTXyhEuVJhWuZ6vn7etxsYIj+X0taiwi542E+PyFqqsD/aW
 YJlQ==
X-Gm-Message-State: AOAM532d7mkeZAc1W5NiphW37RwSNnAciqa184vftfzRqmRTyntBNyCx
 lbfvd4+xw9HnaMsIIAq/2w2zUHwHdANSIg==
X-Google-Smtp-Source: ABdhPJwgTwNfMp2iv2tpadfaTKhVRLnV0qpDmft2wHEwi9e97pjsHmhX2Pv3/9EDybZHjG+wcoa2Og==
X-Received: by 2002:aa7:9475:0:b0:51b:e0c5:401a with SMTP id
 t21-20020aa79475000000b0051be0c5401amr19849728pfq.39.1654557310628; 
 Mon, 06 Jun 2022 16:15:10 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 20/43] target/loongarch: Add basic vmstate description of CPU.
Date: Mon,  6 Jun 2022 16:14:27 -0700
Message-Id: <20220606231450.448443-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-21-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/internals.h |  2 +
 target/loongarch/cpu.c       |  1 +
 target/loongarch/machine.c   | 85 ++++++++++++++++++++++++++++++++++++
 target/loongarch/meson.build |  6 +++
 4 files changed, 94 insertions(+)
 create mode 100644 target/loongarch/machine.c

diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 1a3b39e0be..39960dee27 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -25,4 +25,6 @@ const char *loongarch_exception_name(int32_t exception);
 
 void restore_fp_status(CPULoongArchState *env);
 
+extern const VMStateDescription vmstate_loongarch_cpu;
+
 #endif
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 33d9a9450d..267d96c9a8 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -336,6 +336,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     cc->class_by_name = loongarch_cpu_class_by_name;
     cc->dump_state = loongarch_cpu_dump_state;
     cc->set_pc = loongarch_cpu_set_pc;
+    dc->vmsd = &vmstate_loongarch_cpu;
     cc->disas_set_info = loongarch_cpu_disas_set_info;
 #ifdef CONFIG_TCG
     cc->tcg_ops = &loongarch_tcg_ops;
diff --git a/target/loongarch/machine.c b/target/loongarch/machine.c
new file mode 100644
index 0000000000..49a06fdf28
--- /dev/null
+++ b/target/loongarch/machine.c
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch Machine State
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "migration/cpu.h"
+
+/* LoongArch CPU state */
+
+const VMStateDescription vmstate_loongarch_cpu = {
+    .name = "cpu",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+
+        VMSTATE_UINTTL_ARRAY(env.gpr, LoongArchCPU, 32),
+        VMSTATE_UINTTL(env.pc, LoongArchCPU),
+        VMSTATE_UINT64_ARRAY(env.fpr, LoongArchCPU, 32),
+        VMSTATE_UINT32(env.fcsr0, LoongArchCPU),
+        VMSTATE_BOOL_ARRAY(env.cf, LoongArchCPU, 8),
+
+        /* Remaining CSRs */
+        VMSTATE_UINT64(env.CSR_CRMD, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PRMD, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_EUEN, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MISC, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_ECFG, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_ESTAT, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_ERA, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_BADV, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_BADI, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_EENTRY, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBIDX, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBEHI, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBELO0, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBELO1, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_ASID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PGDL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PGDH, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PGD, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PWCL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PWCH, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_STLBPS, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_RVACFG, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PRCFG1, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PRCFG2, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PRCFG3, LoongArchCPU),
+        VMSTATE_UINT64_ARRAY(env.CSR_SAVE, LoongArchCPU, 16),
+        VMSTATE_UINT64(env.CSR_TID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TCFG, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TVAL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_CNTC, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TICLR, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_LLBCTL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IMPCTL1, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IMPCTL2, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBRENTRY, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBRBADV, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBRERA, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBRSAVE, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBRELO0, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBRELO1, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBREHI, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBRPRMD, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MERRCTL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MERRINFO1, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MERRINFO2, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MERRENTRY, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MERRERA, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MERRSAVE, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_CTAG, LoongArchCPU),
+        VMSTATE_UINT64_ARRAY(env.CSR_DMW, LoongArchCPU, 4),
+
+        /* Debug CSRs */
+        VMSTATE_UINT64(env.CSR_DBG, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DERA, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DSAVE, LoongArchCPU),
+
+        VMSTATE_END_OF_LIST()
+    },
+};
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index bcb076e55f..103f36ee15 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -14,6 +14,12 @@ loongarch_tcg_ss.add(files(
 ))
 loongarch_tcg_ss.add(zlib)
 
+loongarch_softmmu_ss = ss.source_set()
+loongarch_softmmu_ss.add(files(
+  'machine.c',
+))
+
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
 
 target_arch += {'loongarch': loongarch_ss}
+target_softmmu_arch += {'loongarch': loongarch_softmmu_ss}
-- 
2.34.1


