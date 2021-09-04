Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB58A400CF2
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 22:46:37 +0200 (CEST)
Received: from localhost ([::1]:44914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMcYe-0006HC-HK
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 16:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcNz-0005yl-TV
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:35 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:40525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcNo-0002sH-4Q
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:33 -0400
Received: by mail-lf1-x12a.google.com with SMTP id bq28so5338254lfb.7
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 13:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N72m9wOihT632IIPCjrLGqtbp/sw40TmD3c4hwDwJKM=;
 b=WNuMtysm6TgtUGhwBpaAOuaTEojo+Bk7U5Fl2lKhAWRtH7+ZZB5q7T5jsXP31sqYtp
 470hI/ejam1fCrUP/XOuCoS2xRrEamd9KumhbZlerbL1aIOOf8LIy53XfePvLCOyz0B8
 jRHz640QwN8Lbd4hmGA7XgKjMbmHvgDS48wYQRoDSI/BqSg/vVfuv0Khxrfq28ula3EA
 PcDjXmYqf2ituUKGJ4bT5NBHHPEY+Ayx/PqbZ8mOrS38A/E676g92rgFF5G2+351Fi7e
 H0iLByIUhptnNtqN7zXe5mNV+OHLCmnEfqhHleX1W+CbGkz9fV40yITLMHt0fOiivyDE
 jkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N72m9wOihT632IIPCjrLGqtbp/sw40TmD3c4hwDwJKM=;
 b=V050bNfswX7LJVIO7Nrv/SERUJL8AG7O9lVb0P4oKSxSJVp51KzbquhQkF+5dir6zc
 BQ1u0uW8oclWtMU/od05lIRrVpMg+ZBmRB6yfOWUU21DoMGzG7AG5DFNJf+S4DwSGLeH
 QMW6lfjywg+pUgM2VWl48SKTl2EJftT57rAeQQQ5aQYA5IjE5iro5JWFT7epLBVwr/C5
 shthU5RD2NOTuUo0BeLkk4+0UUIO3LpuiXc98H8Jq1EtMQCEOsa2WSfaCF+zPH18JMCe
 NNtP4iLIvLBOfjequGfbr8qPkz6XVNeKY3+7y9gR/3jRzNJZjp+VCcIJJYUGWn//0Xy/
 +HWA==
X-Gm-Message-State: AOAM532vbxfPDdveg2t38YwFan+K0/gzRpNm7KaD34nxfqS+ReNXDIwr
 vW8KGunetAJJBUI1ldBRR3zSDSYJ8xKTQuGK2H4=
X-Google-Smtp-Source: ABdhPJzwLHjkCDWSv6SF1Ft+vUh26tbSSOtY49IqVqMoV+cXArqNBh6kMyLtOpBXUnGgTUx2BBNoNQ==
X-Received: by 2002:a19:dc47:: with SMTP id f7mr3941147lfj.71.1630787721720;
 Sat, 04 Sep 2021 13:35:21 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id v15sm326304lfq.142.2021.09.04.13.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:35:21 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 03/16] target/riscv: clwz must ignore high bits (use
 shift-left & changed logic)
Date: Sat,  4 Sep 2021 22:35:02 +0200
Message-Id: <20210904203516.2570119-4-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12a.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Assume clzw being executed on a register that is not sign-extended, such
as for the following sequence that uses (1ULL << 63) | 392 as the operand
to clzw:
	bseti	a2, zero, 63
	addi	a2, a2, 392
	clzw    a3, a2
The correct result of clzw would be 23, but the current implementation
returns -32 (as it performs a 64bit clz, which results in 0 leading zero
bits, and then subtracts 32).

Fix this by changing the implementation to:
 1. shift the original register up by 32
 2. performs a target-length (64bit) clz
 3. return 32 if no bits are set

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

Changes in v10:
- New patch, fixing correctnes for clzw called on a register with undefined
  (as in: not properly sign-extended) upper bits.

 target/riscv/insn_trans/trans_rvb.c.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 6c85c89f6d..8d29cadd20 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -349,8 +349,10 @@ GEN_TRANS_SHADD(3)
 
 static void gen_clzw(TCGv ret, TCGv arg1)
 {
-    tcg_gen_clzi_tl(ret, arg1, 64);
-    tcg_gen_subi_tl(ret, ret, 32);
+    TCGv t = tcg_temp_new();
+    tcg_gen_shli_tl(t, arg1, 32);
+    tcg_gen_clzi_tl(ret, t, 32);
+    tcg_temp_free(t);
 }
 
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
-- 
2.25.1


