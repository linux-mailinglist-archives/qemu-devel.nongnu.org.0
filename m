Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EE838F711
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 02:45:24 +0200 (CEST)
Received: from localhost ([::1]:58742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llLCE-0004GU-Vt
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 20:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1llJUf-0006SE-BY; Mon, 24 May 2021 18:56:17 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:47074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1llJUd-00063t-4F; Mon, 24 May 2021 18:56:17 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d20so1095261pls.13;
 Mon, 24 May 2021 15:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7UOaen0v9fpi+6ELlwd0Bu+zOepIwS7irPoRt0OH48U=;
 b=lAeNBatWX33Fto1TTq9DsXVUzaR8km8NItXFQioqIqd+iKaxdwzN+zRc0p/Vo31uM2
 r4taaGkd3PJzbKnD4OQmOxZUrxsFFCSjQQs5P6pZbgW9vqY7T37I0lQxC1WAYg79lYA0
 xUklZUj+YhQaiBfNxltaIIFNPW8UN++JxPi3fxUL56otb/+pSyHPoud3DC+/EB7daQpc
 GmGJNRbO2K1lXc9xY7PsEUco5GhxVcLgDnAKB+NbZsik/bV4hsQcce6mExXk4aXbGdPN
 2o/YXwCEIbs+ryr3zfhpnRbC1DLsIdHFHTwUjfLACCIMNkkNdKdCmfG80V6wHrB0voyw
 QbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7UOaen0v9fpi+6ELlwd0Bu+zOepIwS7irPoRt0OH48U=;
 b=dw6Pp4O9Uo7gW0h/ElJYPiRJkWfYg1PDlpn/4lPzseGVotyXM8BvcM/fjKTF4rAB2G
 ljN+D08RgdTVWESjoxwCv0F9iNn5xeVbk5/LF6QCORJ+xt6VoEUIUvpuKwesfbhmikfJ
 tWUe0PBJD6mEZm7RQqjfhB7pA2z2VTsOpqfCQUtGZcSAatRN1+eOE0msHyxZ3UJYufQi
 QK92AKO8qK3XQRzojm+skaOMFAN2i3WXIqBUXV+4Xk7cri5JqXtPDcfcPwBVWJCcfMbY
 tdG0QCYkWAnNa22KqY1p5WBUE0ufamoRH5C5jaOlpAfwXCCLA5CNnc0+bJzJvBBJNH7X
 yNvg==
X-Gm-Message-State: AOAM533IDch48WdUvp+rlGg/CbjQI1BUiEDbIqS8vsVBsZTtBw9krsbY
 YBOcrDFs8ZoVGKDIPCFWHA4l1sbBbjqgew==
X-Google-Smtp-Source: ABdhPJyf3m1S7lGVWPve/6ZzRU8ey5BNABWE3t2Q31Q4hKeKuZWNN9GECza6hc7p05Eu0lEA9duBYA==
X-Received: by 2002:a17:902:ea84:b029:f0:a36a:489c with SMTP id
 x4-20020a170902ea84b02900f0a36a489cmr27947257plb.38.1621896972664; 
 Mon, 24 May 2021 15:56:12 -0700 (PDT)
Received: from swjoshi-Precision-7920-Tower.hsd1.wa.comcast.net
 ([2601:600:8680:7470:ca3d:eee7:b3e3:ee1c])
 by smtp.gmail.com with ESMTPSA id t1sm12286075pgq.47.2021.05.24.15.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 15:56:12 -0700 (PDT)
From: Swetha Joshi <swethajoshi139@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Adding ifdefs to call the respective routines only when their
 configs are enabled
Date: Mon, 24 May 2021 15:56:08 -0700
Message-Id: <20210524225608.3191809-1-swethajoshi139@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=swethajoshi139@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 24 May 2021 20:44:05 -0400
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


