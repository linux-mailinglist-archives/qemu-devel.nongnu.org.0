Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0829540DE73
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:48:06 +0200 (CEST)
Received: from localhost ([::1]:49020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtcL-0006Ej-3G
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLV-0001Nk-PV
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:41 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLQ-0002Sh-IR
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:41 -0400
Received: by mail-pl1-x636.google.com with SMTP id v2so4089346plp.8
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dwPWLEp4Zz1Osmk2eBXqla8Z9DrCfYKS2P2ajgRsNfc=;
 b=N7/sGb/hWpZ5624+O8nYysGBZ1D64df1KE1/KFRWPFcFQyFQAYONjwwXst0Czz1fjx
 IkwLCnq/+FSVyMCDwf7bv6Dk/oUJqXHgRz35KQKrVpmrxJ5tAeq1DGkfRcM+DBQP7nS1
 ddpl2M70dloUToNCkiB6S5mHeNBzMNVjOD5C/l6Ae/H8DqhRqpDMhIbMEtPSMIsr6NA0
 2evABzihJ0c5Yd/GSgLA31DLf0BTcaj8IOrWGEuuHKBa3pGF1/Wt4GjroCuQ26vXuPq1
 bMp7kZTZlpBEiY1bH2M/BGEcib+Z9iXAAWT6PHTpwP+qDwTWqLgVXzHsziVTQqbYxAin
 7Ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dwPWLEp4Zz1Osmk2eBXqla8Z9DrCfYKS2P2ajgRsNfc=;
 b=ZD3Uaz0OVoeJRupO2QSbgvCyQIPwPthbXSCG5KVoizAeEtEkL9o2uLo/LwCqJ0W15n
 1qY7VZwUz+hZZUs9HL5Szhv68O0Dl8uafUvKpuEfGJ+UA0ooH57kUZDbhbE4Y4N95YNK
 kQUphQHpQeZU/Tw1spLA16dCjyFj6oL30Ha4F8idDHz6pD5wp+wRIsoIGc7KHChiRPaJ
 8vnGNO+FCc44rxuQqLGQGXIU6J+pt8/DEvrBMiuzq/vsseC5eZ40kTpODdbbl36iuOq7
 UHUACiVAyVNGlDibSSsWt5pTlAdyYLubQ7UWBKdmsy3wQm28EpvE35qOftbEZL6YGdG2
 +UBA==
X-Gm-Message-State: AOAM530ZzhXJVciP0dZBYTht6Pksp1oSPjXBfRr6LvrojZFq4mUYTSfz
 MoI3iQLwC4o8thX2oih6y+cyCpx80usxFQ==
X-Google-Smtp-Source: ABdhPJxkKzMhvCUwzZli/7HFILEJVa/12GQS4T3gVnuRi34YOmDwuJ2hkT7XBWhC/rSkx0O0paDqxg==
X-Received: by 2002:a17:902:bd42:b0:138:d3ca:c387 with SMTP id
 b2-20020a170902bd4200b00138d3cac387mr5202976plx.51.1631806233885; 
 Thu, 16 Sep 2021 08:30:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/35] target/avr: Restrict has_work() handler to sysemu
Date: Thu, 16 Sep 2021 08:30:01 -0700
Message-Id: <20210916153025.1944763-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict has_work() to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-11-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 5d70e34dd5..6d51f91ca2 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -195,6 +195,7 @@ static const struct SysemuCPUOps avr_sysemu_ops = {
 static const struct TCGCPUOps avr_tcg_ops = {
     .initialize = avr_cpu_tcg_init,
     .synchronize_from_tb = avr_cpu_synchronize_from_tb,
+    .has_work = avr_cpu_has_work,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .tlb_fill = avr_cpu_tlb_fill,
     .do_interrupt = avr_cpu_do_interrupt,
@@ -211,7 +212,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = avr_cpu_class_by_name;
 
-    cc->has_work = avr_cpu_has_work;
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
-- 
2.25.1


