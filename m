Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6010C3923A2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:13:21 +0200 (CEST)
Received: from localhost ([::1]:55826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3eK-0002ZY-Cs
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 20:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FO-0005kL-HJ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:34 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FH-0004Vm-QN
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:34 -0400
Received: by mail-pj1-x1035.google.com with SMTP id t11so1714373pjm.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WlyMc+K2Pid/BoobYq2w/tlLCLpXHS9PvnSEDevx2XU=;
 b=hobtuQpRTJhPA00PpqsCUN3Id0E2so7iOrubDvxfKAmb62o3liZXLzdZ2C16L6GS8Y
 Ih0mm51e+CrYL9whnS0qTuEEm/3tO5C9ZFeszEGULqAKnWOATJlDdtCP3BiaOHKxJ5xv
 lJefco8cAdAcVopXy7aFXldH1RvtDY5fx/wNrspX7siY87xjnBYBNAeKanQxyebnbiCj
 qztGzzVC5eaKhcWUlP9fqmbyAgdFNm9q5cxMtVmTBcdBQ+HDENi7/sWXMQuF7zmDhiuP
 pXCj4jmncgqKF03eEbR629nVGQf+pwxTsA68qCgLfgBz9XXex1kZfvcC+T1W9kCUR71m
 hv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WlyMc+K2Pid/BoobYq2w/tlLCLpXHS9PvnSEDevx2XU=;
 b=ADZHsDiccRFB/FqHSNF2b6KOhJO9mhrTIcKSMku9z/hErlI08b2zJe57G1DNhQmC6s
 4tsMnvIKYVTqRf/4VQJdXK+vclQ6Pd9oyjuNrjFbBJfvo5n6XM3KOL3rY7kKBj4di98E
 rOoaKZVfa57ejRPl5gArnJUInN/svVE605kbLaZhC2+U4x5KzzA06JTsUuOxyR2N0hlH
 AdiXxdiD//XH4zClppkBI2pOehPjhE79za0CfFpLxkIr+tCu8Om8ydoF9vz3/E23a8lC
 djhPfYrl4EHIATfNl5AMfPdgwVtwszY61InIJhJR0pnggK3SM/WvLeUGCD8QQA+fNLif
 sikQ==
X-Gm-Message-State: AOAM532Rp7y7bxEv0mC7MBugiOvBZDu9pmKOUZ26DADzhEd4K4xEXjTx
 JdUtyYchthn2GmcnijwVpilmuTVLFrptqQ==
X-Google-Smtp-Source: ABdhPJxspgIMRprSJvrJHkybjP9tl151iqtcbTsg0dkI1LAMFIFnDjyrqhcsVapF3JHj0zGqUhPSXg==
X-Received: by 2002:a17:90a:7306:: with SMTP id
 m6mr6411532pjk.217.1622072846461; 
 Wed, 26 May 2021 16:47:26 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/31] cpu: Directly use get_memory_mapping() fallback handlers
 in place
Date: Wed, 26 May 2021 16:46:56 -0700
Message-Id: <20210526234710.125396-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

No code uses CPUClass::get_memory_mapping() outside of hw/core/cpu.c:

  $ git grep -F -- '->get_memory_mapping'
  hw/core/cpu.c:87:    cc->get_memory_mapping(cpu, list, errp);
  hw/core/cpu.c:439:    k->get_memory_mapping = cpu_common_get_memory_mapping;
  target/i386/cpu.c:7422:    cc->get_memory_mapping = x86_cpu_get_memory_mapping;

Check the handler presence in place and remove the common fallback code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210517105140.1062037-11-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/cpu-common.c | 16 ----------------
 hw/core/cpu-sysemu.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 2aa6b8cffc..9530e266ec 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -66,21 +66,6 @@ CPUState *cpu_create(const char *typename)
     return cpu;
 }
 
-void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
-                            Error **errp)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    cc->get_memory_mapping(cpu, list, errp);
-}
-
-static void cpu_common_get_memory_mapping(CPUState *cpu,
-                                          MemoryMappingList *list,
-                                          Error **errp)
-{
-    error_setg(errp, "Obtaining memory mappings is unsupported on this CPU.");
-}
-
 /* Resetting the IRQ comes from across the code base so we take the
  * BQL here if we need to.  cpu_interrupt assumes it is held.*/
 void cpu_reset_interrupt(CPUState *cpu, int mask)
@@ -304,7 +289,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
     k->has_work = cpu_common_has_work;
-    k->get_memory_mapping = cpu_common_get_memory_mapping;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 931ba46354..aa68ca281e 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -33,6 +33,19 @@ bool cpu_paging_enabled(const CPUState *cpu)
     return false;
 }
 
+void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
+                            Error **errp)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->get_memory_mapping) {
+        cc->get_memory_mapping(cpu, list, errp);
+        return;
+    }
+
+    error_setg(errp, "Obtaining memory mappings is unsupported on this CPU.");
+}
+
 hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                      MemTxAttrs *attrs)
 {
-- 
2.25.1


