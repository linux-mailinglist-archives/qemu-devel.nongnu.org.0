Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE5A460D33
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:24:30 +0100 (CET)
Received: from localhost ([::1]:58060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXHJ-0005dB-4e
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:24:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzo-0005RT-0D
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:06:24 -0500
Received: from [2607:f8b0:4864:20::52f] (port=42539
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzk-0000VF-OT
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:06:22 -0500
Received: by mail-pg1-x52f.google.com with SMTP id s37so4825402pga.9
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rOZkko/CTdaE7DpkXpWYbtzqXWlFEusGG9wsyPj6Eso=;
 b=VnFD/WRG3qHr4TbZFSgi35ILh4J28irJd4rj2lE9ZtsUMpbuw74kRsTwNZvLBMUZXF
 TDPd4faj7W9E3hpyCj07P2m6cO1RFN7PHob3QVpO1bV0HL/VPHJcgCC756WZ2n+NyoxF
 D1Azmj7dxkHAPUOZW/6BjizEPJdgHK+BU+RPUitpFvEpn+pJqEUQfdOVhg2w3OdOz+8y
 dC7A8x7eihVoIaVB3DWNxiiFNTecqCXIjw4yttQo2z+WQNw+SsZLJEBu/yscL5DM6dtM
 KQ3UqqzXVnYb0GO+6dEnhyeXfTOBfZbuT5+AEi7wlwEBwsLTLetk1gk4K4KDAEGCrVc1
 CkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rOZkko/CTdaE7DpkXpWYbtzqXWlFEusGG9wsyPj6Eso=;
 b=I8tBrNcaYwlMAJFZNJPDM8eM/5imHImMyIjbuflxcQZ5ihmNy9yBcfML4/CC40OnL2
 AXtMx4y5ST456ZjRyrSi35b5Q0gjWHPX/VWP8E92aj5Dbfq/qgMDfav2Smam+28b0bEO
 pdpcPnlY5Asf5QCLPrzm8r5HBFvbry9mAgC3NY9hB+tokjNZhHc8Rdeus5OO22pHC/I+
 //VQQwLl9MyuBqlj4xWccPh5TgUDEGDtJGZRMY/r9HxK8r08/xArXU9vT8j2vOQIHrln
 R2ndxrqwVcd/J0V+Xl3KJ12y34PBwHfYL4/6/i2qzBsA7OU9SfLxw9l2q1ePEL0l38xB
 F7kg==
X-Gm-Message-State: AOAM532zPd3ZeZy14QK1odxHOQNGB8Q0TXcJPxGKh59beCw55k6zV1Kl
 uIyfBG/ih/FhwvpsF7yqMDScQHlTR9q7RyEE
X-Google-Smtp-Source: ABdhPJwmV/TaUF35qN6/OltFs7/czaB9jO1t8D7kRs3mixsiybOImgl+s858dv47ks1slFodS6ezmA==
X-Received: by 2002:a63:1b5e:: with SMTP id b30mr32474010pgm.72.1638155179422; 
 Sun, 28 Nov 2021 19:06:19 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:06:19 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 32/77] target/riscv: rvv-1.0: iota instruction
Date: Mon, 29 Nov 2021 11:02:52 +0800
Message-Id: <20211129030340.429689-33-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
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


