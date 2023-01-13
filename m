Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC0666944F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 11:37:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGHPo-0003qd-SF; Fri, 13 Jan 2023 05:36:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pGHPm-0003pz-Eh
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 05:36:02 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pGHPk-0008DO-EO
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 05:36:01 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so18452052wms.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 02:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6w8Ag6eL5/CT/oiXQRGy6t76jiF20QyArRcsggBZ8zE=;
 b=kODBHtk9L87c0XeqBxb8QPou7MZc8+N7jtZLhr6fFy99aq3ph0JPTNXWtOfliGMvBk
 WA2IFHl8L4f13CWMvU4dHGjhhAWGLEL15AjbJI6fAbNRGf1dD4RzHoSyKHa/z2OGXFs4
 xDYPBerZsJvWELLWTSWcBlCvYAgbvwhfITke22SE4aN1L4fEEJRe2Qi81bI6xDFL8t0e
 rFtfFDpiZPivRrzqZceDXZOusdE12zJGpj/rahAM7Y64y/3qCwVHj80wV4bEdcxfBnr7
 /mxwSu9kikQIQnbs8ffo+h5yRfP9ja5Jkt2FzRMQjQtBn48z9k7OPF/P8AtK4EWQXwQz
 3hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6w8Ag6eL5/CT/oiXQRGy6t76jiF20QyArRcsggBZ8zE=;
 b=SUtZn/KkGdfdeWDOpTzSIkIn5nSCtFwO5wl34yDt39u2kVqLvq6eEZmFDgzOHUoLR1
 11Jm7U2Pcx3sZ1O0z/1+ap9Xo9N9iUugPHFrNmgeUcj1HYYBiAmmxc1KI5FobFdglljD
 TBKF/Txg9bW8h2Bc8a/iaDCOGA0oIdZ3YjDYYgkYZ67jODBfb5+etdHuyVQjOCag4+MD
 QbgDhHsxb1xQpfmOpe1X2HGp1ijpn8vUO5srYflkXTQ7gdYQLuQdklCvWiuS84nGpE93
 g1WXDVu/Tt5oPu8ngt8eQ3cQF/aBN9L0c4UV2CaQ6j6a4HtOK6dJjlwTPbYWz22jTKnA
 cdig==
X-Gm-Message-State: AFqh2kpupxpk+fu7T/MyPWo75QKqcWd662AjC1sOWmyTV7T3NLciYvtc
 8HN+H8MBzXtP4Ahe76ePGam6W6FCxCHNPk/Q
X-Google-Smtp-Source: AMrXdXtotOFcG4tsndD2gGCIh9dQeBCfDpwGcQ8HvNZbdWGAa6CM+Nd4roH0cfwwRnOc78ToR6AcZA==
X-Received: by 2002:a05:600c:4f55:b0:3cf:7197:e67c with SMTP id
 m21-20020a05600c4f5500b003cf7197e67cmr56632441wmq.25.1673606158915; 
 Fri, 13 Jan 2023 02:35:58 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
 by smtp.gmail.com with ESMTPSA id
 k30-20020a05600c1c9e00b003d9b89a39b2sm27341414wms.10.2023.01.13.02.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 02:35:58 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 1/2] riscv: Pass Object to register_cpu_props instead of
 DeviceState
Date: Fri, 13 Jan 2023 11:34:52 +0100
Message-Id: <20230113103453.42776-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230113103453.42776-1-alexghiti@rivosinc.com>
References: <20230113103453.42776-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

One can extract the DeviceState pointer from the Object pointer, so pass
the Object for future commits to access other fields of Object.

No functional changes intended.

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


