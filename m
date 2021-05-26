Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992193923C1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:27:23 +0200 (CEST)
Received: from localhost ([::1]:42360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3ru-00053Y-Nl
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 20:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3Fe-00068Q-DI
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:56 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:45010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FQ-0004cn-Ks
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:48 -0400
Received: by mail-pf1-x433.google.com with SMTP id 22so2197247pfv.11
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdKqjgVc8k1VtRKWlpH/KMPYr5BtQruarC7LkdFcPVk=;
 b=In+USBX8lk9SWnWSvkemytgVYNepa+KWAZvv6mBf30hNENUGifkhRd159lPHwW94YB
 4LsZtx2ims+t8EbcRnb8Y9/g4+ifzZPLAcD/yvJVZlTBM/tF3H0dgimqc4zWcakkukaC
 IuslW6IwXm+f6ZhjzQBgYfwPtaAOoiW30mr+clp+kzjKRT8uXv2yYyWVzSSbloVfrEBt
 1aUyMEhyX8iM8e3LYs8NFa2tHrtoZl+pLSw4NalhzcGEWq7VmD04nIx27Yvrr6ZTo/bs
 YiX7/eWq5TgJI5ecmx3dp7wVK87AQK3jpa1p4Pwddhkx1/sdlOcgqsRA7KKpjcCYQ15D
 DwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdKqjgVc8k1VtRKWlpH/KMPYr5BtQruarC7LkdFcPVk=;
 b=b6YOtl1iXjBKrjsuGfnyo7+39qCiHFFgvLoxbJ9gx6h69/OgMDa6TAfWkg+cJGR69F
 BJuVfeXCketjBomA5JMeYtpuKEThcGKvrGS7FBf2MTyVk6hHIyi+creZaLjgC1qQDRSb
 sIyg/etkbI4mzRkkJdu2E0PRV8Ng5BV+ZUEgPRMLUy27tfXOx3Fymx01c/4AqK4Sbxtr
 ARbkpCoqvRbMassLZgmiP5tIIKAT8XGUlAnxHQBvQifNXslkQsSr44U5LAywC5bTZFaj
 1u0jcWziTwOJ9b6pqTSjUkrMb5EXiks/s4Nwyh7MJkcBj/zJAk85PZ31usukWtZW2c9O
 KVKQ==
X-Gm-Message-State: AOAM532G8XfhPJgTLO+NKOnQ7T/s/WYG+oT9uaHQgQmsS9bKh2bdqqCP
 v9d3eb/BqmZP/FvgQHyDfcCGMKLgNw6gQQ==
X-Google-Smtp-Source: ABdhPJzeokOViVnNm7JQx5J+9NNfSScbBbkr1iL/2GYStruIijDkf8thkp6ULQP8sKXC/JIkMzvsMw==
X-Received: by 2002:a65:4608:: with SMTP id v8mr977154pgq.435.1622072855215;
 Wed, 26 May 2021 16:47:35 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/31] cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps
Date: Wed, 26 May 2021 16:47:07 -0700
Message-Id: <20210526234710.125396-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210517105140.1062037-22-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h            | 3 ---
 include/hw/core/sysemu-cpu-ops.h | 5 +++++
 hw/core/cpu-sysemu.c             | 4 ++--
 target/i386/cpu.c                | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 405d1f367f..4f6dd24112 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -95,7 +95,6 @@ struct SysemuCPUOps;
  * @dump_statistics: Callback for dumping statistics.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
  * @get_paging_enabled: Callback for inquiring whether paging is enabled.
- * @get_memory_mapping: Callback for obtaining the memory mappings.
  * @set_pc: Callback for setting the Program Counter register. This
  *       should have the semantics used by the target architecture when
  *       setting the PC from a source such as an ELF file entry point;
@@ -139,8 +138,6 @@ struct CPUClass {
     void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
     bool (*get_paging_enabled)(const CPUState *cpu);
-    void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
-                               Error **errp);
     void (*set_pc)(CPUState *cpu, vaddr value);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 1f249e0f06..213e5287ab 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,11 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @get_memory_mapping: Callback for obtaining the memory mappings.
+     */
+    void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
+                               Error **errp);
     /**
      * @get_phys_page_debug: Callback for obtaining a physical address.
      */
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index b31c33ad2b..3850fcb27f 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -39,8 +39,8 @@ void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->get_memory_mapping) {
-        cc->get_memory_mapping(cpu, list, errp);
+    if (cc->sysemu_ops->get_memory_mapping) {
+        cc->sysemu_ops->get_memory_mapping(cpu, list, errp);
         return;
     }
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index de212a939d..d400feec8f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6718,6 +6718,7 @@ static Property x86_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .get_memory_mapping = x86_cpu_get_memory_mapping,
     .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
@@ -6756,7 +6757,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->get_paging_enabled = x86_cpu_get_paging_enabled;
 
 #ifndef CONFIG_USER_ONLY
-    cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
-- 
2.25.1


