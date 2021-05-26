Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DEE39238B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:03:15 +0200 (CEST)
Received: from localhost ([::1]:40224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3UY-0000AT-2p
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 20:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FV-0005w8-Mq
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:41 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:33465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FM-0004ZW-7u
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:41 -0400
Received: by mail-pl1-x635.google.com with SMTP id b7so1442531plg.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i9sjalUJzXMjcjyM8v8NrOBCxoHFCzoZhE1tMS09ZS0=;
 b=WA4TJgVcUZnGKzQpqnyNs8o55zSoz4EoSFJwsDFyc+9M7G+G7U7Pol9zOwCPI0Qcll
 7VW5DTCtdTUwADJVf4L0OgdQE20HDeAAEFeHNU6RZjcJGU7VvtdqZbsKkLIzAyIzSCU+
 i2jVEydHwyv2oOdjlbDOPj0g7OJBFvHfnpCFe38YW8WsGnAzY4ZhiTzvHnJO3Bnk3gqR
 LhhHEZOGUIIbovfKg4bEL6r/JoPLjqBmE5PqncFrZuBesykzRzmJc5YMEDTf/Q4Bxkp7
 6O1C/0WkWNEt/KkyW4keL2DEzyY8pRZmBwUDEhJUds39Ik8VSZfrflw6BexlAEzlw/Tq
 tbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i9sjalUJzXMjcjyM8v8NrOBCxoHFCzoZhE1tMS09ZS0=;
 b=bu9krZ0r9WNvUzcc9bJzzFnsbZpZtawwRrHsnEFQRkb24odKao9UohUZSeVFWdmckT
 eHVO9s3RZvQFpik3L3MDTgYzjucJabIkcUdfn0rSQW6lAdV9Z1cyjmByB/HDmR6pZ9HR
 d0KX1n7K7J8wLyqMB+CO9h1PFCZAO0YKSLbyszjtVe+rRrvAncF4ip8rwjh76TPP2Bjn
 Mushe5+Cy9bKw3MIR6ROCjPW72bVoEwsi1gNj/f3Qo1g6lh6kWQkYZXAIcBYP2Vb6ETp
 CudO6oRFiKygZ8s8SSpNlzMq7vRIWhV/6mNWcCYoMX8s7rpwgABtdNnbIAUFH4SMqV6v
 ZyKA==
X-Gm-Message-State: AOAM532cM3tFJv2xX/HjzyuHkefC7VZJmNqMJgWUuq5ZS4C+cG+H+Q1v
 i0XukHO5ATaRnXMwAagZmBVi1KxctIQPjQ==
X-Google-Smtp-Source: ABdhPJw4+WG9bSCD1ZDZdc6GZckPEwwqmtZc6oz9FeM4AxFotQF89PkS69WefCRIGyoYnu2oAEXX8A==
X-Received: by 2002:a17:90a:1fc1:: with SMTP id
 z1mr6448560pjz.183.1622072850773; 
 Wed, 26 May 2021 16:47:30 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/31] cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOps
Date: Wed, 26 May 2021 16:47:02 -0700
Message-Id: <20210526234710.125396-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

VirtIO devices are only meaningful with system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210517105140.1062037-17-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h            | 5 -----
 include/hw/core/sysemu-cpu-ops.h | 9 +++++++++
 hw/core/cpu-sysemu.c             | 5 +++--
 target/arm/cpu.c                 | 2 +-
 target/ppc/cpu_init.c            | 4 +---
 5 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c8d4a8a642..dd3f5f996e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -90,10 +90,6 @@ struct SysemuCPUOps;
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
  * @has_work: Callback for checking if there is work to do.
- * @virtio_is_big_endian: Callback to return %true if a CPU which supports
- * runtime configurable endianness is currently big-endian. Non-configurable
- * CPUs can use the default implementation of this method. This method should
- * not be used by any callers other than the pre-1.0 virtio devices.
  * @memory_rw_debug: Callback for GDB memory access.
  * @dump_state: Callback for dumping state.
  * @dump_statistics: Callback for dumping statistics.
@@ -152,7 +148,6 @@ struct CPUClass {
 
     int reset_dump_flags;
     bool (*has_work)(CPUState *cpu);
-    bool (*virtio_is_big_endian)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 0370ac1519..8fa98bf2a7 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,15 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @virtio_is_big_endian: Callback to return %true if a CPU which supports
+     * runtime configurable endianness is currently big-endian.
+     * Non-configurable CPUs can use the default implementation of this method.
+     * This method should not be used by any callers other than the pre-1.0
+     * virtio devices.
+     */
+    bool (*virtio_is_big_endian)(CPUState *cpu);
+
     /**
      * @legacy_vmsd: Legacy state for migration.
      *               Do not use in new targets, use #DeviceClass::vmsd instead.
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index aa68ca281e..bad7d2cb01 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 bool cpu_paging_enabled(const CPUState *cpu)
 {
@@ -126,8 +127,8 @@ bool cpu_virtio_is_big_endian(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->virtio_is_big_endian) {
-        return cc->virtio_is_big_endian(cpu);
+    if (cc->sysemu_ops->virtio_is_big_endian) {
+        return cc->sysemu_ops->virtio_is_big_endian(cpu);
     }
     return target_words_bigendian();
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index bd623a4961..0111201235 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1948,6 +1948,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
     .legacy_vmsd = &vmstate_arm_cpu,
 };
 #endif
@@ -1991,7 +1992,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
-    cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
     cc->sysemu_ops = &arm_sysemu_ops;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 5121f9cfd4..108e0c6580 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9267,6 +9267,7 @@ static Property ppc_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps ppc_sysemu_ops = {
+    .virtio_is_big_endian = ppc_cpu_is_big_endian,
     .legacy_vmsd = &vmstate_ppc_cpu,
 };
 #endif
@@ -9335,9 +9336,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_core_xml_file = "power64-core.xml";
 #else
     cc->gdb_core_xml_file = "power-core.xml";
-#endif
-#ifndef CONFIG_USER_ONLY
-    cc->virtio_is_big_endian = ppc_cpu_is_big_endian;
 #endif
     cc->disas_set_info = ppc_disas_set_info;
 
-- 
2.25.1


