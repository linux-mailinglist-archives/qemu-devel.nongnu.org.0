Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5185568376E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 21:22:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMx7g-000730-Mz; Tue, 31 Jan 2023 15:20:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMx7Q-0006tl-Ck
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:20:40 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMx7N-0002io-75
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:20:38 -0500
Received: by mail-wr1-x435.google.com with SMTP id m7so15349753wru.8
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 12:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ygu0duwWgb07Jo+qlRVPI7Zizkm9Hcw3R3ZaXGJeNaI=;
 b=E22vbgmJzo8I+hieRTSX4rrt4eWDktifyXi5kb04kI+vE5iw8iNwcbwQbqFi/3bHyW
 aD7/uFay6CPtcQ9OrnZ5mM+8l53JU0UvSuRx8ccrpbH3vRBKv25Ah5Tlmx5Cg+wq7cDE
 biAELt3C+cz9bM59i90j6BFgtvfphg8ZcfzrD8yCToPJZtY/OFSpoyGn/XYsmn9h5/RG
 6XjMNe1xobeZ7QHot47WQ084Q5kxh/ITd2VqsXpFNHuKKqaessG0Xzdrss/bJQC+cqr7
 YQz1lW18ZljntBaCHjGLAGIvSk8v8qgvuAnVLT5dRBBdSyyVVNc26U2GZxb2cpxKioj5
 goIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ygu0duwWgb07Jo+qlRVPI7Zizkm9Hcw3R3ZaXGJeNaI=;
 b=p18BYiO5iAzbG8CbKoz6WquSDA4dyAdmp0MQmf7pZD18jzxTQRg+ZLgz1i5iM+w8g+
 av2ncD1dwa3JtPOaF74zoo40aVG0OLvZZWNYfsFsqJhYEryE3k+KvKVmFrX1inFsGN/Z
 a1G6myOlynT15XdeKM408IjiYGbRMx3Qs2I+SwSPRG6SXK+HNRkZgMaB4bQHdHo1Ozph
 fgiyo6y5eolyvTyEdIYAfLGa5KpFpW87uWCX49ijMMyAXs4LJei43U8NABTAgsreGi7Z
 VtVHVUvwjtRHR1hb3t2QbiHLjiWeaFEz+/AVhytyW0hNwFn79S26BCnrWRmngr4Vf8z2
 qChw==
X-Gm-Message-State: AO0yUKUWH1omEg1a0nlzAFe52RVFOY2/Z42rmx9j0cN+E3VnpWEh76ZR
 +TxW0uSHt4b73LrA8a2b456nTzMOhTTVZPrd
X-Google-Smtp-Source: AK7set83x50Wr6OLwouSd9FYtIMUWEF17/WCDZMfbyiKThXFEdQWz+va8GhYtFkHWDw/bmmEH+n4Mw==
X-Received: by 2002:a5d:5047:0:b0:2be:151a:dda0 with SMTP id
 h7-20020a5d5047000000b002be151adda0mr202559wrt.70.1675196436463; 
 Tue, 31 Jan 2023 12:20:36 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 v2-20020adfe282000000b002bdec340a1csm15391977wri.110.2023.01.31.12.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 12:20:35 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v5 12/14] RISC-V: Add initial support for T-Head C906
Date: Tue, 31 Jan 2023 21:20:11 +0100
Message-Id: <20230131202013.2541053-13-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131202013.2541053-1-christoph.muellner@vrull.eu>
References: <20230131202013.2541053-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x435.google.com
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds the T-Head C906 to the list of known CPUs.
Selecting this CPUs will automatically enable the available
ISA extensions of the CPUs (incl. vendor extensions).

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
Changes in v2:
- Drop C910 as it does not differ from C906
- Set priv version to 1.11 (new fmin/fmax behaviour)

Changes in v3:
- Removed setting dropped 'xtheadxmae' extension

Changes in v4:
- Inlcude cpu_vendorid.h in cpu.c instead cpu.h

 target/riscv/cpu.c          | 31 +++++++++++++++++++++++++++++++
 target/riscv/cpu.h          |  1 +
 target/riscv/cpu_vendorid.h |  6 ++++++
 3 files changed, 38 insertions(+)
 create mode 100644 target/riscv/cpu_vendorid.h

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3078556f1b..8cbc5c9c1b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -22,6 +22,7 @@
 #include "qemu/ctype.h"
 #include "qemu/log.h"
 #include "cpu.h"
+#include "cpu_vendorid.h"
 #include "pmu.h"
 #include "internals.h"
 #include "time_helper.h"
@@ -281,6 +282,35 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     cpu->cfg.mmu = false;
 }
 
+static void rv64_thead_c906_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
+    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_priv_version(env, PRIV_VERSION_1_11_0);
+
+    cpu->cfg.ext_g = true;
+    cpu->cfg.ext_c = true;
+    cpu->cfg.ext_u = true;
+    cpu->cfg.ext_s = true;
+    cpu->cfg.ext_icsr = true;
+    cpu->cfg.ext_zfh = true;
+    cpu->cfg.mmu = true;
+    cpu->cfg.ext_xtheadba = true;
+    cpu->cfg.ext_xtheadbb = true;
+    cpu->cfg.ext_xtheadbs = true;
+    cpu->cfg.ext_xtheadcmo = true;
+    cpu->cfg.ext_xtheadcondmov = true;
+    cpu->cfg.ext_xtheadfmemidx = true;
+    cpu->cfg.ext_xtheadmac = true;
+    cpu->cfg.ext_xtheadmemidx = true;
+    cpu->cfg.ext_xtheadmempair = true;
+    cpu->cfg.ext_xtheadsync = true;
+
+    cpu->cfg.mvendorid = THEAD_VENDOR_ID;
+}
+
 static void rv128_base_cpu_init(Object *obj)
 {
     if (qemu_tcg_mttcg_enabled()) {
@@ -1371,6 +1401,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
 #endif
 };
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5cc3011529..60478f4a9c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -53,6 +53,7 @@
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
 #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
+#define TYPE_RISCV_CPU_THEAD_C906       RISCV_CPU_TYPE_NAME("thead-c906")
 #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
 
 #if defined(TARGET_RISCV32)
diff --git a/target/riscv/cpu_vendorid.h b/target/riscv/cpu_vendorid.h
new file mode 100644
index 0000000000..a5aa249bc9
--- /dev/null
+++ b/target/riscv/cpu_vendorid.h
@@ -0,0 +1,6 @@
+#ifndef TARGET_RISCV_CPU_VENDORID_H
+#define TARGET_RISCV_CPU_VENDORID_H
+
+#define THEAD_VENDOR_ID         0x5b7
+
+#endif /*  TARGET_RISCV_CPU_VENDORID_H */
-- 
2.39.1


