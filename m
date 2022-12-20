Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B46B6521CD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 14:54:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d3l-0004Mx-9P; Tue, 20 Dec 2022 08:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3j-0004MV-Kv; Tue, 20 Dec 2022 08:53:31 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3i-00014U-5b; Tue, 20 Dec 2022 08:53:31 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-12c8312131fso15439943fac.4; 
 Tue, 20 Dec 2022 05:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JLfYbjnmnlceFRofKnXzhe3GkaQmrAEnrSg6xJoLQ44=;
 b=kf8xTQeMNJL/KIz6suYK8IU/tbz41IXXgEg+59up9Jduql92JlQv3rRACukIXHVG21
 O/ZIVESfyyifYHULj0/VNKNwY9kHq8AmrQeawGFc2Qz9LAIUvMcMS2mf80Z2pLzUDrjQ
 HiEVs2xx+kPz+/PtuaF4EzMCaLfmj5+EHAI//FjOKv6icGBDNK0ZFwyyu0Ihbt7qEuX8
 acDq3mLqDFFFPQLeO5u4yHYlIkk6i9sheFdbzIZrIktRg1fHgf6g/DLRVU/MAyS6qLnY
 YlYLBwc8spaiHjzUqkBxjraqgFvB4AyRa4h1KaSAtmt74tlVUH7oBGKgo8QLcx9MNj80
 zg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JLfYbjnmnlceFRofKnXzhe3GkaQmrAEnrSg6xJoLQ44=;
 b=cBHex87hYGk6OKe2CkZUxLDv0zn/u79WPn61NtHGrUI3snB6vzstWA56C+fd/nSRKu
 3IP3gYbTf9jip8ovZgEdSnP8X47JVGXgsnikyvFzSDGYj8lOvI9GsEo5DDLHdZRU1KOQ
 XjJFwfDPsTyqOFqhmpD6QRNPNOHdj1VyiGDTWh0ruV695+QPtGAvEvtPZhPFC4t4d8O3
 xMLwEK5l9GqpWaVKUTkfY8olBc09hLAp5D6iKi4sOk4AX8dSFAwPWlEzzcbqcbv51OGV
 ZBUKzVXN+2k+Cx5O/IeGL6VNhZ0BBXIr54iIdDrGnQsMBiwOUGtfd8eZhSo1t39qqAEU
 aosA==
X-Gm-Message-State: ANoB5pkhfGiWz2SPAOtvOWQoBdIL+PkGaxMq4mUC+XIZWTpuLZT8OObk
 3y9RXJY5LBM0cMtBmo3LjzFRM77pntQ=
X-Google-Smtp-Source: AA0mqf5eL2O7k5jOWq0xGA4KcVXAP1wGDm408s2eWmm7jAdfC1FlItCn6fkSxeVlNtUWMF3WCDYpKA==
X-Received: by 2002:a05:6870:2886:b0:144:b157:ddb3 with SMTP id
 gy6-20020a056870288600b00144b157ddb3mr21047339oab.51.1671544408444; 
 Tue, 20 Dec 2022 05:53:28 -0800 (PST)
Received: from fedora.dc1.ventanamicro.com (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056870898e00b0014474019e50sm5994933oaq.24.2022.12.20.05.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:53:28 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 12/15] hw/ppc/e500: Resolve variable shadowing
Date: Tue, 20 Dec 2022 10:52:48 -0300
Message-Id: <20221220135251.155176-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220135251.155176-1-danielhb413@gmail.com>
References: <20221220135251.155176-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

Assign to the outer variable instead which even saves some code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20221216145709.271940-6-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 53876af866..fee14ff8b3 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -908,7 +908,7 @@ void ppce500_init(MachineState *machine)
     bool kernel_as_payload;
     hwaddr bios_entry = 0;
     target_long payload_size;
-    struct boot_info *boot_info;
+    struct boot_info *boot_info = NULL;
     int dt_size;
     int i;
     unsigned int smp_cpus = machine->smp.cpus;
@@ -963,7 +963,6 @@ void ppce500_init(MachineState *machine)
         /* Register reset handler */
         if (!i) {
             /* Primary CPU */
-            struct boot_info *boot_info;
             boot_info = g_new0(struct boot_info, 1);
             qemu_register_reset(ppce500_cpu_reset, cpu);
             env->load_info = boot_info;
@@ -1263,7 +1262,6 @@ void ppce500_init(MachineState *machine)
     }
     assert(dt_size < DTB_MAX_SIZE);
 
-    boot_info = env->load_info;
     boot_info->entry = bios_entry;
     boot_info->dt_base = dt_base;
     boot_info->dt_size = dt_size;
-- 
2.38.1


