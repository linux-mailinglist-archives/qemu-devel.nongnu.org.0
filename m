Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30EE6BFCA3
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 21:08:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdcng-00055V-0c; Sat, 18 Mar 2023 16:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnd-00054R-FS
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:09 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcna-00071F-Ky
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:09 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 p11-20020a9d454b000000b0069d8eb419f9so4292010oti.4
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 13:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x65YaMF/q551T09YOmWRrKe4JEANKzCqnWd/M7vc3rI=;
 b=WDZm6azOn6uOfqOOcJs0lPQuV5/BCwdx0DzFUIoDyS2FJBOqaJeqD9OF9Esk0mJL89
 g5fTSeweyvMUx1qlYudPzwSFnS9qwgB5J8BgBWBipqHhettxypdhbvG7H7ci95+zx4d1
 Y860YAy3mVfxIvm3tVbtV1H3d59RAB2k5ZGtaoNCYXQ5s6irJZMXDoUoHqK3+qW+bwS8
 5C42lDRWCafo7LA62ljYPq9AD0UNxAdz8X0ZqA2/arTzVaVNMlGV3BosGyxckKPl3QxT
 Tj0Q7QsbpRKFDlKA8N9fcPb40sSHyqY+ue4r+dD9wZwOnv2L90TRA00LVtnn6NMKlZnf
 0vYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x65YaMF/q551T09YOmWRrKe4JEANKzCqnWd/M7vc3rI=;
 b=GZQgqXKNbq3j0sL63hKzApGCAcKtB/PfKl+iaH57mz1zX/URu3pU9ljkRKqw6bb0Y3
 G+fUfJE+/jHkIvidlf2DkpbRFOp8aAsVOOOwopNETbpoYZ3dET/AzE6/CtxBwGZ4xx/h
 BLj64jZ5FoKRRB2mzlAYK5h3uCod0mXsesBgwV4j2+uFy1QDnWjCab0eKkDu3AVHF2MY
 d+LrwplqIqIqY6qShDf20AqqLCec94GfjGtAJUAWDPnKQQGDM9BGIWiUOrFrU8NpiRHk
 dY42S42yRVBLKwX2RkXm1aTEqfXHj/LgQrSnPFUyJYoyuqMgUa4W4386KcmOk1CxgeIi
 dq7g==
X-Gm-Message-State: AO0yUKXAA1g03aE9My8iuLS3ZOJs46AxnqqvdUCHNBFqxFM95s2WBGIc
 ubhfpDr5uzfgztbDFAPkprqK6jzO7x9rMUGRz4g=
X-Google-Smtp-Source: AK7set9r843x8X3HshSBomOql/15knkrNkkOzmGnxugOq1ZPIX8wi4LUjotWn4+4RKtpn0uuHEJ4kQ==
X-Received: by 2002:a9d:7412:0:b0:68b:c42c:700e with SMTP id
 n18-20020a9d7412000000b0068bc42c700emr1367903otk.4.1679169902744; 
 Sat, 18 Mar 2023 13:05:02 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:02 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 07/26] target/riscv: move pmp and epmp validations
 to validate_set_extensions()
Date: Sat, 18 Mar 2023 17:04:17 -0300
Message-Id: <20230318200436.299464-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x335.google.com
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


