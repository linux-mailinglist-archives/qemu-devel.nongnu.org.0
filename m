Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5B062617C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:38:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYsA-0007sm-9X; Fri, 11 Nov 2022 13:35:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYrl-0007pB-CZ
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:35:06 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYrf-0007O7-1P
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:34:59 -0500
Received: by mail-wm1-x32f.google.com with SMTP id o30so3400001wms.2
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ABoGqsqA9eKSAz+FBs0/NNjZz/xcfytUN16WsWs1Ty0=;
 b=Z8ydcl8pbnAJlJXYR0TxeAgo9CbaC4DxmivQY4N5w+ve9wnWogLWcuD+VP11JWqKdf
 +qdUOJX9bLOZrPqU8OFumNvTeJT0Ml2b6Fo5Ibo2XR2KMy3H+9438M1CXuy8LWw8Qvj8
 p/Vkp6xAxO161eZstmPyq7lm7YNLDNe0lA5KIi7uNK9fqu5CDCKvx/dljTkTLoqnb5xQ
 AEny2X4nrxn1nO+1a8ISh7L8iAHwf7NCf3Bc+zrfNBF7YG0RqpNb2kbwVD+wukN+5R8W
 77GiSDRNICcJ2mmHfnUh8A1/zHEnMu9o6L7P4E7kXUNJdWwnAKgzum85I18kZ/kUrxpg
 P2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ABoGqsqA9eKSAz+FBs0/NNjZz/xcfytUN16WsWs1Ty0=;
 b=D4KQ3/T3oqq2PbFeNw6X2YtOdlhuq5kvi+G5IbUXuyQ6GdqSeST4yT6JmFlDJd7ipm
 K+SN5XjpWMjCJ4e92ZJTuFX9IIXssHvWeYIDp1cCrvxM4Eh669YWwPyuC9BrkmPRWyQC
 6Do4+1igsSfC4FP7U/YEf8a29wwcRk8q8Xs4iNbWLJoBueQhM6mUmdFmY/l4PvW9AwsD
 WfZk4lcD2v8+tsY2tPKGhX3G0OWKPMnWJAk7m2kSkRypwHCSvtpQIYn/xRV7O5TAuhih
 WLWck25jevK9NWpHTKAw9EXkDk0V16Q+8aaWRP5mEYZ1+IBekYysmCL+HT5bDOqKOPo2
 6bVg==
X-Gm-Message-State: ANoB5pnMcCklPYiAEnUWCafEPjPjNZIOlp32FE/hq0bLMsp1sh/oC6Ry
 gTeGX+G54Rd75UM+92MPHJjiiw==
X-Google-Smtp-Source: AA0mqf5taPGJVV+d1Y2yhGKvngpas6zXzulGvEd3jAJkejOzeLe9NOQCQoC/78hrARUNk+JBsOzfMw==
X-Received: by 2002:a05:600c:4254:b0:3cf:6e9b:21f1 with SMTP id
 r20-20020a05600c425400b003cf6e9b21f1mr2126379wmm.90.1668191693500; 
 Fri, 11 Nov 2022 10:34:53 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b003c6f426467fsm10385729wmq.40.2022.11.11.10.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:34:51 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 82A351FFC8;
 Fri, 11 Nov 2022 18:25:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH  v5 18/20] hw/i386: convert apic access to use MemTxAttrs
Date: Fri, 11 Nov 2022 18:25:33 +0000
Message-Id: <20221111182535.64844-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This allows us to correctly model invalid accesses to the interrupt
controller as well as avoiding the use of current_cpu hacks to find
the APIC structure. We have to ensure we check for MSI signals first
which shouldn't arrive from the CPU but are either triggered by PCI or
internal IOAPIC writes.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>

---
v1
  - don't validate requester_id for MTRT_MACHINE, just assume IOPIC
---
 include/hw/i386/apic.h |  2 +-
 hw/i386/x86.c          | 11 +++-----
 hw/intc/apic.c         | 62 ++++++++++++++++++++++++++++--------------
 3 files changed, 46 insertions(+), 29 deletions(-)

diff --git a/include/hw/i386/apic.h b/include/hw/i386/apic.h
index da1d2fe155..064ea5ac1b 100644
--- a/include/hw/i386/apic.h
+++ b/include/hw/i386/apic.h
@@ -22,6 +22,6 @@ void apic_designate_bsp(DeviceState *d, bool bsp);
 int apic_get_highest_priority_irr(DeviceState *dev);
 
 /* pc.c */
-DeviceState *cpu_get_current_apic(void);
+DeviceState *cpu_get_current_apic(int cpu_index);
 
 #endif
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 78cc131926..66645a669c 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -585,14 +585,11 @@ int cpu_get_pic_interrupt(CPUX86State *env)
     return intno;
 }
 
-DeviceState *cpu_get_current_apic(void)
+DeviceState *cpu_get_current_apic(int cpu_index)
 {
-    if (current_cpu) {
-        X86CPU *cpu = X86_CPU(current_cpu);
-        return cpu->apic_state;
-    } else {
-        return NULL;
-    }
+    CPUState *cs = qemu_get_cpu(cpu_index);
+    X86CPU *cpu = X86_CPU(cs);
+    return cpu->apic_state;
 }
 
 void gsi_handler(void *opaque, int n, int level)
diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 3df11c34d6..0a9897e64f 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -18,9 +18,11 @@
  */
 #include "qemu/osdep.h"
 #include "qemu/thread.h"
+#include "qemu/log.h"
 #include "hw/i386/apic_internal.h"
 #include "hw/i386/apic.h"
 #include "hw/i386/ioapic.h"
+#include "hw/i386/ioapic_internal.h"
 #include "hw/intc/i8259.h"
 #include "hw/pci/msi.h"
 #include "qemu/host-utils.h"
@@ -634,21 +636,23 @@ static void apic_timer(void *opaque)
     apic_timer_update(s, s->next_time);
 }
 
-static uint64_t apic_mem_read(void *opaque, hwaddr addr, unsigned size)
+static MemTxResult apic_mem_read(void *opaque, hwaddr addr, uint64_t *data,
+                                 unsigned int size, MemTxAttrs attrs)
 {
     DeviceState *dev;
     APICCommonState *s;
     uint32_t val;
     int index;
 
-    if (size < 4) {
-        return 0;
+    if (attrs.requester_type != MTRT_CPU) {
+        return MEMTX_ACCESS_ERROR;
     }
+    dev = cpu_get_current_apic(attrs.requester_id);
 
-    dev = cpu_get_current_apic();
-    if (!dev) {
-        return 0;
+    if (size < 4) {
+        return MEMTX_ERROR;
     }
+
     s = APIC(dev);
 
     index = (addr >> 4) & 0xff;
@@ -719,7 +723,8 @@ static uint64_t apic_mem_read(void *opaque, hwaddr addr, unsigned size)
         break;
     }
     trace_apic_mem_readl(addr, val);
-    return val;
+    *data = val;
+    return MEMTX_OK;
 }
 
 static void apic_send_msi(MSIMessage *msi)
@@ -735,32 +740,45 @@ static void apic_send_msi(MSIMessage *msi)
     apic_deliver_irq(dest, dest_mode, delivery, vector, trigger_mode);
 }
 
-static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
-                           unsigned size)
+static MemTxResult apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
+                                  unsigned int size, MemTxAttrs attrs)
 {
     DeviceState *dev;
     APICCommonState *s;
     int index = (addr >> 4) & 0xff;
 
     if (size < 4) {
-        return;
+        return MEMTX_ERROR;
     }
 
+    /*
+     * MSI and MMIO APIC are at the same memory location, but actually
+     * not on the global bus: MSI is on PCI bus APIC is connected
+     * directly to the CPU.
+     *
+     * We can check the MemTxAttrs to check they are coming from where
+     * we expect. Even though the MSI registers are reserved in APIC
+     * MMIO and vice versa they shouldn't respond to CPU writes.
+     */
     if (addr > 0xfff || !index) {
-        /* MSI and MMIO APIC are at the same memory location,
-         * but actually not on the global bus: MSI is on PCI bus
-         * APIC is connected directly to the CPU.
-         * Mapping them on the global bus happens to work because
-         * MSI registers are reserved in APIC MMIO and vice versa. */
+        switch (attrs.requester_type) {
+        case MTRT_MACHINE: /* MEMTX_IOPIC */
+        case MTRT_PCI:     /* PCI signalled MSI */
+            break;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: rejecting write from %d",
+                          __func__, attrs.requester_id);
+            return MEMTX_ACCESS_ERROR;
+        }
         MSIMessage msi = { .address = addr, .data = val };
         apic_send_msi(&msi);
-        return;
+        return MEMTX_OK;
     }
 
-    dev = cpu_get_current_apic();
-    if (!dev) {
-        return;
+    if (attrs.requester_type != MTRT_CPU) {
+        return MEMTX_ACCESS_ERROR;
     }
+    dev = cpu_get_current_apic(attrs.requester_id);
     s = APIC(dev);
 
     trace_apic_mem_writel(addr, val);
@@ -839,6 +857,8 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
         s->esr |= APIC_ESR_ILLEGAL_ADDRESS;
         break;
     }
+
+    return MEMTX_OK;
 }
 
 static void apic_pre_save(APICCommonState *s)
@@ -856,8 +876,8 @@ static void apic_post_load(APICCommonState *s)
 }
 
 static const MemoryRegionOps apic_io_ops = {
-    .read = apic_mem_read,
-    .write = apic_mem_write,
+    .read_with_attrs = apic_mem_read,
+    .write_with_attrs = apic_mem_write,
     .impl.min_access_size = 1,
     .impl.max_access_size = 4,
     .valid.min_access_size = 1,
-- 
2.34.1


