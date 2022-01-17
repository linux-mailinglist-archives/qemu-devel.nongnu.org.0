Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C784909F0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 15:07:40 +0100 (CET)
Received: from localhost ([::1]:36464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Sfb-000667-5M
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 09:07:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5C-0001Gr-2z
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:30:02 -0500
Received: from [2607:f8b0:4864:20::52d] (port=44730
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S58-0000ev-Ox
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:30:01 -0500
Received: by mail-pg1-x52d.google.com with SMTP id h23so10886926pgk.11
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 05:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zQ+e6HEHagLV+ugP0Jg7+hNrvuiefpptJOptkFpBlzE=;
 b=tShLP9kHsH9UirMtkmYzCQRf15t8aMev8X0SWxW2VfRjWrMaYLgMW+dYhN1VWzxWUy
 KrIe2kTXU2GDhRYPc/hXM8wL8dHz6ZldSrmYzbH16qPZHH0bJfipl1gO6Q042IH+MrdL
 I+E7jmGke/iiAo8i9fKf5tTEJ3IYJLiYY3dwl2Ts24gdspyXQeATfqbANLJSEkUh6F6b
 81v+1O6Xb+FE/2SThPP0GJch5JlbWheHH5Rl3BBrGxpKKmfa9VWt1Yr5RgTj2G2VfFEz
 IgFhCLSm2JcPl1QJSyDJf/JSJrN7DXyaPvQHZ0WwAUgMM+ox0wRrrv1rE0cLDkFrfE0M
 PlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zQ+e6HEHagLV+ugP0Jg7+hNrvuiefpptJOptkFpBlzE=;
 b=y/6bvbf/Ds8tY5e+mjnW9Wo1TYgeMSuCyVxeu7ctCo1Y7VeDa7UcZPmyzSgC3mKIos
 PRUNrHpLTOUk9YYHgO/lObXNXfLT25/AI1jrVF5qgkzVwT5r+Fy1PiX9a3cgpzBUfDJl
 wjWAQ8dTgt40nUaI+vxwq1Ne1Cmkx3yEL/ELJDKBx5HdW9dUxqaLCh1Y8BidTxO/xGxw
 1XAgF6v7u2BheiDpENeuJzDoN2n+FYO00Xt9RHqlh7U5ebSZ8m8+lcAkdEbY8HsxsxjN
 gLXQXpcb+VVG9vjiD8sM93tJMJLY0ebQFr/dz2YdEcRJ0YHDwSnolr047+Putz9Q/30w
 HryA==
X-Gm-Message-State: AOAM5324rzPqQJ9XTDXN5aH5G6UJAEvgxVhv7alesPriIVwJ3TcxD2oE
 pvvzbu6icmjeRn6FWnkCa+LZoQ==
X-Google-Smtp-Source: ABdhPJz3kxKCqXGgxyd7wFwu+f5qcLjHqNsiNubycDmJ9yiITQClouJVeFIx4I48vY0bbPdxV8JnZg==
X-Received: by 2002:a63:101:: with SMTP id 1mr3810041pgb.252.1642426175114;
 Mon, 17 Jan 2022 05:29:35 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:29:34 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v7 05/23] target/riscv: Allow setting CPU feature from
 machine/device emulation
Date: Mon, 17 Jan 2022 18:58:08 +0530
Message-Id: <20220117132826.426418-6-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52d;
 envelope-from=anup@brainfault.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

The machine or device emulation should be able to force set certain
CPU features because:
1) We can have certain CPU features which are in-general optional
   but implemented by RISC-V CPUs on the machine.
2) We can have devices which require a certain CPU feature. For example,
   AIA IMSIC devices expect AIA CSRs implemented by RISC-V CPUs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 11 +++--------
 target/riscv/cpu.h |  5 +++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6afb38f9b7..76f9786836 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -133,11 +133,6 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
     env->vext_ver = vext_ver;
 }
 
-static void set_feature(CPURISCVState *env, int feature)
-{
-    env->features |= (1ULL << feature);
-}
-
 static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
 {
 #ifndef CONFIG_USER_ONLY
@@ -459,18 +454,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     if (cpu->cfg.mmu) {
-        set_feature(env, RISCV_FEATURE_MMU);
+        riscv_set_feature(env, RISCV_FEATURE_MMU);
     }
 
     if (cpu->cfg.pmp) {
-        set_feature(env, RISCV_FEATURE_PMP);
+        riscv_set_feature(env, RISCV_FEATURE_PMP);
 
         /*
          * Enhanced PMP should only be available
          * on harts with PMP support
          */
         if (cpu->cfg.epmp) {
-            set_feature(env, RISCV_FEATURE_EPMP);
+            riscv_set_feature(env, RISCV_FEATURE_EPMP);
         }
     }
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index df4e7d490e..2c04826496 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -356,6 +356,11 @@ static inline bool riscv_feature(CPURISCVState *env, int feature)
     return env->features & (1ULL << feature);
 }
 
+static inline void riscv_set_feature(CPURISCVState *env, int feature)
+{
+    env->features |= (1ULL << feature);
+}
+
 #include "cpu_user.h"
 
 extern const char * const riscv_int_regnames[];
-- 
2.25.1


