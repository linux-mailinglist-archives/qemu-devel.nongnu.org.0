Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D03A53986C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 23:10:02 +0200 (CEST)
Received: from localhost ([::1]:38110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw97p-0002w1-BP
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 17:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abrestic@rivosinc.com>)
 id 1nw93s-0000Ni-LP
 for qemu-devel@nongnu.org; Tue, 31 May 2022 17:05:58 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:36480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <abrestic@rivosinc.com>)
 id 1nw93q-0005m8-Rz
 for qemu-devel@nongnu.org; Tue, 31 May 2022 17:05:56 -0400
Received: by mail-qk1-x735.google.com with SMTP id l82so14151193qke.3
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 14:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ye8xCwyuZUSR5LAVXT9k7eRWTSq5Jn5Xg6V04rS1bxY=;
 b=pQdjwUHfXY8jjcS/x2lDcY3HS3HcVIILZGUwXWfWctWocQEd0frI13IP+hJdZxJjES
 MLFKCUS/2bPWZvrhLmGQ9ARSw2s+fd/VUbWiHAXasJME7KsgtsI2t+POA0y5K0DyJaIU
 grQijTXlRzjp4epnuO6Ae34tb6J4AcZ4lr+4sy479Qz2oQ7DUpQATjDAgM/wvfmZJXH8
 h7goe8uasmiAeIBDmG0pxgOAPHZztQNx7n7Ee8qfoxkLKg1VPBu2uqbjpfY0U6kbN6a0
 JpHljRx7Q1cihSL6qQnB4Xrq/ehQHdIPCF4BJfm7Lmaeyk26DGFfPo+S1vYYG9steM1M
 iYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ye8xCwyuZUSR5LAVXT9k7eRWTSq5Jn5Xg6V04rS1bxY=;
 b=HCfRFsXKMshwczyXULM8c3VMPNYalxvDrmSHcq/tHnfAsO6hYmwWMtK/yS84sWPbAI
 S1yDAEteGTyCRBXPorJPoMP5GTIVVJmvUfyPU11kDqHpdJcn1oMJpv0IfsGUWZ6paQy1
 6DCBdQyDbljMSgunG0Fm3fylFZz2eSg58XTgs9DefLq+8x2zEOGEaUJaExjuvWEdHWmt
 bNkbxCxsPFwMkKV9YdlIeaKJ7WK2klo+B9AXQ+5QdQFaT7k1pAmgtzBczJn5lZuOyFFI
 YrW0XcBcXdGDLcgtoynnS19JqekgfwzPjrz2dpIvw/xiMckJGpb4WFHrSYEKmogXoldg
 jtKQ==
X-Gm-Message-State: AOAM531A3rM5kTPIl6FS9ddH6se+JnwIJc2Brqy6taLUqGlcOswSjgra
 SmLYn0eCp9QeBTDWwMnEkLOljA==
X-Google-Smtp-Source: ABdhPJws7NR+1rheyH5eJQBga7NsgVjQwsI7qBi+2lKx7BWnn+0D0g0bhSvFyIstzvJq5uCWVzq5cA==
X-Received: by 2002:a37:a1c1:0:b0:6a3:4139:1397 with SMTP id
 k184-20020a37a1c1000000b006a341391397mr38775183qke.443.1654031152711; 
 Tue, 31 May 2022 14:05:52 -0700 (PDT)
Received: from abrestic-xps.ba.rivosinc.com ([71.247.37.191])
 by smtp.gmail.com with ESMTPSA id
 c13-20020ac8054d000000b002f3e127be41sm9457674qth.20.2022.05.31.14.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:05:52 -0700 (PDT)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH] target/riscv: Wake on VS-level external interrupts
Date: Tue, 31 May 2022 17:05:44 -0400
Message-Id: <20220531210544.181322-1-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=abrestic@rivosinc.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Whether or not VSEIP is pending isn't reflected in env->mip and must
instead be determined from hstatus.vgein and hgeip. As a result a
CPU in WFI won't wake on a VSEIP, which violates the WFI behavior as
specified in the privileged ISA. Just use riscv_cpu_all_pending()
instead, which already accounts for VSEIP.

Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
---
 target/riscv/cpu.c        | 2 +-
 target/riscv/cpu.h        | 1 +
 target/riscv/cpu_helper.c | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a91253d4bd..c6cc08c355 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -391,7 +391,7 @@ static bool riscv_cpu_has_work(CPUState *cs)
      * Definition of the WFI instruction requires it to ignore the privilege
      * mode and delegation registers, but respect individual enables
      */
-    return (env->mip & env->mie) != 0;
+    return riscv_cpu_all_pending(env) != 0;
 #else
     return true;
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f08c3e8813..758ab6c90b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -488,6 +488,7 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero);
 uint8_t riscv_cpu_default_priority(int irq);
+uint64_t riscv_cpu_all_pending(CPURISCVState *env);
 int riscv_cpu_mirq_pending(CPURISCVState *env);
 int riscv_cpu_sirq_pending(CPURISCVState *env);
 int riscv_cpu_vsirq_pending(CPURISCVState *env);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d99fac9d2d..16c6045459 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -340,7 +340,7 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *env,
     return best_irq;
 }
 
-static uint64_t riscv_cpu_all_pending(CPURISCVState *env)
+uint64_t riscv_cpu_all_pending(CPURISCVState *env)
 {
     uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
     uint64_t vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
-- 
2.25.1


