Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7337242A984
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:36:20 +0200 (CEST)
Received: from localhost ([::1]:54264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKlH-000572-F3
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXi-0006ee-TI
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:18 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXf-00049m-Ho
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:18 -0400
Received: by mail-pj1-x102a.google.com with SMTP id oa4so18153pjb.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=D65+qbhBiQEHG5+8gyKCqsFmt2IVIgoiw1iwwfSXJMo=;
 b=hId+N/iVvu8tR9RGnYK8oOaivh5PSFr5//0/wBhvo16lwjrth7lA0j18PYn2yRfVXh
 jAQwhocMbv/zPnIyj2AAff8TYR0pSULB2vl3Wm+a2YGKFmeKWs2iJdw9UBbkDrXmo5gg
 tgA2ID8qQeFStLWdxL4E7foPglCIW9ItZncHUTAd+56YeX6gGC/XGllFtX0Oq+gnglfU
 qd4kBPkte1/QPg8DfwAxa/7s+wvKENmCIu4gN+o9wtxqJ0q2U/1qMYK2mi4kfx3bc6UG
 7gxynAvlnDLvTsHtImhh9PhNxiMKYspATHVTl+SwTQqAkeFCAryP+m2PT3xVyptmNbqC
 AdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D65+qbhBiQEHG5+8gyKCqsFmt2IVIgoiw1iwwfSXJMo=;
 b=c7CR/wddgFSZSMXjqiZ3c+hVM5RFbYk6S3XcgL6F5NAVFScnK2KB9AqkcKsmVi16ak
 KK806FIS55zL25UUqH9AQb3YV5RFf7HkbG6EgV97QKq5oxpqOqPuX3uUjO+ac1voDeAY
 28BS/oSNYk/nBJGR4UNAv1A5gyernee2jxxoe0n++K8dJb+uxIUrn0RjwKKO57PbXnO4
 Yv5NWceHLoOr4X4XP97aPkThjDz6A6qRywnTEbAlN2JMsk7HUIdvyrz6WL+dEZj0fLyt
 xYtNbTPJrEt/jVzN+WiGiYC+3Lwe8p1/FBu7jlHzh2mS4sAn4p7rnM6k5MNF8DzenDjM
 EWwA==
X-Gm-Message-State: AOAM532wbl6VuWKP4KwGlblfB2C3kFuHPrmUag/ipUODAQQEhZuX0WQd
 1pnpOVwfvSikEm0kER3zBwbv+xXnTL9ghg==
X-Google-Smtp-Source: ABdhPJyby/J2NoemUptFn9a6OX5xKDgJzKBMb0q8qPWSTnYvhowDcxmUH+MPWh7R9LNYVMdCP6gk0g==
X-Received: by 2002:a17:902:6b07:b0:13e:d5ba:3d8f with SMTP id
 o7-20020a1709026b0700b0013ed5ba3d8fmr31105481plk.32.1634055734165; 
 Tue, 12 Oct 2021 09:22:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/23] target/riscv: Remove dead code after exception
Date: Tue, 12 Oct 2021 09:21:53 -0700
Message-Id: <20211012162159.471406-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have already set DISAS_NORETURN in generate_exception,
which makes the exit_tb unreachable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_privileged.c.inc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 32312be202..a7afcb15ce 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -22,8 +22,6 @@ static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
 {
     /* always generates U-level ECALL, fixed in do_interrupt handler */
     generate_exception(ctx, RISCV_EXCP_U_ECALL);
-    exit_tb(ctx); /* no chaining */
-    ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
 
@@ -60,13 +58,11 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
         post   = opcode_at(&ctx->base, post_addr);
     }
 
-    if  (pre == 0x01f01013 && ebreak == 0x00100073 && post == 0x40705013) {
+    if (pre == 0x01f01013 && ebreak == 0x00100073 && post == 0x40705013) {
         generate_exception(ctx, RISCV_EXCP_SEMIHOST);
     } else {
         generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
     }
-    exit_tb(ctx); /* no chaining */
-    ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
 
-- 
2.25.1


