Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79E86B9C2F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:52:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7rb-0006nC-FI; Tue, 14 Mar 2023 12:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rW-0006dl-3v
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:59 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rU-0002ba-FE
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:57 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 f19-20020a9d5f13000000b00693ce5a2f3eso8743352oti.8
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 09:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kVgmWGGBS3g3g08u5Ikz0Maj9Bf5PK3Kg5I4B2Hm1eU=;
 b=Q1yksMQGMccm4/kJI07WHIV8UxUXixVSinoFjgi8Un4XocUYg9zqfX1Tk/KQo6kqIa
 dB5CqD6VTamQmRxDGIIrpbtfATqxptysb2J+L386F05medyyT8Ljj1/RN0arNtTO12s7
 PlS887nKg6QQ3mPR+Qbd13ECUR8pJAFXQsuap4f5YtlricCI+zvbnMSWYBR359uQiBLg
 8zSKIIxnHq3VIvJAkwakVBQFr/bxBcDL1KVqXPW18ORPd7Ygopsfe4z1AtWx+pGbdiqI
 AfDsFM7yimlyA8qT1kM3mawCb09frXZGgiNp7clBuitmSWyiBIDKBzTJyEHYFJUJ0BzY
 U3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kVgmWGGBS3g3g08u5Ikz0Maj9Bf5PK3Kg5I4B2Hm1eU=;
 b=cdUQ3XHzNOL8c72mOQuIxnW88rtNfwyeD92AvnZipwekbQETs030l8/exFaIzK3vvo
 2K98fQe0qIvnRKmZOLKm4j1qxj6L3JQ0vdT0OheM8ACh9eGhWuJ62Pw/dacXJ3lzewQj
 nxJO/iS2uecaxYJ2iwmatQp9jKtt+RlG4TUAhFlT6IVCrrf3W+sMaNkvliKEtWXxa/0U
 QkES4d/q9Bd5U4sS+KhAP482SYJzmxNZ8C37dug8e6iLLMWkHGU+4f8WNwk8rB6k1nfZ
 qD+mfMQ9YPlElzppshUUPI1urTr/F08UY2j7nHszSBgfLQifRfjbws54gLA7VsTA4Ev9
 FTHw==
X-Gm-Message-State: AO0yUKWrKC80cBBweD0niBf6jT1QIwoW0/7uEpdzkxp6IcHcx/erc3Wj
 Njy2dtaS7N5M6lxaxJoLi42tX3KRwXYnPPioww4=
X-Google-Smtp-Source: AK7set9Z2wUBduJlE9+YpGN7bQOBQDDgX45zXYFRexnypsawNFnKJuPkj31O4bH4nYNnjaFoOgItpw==
X-Received: by 2002:a9d:7206:0:b0:68b:dc52:10f9 with SMTP id
 u6-20020a9d7206000000b0068bdc5210f9mr19720752otj.5.1678812655420; 
 Tue, 14 Mar 2023 09:50:55 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:54 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 20/26] target/riscv: move riscv_cpu_validate_v() to
 validate_misa_ext()
Date: Tue, 14 Mar 2023 13:49:42 -0300
Message-Id: <20230314164948.539135-21-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
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

riscv_cpu_validate_v() consists of checking RVV related attributes, such
as vlen and elen, and setting env->vext_spec.

This can be done during riscv_cpu_validate_misa_ext() time, allowing us
to fail earlier if RVV constrains are not met.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fa1954a850..0d8524d0d9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1027,6 +1027,9 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
 
 static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
 {
+    CPURISCVState *env = &cpu->env;
+    Error *local_err = NULL;
+
     if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
         error_setg(errp,
                    "I and E extensions are incompatible");
@@ -1073,6 +1076,12 @@ static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
             error_setg(errp, "V extension requires D and F extensions");
             return;
         }
+
+        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
     }
 }
 
@@ -1111,7 +1120,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
-    Error *local_err = NULL;
     uint32_t ext = 0;
 
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
@@ -1202,14 +1210,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
     }
 
-    if (cpu->cfg.ext_v) {
-        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
-        if (local_err != NULL) {
-            error_propagate(errp, local_err);
-            return;
-        }
-    }
-
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
         cpu->cfg.ext_zkr = true;
-- 
2.39.2


