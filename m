Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6226C5A50
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:26:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf6pg-0006Ph-4M; Wed, 22 Mar 2023 18:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6pe-0006PD-2a
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:21:22 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6pF-0006Uy-T6
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:21:17 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-17aeb49429eso20574575fac.6
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679523644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x65YaMF/q551T09YOmWRrKe4JEANKzCqnWd/M7vc3rI=;
 b=nS5nrh2I9GGKXGrqgy7Igc35fvh7ozKz2Bts71244kSQDBW6qw717aUXW4++YDMkk6
 rvAbDFLgBLkMcX/cGDRoEJlEQ633uTp5pIIJqa6Vnszul8Ct4b4DeQT9igMNX0UL6My6
 Tg/oyl2P9/TzJgKjQ/97d/6szZS48SU20eYCZUooBZBl9taVww13dqPld19fdYbN11td
 VzGfwbwOLNSb+Wn6pn6qg9oMLAnQfTkNFcDTUzfNLncAQXHJtzFuHN8YpOFrlZkw+Umu
 TQdJLKj5RSU+E47PZjO5MFNhhMxYEzg2kq6ZbnKa5BHjJ4ajQfvqpKOs2foyQOMUXXce
 TK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679523644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x65YaMF/q551T09YOmWRrKe4JEANKzCqnWd/M7vc3rI=;
 b=6ReZsN5jT/hJtbr4ufZoZTksYGDuS2yn8N4JiMAMGUro2O55tQkEURdmeOmmE9PS0y
 Z8Ker/7x2wXr9m4SVl3qEeSBip8aEFp+75Js6FRJgFJSyGn3zKum6VhC7xiWsttuCJ/9
 mrKr6ebhKduMg5S4HW7ZNyQyJk0cibnaGd5dWC68VQ6jXCjBykGR9E+6My1kiO9zoZnO
 75zba3cawrOeS3eQRZS6rRcvGlLGHSpcf6on9hy5pvZy0zNmR4sAOb1gxKJdSX0bCqoe
 Py/3K1vYbYSnSBFcBRVwz7/cWPTXm5n0ya5bRFRs4w+qUiNmbv4FYqmxRjbkI2i/LKMw
 EisA==
X-Gm-Message-State: AAQBX9e59NHc19BNx7d9bmiWAbBhih+cWQpX1ysN92kOoFTK3TUq38FL
 VCD/yTaiNeEiOFDglqrU85qiT8yeUvlbKIFx8kc=
X-Google-Smtp-Source: AK7set8gvnd7PMUqupfUtgPgWjMoih6vfos5yeaqRmzAo7hfFfuT1+EAaGVMgi+N4S6nYEatIL04ew==
X-Received: by 2002:a05:6871:20d:b0:177:ab68:aa9a with SMTP id
 t13-20020a056871020d00b00177ab68aa9amr1033475oad.1.1679523644091; 
 Wed, 22 Mar 2023 15:20:44 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:20:43 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 07/25] target/riscv: move pmp and epmp validations
 to validate_set_extensions()
Date: Wed, 22 Mar 2023 19:19:46 -0300
Message-Id: <20230322222004.357013-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
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

In the near future, write_misa() will use a variation of what we have
now as riscv_cpu_validate_set_extensions(). The pmp and epmp validation
will be required in write_misa() and it's already required here in
riscv_cpu_realize(), so move it to riscv_cpu_validate_set_extensions().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1a298e5e55..7458845fec 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -916,6 +916,15 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     Error *local_err = NULL;
     uint32_t ext = 0;
 
+    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
+        /*
+         * Enhanced PMP should only be available
+         * on harts with PMP support
+         */
+        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
+        return;
+    }
+
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
                             cpu->cfg.ext_a && cpu->cfg.ext_f &&
@@ -1228,16 +1237,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
-        /*
-         * Enhanced PMP should only be available
-         * on harts with PMP support
-         */
-        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
-        return;
-    }
-
-
 #ifndef CONFIG_USER_ONLY
     if (cpu->cfg.ext_sstc) {
         riscv_timer_init(cpu);
-- 
2.39.2


