Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D47252292
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 23:14:13 +0200 (CEST)
Received: from localhost ([::1]:34380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAgGi-0002Lz-9Q
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 17:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg3G-0007Rd-N6
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:00:18 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:39048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg3D-0001hE-Mq
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:00:18 -0400
Received: by mail-pj1-x1043.google.com with SMTP id j13so119248pjd.4
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 14:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AF5wUNj1rfWDk74W8hKW9/y1FLbHGsX9t+9rRKYsDAE=;
 b=JoxIZUUZWi/kyFj8rG/GieKFHcSqVpadpupd+vXYjFjgJ7oD9HzJq9O4A6sVbmikwU
 K9IfJ/E6Q5bjZM22hHkOTVBggJfkJufWLaGGKa1OVSmxmnZrXdx7rV3Ug0pV1RDIZiUG
 TRm5Xqgy4+A77PZkh5EzFlyvs3DCWf/41iMyS3E61GJYtJYAmt6DNTMVAy97YC+BY7qP
 haXHAuuuS4N1qGTlmT9SpN4w4t/DfkG0zigGXZrxKsT5nYBy5w3wNyDZIYreRzvOLW6N
 /DE4S4gF81G1gcmDTfNwIBNsSQunE/LsePwT8wPT3LDIjrN7NGvuG6PikdrChiSRuABo
 SEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AF5wUNj1rfWDk74W8hKW9/y1FLbHGsX9t+9rRKYsDAE=;
 b=m4+NBinIrgDtlUzJhJ38+IrBxdYu1cJ+aShjvxWroiay+IGHEZ/xFGysApwS5NlWb4
 1/IBOsUtR2P1hooupgUoZQIILGgB7IDirxQzjQ4EQ91tfdpDE+CEhL8O8tEjVtbZn0lx
 OVSF51yQ8BQxFr2hDWH6pccg298wAhyS89mTuX2kZDcRNG7QYnXz9D4w0IrPxYYwmtVE
 6tJtDynuMB9G0jY5c/RdvG8a7wKxfpvONQKgDlIyUWuBDYFYjjaWVCHXyaj/FJrEYOGB
 igWHuqsulPY3OHSYX1pdkJx6gRvkKLwo+i5FyrBWz0S4ml07ttqHsz5nVKxjKPO5vvIP
 PPjg==
X-Gm-Message-State: AOAM532hhHWJFvCc6EA9YpwjUyiaOgsR2FVQNoq1dafw2euBLmhYrkBe
 3cwDHx4fMSlaoyKyuH7RkdM5kB/BIRTWyw==
X-Google-Smtp-Source: ABdhPJx5NJSADve+SF/vMsZcz0coY3c4ey5dkWOsibQinB76dvBEhX9rPzi3gX33pkqPg8YAenNPag==
X-Received: by 2002:a17:90a:fd82:: with SMTP id
 cx2mr3098541pjb.20.1598389213985; 
 Tue, 25 Aug 2020 14:00:13 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id k4sm16074pgr.87.2020.08.25.14.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 14:00:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/77] target/microblaze: Fix width of BTR
Date: Tue, 25 Aug 2020 13:58:50 -0700
Message-Id: <20200825205950.730499-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825205950.730499-1-richard.henderson@linaro.org>
References: <20200825205950.730499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The branch target register is only 32-bits wide.  Do not use a
64-bit type to represent it.  Since cpu_btr is only used during
MSR and MTR instructions, we can just as easily use an explicit
load and store, so eliminate the variable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.h       |  2 +-
 target/microblaze/translate.c | 12 +++++-------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 34177f9b28..72f068a5fd 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -241,7 +241,7 @@ struct CPUMBState {
     uint64_t ear;
     uint32_t esr;
     uint32_t fsr;
-    uint64_t btr;
+    uint32_t btr;
     uint64_t edr;
     float_status fp_status;
     /* Stack protectors. Yes, it's a hw feature.  */
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 3fc2feda3d..a2bba0fe61 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -59,7 +59,6 @@ static TCGv_i32 cpu_pc;
 static TCGv_i32 cpu_msr;
 static TCGv_i64 cpu_ear;
 static TCGv_i32 cpu_esr;
-static TCGv_i64 cpu_btr;
 static TCGv_i64 cpu_edr;
 static TCGv_i32 env_imm;
 static TCGv_i32 env_btaken;
@@ -545,7 +544,8 @@ static void dec_msr(DisasContext *dc)
                                cpu_env, offsetof(CPUMBState, fsr));
                 break;
             case SR_BTR:
-                tcg_gen_extu_i32_i64(cpu_btr, cpu_R[dc->ra]);
+                tcg_gen_st_i32(cpu_R[dc->ra],
+                               cpu_env, offsetof(CPUMBState, btr));
                 break;
             case SR_EDR:
                 tcg_gen_extu_i32_i64(cpu_edr, cpu_R[dc->ra]);
@@ -587,7 +587,8 @@ static void dec_msr(DisasContext *dc)
                                cpu_env, offsetof(CPUMBState, fsr));
                 break;
             case SR_BTR:
-                tcg_gen_extrl_i64_i32(cpu_R[dc->rd], cpu_btr);
+                tcg_gen_ld_i32(cpu_R[dc->rd],
+                               cpu_env, offsetof(CPUMBState, btr));
                 break;
             case SR_EDR:
                 tcg_gen_extrl_i64_i32(cpu_R[dc->rd], cpu_edr);
@@ -1799,8 +1800,7 @@ void mb_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     qemu_fprintf(f, "IN: PC=%x %s\n",
                  env->pc, lookup_symbol(env->pc));
     qemu_fprintf(f, "rmsr=%x resr=%x rear=%" PRIx64 " "
-                 "debug=%x imm=%x iflags=%x fsr=%x "
-                 "rbtr=%" PRIx64 "\n",
+                 "debug=%x imm=%x iflags=%x fsr=%x rbtr=%x\n",
                  env->msr, env->esr, env->ear,
                  env->debug, env->imm, env->iflags, env->fsr,
                  env->btr);
@@ -1868,8 +1868,6 @@ void mb_tcg_init(void)
         tcg_global_mem_new_i64(cpu_env, offsetof(CPUMBState, ear), "rear");
     cpu_esr =
         tcg_global_mem_new_i32(cpu_env, offsetof(CPUMBState, esr), "resr");
-    cpu_btr =
-        tcg_global_mem_new_i64(cpu_env, offsetof(CPUMBState, btr), "rbtr");
     cpu_edr =
         tcg_global_mem_new_i64(cpu_env, offsetof(CPUMBState, edr), "redr");
 }
-- 
2.25.1


