Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D52443FA0E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:39:31 +0200 (CEST)
Received: from localhost ([::1]:54164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgOMC-0002Xf-Gs
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNlZ-000641-Fj
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:01:37 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:37567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNlX-00061H-8B
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:01:36 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so10074687pjl.2
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rOZkko/CTdaE7DpkXpWYbtzqXWlFEusGG9wsyPj6Eso=;
 b=jWme/8E+gsX4RUldW0PvSKdcV8SwfuQ5PgbWBcjod0JVVpwk5ZGVL0Q87kbAsh+PFC
 njm12F1JbOyxt/9r6hdNekV/9cLYfwc7u4Mv6p69rEz0OWXK2oL8gXS6HCNIyQHYY8PN
 EprQYIo4p476GgPL5et1hae4lSgbLZVmnKxjC10TvVq93PK66SlX2blzKTbeIRDFxiQS
 CejxzsM19ojPLSj/bHQ3erZtpbs5f9NN4KeqPc0OGD5u+yzIMtSsF8B2pi8eHVpOx9k1
 h2SnaXW9L/R3CtDiLVl+gr0NRyyZ+ntCFoLInSn9vxYo7B8M+4tZgReXfwlhE1UwTQ62
 QYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rOZkko/CTdaE7DpkXpWYbtzqXWlFEusGG9wsyPj6Eso=;
 b=Q9aQ3WHpm0b6mHRNw2QzO3AMLcN7GowUTQl0pzC2wLzjkUa7wQ1tGHNf2zslz6wLMZ
 IMX2cG54yY/Ve9AWBib2LeysouFKzt9Bmj4olNNOylq3GBR3xVTtXNVa4HjqAY7s5dBS
 Tq9tlJ8+8afbQL3hQjArhWw0+bD72BVjFWnBqDrmM+tuEfFcGQv+7FxaWhRWPAyNoyz/
 pzmqvu38wSfVZESMeD/VgUTfXDU9IX8s6m03h0zLFP+6q0V6xMCVlVxz8nCWBLCHo+1t
 X2dPEmRfxJMabsD9GDh1cnORlLUndLzDHJ02far4aUOde0N/Jk6G/hKCzFEMJtCXrKzK
 z8DA==
X-Gm-Message-State: AOAM532hN1/4TfslWjlFCm5GFFkoGU+6r1kGO0ZNkI0e8xY3KLlUsXzf
 +EFbGA3TvWDgUkXoNaWIMWvYP/mHSeJSQb91
X-Google-Smtp-Source: ABdhPJwW7jT1NRBDHFRR7lxaheN8AtgvC1Tc43UsF0QUJv8l4cAYuAuttKqE1QRrd99UY07D21tRMg==
X-Received: by 2002:a17:90a:ba03:: with SMTP id
 s3mr10048879pjr.116.1635498092734; 
 Fri, 29 Oct 2021 02:01:32 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:01:32 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 32/76] target/riscv: rvv-1.0: iota instruction
Date: Fri, 29 Oct 2021 16:58:37 +0800
Message-Id: <20211029085922.255197-33-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d139c0aade7..3ac5162aeb7 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -632,7 +632,7 @@ vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
-viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
+viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 9206e6f06c8..80cbf0cadb8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2757,12 +2757,18 @@ GEN_M_TRANS(vmsbf_m)
 GEN_M_TRANS(vmsif_m)
 GEN_M_TRANS(vmsof_m)
 
-/* Vector Iota Instruction */
+/*
+ * Vector Iota Instruction
+ *
+ * 1. The destination register cannot overlap the source register.
+ * 2. If masked, cannot overlap the mask register ('v0').
+ * 3. An illegal instruction exception is raised if vstart is non-zero.
+ */
 static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s) &&
-        require_noover(a->rd, s->lmul, a->rs2, 0) &&
+        !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs2, 1) &&
         require_vm(a->vm, a->rd) &&
         require_align(a->rd, s->lmul)) {
         uint32_t data = 0;
-- 
2.25.1


