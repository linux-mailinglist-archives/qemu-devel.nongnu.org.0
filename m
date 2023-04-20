Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3796E8DEC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:22:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQTq-00085r-R1; Thu, 20 Apr 2023 05:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTc-0007yu-Tt
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:21:17 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTb-000717-9Y
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:21:16 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-18b5c8c2a49so143993fac.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681982473; x=1684574473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qTEuK/TipxDMuIwEPwLq6RIPLKqwF8JtMA6wZHqbIok=;
 b=JEXD+p9cjJs/qdWQZBsMqhMLr4TtJhYAtH1Q/XBML91muhEhpAvFft5qW8zZuTDvzD
 OGtslE/QMkJ3youHpSZARcgwElJfKdRYr1fq7I8y2U0xyfsjdUYE5x4RD3/U2f8buruI
 ef/ztBkpHWIiNdAxOXWos2fYSoyFRBOwH6lv6NKUdnXxtzuNKaEP9DbwaUmHyF69QXiv
 ARg3SlDFmoFE21nAFSnRAFrDruSXhNdOhWTudrFAyca0kxYxCPu6GZ4QoUaY0O6tQg2h
 VgFdgHm7zFaj0Y9HhMod25yYExQ0TFUvZC+RClzM/9+vcXAb1qrFsEyQcMNqjMqwZ1Zl
 A17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982473; x=1684574473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qTEuK/TipxDMuIwEPwLq6RIPLKqwF8JtMA6wZHqbIok=;
 b=SYWUhY2e3//wUY/f2kdgDvxVBvvEh2v6PUejtcSzqSwgmYfv+0lMb6b4S3nqpbscGa
 ffEgqv3ILPacaCXTNy4nQyxyQoczMvEZlkuopNWiB74kuEWW4lN2/5RC+unYPhE9SP6F
 Y4QOgUXPr+krCwi9OHQN3En5iL/Akw0PQ2KA46DHB99LRBdO2OGoOKz7ygtgPvdHIQwO
 qGQIF1jrgKHrHVEcVg4XaWDmAHCi8Zfc2R6jnLnj534+QsZkjLmhjqpJqCrF6Q3d7tTO
 zXklOjCUpBsXkqzo0q2QEKV2G+dI5vAZx78sESdfU4uSrFXZ9tVZNWBBbrfOZotnVS1j
 ATbQ==
X-Gm-Message-State: AAQBX9coWdeMzXDdmRS+PYAXC04+G+r3gAFhsPZ+c838nu7bMyyWU4Io
 sHz8DiafWKwae+07CviYD4mIDAwYci1fkizfpdY=
X-Google-Smtp-Source: AKy350ZYhePwU0KpXf4JNGSB66fNg6RIS1mcP+acudMhqgCDKhd4dk92w6ZwBeoreDMBYgHwHCa/zw==
X-Received: by 2002:a05:6870:d189:b0:17f:84bb:5a9d with SMTP id
 a9-20020a056870d18900b0017f84bb5a9dmr626018oac.37.1681982473573; 
 Thu, 20 Apr 2023 02:21:13 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a056870e74100b0017280f7d653sm529668oak.35.2023.04.20.02.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 02:21:13 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v7 02/12] target/riscv/cpu.c: remove set_vext_version()
Date: Thu, 20 Apr 2023 06:20:50 -0300
Message-Id: <20230420092100.177464-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420092100.177464-1-dbarboza@ventanamicro.com>
References: <20230420092100.177464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This setter is doing nothing else but setting env->vext_ver. Assign the
value directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index feca13aefb..fed7b467e4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -252,11 +252,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
-static void set_vext_version(CPURISCVState *env, int vext_ver)
-{
-    env->vext_ver = vext_ver;
-}
-
 #ifndef CONFIG_USER_ONLY
 static uint8_t satp_mode_from_str(const char *satp_mode_str)
 {
@@ -834,7 +829,7 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
         qemu_log("vector version is not specified, "
                  "use the default value v1.0\n");
     }
-    set_vext_version(env, vext_version);
+    env->vext_ver = vext_version;
 }
 
 /*
-- 
2.40.0


