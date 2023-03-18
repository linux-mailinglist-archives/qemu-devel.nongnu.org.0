Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9776BFCA0
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 21:07:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdcnv-0005IW-BD; Sat, 18 Mar 2023 16:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcns-0005HX-OH
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:24 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnr-0006sx-7i
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:24 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 x18-20020a4ae792000000b005376d6c9cfeso1260203oov.3
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 13:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2FfMN5ljB+YprrE4UltRQLz73prfFTbeqKbrs/aENp8=;
 b=KPMtuaDXthd8SdA+kYQt2prhH8g9s8m50l9ezlOG2z6gueaDqX9+tpYL6uaSohkWA7
 HOHq+QPtok/rfmY7gPUdVNqxiPr0bo8l2J4uBELIK8oU/wQQktVnP5CaGmuKjMPOG63Q
 xkZoUTl3UC/dmpj6UdOIyZIfJUURT4m8R5pGUZkp0+Bt77mqEE4wJHESzkFMYqloKK9C
 ZSPtUsPyQYoVfZ0WS16X5D6rV+zSLFzOoXtEzAF0A+Wwdo3tcatBcOCGUp3A0CWHG8G4
 zakgWmGmckW+PvL3/k6YqFjrt2yT0RBOMpwnhUHDukC9PrpX6RJbAbOox8qyzfLxQDSU
 320g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2FfMN5ljB+YprrE4UltRQLz73prfFTbeqKbrs/aENp8=;
 b=suTl4uYCWA6D650xFLjgHXvuhwEvBgVMKJjBd6VY9+Y64FJN6FhRizX/t4SMzvnYdZ
 IdWsuHqBPGVw6V6rR8WHPR8y4dJues9tSud2J4zog1geBfAM8MPrulFuMgicUJ2B5M5Q
 ex3F/KEpztBf/zfrQ9L/ROen8Jty4QtIZ1hLEaveEx8ZALgv/E9wFbD/lRBM9jkJklLl
 kwVRaqmzHpR2t+iYw87NapJcwGQn+7/StduoPWoRRl2TcRSJugZkFfzHm5AQjwXtCWvC
 aCw0NwmtCx2MuwWt4XFkd6uM9hmQ8VcRT17gyH8eS7SLzrEYSzUSJghQbY2BIj7edzZD
 0MDA==
X-Gm-Message-State: AO0yUKWRqhpOD9kM3eDYelqaEIpWm7icE2+6ZzTJ/MR2BsMJ6mNTNRN4
 fDfdBE2oYk1tdBpvxB6WnSmgh0IcFYVFvsVLdgw=
X-Google-Smtp-Source: AK7set+fe0VKVCgwJ7sq6FyibyDxqplXvAi3WC4hAcSpIFNOb9KH9YVMiFYn18jvzxy7iZL7e6jq/A==
X-Received: by 2002:a4a:3350:0:b0:537:f9d4:a44c with SMTP id
 q77-20020a4a3350000000b00537f9d4a44cmr1460552ooq.5.1679169922234; 
 Sat, 18 Mar 2023 13:05:22 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:21 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 14/26] target/riscv: add RVG
Date: Sat, 18 Mar 2023 17:04:24 -0300
Message-Id: <20230318200436.299464-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc31.google.com
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

The 'G' bit in misa_ext is a virtual extension that enables a set of
extensions (i, m, a, f, d, icsr and ifencei). We're already have code to
handle it but no bit definition. Add it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 4 ++++
 target/riscv/cpu.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 28d4c5f768..48ad7372b9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -274,6 +274,9 @@ static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
     if (cfg->ext_j) {
         ext |= RVJ;
     }
+    if (cfg->ext_g) {
+        ext |= RVG;
+    }
 
     return ext;
 }
@@ -293,6 +296,7 @@ static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
     cfg->ext_u = misa_ext & RVU;
     cfg->ext_h = misa_ext & RVH;
     cfg->ext_j = misa_ext & RVJ;
+    cfg->ext_g = misa_ext & RVG;
 }
 
 static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2263629332..dbb4df9df0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -82,6 +82,7 @@
 #define RVU RV('U')
 #define RVH RV('H')
 #define RVJ RV('J')
+#define RVG RV('G')
 
 
 /* Privileged specification version */
-- 
2.39.2


