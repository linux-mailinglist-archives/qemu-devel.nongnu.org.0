Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831325899EE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 11:28:42 +0200 (CEST)
Received: from localhost ([::1]:38426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJX9l-0008Hh-2u
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 05:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oJX2P-00045F-S3
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 05:21:07 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oJX2M-0004ey-1d
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 05:21:05 -0400
Received: by mail-wr1-x431.google.com with SMTP id j1so16140076wrw.1
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 02:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=8ZbOjpO/dOgKS9JowVvhtj9YX3QSdVl1BNHpIbHjPH8=;
 b=i4ih7E4Fts8Ya1nwbNZi0hIF0jcwxyrelQkLr9OUYL2aMN1avnHhkGsC2ICpGl6riA
 AmE85JUOj2n0LKnT56VktKIerpW4BVsg1o1HkpVviUSgndclhlu+0q+zoiVuBKvWG1De
 HlWRt0mHVN61WaR2SwU4XSUVKKM/FGiFfYZdt3bRwhu56zegWSO1e2LPSg1uFZcGq6j+
 5Gz7klHiVbeYS1WlKz9MSPnRB8fFV41S8+cFZ82u7nEgBNysb9JYjxZsZX0QND4ukZ7U
 rO3yuoRP24BMui00u+MG3/xbQb5PbRYE/SasNXCuGhQdPtuX/TgB8tB5JSuja6sfKiDm
 shxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=8ZbOjpO/dOgKS9JowVvhtj9YX3QSdVl1BNHpIbHjPH8=;
 b=4cnVVFeRGxbraTKgSs273ChDbRqUEShEfuhixbBqyzFDZludU7cOczpvrnyCHkEa7a
 vrXtD4mQZ/9q1aoqe2sj1ob+e4pOWIQHbXr33uxxEOPa4VZv+yWRyYXQSTCvohVljZTO
 0t8nH2y9JnZyhLSfpTNnCofeuauX87MTws8ExMHLBiVSUi6xpnC68Zu9yoTgQLVv4Px1
 4e3U/UaX2bzTj5Ea9BFMOjXIl8uyGfI341hmYw4PbeFCwVLNhaSpf4d1uxx9wEFLhyBk
 yI9VjnCJO4Qlu2IUL/rXNFGHZ+AMld1mNCSlzL38QFo5zFw+vgZ8nK1MjReqy5yAuBYA
 k4Rg==
X-Gm-Message-State: ACgBeo2Sqr/d3SxQIElhj1eYW2+wPNK++0bq5LM7vjr5ucChsDtPx/Q8
 EZpjowyjU3uWLIVHWItXxRv9GQ==
X-Google-Smtp-Source: AA6agR4uXW49PbivQP5rggAjZleuNVbVfT/+HFco6Z8ebiygHqK3OZtdTWRhjyg2gbw1+DhVMVKwkw==
X-Received: by 2002:a05:6000:805:b0:220:748e:82c6 with SMTP id
 bt5-20020a056000080500b00220748e82c6mr751928wrb.395.1659604856781; 
 Thu, 04 Aug 2022 02:20:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ba5-20020a0560001c0500b0021efc75914esm581776wrb.79.2022.08.04.02.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 02:20:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3CDC41FFB7;
 Thu,  4 Aug 2022 10:20:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH] cputlb and ssi: cache class to avoid expensive
 object_dynamic_cast_assert (HACK!!!)
Date: Thu,  4 Aug 2022 10:20:44 +0100
Message-Id: <20220804092044.2101093-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Investigating why some BMC models are so slow compared to a plain ARM
virt machines I did some profiling of:

  ./qemu-system-arm -M romulus-bmc -nic user \
    -drive
    file=obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd \
    -nographic -serial mon:stdio

And saw that object_dynamic_cast was dominating the profile times. We
have a number of cases in the CPU hot path and more importantly for
this model in the SSI bus. As the class is static once the object is
created we just cache it and use it instead of the dynamic case
macros.

[AJB: I suspect a proper fix for this is for QOM to support a cached
class lookup, abortive macro attempt #if 0'd in this patch].

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Cédric Le Goater <clg@kaod.org>
---
 include/hw/core/cpu.h |  2 ++
 include/hw/ssi/ssi.h  |  3 +++
 include/qom/object.h  | 29 +++++++++++++++++++++++++++++
 accel/tcg/cputlb.c    | 12 ++++++++----
 hw/ssi/ssi.c          | 10 +++++++---
 5 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 500503da13..70027a772e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -317,6 +317,8 @@ struct qemu_work_item;
 struct CPUState {
     /*< private >*/
     DeviceState parent_obj;
+    /* cache to avoid expensive CPU_GET_CLASS */
+    CPUClass *cc;
     /*< public >*/
 
     int nr_cores;
diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index f411858ab0..6950f86810 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -59,6 +59,9 @@ struct SSIPeripheralClass {
 struct SSIPeripheral {
     DeviceState parent_obj;
 
+    /* cache the class */
+    SSIPeripheralClass *spc;
+
     /* Chip select state */
     bool cs;
 };
diff --git a/include/qom/object.h b/include/qom/object.h
index ef7258a5e1..2202dbfa43 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -198,6 +198,35 @@ struct Object
     OBJ_NAME##_CLASS(const void *klass) \
     { return OBJECT_CLASS_CHECK(ClassType, klass, TYPENAME); }
 
+#if 0
+/**
+ * DECLARE_CACHED_CLASS_CHECKER:
+ * @InstanceType: instance struct name
+ * @ClassType: class struct name
+ * @OBJ_NAME: the object name in uppercase with underscore separators
+ * @TYPENAME: type name
+ *
+ * This variant of DECLARE_CLASS_CHECKERS allows for the caching of
+ * class in the parent object instance. This is useful for very hot
+ * path code at the expense of an extra indirection and check. As per
+ * the original direct usage of this macro should be avoided if the
+ * complete OBJECT_DECLARE_TYPE macro has been used.
+ *
+ * This macro will provide the class type cast functions for a
+ * QOM type.
+ */
+#define DECLARE_CACHED_CLASS_CHECKERS(InstanceType, ClassType, OBJ_NAME, TYPENAME) \
+    DECLARE_CLASS_CHECKERS(ClassType, OBJ_NAME, TYPENAME) \
+    static inline G_GNUC_UNUSED ClassType * \
+    OBJ_NAME##_GET_CACHED_CLASS(const void *obj) \
+    { \
+        InstanceType *p = (InstanceType *) obj; \
+        p->cc = p->cc ? p->cc : OBJECT_GET_CLASS(ClassType, obj, TYPENAME);\
+        return p->cc;                                                   \
+    }
+
+#endif
+
 /**
  * DECLARE_OBJ_CHECKERS:
  * @InstanceType: instance struct name
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index a46f3a654d..882315f7dd 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1303,8 +1303,9 @@ static inline ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
 static void tlb_fill(CPUState *cpu, target_ulong addr, int size,
                      MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
+    CPUClass *cc = cpu->cc ? cpu->cc : CPU_GET_CLASS(cpu);
     bool ok;
+    cpu->cc = cc;
 
     /*
      * This is not a probe, so only valid return is success; failure
@@ -1319,7 +1320,8 @@ static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
                                         MMUAccessType access_type,
                                         int mmu_idx, uintptr_t retaddr)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
+    CPUClass *cc = cpu->cc ? cpu->cc : CPU_GET_CLASS(cpu);
+    cpu->cc = cc;
 
     cc->tcg_ops->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
 }
@@ -1331,7 +1333,8 @@ static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
                                           MemTxResult response,
                                           uintptr_t retaddr)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
+    CPUClass *cc = cpu->cc ? cpu->cc : CPU_GET_CLASS(cpu);
+    cpu->cc = cc;
 
     if (!cpu->ignore_memory_transaction_failures &&
         cc->tcg_ops->do_transaction_failed) {
@@ -1606,7 +1609,8 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     if (!tlb_hit_page(tlb_addr, page_addr)) {
         if (!victim_tlb_hit(env, mmu_idx, index, elt_ofs, page_addr)) {
             CPUState *cs = env_cpu(env);
-            CPUClass *cc = CPU_GET_CLASS(cs);
+            CPUClass *cc = cs->cc ? cs->cc : CPU_GET_CLASS(cs);
+            cs->cc = cc;
 
             if (!cc->tcg_ops->tlb_fill(cs, addr, fault_size, access_type,
                                        mmu_idx, nonfault, retaddr)) {
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index 003931fb50..f749feb6e3 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -38,7 +38,8 @@ static void ssi_cs_default(void *opaque, int n, int level)
     bool cs = !!level;
     assert(n == 0);
     if (s->cs != cs) {
-        SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(s);
+        /* SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(s); */
+        SSIPeripheralClass *ssc = s->spc;
         if (ssc->set_cs) {
             ssc->set_cs(s, cs);
         }
@@ -48,7 +49,8 @@ static void ssi_cs_default(void *opaque, int n, int level)
 
 static uint32_t ssi_transfer_raw_default(SSIPeripheral *dev, uint32_t val)
 {
-    SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(dev);
+    /* SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(dev); */
+    SSIPeripheralClass *ssc = dev->spc;
 
     if ((dev->cs && ssc->cs_polarity == SSI_CS_HIGH) ||
             (!dev->cs && ssc->cs_polarity == SSI_CS_LOW) ||
@@ -67,6 +69,7 @@ static void ssi_peripheral_realize(DeviceState *dev, Error **errp)
             ssc->cs_polarity != SSI_CS_NONE) {
         qdev_init_gpio_in_named(dev, ssi_cs_default, SSI_GPIO_CS, 1);
     }
+    s->spc = ssc;
 
     ssc->realize(s, errp);
 }
@@ -120,7 +123,8 @@ uint32_t ssi_transfer(SSIBus *bus, uint32_t val)
 
     QTAILQ_FOREACH(kid, &b->children, sibling) {
         SSIPeripheral *peripheral = SSI_PERIPHERAL(kid->child);
-        ssc = SSI_PERIPHERAL_GET_CLASS(peripheral);
+        /* ssc = SSI_PERIPHERAL_GET_CLASS(peripheral); */
+        ssc = peripheral->spc;
         r |= ssc->transfer_raw(peripheral, val);
     }
 
-- 
2.30.2


