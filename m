Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E958B691FDF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:38:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTa6-0005Ku-Nq; Fri, 10 Feb 2023 08:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTa4-0005KM-50
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:36:48 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTa2-0007UP-H9
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:36:47 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1442977d77dso6664238fac.6
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wAXpoQwNhpHUoubdBZNJ52mEOiSHrBu0KlfiKoXrCOQ=;
 b=o6XiK8fQEHjMoqPgD6KrzT4UaTNdE0mj+6ECb3zH2YYMOyT+H6dqTeLXKcPKaTgGP0
 ppa8h0q4fvcf2+uFYRL/bcO7b+aSlVlI/JBlQggrlXUBHSSE2zs35mhwrzvZtljzY3Oi
 bVPAOSTPRoZrBbVnn3vh+MvSSOENU90iWxWpGDRHiIW7kUuwMWKXWCCs+LOBKtQIi4Mx
 1V8emat8oxdEGriouy5tCyeuXiZqyY2g9lWOF1xR7d7o5DfY8b7+69/yuJQ/8mmxCQls
 /ajodA+l1vQ5VNW5cfAEm2M/aOT81pOqbnRkJ+C7/oF+lZYe8z8wgNYVz42tVuqv9wIT
 D/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wAXpoQwNhpHUoubdBZNJ52mEOiSHrBu0KlfiKoXrCOQ=;
 b=iY/fJuO0e04Xv3tYcK2Lt6d8qAdbnH2cl6HDv/JfHxXUyIy9TWPV6w09ri2E7Pnzcf
 00XOzR/p4xG+dB/xjWQ+YU/+pslSXeB0kV1jJ49AGvtDj0R0hTO8QRr7MO/I6yG2ig3I
 I5kXsXWgjFNFhEc+R3Aon8s6YrM6VFCq0XV5mX5NBsOCmFk9OtT0iMMHiMwtlCNBZ9Ep
 Pns+98eKemIVlhhwhzkDh2/Hz+pv1wp91p+41SVbRRqDX6x9NBWjKuXcc/BtbIRZzi/Y
 dcwts8A35BiyAqbysCbyIhZvsI2S9zO2CDAAXsPiHNWgcgBMd06H8L97XpjSnTtPg8Xn
 PwSw==
X-Gm-Message-State: AO0yUKV68q99BbHuvlYKrwasAJGekvzU89WECaW/RP33/awwK9GZjVwr
 Yt1nBbI5cHtiz1ffoYUiCF6wFTnlyT9qWh1M
X-Google-Smtp-Source: AK7set8LJI0coBHZGvisxWz/yFFTHSIxJ0M4HTYYusjEcq0xiZIslpG0cjtM77J9rIbdE0VMe3GJyA==
X-Received: by 2002:a05:6870:4190:b0:163:a1a3:912b with SMTP id
 y16-20020a056870419000b00163a1a3912bmr9379480oac.56.1676036204963; 
 Fri, 10 Feb 2023 05:36:44 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a05687050e400b0014474019e50sm1890570oaf.24.2023.02.10.05.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 05:36:44 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 02/11] target/riscv: allow users to actually write the MISA CSR
Date: Fri, 10 Feb 2023 10:36:26 -0300
Message-Id: <20230210133635.589647-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210133635.589647-1-dbarboza@ventanamicro.com>
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

At this moment, and apparently since ever, we have no way of enabling
RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
the nuts and bolts that handles how to properly write this CSR, has
always been a no-op as well because write_misa() will always exit
earlier.

This seems to be benign in the majority of cases. Booting an Ubuntu
'virt' guest and logging all the calls to 'write_misa' shows that no
writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
RISC-V extensions after the machine is powered on, seems to be a niche
use.

There is a good chance that the code in write_misa() hasn't been
properly tested. Allowing users to write MISA can open the floodgates of
new breeds of bugs. We could instead remove most (if not all) of
write_misa() since it's never used. Well, as a hardware emulator,
dealing with crashes because a register write went wrong is what we're
here for.

Create a 'misa-w' CPU property to allow users to choose whether writes
to MISA should be allowed. The default is set to 'false' for all RISC-V
machines to keep compatibility with what we´ve been doing so far.

Read cpu->cfg.misa_w directly in write_misa(), instead of executing
riscv_set_feature(RISCV_FEATURE_MISA) in riscv_cpu_realize(), that would
simply reflect the cpu->cfg.misa_w bool value in 'env->features' and
require a riscv_feature() call to read it back.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 1 +
 target/riscv/cpu.h | 1 +
 target/riscv/csr.c | 4 +++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 93b52b826c..69fb9e123f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1197,6 +1197,7 @@ static void register_cpu_props(DeviceState *dev)
 
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
+    DEFINE_PROP_BOOL("misa-w", RISCVCPU, cfg.misa_w, false),
 
     DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
     DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7128438d8e..103963b386 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -498,6 +498,7 @@ struct RISCVCPUConfig {
     bool pmp;
     bool epmp;
     bool debug;
+    bool misa_w;
 
     bool short_isa_string;
 };
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e149b453da..4f9cc501b2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1329,7 +1329,9 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
 static RISCVException write_misa(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (!cpu->cfg.misa_w) {
         /* drop write to misa */
         return RISCV_EXCP_NONE;
     }
-- 
2.39.1


