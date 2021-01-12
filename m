Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E271B2F2C41
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:09:18 +0100 (CET)
Received: from localhost ([::1]:51214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGc1-0006tu-U0
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:09:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBp-0004f0-76
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:42:13 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBm-0007lM-ET
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:42:12 -0500
Received: by mail-pf1-x42a.google.com with SMTP id a188so1051120pfa.11
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ooeYII9a9p02Rf950LgKJWyqZVGnNJSme//eJhfqgt0=;
 b=ArXijuxhXQLr2VEWC/4e5vW7JeSK+SWICaZ1prNCgQQXCR2d1gCcHZuDKg4rUUKxYj
 iKkMz8C9SzjAXw10bHgaOx3tjfCvueDriK5HBHqbkPLx+KFhtIQYLnPYMGBD5aBe9xV5
 ohfmmLy5N52sDCx9z+7VNXg/6Qp+jjLRcxHhEtqqhVQdpmY5giUNkk7VNRk+kE1Z10Po
 Xx3Ku+iFOGPTDk2wVbGIFc9JyVHjcRBqJSV2Ii/1eR6HXPluCprCGyrpXlt7ysBlr0DZ
 ov/ozOl9BKd5g+RShcmQfEdlCQQrItIEIg3GjQQqjLnD+FOGAhQ7zTqDS3zP/GYPZkPk
 RkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ooeYII9a9p02Rf950LgKJWyqZVGnNJSme//eJhfqgt0=;
 b=qG5oy9VE631K5VzBIaub6la/+kp54kpQvSJ0BfqAo7GAX/F0AK7QTO+kB7vcpH4U+s
 TFTRddRhXF1B99ooLYF2PWiSh2+qPJ82vdORq5xmNVLHzvwKUtJwmlGZoUJJBZzz0+H0
 xRtSQvtHaTDiGbZLLchJeauK1RoaCGk0UbODPviEDjL4/K7rpacMvZUJEwy3zWSGYWk4
 6aKa0C3kQnX6Yeed9ilXBUdknsySTSrV+afx0dl8qeHHtU29yQQA/34jaracmuFi8bGI
 g23POBaMVyhP/fKNZ3v2UzWFpqeg+pAGK5eMwX4D/KLCI8UwFalja7GUwRZM6Dvvpo0l
 3t5w==
X-Gm-Message-State: AOAM5332i3accfHPv9Ve2mws3cGjBjVp3GaLfYLwdPo6phrNFlmqxegB
 4qWp+T+6Vaafhmr+yEVqkEmrh5elndyKnsNc
X-Google-Smtp-Source: ABdhPJxFe9+0BhPXMXq86tAfXsyEEVFkeMVSJau5TZqSvRFiIwUz3bgFMLfqSQSmE2TtoCtywT627g==
X-Received: by 2002:a62:dd94:0:b029:19e:92ec:722a with SMTP id
 w142-20020a62dd940000b029019e92ec722amr4124825pff.50.1610444528979; 
 Tue, 12 Jan 2021 01:42:08 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:42:08 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 31/72] target/riscv: rvv-1.0: iota instruction
Date: Tue, 12 Jan 2021 17:39:05 +0800
Message-Id: <20210112093950.17530-32-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6b3caef1721..fae5ea3fa63 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -607,7 +607,7 @@ vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
-viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
+viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5b229d55307..6e45186b9b4 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2989,12 +2989,18 @@ GEN_M_TRANS(vmsbf_m)
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
2.17.1


