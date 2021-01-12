Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4BA2F2B87
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 10:43:34 +0100 (CET)
Received: from localhost ([::1]:43446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGD7-0004hS-RO
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 04:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzG9n-0002Yj-LE
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:40:09 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzG9i-0006rs-W6
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:40:07 -0500
Received: by mail-pl1-x62d.google.com with SMTP id r4so1093247pls.11
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Yye3Z0qR/c1js4JmmpocTyw61D0G4DW3AiWVdjc/OhI=;
 b=DpLnpRsjHJxs5eLGjKEsN6072EQPi4hMdoafE8z1BPIrqiVnd/QAN34M+xyEuBAy4U
 CIU4gqMU4scLuLAgre92l+FKn0xJuLayUgQVVngdYuA0l5OX16pqP1MA03lvqpX0EvYh
 rJeNj3Xn6aEmABD641icKFlJ5CdnLWJ/r+FadkbRwQUD+wwCmR//adjR1peBDcUe5T9a
 03ioPvhGnd3c9X+LCbCnCSBlAMS6eTVNB/XbsRjA1Os+K3WZxee6rscB/Ubn/XdiKbWH
 2sgl+NV8uJO2fbusm/oPks48tG+Q77Qh92uCOfnMPyk78EWSGv4xcOV6836UOkQ/7yJ5
 dkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Yye3Z0qR/c1js4JmmpocTyw61D0G4DW3AiWVdjc/OhI=;
 b=sU48znGUorycP1F7V4+UzbZbOjMxcOAWL87OTAzKo8mM2qHhCXRaL+u6Eqr9iGka3N
 xhXcrLLJWufIPZn/iiozmyI64eodTvD3xmmonxppJ9k9us3Hn/iNAw6Zz08YBmZl3d1O
 qjomkbhqCq0eqw5c1/pV1rRtEST0IT0GCwXqJ1NvU0wQUoxU/uDDPkM59B4QIsrxAjES
 kRaTluC0mithAJ0oKggNzMvHiAKrq85Vzv+E0AdbP1fJSAIHaRHhHZStahJYwRGy6o47
 S0aHih7U5dHxo+S7ZxpyN8GPQi95djPhta0xS0rvpu2WB8QKgkL0mpDTQyJFUcmgk1+9
 YepA==
X-Gm-Message-State: AOAM530b/8ZRyVW6fO9Y8e5KbOx0o7QcyiBpDaQLVIJGHq1MTsBAdLGD
 5AV5PRc3wV881UmJkUZCsYNVxoqmrfW5fezY
X-Google-Smtp-Source: ABdhPJwLQbLaTJJZ+/OCpIQwrsyCCocs03/w3siSpzydnpRONoc9kUa6tIO7hJsEjJsyVHtxh8aI3g==
X-Received: by 2002:a17:90a:7a8e:: with SMTP id
 q14mr3727909pjf.200.1610444401342; 
 Tue, 12 Jan 2021 01:40:01 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:40:00 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 01/72] target/riscv: drop vector 0.7.1 and add 1.0 support
Date: Tue, 12 Jan 2021 17:38:35 +0800
Message-Id: <20210112093950.17530-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 10 +++++-----
 target/riscv/cpu.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8227d7aea9d..49e78456422 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -379,7 +379,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_11_0;
-    int vext_version = VEXT_VERSION_0_07_1;
+    int vext_version = VEXT_VERSION_1_00_0;
     target_ulong target_misa = env->misa;
     Error *local_err = NULL;
 
@@ -497,8 +497,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                 return;
             }
             if (cpu->cfg.vext_spec) {
-                if (!g_strcmp0(cpu->cfg.vext_spec, "v0.7.1")) {
-                    vext_version = VEXT_VERSION_0_07_1;
+                if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
+                    vext_version = VEXT_VERSION_1_00_0;
                 } else {
                     error_setg(errp,
                            "Unsupported vector spec version '%s'",
@@ -506,8 +506,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                     return;
                 }
             } else {
-                qemu_log("vector verison is not specified, "
-                        "use the default value v0.7.1\n");
+                qemu_log("vector version is not specified, "
+                        "use the default value v1.0\n");
             }
             set_vext_version(env, vext_version);
         }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6339e848192..b0281133e09 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -86,7 +86,7 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
 
-#define VEXT_VERSION_0_07_1 0x00000701
+#define VEXT_VERSION_1_00_0 0x00010000
 
 enum {
     TRANSLATE_SUCCESS,
-- 
2.17.1


