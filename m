Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D99407899
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 16:03:25 +0200 (CEST)
Received: from localhost ([::1]:36306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP3bH-00058X-Tq
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 10:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YP-0002Py-SD
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:26 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:34572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YO-0005bf-20
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:25 -0400
Received: by mail-lj1-x233.google.com with SMTP id f2so8229119ljn.1
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 07:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DmfeRaFVIi1NS9S3i9WiPFG7A336man2wcVNd43HhY4=;
 b=0NqKkMBkKmY6AhODYgFTsFtRI9v5mhchDYkjYDS/4fmwD6vTt1AMgrQs54j+x3asSo
 MYJss5S1+EDrbIDF7GojBbd8kJlGx+Tvbu7pQ3/Ry7WPMRg5EdV0syALIbVWPb/BcglH
 8KPemQIb82fMDA33MN1pDv/6s90PKSKHNKRNI5sfjm2dMLdQxlxDX/j1zESFj8oPkxSl
 P2aJW/Bs+8TmB8pdpOlYe4RdNbiAAU0gvwV4D0ZsAWafTC71joO+j3/Aw3nPgsqWXeKF
 qyx3bvNmsit0mGaf3bVOCQEiMy7Foh29LMH3gji5ow2TAThhTrzL7OYUMgnZ4UFkWb5Z
 cnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DmfeRaFVIi1NS9S3i9WiPFG7A336man2wcVNd43HhY4=;
 b=v8dJlPH9XtyeIaKEnv/gAdblVkvDhNF9eeDsz/DcGFUwoiZMYggo16pXiBoahl1qfD
 hgsTs4XG6ePP9Hr8ZnQ8D24ZMv3+IS1Kgbi1DskpEgas1HWxkfa9lKh7zshdbR3zEERT
 Pd52HqD531I3K+B/19zv1h+od2THDS+VD8HCgimQ+dRIfLhMRAd0pq9lMWN6zgwuxCvW
 L2SG3KVfzaSwJuL+hQyLvhphOmJnwhrNSSo3s8spYI034p4vky+uux6vZjDg4dq7L/QX
 1nkW+M3J6aRPBY9Kdpb9/KiThrSkg0ah4LDkJbuLv87HyLDL1K+n3GhsCceU8XGSkrXO
 SjgA==
X-Gm-Message-State: AOAM533Bmta/QkhCZ6rTolCwtGrnVMjL7kzWURiDi1TPAV45HBqRpvrY
 1neldA5LIhfivmb9oeroXJTFN6PMgAaTLljh
X-Google-Smtp-Source: ABdhPJzJWZvhQgNJj1dqkZ/avpvo48MGZnSowzFISnpwUbfxi3xCrpSCT8OX0WwpELlIcx1fhV9eqA==
X-Received: by 2002:a2e:5345:: with SMTP id t5mr2290506ljd.20.1631368821804;
 Sat, 11 Sep 2021 07:00:21 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u15sm213052lfk.26.2021.09.11.07.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 07:00:21 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 02/16] target/riscv: fix clzw implementation to operate on
 arg1
Date: Sat, 11 Sep 2021 16:00:02 +0200
Message-Id: <20210911140016.834071-3-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x233.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Kito Cheng <kito.cheng@sifive.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The refactored gen_clzw() uses ret as its argument, instead of arg1.
Fix it.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Fixes: 60903915050 ("target/riscv: Add DisasExtend to gen_unary")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---

(no changes since v10)

Changes in v10:
- New patch, fixing regressions discovered with x264_r.

 target/riscv/insn_trans/trans_rvb.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index c0a6e25826..6c85c89f6d 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -349,7 +349,7 @@ GEN_TRANS_SHADD(3)
 
 static void gen_clzw(TCGv ret, TCGv arg1)
 {
-    tcg_gen_clzi_tl(ret, ret, 64);
+    tcg_gen_clzi_tl(ret, arg1, 64);
     tcg_gen_subi_tl(ret, ret, 32);
 }
 
-- 
2.25.1


