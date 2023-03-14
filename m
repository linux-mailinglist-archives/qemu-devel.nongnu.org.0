Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581EF6B9C42
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:54:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7ql-0005Oz-HC; Tue, 14 Mar 2023 12:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qj-0005NK-2R
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:09 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qh-0002bO-2e
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:08 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 w21-20020a9d6755000000b00698853a52c7so768264otm.11
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 09:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LzC32kwhNKZwr0ZLWy81R08TnwzFOSQXtssAv+2bDbg=;
 b=E14NW/xGqMs6wPcYWpEW+sY6K6Xyj6B/YETVtHlFNfBhiluZaLqmNVkvnPzZSTV+Mm
 Jv0wt7sYaHSOnuAnK1MbM43WzcNOwWqGIcKAXj+bfrmXfuUzZhXl7n0cVCVVi+p/B/QE
 NWBL4iJtOumJB7L5ZBIUwFOSFWnXRW/IOTETWwFy2MLcBsuyWtRlZovyLBJ1DrMN/mYS
 euDZlxt4ustVcKsUhPFCubVo/bg7l372ImdVGA0hU6TVvVSmmLv9WzhLFX9Zvje7p4qz
 85K7INYDO9mOSgHuEUDuEvg+xvchO09lzuNt3yuAwppnJv2A7XpWf/0A7dACJNJNTHhv
 Ot7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LzC32kwhNKZwr0ZLWy81R08TnwzFOSQXtssAv+2bDbg=;
 b=CTfZD8K+WMJjQeFxORFIaG61d/oWtbNIt+Nfhc0O9ShrSRwlmMUEiOCNC+DiBGwjyo
 uDVEpjWc6cv0nqSOQDZKDWGP6uO0BX/NguT9GVIQ1PbzEDRhP9J7FerR0CbPQGJXuVSh
 fF2enDtedZcZ+SzdbHsKSvQMlvFSdWQDm6XyJEZlFtDTD2PnvJkR6lr/wX9G9kO3e49X
 UaXp7oGOnCTgAP3E0g/y3EW3aXtcry59yn2rHwrsnEVKVM7oAAfK59sqvDSnGWAFl8wz
 9kEbnfLd34Xbx1TYGMmB1mzOT7Tf920/tSi9NN0SZKBJbPlTHg6pKy5j4uLbzrzyNfhb
 5m7A==
X-Gm-Message-State: AO0yUKUhR1S9yntQTKic67rTRRvsfoEuksGwThBy3GbCRE2ySMuDVzpq
 xDwLo5q4VmXlQAKdDYPKKuLC/xA810Dx94mkEvk=
X-Google-Smtp-Source: AK7set/xAcSMxl3cUNrixp1o5UpPXWHvyVHofmVreGpu8e6zrVTRUVmGoMV2gBYic7LK7T8maIml2g==
X-Received: by 2002:a9d:487:0:b0:696:13be:c37a with SMTP id
 7-20020a9d0487000000b0069613bec37amr1684137otm.22.1678812606087; 
 Tue, 14 Mar 2023 09:50:06 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:05 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 04/26] target/riscv: add PRIV_VERSION_LATEST
Date: Tue, 14 Mar 2023 13:49:26 -0300
Message-Id: <20230314164948.539135-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32e.google.com
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

All these generic CPUs are using the latest priv available, at this
moment PRIV_VERSION_1_12_0:

- riscv_any_cpu_init()
- rv32_base_cpu_init()
- rv64_base_cpu_init()
- rv128_base_cpu_init()

Create a new PRIV_VERSION_LATEST enum and use it in those cases. I'll
make it easier to update everything at once when a new priv version is
available.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 8 ++++----
 target/riscv/cpu.h | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 18032dfd4e..1ee322001b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -338,7 +338,7 @@ static void riscv_any_cpu_init(Object *obj)
                                     VM_1_10_SV32 : VM_1_10_SV57);
 #endif
 
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
     register_cpu_props(obj);
 }
 
@@ -350,7 +350,7 @@ static void rv64_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -426,7 +426,7 @@ static void rv128_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV128, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -439,7 +439,7 @@ static void rv32_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..76f81c6b68 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -88,6 +88,8 @@ enum {
     PRIV_VERSION_1_10_0 = 0,
     PRIV_VERSION_1_11_0,
     PRIV_VERSION_1_12_0,
+
+    PRIV_VERSION_LATEST = PRIV_VERSION_1_12_0,
 };
 
 #define VEXT_VERSION_1_00_0 0x00010000
-- 
2.39.2


