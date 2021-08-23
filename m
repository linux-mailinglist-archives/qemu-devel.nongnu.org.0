Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9909B3F4EC1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:52:39 +0200 (CEST)
Received: from localhost ([::1]:54196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDBe-0002in-MV
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mID0N-0006UN-8Z
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:40:59 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:46993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mID0K-0006Ov-6e
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:40:58 -0400
Received: by mail-lj1-x229.google.com with SMTP id w4so31079358ljh.13
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zBTbg6tktPA95cWK3OcL2KJxnCbENvh848XLxRCjBVs=;
 b=szvF9Uqr4N+lnO8J5CckibTyLeuyUzPedmppul/3wMA/IpghBrPjZP8cz1aq7Tg0TE
 l6Qs/FMnzA33aztWJ3uwtJOl7VGut3OvMOOxvus8FrXoYuBKL1pjczY4Qy2D3RBTkMLm
 ToR0rrnaexByuD+HVW8akIcarz28EbbwOHOwOe5Nbg6PRVJCQlljkYYTCsqTlTKFk8Su
 GTScvl6zsKFmypWxBvPgOu3CzK7Y1ZeufBYM8ME9LpDSWY2M+5NCM4XvlKw8U6q30CTx
 vjX9L1WOwggIRlnslTHluuVJNHPWCfFWAca/IyFzyJF4Cg6/I4qD0BBPIZGmygQ2Z/WZ
 Iybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBTbg6tktPA95cWK3OcL2KJxnCbENvh848XLxRCjBVs=;
 b=dYTx3LLl6TJnZv+qM650a3R54vItW1gL69t/Uz2QkS7zmPYbIM3z6R0FuBEyGMc6kz
 FRnOYpdFmCeStnCLGJZMftiX9cjURdlrO35JEIWyxWB57N5+y0t2TkKj6hMuaj+kZirc
 j9I/hi3fq6eXrjokU97Vl1C326whZ2bDxrHVFxwUo3IkPuUGTbIJorvRC8GDtp38SG/Y
 34tZS+zg7qJ+VORGjDNCW4cMC60y6itFDZxNxL7URKbbTym5BVfr0egJmlA83Bk6c6iD
 UPyMqpYUS5D9NTaI9nRHosAn3+FP3zDzEfcKu2B4mx4K4G5OH6Fd5lrkmYn9yAKIcxTd
 PHrw==
X-Gm-Message-State: AOAM530MNr6TJ+az2A2T/Ahyew7vNl+UO9BLlnIKrgRvE9me10U9owOI
 fxwcSXl47XCusFdjRmpJw8W5ZKTfgoM66sRW
X-Google-Smtp-Source: ABdhPJy6fqE3RxBxW3bDFS46eOBd36yBXM6VPjby4/zDcmVQWAtjw++7TqYVjWSSfQmU+uKsjVPPpg==
X-Received: by 2002:a05:651c:b1e:: with SMTP id
 b30mr27655180ljr.424.1629736852287; 
 Mon, 23 Aug 2021 09:40:52 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id z5sm1491671lfs.126.2021.08.23.09.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:40:52 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/15] target/riscv: rewrite slli.uw implementation to
 mirror formal spec
Date: Mon, 23 Aug 2021 18:40:37 +0200
Message-Id: <20210823164038.2195113-15-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x229.google.com
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
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The slli.uw instruction is defined as
    X(rd) = (EXTZ(X(rs)[31..0]) << shamt);

This rewrites its implementation to directly match this, allowing
for the small optimisation of not emitting the zero-extension if
the immediate shift is greater than 32.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

(no changes since v1)

 target/riscv/insn_trans/trans_rvb.c.inc | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index b134abd263..3419dcf1bb 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -308,17 +308,14 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
         return false;
     }
 
-    TCGv source1 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
-
+    TCGv source = tcg_temp_new();
+    gen_get_gpr(source, a->rs1);
     if (a->shamt < 32) {
-        tcg_gen_deposit_z_tl(source1, source1, a->shamt, 32);
-    } else {
-        tcg_gen_shli_tl(source1, source1, a->shamt);
+        tcg_gen_ext32u_tl(source, source);
     }
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
+    tcg_gen_shli_tl(source, source, a->shamt);
+    gen_set_gpr(a->rd, source);
+    tcg_temp_free(source);
     return true;
 }
 
-- 
2.25.1


