Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C1938F864
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:59:52 +0200 (CEST)
Received: from localhost ([::1]:60462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llNIN-0005JF-BK
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1llNHC-0004TS-39; Mon, 24 May 2021 22:58:38 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1llNH3-00047b-2w; Mon, 24 May 2021 22:58:37 -0400
Received: by mail-pg1-x533.google.com with SMTP id 6so21562513pgk.5;
 Mon, 24 May 2021 19:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jit/wPPIC3Z5mpQMOwthL3yURlI1RAkSsp9Z+Zu19vg=;
 b=QQh1Pw8NDTP5yHJrlsTpmBm0SW23k/MOb/zgOApERwehNgz03o95YPcI/i9h538eva
 tgOkaY5X1GOR5GerDuAiUhT6+Wd8mYOK7mdyFb88x/HNpXNTzTzyUVxbLX9ND29xP06P
 5Sc9VYjIGes8X1hKBhIzy+zNx+UsLsyxZ+FyY2EBTu9xAEjSMvK+/4N0owPUZIGNOKYE
 fr5d0r2rrEe5sPQia9J42tytiHXznuYn5ym8rXWFvffTaee8hAMNwnrByW6MRhQBYUa7
 h9rjRVEHcGEfqQMt49h7u93B/BeyWNgySSFQsTbjCOPwXH08pslzTYRLFZmtJmiST4Dr
 SW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jit/wPPIC3Z5mpQMOwthL3yURlI1RAkSsp9Z+Zu19vg=;
 b=Vot/XhceVpAAnCk1ngsUkQsBAqRF03nNzy3TrlcgrAMxPS8DOSs2Tn5Yvsyoswkg/+
 kn3oaeuat9XJ3XEbmOkWJo3iLQXG2Lvwg7ayB8nC9DZkVBuWvvtA5vOuV4XlV1wwhGOr
 zWgrfwk70UNItEb2cKfiUpAGHuEg/Jn5lhuhThyAe6N3FjS+70Ie/YDI/ujK3wQ4QlxO
 GQLdZErRWfeHZwAXbCYJpaUj2lYF5lNtlDwxuB9WS6ywoKMOeuIyzEHIgEkP4seDCdFH
 5ODiBzx1bgklS3K8FYd6uKCIvXvF6+1t0w8AsIuyLRqsSGwCkKAN33N0e1lEsxlFOiFI
 kxEA==
X-Gm-Message-State: AOAM533cNU6+ou6U5UzS2tz27OxUnw8RXkwY6asAIyU+0K5Tc/7YSUuz
 notb9GZWwFU+wX07gaiuEphszAE7QTsROw==
X-Google-Smtp-Source: ABdhPJxiN7uZHoPZsKnoYbCjhtdZH/+7OSgP77pvDFDhvlBxUsSx5WYwAycY8PWqWBbBRGqhjXGZwQ==
X-Received: by 2002:a63:54d:: with SMTP id 74mr16707653pgf.169.1621911507298; 
 Mon, 24 May 2021 19:58:27 -0700 (PDT)
Received: from swjoshi-Precision-7920-Tower.hsd1.wa.comcast.net
 ([2601:600:8680:7470:ca3d:eee7:b3e3:ee1c])
 by smtp.gmail.com with ESMTPSA id 66sm13058608pgj.9.2021.05.24.19.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 19:58:26 -0700 (PDT)
From: Swetha Joshi <swethajoshi139@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH_V3] Adding ifdefs to call the respective routines only when
 their configs are enabled
Date: Mon, 24 May 2021 19:58:23 -0700
Message-Id: <20210525025823.3208218-1-swethajoshi139@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=swethajoshi139@gmail.com; helo=mail-pg1-x533.google.com
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
Cc: qemu-trivial@nongnu.org, Swetha Joshi <swethajoshi139@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Swetha Joshi <swethajoshi139@gmail.com>
---
 target/arm/kvm64.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index dff85f6db9..47a4d9d831 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1403,7 +1403,10 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
     hwaddr paddr;
     Object *obj = qdev_get_machine();
     VirtMachineState *vms = VIRT_MACHINE(obj);
-    bool acpi_enabled = virt_is_acpi_enabled(vms);
+    bool acpi_enabled = false;
+#ifdef CONFIG_ARM_VIRT
+    acpi_enabled = virt_is_acpi_enabled(vms);
+#endif /* CONFIG_ARM_VIRT */
 
     assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
 
@@ -1426,12 +1429,13 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
              */
             if (code == BUS_MCEERR_AR) {
                 kvm_cpu_synchronize_state(c);
-                if (!acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
-                    kvm_inject_arm_sea(c);
-                } else {
+#ifdef CONFIG_ACPI_APEI
+                if (acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
                     error_report("failed to record the error");
                     abort();
                 }
+#endif /* CONFIG_ACPI_APEI */
+                kvm_inject_arm_sea(c);
             }
             return;
         }
-- 
2.25.1


