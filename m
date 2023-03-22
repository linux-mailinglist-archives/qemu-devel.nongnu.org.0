Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6963B6C5A2B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:16:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf6ss-0006at-HI; Wed, 22 Mar 2023 18:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6sq-0006Ys-1s
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:24:40 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6r9-0006WP-J8
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:24:39 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-17671fb717cso20889268fac.8
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679523675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k0FXi0eyw+Va+BGFQKhZGPZaxrdiLszrUzjwuQqzCKk=;
 b=SLAPPUOhrBzHzJPve9b46J0a1QKqnNBVqQkn6/qyLSQYfl7aPvy4gD35+AZwHuPhpb
 01rpYafncwQxuzaUt/T0FaAgBdLWF1NS9y9OCgzzkDxYt8LabU095F98HYGt0fzQf2kT
 gQMhGPiSTli+Sv9IamobIM88xLkadrbtJpJ0lGWbUPG0cvAS1f5xMvdhAwYPTiNkvVIg
 xVTBEDYi3UnpAxw1u1Wuyjmen0NHB0ljCt8tclkBN7MGhWBzoHoM1P5Tw+Nh0uWzRS3g
 Mwr7BDy5hUKv2nkHpM9TIxFMJJIs0Vc2awepGKilhKl1IS+/OEdAqLMSmden/dWM9lEz
 eUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679523675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k0FXi0eyw+Va+BGFQKhZGPZaxrdiLszrUzjwuQqzCKk=;
 b=hm+vA/0mnQyk0CzoWog0wSQWLJFjnhXKNcn4qIhgMpxeUA3Ohs9BW7iy3U3oJgUxK+
 43ESDpSJCiTr8nV5GxiOljUFt0Ho0Pyhgv2FvFe0R8JIgAZl5ivasf5grxpKUm8jZ5p5
 DIKkUzJqxo9ARlErpRyEonG5kxE7fR+bKAKMESOntsTk3jutBKzWu9ZIt65JQAGDJqg3
 McQWhDa3rq9JISvd3LtmI9DhQTTlJvSkMm1C3EM4gr9wbP417TcFaJl9WWA5oK7q/NrQ
 vucbXpYA1s/VcYGp9xqji6aIcJggaPSyItdeVe78/8zfaJM0zT5Xg6Z9hJhzXh1hKrpa
 cf/g==
X-Gm-Message-State: AAQBX9frxQ9QclLJdxGqe0PQKMhvCvVyQ8M+PDBhIG9zZKA9qglG3om0
 cKhUe0XR6cGwbXT1CKKAS+XhA8FtfvQDER4EGpI=
X-Google-Smtp-Source: AK7set8cBE45KvXXKfkGVFFCCQ3Xg1BdaDXigpBJUiMmmc3mpDGj6220tqdQnAFdi9bSjMAyOsBT3w==
X-Received: by 2002:a05:6870:ec89:b0:17a:f5ef:f668 with SMTP id
 eo9-20020a056870ec8900b0017af5eff668mr796713oab.27.1679523675056; 
 Wed, 22 Mar 2023 15:21:15 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:14 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 17/25] target/riscv: move riscv_cpu_validate_v() to
 validate_misa_ext()
Date: Wed, 22 Mar 2023 19:19:56 -0300
Message-Id: <20230322222004.357013-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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

riscv_cpu_validate_v() consists of checking RVV related attributes, such
as vlen and elen, and setting env->vext_spec.

This can be done during riscv_cpu_validate_misa_ext() time, allowing us
to fail earlier if RVV constrains are not met.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f9710dd786..399f63b42f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1018,6 +1018,9 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
 
 static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
 {
+    CPURISCVState *env = &cpu->env;
+    Error *local_err = NULL;
+
     if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
         error_setg(errp,
                    "I and E extensions are incompatible");
@@ -1051,6 +1054,14 @@ static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
         error_setg(errp, "D extension requires F extension");
         return;
     }
+
+    if (cpu->cfg.ext_v) {
+        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
 }
 
 static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
@@ -1088,7 +1099,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
-    Error *local_err = NULL;
     uint32_t ext = 0;
 
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
@@ -1179,14 +1189,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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


