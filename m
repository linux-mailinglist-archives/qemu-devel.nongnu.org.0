Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C536CC969
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 19:37:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phDF6-0008QF-AC; Tue, 28 Mar 2023 13:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phDF2-0008Ke-5C
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:36:16 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phDF0-0005SF-JJ
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:36:15 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-17aceccdcf6so13506079fac.9
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 10:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680024973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NoB6geIo+deBuKwjgIqMS5WPUG4xrppd24DiTg9tyg=;
 b=G+WgUD1qOa9VemkvWmpWxvOvvhao3i+xEUmeGTZcIpKDEtG9SH4hOdwX5e27hysVht
 962aThRNNcF0rnivUMdCBVhyXW6e131bgoojIigYCinEWXHfg1xorMt5T/StzAO80JBZ
 Y66pUJK1wq1/JoBNalVNvevKQlrW6ndfOUG42dJXbzHLTXJfOQ/qMeyxxiqP9IBeD7uI
 gblwrmmPJEQZ4eNArSZ5CCd1o8/Ywwhscge/G5C8sKbAiNW9PjHaE49JztIngCWDqaWm
 GB9KRKQkuAB5VoZ4fXfB0Ta0avyHEYPfN19wv9AwvZ3vt7t5rG7BBJauR/azwAjcfcmW
 SeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680024973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0NoB6geIo+deBuKwjgIqMS5WPUG4xrppd24DiTg9tyg=;
 b=FAQKV1RKWX/Oz0qMvnbjVkkUmwojHx6L90YNQw40BwPT3PK89ZQH+wVfCC4eOMn2rm
 88qFOKhunJMLYsOSBIs9N1VY51SxQCy3aohJqyVyAmbIZZoYLEmPP5Xi27ZEscNDdJgB
 xVZ9+3qx0RN9ha60dYwcoryLfiKf7dLIyAs5jQ/JvDmODvUypi2ipCivUssOwXNnNjiW
 RM57tDTHEMsJ+hWlf0v9t3dEEDggdEJcFWH2CJ64J559+9SY44BNWNp8iJVbvKpDMsoG
 7/4kVffkmKjsuKj0EbJGgHeZKif8HwTGDn4aQYI2XXyhr1Ys86mLkAC0XoPDE8V7zEdG
 jVQQ==
X-Gm-Message-State: AAQBX9e2RW7nMQOiATcVPjXzQYsgzElxvQ1pdfdtqz3AzwsWwmO83PK2
 3XKf/P7AvAGge4FQIlR4YrQQXSpKhIv8wC+qkEo=
X-Google-Smtp-Source: AKy350Yv0fVYYFaHeNNPOMbxyE6+txxu+TR+y80r6PKZj/NVUPHPTWhtgwHoU0zednXS7n9i6wloLA==
X-Received: by 2002:a05:6870:ea84:b0:177:be5e:4532 with SMTP id
 s4-20020a056870ea8400b00177be5e4532mr12052926oap.10.1680024973658; 
 Tue, 28 Mar 2023 10:36:13 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m2-20020a9d6442000000b0069f0a85fa36sm11635654otl.57.2023.03.28.10.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 10:36:13 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 7/9] target/riscv/cpu.c: validate extensions before
 riscv_timer_init()
Date: Tue, 28 Mar 2023 14:35:41 -0300
Message-Id: <20230328173543.431342-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328173543.431342-1-dbarboza@ventanamicro.com>
References: <20230328173543.431342-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
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
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 05878846f9..1a095ce8e3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1197,13 +1197,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-
-#ifndef CONFIG_USER_ONLY
-    if (cpu->cfg.ext_sstc) {
-        riscv_timer_init(cpu);
-    }
-#endif /* CONFIG_USER_ONLY */
-
     riscv_cpu_validate_set_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -1211,6 +1204,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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


