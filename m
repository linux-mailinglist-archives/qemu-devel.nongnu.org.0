Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7932691FE0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:38:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTaE-0005OQ-N2; Fri, 10 Feb 2023 08:36:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTaC-0005NZ-Gj
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:36:56 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTaB-0007Tj-2J
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:36:56 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-16346330067so6685473fac.3
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jXRfwgqPQXtMLRzModaF9Vj6x3OpmvfEXDQQUU4La3Q=;
 b=nyphIfK4GZjemvU3PnYrHeZk083jpVJJ/bLQOsO7irAd42kRsteAphrcJgWj2g4zDJ
 ZKsYOqYunmE9LCp0i7D+LCSsnTgrNjgdzKJlEm3PhcUu0cAF+l/J8XwlWK53F6eIp9iA
 7WnY8ImomznOSngNU3W3TRwptBBTClT9AENAgdYmPPdNoXNBwFTXp84PZEk+LAQwnw+b
 bhpMCvrmueKT24NpZsBDd/DP3VxVuByetsFqZNoY94p2joKLWQoGiWbhMfLCSJ8zGyro
 fLQW/aTz8luNfGlM1QEDDKGH1Ms/iCx0pl4QGEb6cBeW+GMFxEUrjDcfKp6hzzAp1vhM
 L4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jXRfwgqPQXtMLRzModaF9Vj6x3OpmvfEXDQQUU4La3Q=;
 b=OtoqtqYE7ERO3Qr3GV7XsnyMO2VGRA3G6nKDCkC8kygL/VNv+JEqOBuORASePUrAb/
 jsxDg3dDCzYoJa/5uHymrCwBXuuUp9fyNBlbZV7ecG+VgcHhNaA53KzhiEUyGdiTSeZZ
 XIR73n9AK0zNgWiw1TTSb0Av7i2IlrnOUj0tFflmildlMpJjJvcMYugS9Cb39Vcir3GF
 ufEvI5NuLuwzgbNt9iKimTzXnybcP/B3Srqm/QR7rthAsNASlLWbO4QYZDu5o089fqId
 YoVLvj0w0qHI7Wom31xddwdFJXirffJitV1f12W55kQ+uLH8r/AGRsOTzY8mPvqqPPkH
 qV0A==
X-Gm-Message-State: AO0yUKXbD4w68VJCPgEswSK6ZY4ELsiHUsT5VE6umOKgtvTaNSL3Osfd
 YvJmK5lPkhFlrjXhpm2KIev/fjf5lkz7LIsu
X-Google-Smtp-Source: AK7set/JZns0jzyjxhX4lqA7ZcIG3ORY+IUfnP2chYo3vbNoh2RDBxWBZCC1IJVAfW809q+6g+Wkww==
X-Received: by 2002:a05:6870:e301:b0:15e:fc5d:a879 with SMTP id
 z1-20020a056870e30100b0015efc5da879mr11398672oad.11.1676036213876; 
 Fri, 10 Feb 2023 05:36:53 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a05687050e400b0014474019e50sm1890570oaf.24.2023.02.10.05.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 05:36:53 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 06/11] target/riscv/cpu.c: error out if EPMP is enabled
 without PMP
Date: Fri, 10 Feb 2023 10:36:30 -0300
Message-Id: <20230210133635.589647-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210133635.589647-1-dbarboza@ventanamicro.com>
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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
---
 target/riscv/cpu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 272cf1a8bf..1e67e72f90 100644
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


