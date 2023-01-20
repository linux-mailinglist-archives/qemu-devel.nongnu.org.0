Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12625675530
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:03:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIr0K-0007NT-QH; Fri, 20 Jan 2023 08:00:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1pIr08-0007Ld-Eg
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:00:19 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1pIr06-0006G3-U1
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:00:12 -0500
Received: by mail-pl1-x630.google.com with SMTP id jm10so5211293plb.13
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 05:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jhhgQogAthhvWskxErYyVviUIAb5WWWhMnae0hKG2Ik=;
 b=HOIZH/ACOEXLZTTM8+6S3ZY5iyO2KC6laUnwk9j6hbmvr2Ix+0FiWMFheVZHpfUAui
 IE3tFtfCDK8DitxjRds16MducHAlrge8eE6NQ1Q3VZjISzv9PouD0kzhtR+Sr3vJAr+R
 ZinlZ2ncCJTxwrNa/uaDv1REP1Y+yhKojrPOT+M5ypbxM7rZcUGOD/f2gqDjxvvYz8hN
 +vwMepS4RU+pp4Oyh1GcmjrXJ91yqiKtwkM5tzDNanDZDocxIET48WtLh1pectsvYVOZ
 ME9SaTQJ+j11Vcfo87ZEy2UKy3cgS6eA2QxekbK2zsylDz+1nUpgBwFY4mlPCSSU1qOq
 ZaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jhhgQogAthhvWskxErYyVviUIAb5WWWhMnae0hKG2Ik=;
 b=NOHha2Yeo9w+ZnM2dOkJfj0hk3b/vmlb39D4EGxTBpNafd1V/r14xV016Iqt9ewPT3
 t1WOkBkCZjbvpO9ryIITjc4Z0x+Hq179U8BGr5YQbCt5CEYnf3KV3f/CilAo1a4SnHQN
 J97SXsdFMHE9XVIYFAxRUOKJyuLL+fQuNPKJu//nQ9QmOOLr8oL5pC3ZJPEcXzt3IeGK
 3UiC666jnF5TlRhe16J3k5CqxIigtNG6lozLZS96bdo9ruPO3k+obakY0gEL4lsY8zZY
 pa8oGNngHXlMoA7fvJHtPMF8+7pl1/5QjJGXVfvb2YKnOxHiR/0+hlqr+JIiJ4gz0n2a
 e2qg==
X-Gm-Message-State: AFqh2kpnP5NHGS9VTMvo36+20AyvgMnhRGTJQKWvtkDJhh8mhuVeLbnj
 L2sFXb65m8Wd7oczQTw32ZF/Rw==
X-Google-Smtp-Source: AMrXdXvpPoNaU1fqtF07PHP8TPU7yAVUqU/At3pTWwuxnt/Wec8mklyC16wBNmEj44jAbCIlFl42kw==
X-Received: by 2002:a17:902:6a89:b0:194:88a3:6e28 with SMTP id
 n9-20020a1709026a8900b0019488a36e28mr15050887plk.51.1674219609223; 
 Fri, 20 Jan 2023 05:00:09 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a170902e5c700b0017f72a430adsm7279610plf.71.2023.01.20.05.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 05:00:08 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 1/4] target/riscv: Update VS timer whenever htimedelta
 changes
Date: Fri, 20 Jan 2023 18:29:47 +0530
Message-Id: <20230120125950.2246378-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120125950.2246378-1-apatel@ventanamicro.com>
References: <20230120125950.2246378-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The htimedelta[h] CSR has impact on the VS timer comparison so we
should call riscv_timer_write_timecmp() whenever htimedelta changes.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 62e6c4acbd..fa17d7770c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3045,6 +3045,8 @@ static RISCVException read_htimedelta(CPURISCVState *env, int csrno,
 static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
                                        target_ulong val)
 {
+    RISCVCPU *cpu = env_archcpu(env);
+
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
@@ -3054,6 +3056,12 @@ static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
     } else {
         env->htimedelta = val;
     }
+
+    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
+        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+                                  env->htimedelta, MIP_VSTIP);
+    }
+
     return RISCV_EXCP_NONE;
 }
 
@@ -3071,11 +3079,19 @@ static RISCVException read_htimedeltah(CPURISCVState *env, int csrno,
 static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
                                         target_ulong val)
 {
+    RISCVCPU *cpu = env_archcpu(env);
+
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
     env->htimedelta = deposit64(env->htimedelta, 32, 32, (uint64_t)val);
+
+    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
+        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+                                  env->htimedelta, MIP_VSTIP);
+    }
+
     return RISCV_EXCP_NONE;
 }
 
-- 
2.34.1


