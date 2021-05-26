Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F08D392399
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:09:44 +0200 (CEST)
Received: from localhost ([::1]:51212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3ap-0007kA-D5
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 20:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FM-0005eV-9a
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:32 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FG-0004VR-AJ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:31 -0400
Received: by mail-pl1-x62a.google.com with SMTP id e15so1431086plh.1
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S7KbakECIlRBEW9AV5a5Z5Z05otVIbkvglZTbFFM7hc=;
 b=ux3ZngikvLAmLJ62fYLZsH9M4yHr/TSE6iQmGrTQu3W0bQpPqx0vB9kpiXrcxrnNXH
 ibgpX0JsTdPGvgNbIfBCX92ZF5RETfpN3XjAy8qw8J4J3fS1VB2GGAFEO/i1m6y27V9X
 VXXp10V6Y57xRawoDvsv7hacZ9u7Bv52wiZ7bsDeHOF6FIpC9LY8Urb7w4J3Lx5fZP/0
 uHvFmlHNunLiv+QCYrq7Vj8oOVUlZVeFH7AxsHPz9aAD48mD4yFPOvukvPQWfYZNu9v7
 LgJEpS8/PCVHNK3kBtKnXw8UA64719CC+moNf7GcUkKbSZlBCLPWTQzp+ygfxowin8bO
 aB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S7KbakECIlRBEW9AV5a5Z5Z05otVIbkvglZTbFFM7hc=;
 b=t+2J8ASLOlX7XXNvlTbqjSMT/uiqyOUl451fiBIUeu4ezBHGsBg8V+WSMe1qH/5xnf
 42WHHc78VyhyMGQfKR1Tjni4V0RqmmVgSaqV/wAS+V9LmpO+RUk4evBympJ1EgiRrBX8
 thgApZf27kp/inVbtI3jAC0FR1AdjRwVxB2Dp7NQsJIMocendxwkY8KWoQnO9JXbZlxE
 6/bvDcIrEutRoOEzVbIrA+A6qVAczI/6o29kdzs3D2/jK80j3/WXOTqVsLKXZ+4z25Vo
 4a9Bc81W8vK9gdql/Fipa1sPqZsSzEzRqhK32rUWawyeYJXawToCrO2MzHB3Y7RTsBk2
 +CdA==
X-Gm-Message-State: AOAM532yu7Ui/fkK4G/qU8EwTtUTA+1RJMqpD+kNpE2BY4pHVKZ4Jf3H
 U+gQ6l/T5dx5bwTc31iR1RoPIMdLfrMDIQ==
X-Google-Smtp-Source: ABdhPJw7EyJ5p+6VLlqyoT+dFG92m+1oEq7lIfgNAEdgdtgOZ8E4z3SOnfDhVktlHXGj8kB1FNvSNQ==
X-Received: by 2002:a17:90a:1150:: with SMTP id
 d16mr700234pje.180.1622072844283; 
 Wed, 26 May 2021 16:47:24 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/31] cpu: Introduce cpu_virtio_is_big_endian()
Date: Wed, 26 May 2021 16:46:53 -0700
Message-Id: <20210526234710.125396-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Introduce the cpu_virtio_is_big_endian() generic helper to avoid
calling CPUClass internal virtio_is_big_endian() one.

Similarly to commit bf7663c4bd8 ("cpu: introduce
CPUClass::virtio_is_big_endian()"), we keep 'virtio' in the method
name to hint this handler shouldn't be called anywhere but from the
virtio code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210517105140.1062037-8-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h |  9 +++++++++
 hw/core/cpu-common.c  |  6 ------
 hw/core/cpu-sysemu.c  | 10 ++++++++++
 hw/virtio/virtio.c    |  4 +---
 4 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index df49528785..d96ff4dace 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -610,6 +610,15 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
  */
 int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
 
+/**
+ * cpu_virtio_is_big_endian:
+ * @cpu: CPU
+
+ * Returns %true if a CPU which supports runtime configurable endianness
+ * is currently big-endian.
+ */
+bool cpu_virtio_is_big_endian(CPUState *cpu);
+
 #endif /* CONFIG_USER_ONLY */
 
 /**
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index ddddf4b10e..9d73c9a28c 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -185,11 +185,6 @@ static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)
     return 0;
 }
 
-static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
-{
-    return target_words_bigendian();
-}
-
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
@@ -388,7 +383,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->write_elf64_note = cpu_common_write_elf64_note;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
-    k->virtio_is_big_endian = cpu_common_virtio_is_big_endian;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
     dc->realize = cpu_common_realizefn;
     dc->unrealize = cpu_common_unrealizefn;
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index fe90dde868..078e1a84a5 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -54,6 +54,16 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
     return ret;
 }
 
+bool cpu_virtio_is_big_endian(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->virtio_is_big_endian) {
+        return cc->virtio_is_big_endian(cpu);
+    }
+    return target_words_bigendian();
+}
+
 GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e02544b2df..ab516ac614 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1972,9 +1972,7 @@ static enum virtio_device_endian virtio_default_endian(void)
 
 static enum virtio_device_endian virtio_current_cpu_endian(void)
 {
-    CPUClass *cc = CPU_GET_CLASS(current_cpu);
-
-    if (cc->virtio_is_big_endian(current_cpu)) {
+    if (cpu_virtio_is_big_endian(current_cpu)) {
         return VIRTIO_DEVICE_ENDIAN_BIG;
     } else {
         return VIRTIO_DEVICE_ENDIAN_LITTLE;
-- 
2.25.1


