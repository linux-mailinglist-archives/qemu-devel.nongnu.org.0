Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370A569952F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:07:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdwz-0004R7-3e; Thu, 16 Feb 2023 08:05:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwn-0004Kt-5L
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:05:13 -0500
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwl-0002CK-3X
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:05:12 -0500
Received: by mail-oo1-xc33.google.com with SMTP id
 z25-20020a4ad1b9000000b00517affa07c0so201815oor.7
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bzgUQCLPgU6X7MZ2uleR0+KefuKd7NhosDsVObTIs/M=;
 b=PKgnkpGsaShJmPV4MGbZVSEl0sntGgP7dqF4BjeK6h4MGQ1AxqhMaC8Jj7w6GwdNmU
 f1gLVjV7GAOV0e57SvlviBJja4ExO3KcFDK3HJjWkOvktUcmPzRqAhxRc78hPDQ4HFV+
 I5k/YwvtsmBNI9UIuQJJ/17x3C0wypPKh76i0Bgl6Tr5HK1F81EOQW3z0L7SBvCQ6nGB
 ZgcHJZCBzC3yTbTWA5GBBpPYKnEmlba52x8MSEP81amrr6Nzcmdi0KxkMyCwb/o5KjEj
 Tv+0hV7A3IEEYcS07hKP3el1hn7xs4UTGA81W7AlMlvSj6s3UpdAqx2GJlJbl/M1AFPu
 AV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bzgUQCLPgU6X7MZ2uleR0+KefuKd7NhosDsVObTIs/M=;
 b=TGgPosPozclZqgA5mU/kexpqrc6hvK8guS0nvuVdSxjHzI11PODZ+Ojx/DcaoMuhA2
 RzX1QUmfHsnHvGmm8IGKRozlXUIkLAoKroaBY7UTZ7YL+OyzvHUqL5m5mpRJwqH8CSBr
 aReB/rSAHid/IibkUH5S7g974vAjVK7OyhirfkdO+soBsVVffAfsynZKnJ4oXyTEbHl/
 5msFRwgH/H+Jcnnt5pVcUDuffuJDh2nD4GtTUzM9wKedxZ4in22ANPBfM15m6CL/HUIN
 4KRZsQ2FcZWe3qao/io/uyOYBThsojzOGyC3csQZWII3zDAe6GfXvYIfdJnhpuQaBOET
 xrxQ==
X-Gm-Message-State: AO0yUKVjS7z4EItfR07OPqADdVA6NJPKnsK48oPfKQJ/pu18YB0r4qxe
 Gt0K1VScMzwKJKDD94ZYXf+dG0vQY2u3bUsa
X-Google-Smtp-Source: AK7set9AwnQaOt03vuyttS9V2szt4NQqrvgz9uKePE3L5LJ4Z5uKR6Exjtj2xA61PTm1M5jzJdmhsA==
X-Received: by 2002:a4a:d792:0:b0:51a:32b0:9601 with SMTP id
 c18-20020a4ad792000000b0051a32b09601mr2632528oou.4.1676552710066; 
 Thu, 16 Feb 2023 05:05:10 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c74-20020a4a4f4d000000b0051f97e8a1d5sm594315oob.35.2023.02.16.05.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:05:09 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 05/10] target/riscv/cpu.c: error out if EPMP is enabled
 without PMP
Date: Thu, 16 Feb 2023 10:04:39 -0300
Message-Id: <20230216130444.795997-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130444.795997-1-dbarboza@ventanamicro.com>
References: <20230216130444.795997-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc33.google.com
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

Instead of silently ignoring the EPMP setting if there is no PMP
available, error out informing the user that EPMP depends on PMP
support:

$ ./qemu-system-riscv64 -cpu rv64,pmp=false,x-epmp=true
qemu-system-riscv64: Invalid configuration: EPMP requires PMP support

This will force users to pick saner options in the QEMU command line.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e34a5e3f11..4585ca74dc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -925,13 +925,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     if (cpu->cfg.pmp) {
         riscv_set_feature(env, RISCV_FEATURE_PMP);
+    }
+
+    if (cpu->cfg.epmp) {
+        riscv_set_feature(env, RISCV_FEATURE_EPMP);
 
         /*
          * Enhanced PMP should only be available
          * on harts with PMP support
          */
-        if (cpu->cfg.epmp) {
-            riscv_set_feature(env, RISCV_FEATURE_EPMP);
+        if (!cpu->cfg.pmp) {
+            error_setg(errp, "Invalid configuration: EPMP requires PMP support");
+            return;
         }
     }
 
-- 
2.39.1


