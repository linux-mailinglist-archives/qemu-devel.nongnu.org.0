Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE776C5A75
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:33:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf6sp-0006Yp-Rx; Wed, 22 Mar 2023 18:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6so-0006Ya-5t
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:24:38 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6r5-0006Yc-Sn
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:24:37 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-17997ccf711so20966319fac.0
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679523690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cFACebyvsIbJs5TF2lXPvnEUniBbh7t4lGKzaSV/mqU=;
 b=LvJEvc9Utn0doyf5z/zq40NDDZcWwvoSc8dQ9f9QJt52tEylbKHguuNCm/eaVH2tEP
 akHwNUpUt57Mvo+XFs4+uFY/ryXD3EJwyfQrC8TEcrQZf7h3v66rwJmoxuyassq1YlEg
 oT6Ih+dZ6Hgd1KO7TaGAPnRhBujLd5vXHLOYVsPVI/BREruf2SCTRS3zPQXFzd2F87Xs
 NO1TUcWe4mCxWT5GCf49p1weBcwS6wp/VZNNN8eMbthTqZvOVFfuMhpOGXG8WA8eq5u5
 44DRCghzW18jIjg8zErskjQT3G9+00FODiTwIZlQPVo8XSNQxTWiw/ASZCWAzI3qaTVm
 mycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679523690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cFACebyvsIbJs5TF2lXPvnEUniBbh7t4lGKzaSV/mqU=;
 b=I8zt9rziNG2c3kG13YrXd1r2X39b5v6yYynjX9gmRdvvPgrm5G24SaborapDpm3Wqe
 1Jo4gUzF9NLa1ME3iYstYzcn0zo4WfPGewI1SmG1moH6BYKL2j7Tt80k71GQbg51MPEV
 KqV/3u8mD3qXxXexs7O94rNtYZ6zPRo+xKBdq/njxhQPK73K2RAeVTHgc9EnuOei+02E
 6fiJBOn+TpkBgJvs5IJJLUT7HqzA/n1o86WDBnItNFDYBNcOBpNfuFeQbBfdxiWPUtPp
 J3+yKC5Kuh1O9rzRHUwT4NJ4/SC4/OJIHkYG3gXjuVk3+gxpZGdhzc1SUHeoFt62FzT9
 W3Bg==
X-Gm-Message-State: AAQBX9cUsstKXSaOfwEHrD/YASf6QHuMCTytGBRJx1x5kxjqahrW6/OK
 JBEPQWL3P/TgGYqMTKC+np7/+B0+vGC8cRGPBYc=
X-Google-Smtp-Source: AKy350bBl1CcleaGww74kPs6XaQRlmSUP9fZVwirYdZxhXbX8QFZfbj8g4vY22fWlSb4bLWbBlVdvA==
X-Received: by 2002:a05:6870:a111:b0:172:4748:32d9 with SMTP id
 m17-20020a056870a11100b00172474832d9mr970429oae.3.1679523690499; 
 Wed, 22 Mar 2023 15:21:30 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:30 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 22/25] target/riscv: use misa_ext val in
 riscv_cpu_validate_extensions()
Date: Wed, 22 Mar 2023 19:20:01 -0300
Message-Id: <20230322222004.357013-23-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
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

Similar to what we did with riscv_cpu_validate_misa_ext(), let's read
all MISA bits from a misa_ext val instead of reading from the cpu->cfg
object.

This will allow write_misa() to use riscv_cpu_validate_extensions().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ed02332093..0e6b8fb45e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1109,10 +1109,13 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 }
 
 /*
- * Check consistency between chosen extensions. No changes
- * in env->misa_ext are made.
+ * Check consistency between cpu->cfg extensions and a
+ * candidate misa_ext value. No changes in env->misa_ext
+ * are made.
  */
-static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
+static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
+                                          uint32_t misa_ext,
+                                          Error **errp)
 {
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
@@ -1123,12 +1126,12 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
+    if (misa_ext & RVF && !cpu->cfg.ext_icsr) {
         error_setg(errp, "F extension requires Zicsr");
         return;
     }
 
-    if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
+    if ((cpu->cfg.ext_zawrs) && !(misa_ext & RVA)) {
         error_setg(errp, "Zawrs extension requires A extension");
         return;
     }
@@ -1137,13 +1140,13 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zfhmin = true;
     }
 
-    if (cpu->cfg.ext_zfhmin && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zfhmin && !(misa_ext & RVF)) {
         error_setg(errp, "Zfh/Zfhmin extensions require F extension");
         return;
     }
 
     /* The V vector extension depends on the Zve64d extension */
-    if (cpu->cfg.ext_v) {
+    if (misa_ext & RVV) {
         cpu->cfg.ext_zve64d = true;
     }
 
@@ -1157,12 +1160,12 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zve32f = true;
     }
 
-    if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
+    if (cpu->cfg.ext_zve64d && !(misa_ext & RVD)) {
         error_setg(errp, "Zve64d/V extensions require D extension");
         return;
     }
 
-    if (cpu->cfg.ext_zve32f && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zve32f && !(misa_ext & RVF)) {
         error_setg(errp, "Zve32f/Zve64f extensions require F extension");
         return;
     }
@@ -1195,7 +1198,7 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
             error_setg(errp, "Zfinx extension requires Zicsr");
             return;
         }
-        if (cpu->cfg.ext_f) {
+        if (misa_ext & RVF) {
             error_setg(errp,
                        "Zfinx cannot be supported together with F extension");
             return;
@@ -1367,7 +1370,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    riscv_cpu_validate_extensions(cpu, &local_err);
+    riscv_cpu_validate_extensions(cpu, env->misa_ext, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
-- 
2.39.2


