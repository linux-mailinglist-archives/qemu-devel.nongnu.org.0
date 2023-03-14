Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8596A6B9C2A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:51:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7qw-0005fZ-Vy; Tue, 14 Mar 2023 12:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qv-0005f9-Dn
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:21 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qt-0002r9-Tg
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:21 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 a4-20020a056830008400b0069432af1380so8726296oto.13
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEPTSkB86BpaaFtLEftxltn8EEKuvxXM6fE3vNx61Lo=;
 b=fpWKw43tCsx4KsHBe1RMU0JERuP45w8ETz1ISz01xdUyFhgSDTvfQDChuX8X4wK+ks
 GJQ9qdOtWNYk+aBaUgAbwPKJEnCL70zshRZIEQvADsVwhtskqdhC4KkRnpDsALcWBGoV
 jEcEa9Fecgv+7XR5wq6RGBUA7kvNY2cDo9lXjlXy4bfSkkBcsLhZ1AIzwkQKLFElMBQ1
 u8ppMttpS8/ZynfJkEpI+PZGEkDXo5ENYPwOVzOiIqYac0Ecf3qaulGilyYW7BLHeW3I
 WVOZP7IFFJDqKgDGbVIMmUx29zjgxIxNK+ky5Tjz2AWqfM+5MovbX10a+JnOTSLD7zB3
 KhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEPTSkB86BpaaFtLEftxltn8EEKuvxXM6fE3vNx61Lo=;
 b=LDNrb1k13QNe3XeFrCKvZ3u6JMRIbqmVuY+41Y1LLvPNksibAqu+iQ17jVeRSTF0iZ
 SprYdh3cPn9x2x2pFr2qHDejpadqi8/bpA+aq9XQqXONs1Veu9v09ZJmESrz3OZGW9Rd
 8emY/OnY4LD5dNx9Q10p+zp1Ayl6+BMUJixSGxOFe7yoAt+SUZDMk8YG3dObWzPnpAHo
 oHt8aeCianb+gBLNZpBKJ1Ww9VKa08uXfgbpPK2gKiYlUG8YllHX2qaIQcHY7l2PsQIs
 6uF71h4ChMLKpV084nTLOBFqLhYgqA7XjpYDCwIDMt78RtPafGIkWK0Wiio08SWTKmT3
 VpiA==
X-Gm-Message-State: AO0yUKXCYrabnIT+b8y9R2KquPYNS6tbY/EaZ0VNC08xRMTspx8KDQa+
 IT48BJ8vk2fQY5S4iwHcTa3gocfedm0rYIJuNQs=
X-Google-Smtp-Source: AK7set8/Dv5qXrwIAP4VzTz52mUuIO3F0g5vjQMfVbsVlvpmBlSM0xL1AdLXiSrGtMAB9TUdyNwwlQ==
X-Received: by 2002:a9d:6106:0:b0:693:cb03:e7e8 with SMTP id
 i6-20020a9d6106000000b00693cb03e7e8mr17098118otj.6.1678812618454; 
 Tue, 14 Mar 2023 09:50:18 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:18 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 08/26] target/riscv/cpu.c: validate extensions
 before riscv_timer_init()
Date: Tue, 14 Mar 2023 13:49:30 -0300
Message-Id: <20230314164948.539135-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
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

There is no need to init timers if we're not even sure that our
extensions are valid. Execute riscv_cpu_validate_set_extensions() before
riscv_timer_init().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7458845fec..fef55d7d79 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1237,12 +1237,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-#ifndef CONFIG_USER_ONLY
-    if (cpu->cfg.ext_sstc) {
-        riscv_timer_init(cpu);
-    }
-#endif /* CONFIG_USER_ONLY */
-
     riscv_cpu_validate_set_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -1250,6 +1244,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
 #ifndef CONFIG_USER_ONLY
+    if (cpu->cfg.ext_sstc) {
+        riscv_timer_init(cpu);
+    }
+
     if (cpu->cfg.pmu_num) {
         if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
             cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-- 
2.39.2


