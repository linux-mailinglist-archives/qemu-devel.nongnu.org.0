Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B8852921
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 12:11:53 +0200 (CEST)
Received: from localhost ([::1]:58296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfiQb-00032e-3L
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 06:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60631)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hfiNS-0001X0-Q5
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 06:08:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hfiNR-0007Rj-M9
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 06:08:38 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43088)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hfiNR-0007Ql-Gb
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 06:08:37 -0400
Received: by mail-pf1-f196.google.com with SMTP id i189so9215915pfg.10
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 03:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=7wvZosJ1yqszSgub/Ojdg6XCIa9KX+av7xHMiaUWf30=;
 b=ukuvRUIvsQ1K3HDsKJKiB/xMenOJfpLdCut4I8F1cM70n7mUoxNQv1sT2F2dDq8Nbf
 682pJwcKD5E6b/8SZDMxxKDP8UVmncZ9TM0sJVBdBqrMZwcvcdQg3FXYoh+vWQItAmGR
 +yjCIPTHsLmIyfaJ/6ZBj97LIJxUxVs7qR9LlECugRkL5cLZpmCgymBDO2FUhtVPJtrY
 oCW/T71zy0rnrhfuViUSAH0XY5M1ZzyCxhm4iByb+EoXlCTUE1jbGVAYB8VgWepoYMq7
 kKpF0h3/oN66ar2CP4e4QgvlYlpHzqD/p0iiR2JkW0IJXyZZ9iP0WZqCedOtS2Mq4FUY
 /ziA==
X-Gm-Message-State: APjAAAX63cEwv3NqmViDcag3DAfiGqI+5Kbvgs5rhdDwkcE8adsoELCu
 +vtZXk9aiQYh/8oe4X6vNz5CJg97miwpFeeM
X-Google-Smtp-Source: APXvYqw5s9vRuR4YZ0jyxqpcxR9Ry0hi4GcUetfhULDhp2REhv8jbhDevzDeoLZJjVvXCpCYeqEfsA==
X-Received: by 2002:a63:3383:: with SMTP id z125mr24262769pgz.8.1561457315890; 
 Tue, 25 Jun 2019 03:08:35 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id y193sm13717005pgd.41.2019.06.25.03.08.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 03:08:35 -0700 (PDT)
Date: Tue, 25 Jun 2019 03:07:58 -0700
Message-Id: <20190625100757.12580-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.196
Subject: [Qemu-devel] [PATCH] RISC-V: Add support for the Zicsr extension
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
Cc: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The various CSR instructions have been split out of the base ISA as part
of the ratification process.  This patch adds a Zicsr argument, which
disables all the CSR instructions.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c | 1 +
 target/riscv/cpu.h | 1 +
 target/riscv/csr.c | 5 +++++
 3 files changed, 7 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index bbad39a337b3..915b9e77df33 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -442,6 +442,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
+    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ba551cd3082c..0adb307f3298 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -224,6 +224,7 @@ typedef struct RISCVCPU {
         bool ext_u;
         bool ext_counters;
         bool ext_ifencei;
+        bool ext_icsr;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index de67741f3648..ff988917b995 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -793,6 +793,7 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
 {
     int ret;
     target_ulong old_value;
+    RISCVCPU *cpu = env_archcpu(env);
 
     /* check privileges and return -1 if check fails */
 #if !defined(CONFIG_USER_ONLY)
@@ -803,6 +804,10 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
     }
 #endif
 
+    /* ensure the CSR extension is enabled. */
+    if (!cpu->cfg.ext_icsr)
+        return -1;
+
     /* check predicate */
     if (!csr_ops[csrno].predicate || csr_ops[csrno].predicate(env, csrno) < 0) {
         return -1;
-- 
2.21.0


