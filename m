Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994316776FF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 10:04:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJskj-0000PV-Q0; Mon, 23 Jan 2023 04:04:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pJskh-0000OR-5n
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 04:04:31 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pJskf-0003Uo-4Y
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 04:04:30 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h16so10065831wrz.12
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 01:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=duFDaakbwIRfk/K0lg2ZD1Dq5YvZUrqFJqMDHNa4J+A=;
 b=7Ojuk0BmAvuxJMGbL2anNJZNnYslIJnYQsJtPkHXcBf5gjGFLDyF2gEHWIDeoVNsuA
 GPNQECBgXkGIAyJLc97Klf0zNZP0a7tYsurIYdP/EGlX4MwsH4RFDh1SaLnkfKFGO0/z
 kDAgO0uuS9AyNWF3CpcrEsLyrex/eLlEX7fku+pcm+R7VfGSujKMytW0iDCBuLVW72fX
 oLu6QU9m2M+aO13TycK/dXaG50R0B9iBHFkUPn02dnSiUNdTsFNIuRXUBOLUZr+n4v82
 cMxKaAvUpBDhi4i9b0rGA/sQ0dw7u/SfF29F8crxWWXrNJc7P/dN8eIOdvYPzMcsJIHs
 q7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=duFDaakbwIRfk/K0lg2ZD1Dq5YvZUrqFJqMDHNa4J+A=;
 b=KBRPvMelgvimBFZx2lfDofrtc/1uAfOfrEjtzKFhgXJ27Xt7hK7J2RRfCWJq20u968
 HZlA51Gd8Ule4EHh6ZKlbvMj3LQKUgaBn6wObdiSJht1BKNfBwNFTps69Ek0ezU2fJE8
 vYGFFXO3xbfBpaDd+yFGK3dmTMtnh4EkmYah5Iw+SgWWxkrL8Vfn5yE+EeLSjUG6w+I3
 G4rgwyM1B4xNErouuNK+agnspnqTEmdnQ8SR7m/s9Ww9Tk4oRwnyx+o/0xPFd26WLNo2
 WNHuQB+dvbyCbDSfPDNbVXrm1Ll5ADuPoi/toc1T/LqWdvHEfA94iXNDaFatU1lUVAN7
 UbEw==
X-Gm-Message-State: AFqh2kpSIoVWyT4I6NUS8U6fSir6BC2JGXqrNiZZPeMWK90/JCX0uB/5
 4IVqszLXOGK4yaToGcxGk/P1NQ==
X-Google-Smtp-Source: AMrXdXtno35GXuCPP2kgqufW+ivWpz6mZ4yJP632wtY1BW1CBowyAAY3RLue1YuiNbfph6dswyLOYQ==
X-Received: by 2002:adf:ec88:0:b0:256:ff7d:2346 with SMTP id
 z8-20020adfec88000000b00256ff7d2346mr21082578wrn.51.1674464667283; 
 Mon, 23 Jan 2023 01:04:27 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a5d4fc9000000b002bbb2d43f65sm2572714wrw.14.2023.01.23.01.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 01:04:27 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v6 1/5] riscv: Pass Object to register_cpu_props instead of
 DeviceState
Date: Mon, 23 Jan 2023 10:03:20 +0100
Message-Id: <20230123090324.732681-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230123090324.732681-1-alexghiti@rivosinc.com>
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

One can extract the DeviceState pointer from the Object pointer, so pass
the Object for future commits to access other fields of Object.

No functional changes intended.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 target/riscv/cpu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cc75ca7667..7181b34f86 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -200,7 +200,7 @@ static const char * const riscv_intr_names[] = {
     "reserved"
 };
 
-static void register_cpu_props(DeviceState *dev);
+static void register_cpu_props(Object *obj);
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 {
@@ -238,7 +238,7 @@ static void riscv_any_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #endif
     set_priv_version(env, PRIV_VERSION_1_12_0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
 }
 
 #if defined(TARGET_RISCV64)
@@ -247,7 +247,7 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 }
@@ -280,7 +280,7 @@ static void rv128_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 }
@@ -290,7 +290,7 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 }
@@ -343,7 +343,7 @@ static void riscv_host_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, 0);
 #endif
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
 }
 #endif
 
@@ -1083,9 +1083,10 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void register_cpu_props(DeviceState *dev)
+static void register_cpu_props(Object *obj)
 {
     Property *prop;
+    DeviceState *dev = DEVICE(obj);
 
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
-- 
2.37.2


