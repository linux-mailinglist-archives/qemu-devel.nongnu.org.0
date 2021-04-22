Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B3F367F02
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 12:49:37 +0200 (CEST)
Received: from localhost ([::1]:36106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZWts-0007Zr-C4
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 06:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWrk-0005dl-7W; Thu, 22 Apr 2021 06:47:24 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWrh-0004sh-4l; Thu, 22 Apr 2021 06:47:23 -0400
Received: by mail-wr1-x436.google.com with SMTP id j5so43330954wrn.4;
 Thu, 22 Apr 2021 03:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MQSyM2Tdm6K0DCg9lxDEVBIxpe6wKmVXubqRoSivHac=;
 b=glF10+sSKyBVREb+NIXktdrlLbdnKfTuEJkVMT+s0ZNmjemcMtVD2GKugI3/LYMpeS
 7AjJ9V/kO7+oPrlpukyQIP5HpFb0+FboPQqr06hr968i8Hqbunh4sO9gHzZVJHwDq3IT
 OcS78It5Ht8LQ9TCYT1PDVKeDGzpYZNbswmpje0aUK/A2tok/GaQUue1CgHVgsVh0m0x
 dh4E6fBctFtGFRTBjeQ6zPLYgftqMFEin03ObP3W60CBak2hSrGh3BxEHHA44OjLh8LA
 Ketut1C9204hszCNwkHmXyTW7YrpGFTP6wBwhOeAO5xj+rstGtoMkCf6PjXUbrc+UsFo
 B/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MQSyM2Tdm6K0DCg9lxDEVBIxpe6wKmVXubqRoSivHac=;
 b=uhLBj4NBaf4sBVV1vFYPkLhJkj1HCGILaZe31U1tm9oLkYw9sKeMHT+cwmCMavhQEg
 R/MKZUVV2/L1ZRdTm1vxL/NXAhwEtLaYNL6h3JD8yFI9CbIiu/nvNYCQuy2Ol/mvtF+P
 cgpz3+nsaqM22q0QmFak8mn/1NaoXVQBp8fP3S15GdF+Yr16pIkm28WO1uQSz8jCjLlY
 //APjf+x0tueeMsnUshBLhUYL4T4ZGXjH5Ow/db1qwk3EgMpeBKnvYkm58pBmA69G1M4
 wGrqYzq6fr5/EZYzyEJTbc+GzM4AJ4UziCcvyxOgZHtYYuolQd43J7ne6zvDtmt8gBK/
 qZHg==
X-Gm-Message-State: AOAM533DvapjSpI6ZQ6otpF2lAtKq+YusQsJGjwqGQ0ZHe/Yorl8NN8P
 T3fbqcyyZzNrIxJDIyMbONXtUsGxy945+Q==
X-Google-Smtp-Source: ABdhPJwO1Cwswco/l6ZWPs37RTpkRgvapQAPv53s1T2xV5cC9g/R4KLAivq/pSSMlH3AXR/U/vGVpg==
X-Received: by 2002:adf:bc09:: with SMTP id s9mr3237820wrg.329.1619088438305; 
 Thu, 22 Apr 2021 03:47:18 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a22sm2930800wrc.59.2021.04.22.03.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 03:47:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/15] cpu: Introduce cpu_virtio_is_big_endian()
Date: Thu, 22 Apr 2021 12:46:51 +0200
Message-Id: <20210422104705.2454166-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422104705.2454166-1-f4bug@amsat.org>
References: <20210422104705.2454166-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the cpu_virtio_is_big_endian() generic helper to avoid
calling CPUClass internal virtio_is_big_endian() one.

Similarly to commit bf7663c4bd8 ("cpu: introduce
CPUClass::virtio_is_big_endian()"), we keep 'virtio' in the method
name to hint this handler shouldn't be called anywhere but from the
virtio code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v5: Reword description to justify 'virtio' in name
---
 include/hw/core/cpu.h | 9 +++++++++
 hw/core/cpu.c         | 8 ++++++--
 hw/virtio/virtio.c    | 4 +---
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 9338e80aa4b..08af2c383a5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -604,6 +604,15 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
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
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 4dce35f832f..daaff56a79e 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -218,8 +218,13 @@ static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)
     return 0;
 }
 
-static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
+bool cpu_virtio_is_big_endian(CPUState *cpu)
 {
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->virtio_is_big_endian) {
+        return cc->virtio_is_big_endian(cpu);
+    }
     return target_words_bigendian();
 }
 
@@ -438,7 +443,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->write_elf64_note = cpu_common_write_elf64_note;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
-    k->virtio_is_big_endian = cpu_common_virtio_is_big_endian;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
     dc->realize = cpu_common_realizefn;
     dc->unrealize = cpu_common_unrealizefn;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 07f4e60b309..8a364496fd5 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1973,9 +1973,7 @@ static enum virtio_device_endian virtio_default_endian(void)
 
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
2.26.3


