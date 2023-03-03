Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C96A913F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 07:52:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXzGH-00030j-OX; Fri, 03 Mar 2023 01:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pXzG4-0002zQ-FA
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:51:13 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pXzG1-0001yU-4P
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:51:12 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1720433ba75so2005926fac.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 22:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677826266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sgOOI7JfbiaxIsYqyFar1QsOwyv72kWWDEfoe6yhldw=;
 b=pLnjIhSZA0+gfcKA6DQSFRY595IFkQ8gG/O50ZmohHMR5Mog7B0BEZaq+2XrqmyIW5
 ciVBvssHub9ZDeLUyOKVM97b6kg4/kj5v976v8+F5o0x30xu18Ya5YiDXwkz0YvJZMJI
 /DOeS2ohDq+lssG6P5rBm0pjNmu+vZfjzpfqfH57JnZ755XXpZNWkyHeArLWciQm1suB
 DmuOK1KqGUU+jOQ4GBDRMUvZ043RtarAO3Qu+cIjT6FcXj6/BFCS5xwsYc1fjhiJYKu2
 el19/VZVRwJhcYZ7qNV9iP8giPlbk7nzykfx2GlyDKcQcNcoESFKlN1jwb9/nlr/4FK6
 pCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677826266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sgOOI7JfbiaxIsYqyFar1QsOwyv72kWWDEfoe6yhldw=;
 b=CaeoSMtdh7mPgB5F3MaTJakHJrNfCwM5NBdHXRkqaPZIiymwsmc6lCCGINilxMo5se
 F4EKe06vWP3nsL9rkECSahba0Rvs5PRDz5gi+STcwJdFY7aAlfF1ElmJBdCSYd5E6V1h
 10jaE5fR9vimFq4pOdfyOfXw1URVNdAqn8gElahREoYCIx9hgswmWzoIblgkS00hj3Ui
 n9KgdCLYuCP8qI/cj1C8og07wmUNpWGtU6icao9a+w7s70743AXTqplMuycpFYioiqG1
 J00GIk8NlmUNR3PuvecvOG6zwrQH8kYS7bEnf2SdBwKRmJsj0zXoRDMX8Duo45ADG+VH
 a+pg==
X-Gm-Message-State: AO0yUKUe4ZafHnSeAeXVT60iECfPq2ioDjaDMqP9vph+TS3IqzKS/xZe
 jfY3324ugHKQOeR9lyimzzIbZalgIqMhnQJHxQ0=
X-Google-Smtp-Source: AK7set+jnO+0EBZ+z30zj2mkbRaHh9mCH9X/TipVhClMQbr24O2R4gMnSTqS2XGaerLITswYu2yClA==
X-Received: by 2002:a05:6870:b61b:b0:172:3d65:2e2f with SMTP id
 cm27-20020a056870b61b00b001723d652e2fmr545067oab.14.1677826266111; 
 Thu, 02 Mar 2023 22:51:06 -0800 (PST)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 t4-20020a056870e74400b0017293fa734asm675414oak.48.2023.03.02.22.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 22:51:05 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, alistair.francis@wdc.com,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/2] target/riscv: cpu: Implement get_arch_id callback
Date: Fri,  3 Mar 2023 12:20:54 +0530
Message-Id: <20230303065055.915652-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303065055.915652-1-mchitale@ventanamicro.com>
References: <20230303065055.915652-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oa1-x2e.google.com
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


Implement the callback for getting the architecture-dependent CPU ID ie
mhartid.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0dd2f0c753..467d8467a3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1243,6 +1243,13 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 }
 
 #ifndef CONFIG_USER_ONLY
+static int64_t riscv_get_arch_id(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    return cpu->env.mhartid;
+}
+
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps riscv_sysemu_ops = {
@@ -1297,6 +1304,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &riscv_sysemu_ops;
+    cc->get_arch_id = riscv_get_arch_id;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
-- 
2.34.1


