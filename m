Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF85C32BC60
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 22:55:11 +0100 (CET)
Received: from localhost ([::1]:49138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZSY-0006EF-Sc
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 16:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZLk-0004Mg-IF; Wed, 03 Mar 2021 16:48:08 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZLf-0002Ft-C8; Wed, 03 Mar 2021 16:48:08 -0500
Received: by mail-wr1-x42b.google.com with SMTP id 7so25388174wrz.0;
 Wed, 03 Mar 2021 13:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KrfmTAy/y06Liy613dmSM4G3rbSLinZL5wmkGcBjQ6Q=;
 b=U7nX/qH/pj9vuhk5OuE9MYtkaxBeNOesC2soCFMJdLnuVOBjF9fFA2Oxp1pSweSYco
 wiu2WVgM2FCSZe6jF5bu6+cluDmDfoxu6fop027s/68r5SQR4PP8IBFu0JtfEioDLhmG
 nBu+3OLGVESAfbUgltl7btQsSf4TjkXd8v7u9QOCsSxnQtn6/pEH0JntEMT2OsPOK6bL
 GXqJnjOuGDbPKlepBghW2gklBTNHdmVIa+OiETZb4n10MDPzGJKDo8ybIa44w8MNXfUs
 RKZzDqxxq4SvpBmxqzJgP2HgjMAk/X2A6/cyDGZf76xz92b4eUiFmveD19kme9JBjC37
 yMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KrfmTAy/y06Liy613dmSM4G3rbSLinZL5wmkGcBjQ6Q=;
 b=LavtYqnL73YxMUq58d7IpI9RcG2P1BeQrAHEWFQTEcGgtt07zgj/cQtKi3wOy362JL
 tpE9ouQ/qZPRqRvQdOOj2b56vmbwcCEbL07zxyAD8hC8cuNbFHxTlaytQae88gXi42zr
 UVjKLyXRJEIiKd4CTcb4ZhcS3jK9NQTGzkBr/t/b0RyIziZZKxtgqClLB6VnX8mNfBAw
 jpPk4XTnW89PPeRLmVO74Mp7cwkQqfylHz6OZC37IkAJM+KPGWkRZ1jX0Z7G54wWuG24
 USbsTTTOpPrXos3EYmQTFMixZD5pwg106GtnUK64WKmdaf7JKR31G5oYgt2aYQ9PUY7o
 AUjQ==
X-Gm-Message-State: AOAM530dx09sSLjookCXT9iSbkMEwpVkBKPWs3Ab7jTN7LnjOIEXhU3g
 k/Yfyr+biuJwN2ab7K3E1Glfzmu7bJU=
X-Google-Smtp-Source: ABdhPJwwJYH4kp+e2fr7J19qTnWtXIwYIOd2JbiU45YGKXBBTf8H5A5pvrhOuqeIbSub+9as3hur6w==
X-Received: by 2002:adf:97d5:: with SMTP id t21mr675099wrb.139.1614808080451; 
 Wed, 03 Mar 2021 13:48:00 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n6sm14034871wrt.1.2021.03.03.13.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:47:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/28] cpu: Move CPUClass::virtio_is_big_endian to
 SysemuCPUOps
Date: Wed,  3 Mar 2021 22:46:49 +0100
Message-Id: <20210303214708.1727801-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VirtIO devices are only meaningful with system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 5 -----
 include/hw/core/sysemu-cpu-ops.h | 8 ++++++++
 hw/core/cpu.c                    | 4 ++--
 target/arm/cpu.c                 | 2 +-
 target/ppc/translate_init.c.inc  | 4 +---
 5 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 471c99d9f04..dfb50b60128 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -89,10 +89,6 @@ struct AccelCPUClass;
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
@@ -151,7 +147,6 @@ struct CPUClass {
 
     int reset_dump_flags;
     bool (*has_work)(CPUState *cpu);
-    bool (*virtio_is_big_endian)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 05f19b22070..9c3ac4f2280 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,14 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @virtio_is_big_endian: Callback to return %true if a CPU which supports
+     *       runtime configurable endianness is currently big-endian.
+     * Non-configurable CPUs can use the default implementation of this method.
+     * This method should not be used by any callers other than the pre-1.0
+     * virtio devices.
+     */
+    bool (*virtio_is_big_endian)(CPUState *cpu);
     /**
      * @vmsd: State description for migration.
      */
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 5abf8bed2e4..09eaa3fa49f 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -204,8 +204,8 @@ bool cpu_virtio_is_big_endian(CPUState *cpu)
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
index 403422c6e76..fa0d4bba590 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2262,6 +2262,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
     .vmsd = &vmstate_arm_cpu,
 };
 #endif
@@ -2305,7 +2306,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
-    cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
     cc->sysemu_ops = &arm_sysemu_ops;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 819b807097d..789124debe7 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10845,6 +10845,7 @@ static Property ppc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps ppc_sysemu_ops = {
+    .virtio_is_big_endian = ppc_cpu_is_big_endian,
     .vmsd = &vmstate_ppc_cpu,
 };
 #endif
@@ -10913,9 +10914,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_core_xml_file = "power64-core.xml";
 #else
     cc->gdb_core_xml_file = "power-core.xml";
-#endif
-#ifndef CONFIG_USER_ONLY
-    cc->virtio_is_big_endian = ppc_cpu_is_big_endian;
 #endif
     cc->disas_set_info = ppc_disas_set_info;
 
-- 
2.26.2


