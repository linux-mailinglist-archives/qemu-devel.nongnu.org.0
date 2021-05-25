Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00D138F83C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:35:38 +0200 (CEST)
Received: from localhost ([::1]:42030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMuv-0000Q4-Uk
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1llMtW-0006Hb-Uj; Mon, 24 May 2021 22:34:10 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:44706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1llMtT-0002d5-GC; Mon, 24 May 2021 22:34:10 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 29so10438871pgu.11;
 Mon, 24 May 2021 19:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7UOaen0v9fpi+6ELlwd0Bu+zOepIwS7irPoRt0OH48U=;
 b=DTodlyh54NPrGIYrXpCFw0MWXyLHHd2pD0qIDyXFPYK0EBADF3XavNv77Pe8CdJmr6
 JL+UZeAvAG+t8yF+9rgZhXQl1n9k4O3lO0p1VZ+SOs/VVuU5IOD+8hIJZgdwU5LvAyki
 P+bnh8M286XGcrsmn3E0gQj5iJ42oKkPlxaU1Hgn9HCDTNgIMZuJ2YtOsBhrtRjVryja
 ZnBYIyVw9/uBJUKM+taZ/2RhbIbTbj2Yv3l/pFUjDslNUqI8+gbXMDhEYc3pdymN8rJ/
 6gRZ+uHFM8dTNdDOmLj3O9u9yKVQUa6JRkbXtJ9WcokP/kPVl6I9RRz5AQ+IqZcnKvP2
 uW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7UOaen0v9fpi+6ELlwd0Bu+zOepIwS7irPoRt0OH48U=;
 b=tZB76+K87NN+exhA0OLzFclYm2BfGZ/DOPmL5Zq/tb08G77nQEeDrXBqIVgCuHntH6
 lOtlG4b7QxYUrXypKdQ47D/0SSkUTHQKzmAtZpkL/uBBRVaGOEhD7aj7q8x03Li8WbI7
 eiBqn9MY6vUgHgCKd7mAyClmnKbyEZ/sK60vlKvFco5CYbbN1FpUYNAXX8e12LY2qKAW
 Ydsp8V8ebHy84c/B/VmlF8SefBrobFubs5+I3UlC0AWoP8dLLhYKD6S0tMR9seARomZL
 mTJgkWe6QWgiQZL+wb6PuARFykVsFyAlUGNf7MYe7JoyBzf2ZyH0lv2Rx3ontzLIseHo
 Fjyg==
X-Gm-Message-State: AOAM532DuSSvUIT/3YJI2memQSBmHxJcz4j2kHFDsn+BtzOGGRQ9hsT/
 2WmDWbXtBYBGB9Dyj/C5sxn8GirDmq9EbQ==
X-Google-Smtp-Source: ABdhPJyAxYhxw/Ccn83rB4A8ONz6Kxkbw1xoggVO242umETppt7uyea9JhHnG32TVLLRf9pqAhsQwA==
X-Received: by 2002:a65:4382:: with SMTP id m2mr16665530pgp.354.1621910043408; 
 Mon, 24 May 2021 19:34:03 -0700 (PDT)
Received: from swjoshi-Precision-7920-Tower.hsd1.wa.comcast.net
 ([2601:600:8680:7470:ca3d:eee7:b3e3:ee1c])
 by smtp.gmail.com with ESMTPSA id u11sm11711107pfk.198.2021.05.24.19.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 19:34:02 -0700 (PDT)
From: Swetha Joshi <swethajoshi139@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH_V2 1/2] Adding ifdefs to call the respective routines only
 when their configs are enabled
Date: Mon, 24 May 2021 19:33:45 -0700
Message-Id: <20210525023346.3206241-1-swethajoshi139@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=swethajoshi139@gmail.com; helo=mail-pg1-x52b.google.com
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
Cc: qemu-trivial@nongnu.org, Swetha <swjoshi@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Swetha <swjoshi@microsoft.com>

Signed-off-by: Swetha <swjoshi@microsoft.com>
---
 target/arm/kvm64.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index dff85f6db9..724ce78265 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1403,7 +1403,10 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
     hwaddr paddr;
     Object *obj = qdev_get_machine();
     VirtMachineState *vms = VIRT_MACHINE(obj);
+    bool acpi_enabled = false;
+#ifdef CONFIG_ARM_VIRT
     bool acpi_enabled = virt_is_acpi_enabled(vms);
+    #endif /* CONFIG_ARM_VIRT */
 
     assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
 
@@ -1426,12 +1429,13 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
              */
             if (code == BUS_MCEERR_AR) {
                 kvm_cpu_synchronize_state(c);
-                if (!acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
-                    kvm_inject_arm_sea(c);
-                } else {
-                    error_report("failed to record the error");
-                    abort();
+#ifdef CONFIG_ACPI_APEI
+                if (acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
+                  error_report("failed to record the error");
+                  abort();
                 }
+#endif /* CONFIG_ACPI_APEI */
+                kvm_inject_arm_sea(c);
             }
             return;
         }
-- 
2.25.1


