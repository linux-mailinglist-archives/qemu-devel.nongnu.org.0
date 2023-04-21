Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0BB6EAB9D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:28:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqoQ-0002tn-3X; Fri, 21 Apr 2023 09:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnz-0002Qs-TH
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:28:04 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnx-0003uW-CA
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:28:03 -0400
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-38dee9a7795so724138b6e.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682083680; x=1684675680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2BCmuELRJPh5SQX498hmY8SpGq4Krgaf5b8ZbejSLc=;
 b=I/gNfDm9PRV15z6N+RPnRVLc+RNPjb9lLUGEXhCikK0tYw6wu2A4LGrvo4sWcbsRkf
 AJwoStuUuoQ2DtNvGKCFBSgIjXCCcNENNRBrj1WE1zSkcdnIBDzFS5UoSGP0RHGe4v3s
 noRvMQd47dSj+IoeX74KJVDL7+DOA+jUAoyttFYq773mbbTgmz+lrYKqRT+q/A86DzCT
 sXet67VHwNu5w+T5FJ52d7ofRf1TmR6oDRdQ9HTZf7XbROn40iJTi8OIO55SXKfvBNXa
 yZlcfMWCk05fy+ePA9yXR2S1UPITtq8WhiPYVdDF/YCPjWmn0DjBj7OBjQc+d5xBkSex
 gTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682083680; x=1684675680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z2BCmuELRJPh5SQX498hmY8SpGq4Krgaf5b8ZbejSLc=;
 b=BK1VLy0ne7PTpc0DYBdgLPtTHAvgpd+IS9VxIkVI5wDyjLFIaA8X1FxW33pqvO5Lry
 v0N5IOn6lnJmEMdkKgtn2Fl+Zuq7fx2OY6N8AxaWBW5Ql8w2OPj1L+zzalnyOOBD7Wq1
 YeTXt31+/fAlmGpiaqa6+ycOoa5x+6BeJXIvPPu4tbWbnmZv9V6X05cDztU6J8ImhmjG
 Rm1HGpEOzupuV5oM0uoBodGux+ac9DLlKWMLkYBAJzP4YJPSj0APv7tIw2DI1XOUaNK0
 IZLXm97mkfaD9sJ7yUihLlYvbDkk0B3m0Bsx6X3HjEWSpt48XRP0Sr6LhZx56Gv7PGW2
 Nb4A==
X-Gm-Message-State: AAQBX9dohF6PcUxDuNvMtN65WoQtjXtdDn2diLIzzRARIshBsAKzXqTG
 cGVh80M7E6Gz76kcVtU6evClEzan3AJCFC5Z+os=
X-Google-Smtp-Source: AKy350Yuu3nMmxKxnah4dWBFzHvxLEYw/nYb/jHKIHOzdLWH0tbHCXvkg4Xm4MycYNgXhRGQMt9bCw==
X-Received: by 2002:a05:6808:2907:b0:38d:52bb:9f60 with SMTP id
 ev7-20020a056808290700b0038d52bb9f60mr2545706oib.2.1682083679967; 
 Fri, 21 Apr 2023 06:27:59 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 r84-20020acada57000000b003895430852dsm1623359oig.54.2023.04.21.06.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:27:59 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 09/11] target/riscv/cpu.c: validate extensions before
 riscv_timer_init()
Date: Fri, 21 Apr 2023 10:27:25 -0300
Message-Id: <20230421132727.121462-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421132727.121462-1-dbarboza@ventanamicro.com>
References: <20230421132727.121462-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
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

There is no need to init timers if we're not even sure that our
extensions are valid. Execute riscv_cpu_validate_set_extensions() before
riscv_timer_init().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 43635144bd..2d7f0ac785 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1257,13 +1257,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
@@ -1271,6 +1264,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
2.40.0


