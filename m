Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF8412104C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 18:01:55 +0100 (CET)
Received: from localhost ([::1]:56990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igtkn-0002pF-T5
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 12:01:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57328)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1igtFb-0005qh-S4
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:29:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1igtFa-0000Fc-ES
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:29:39 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34202)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1igtFa-0000Dk-8E
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:29:38 -0500
Received: by mail-wr1-x442.google.com with SMTP id t2so8069740wrr.1
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 08:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sn0dnZOFeT+bItXnoSxlBiq/kd7e5Gr7bxLLAVDuPYI=;
 b=slSJZ2JI/L3JlbodvsDtpM9+zCsCt6xDZb3gwKNmea/CO0Xsi/q2BHCSgiyC1mafiD
 HgNGrQnuD5pb75igkkLn1nnyhqkrud9v4GsWmFF9ZusBTmBmZ9h2QDhsNw30x6FnZGUM
 xJmEegakPQYtfHC/sSXUxw0dwcrk9/zvTl1PfA5RMdkHoMvhCQVDnZadFNEF03y1hnrw
 jB5n6dAypaYl6ojjuyZwsWu4slhBIsNMHNaXJOSuYZH0OcsFiXYfZZNqYCXf3LSn6oLL
 g4HBLN836n28JeYEcg1/yeEmSEY6nJyfE3irHF3UpYkCIJcNpE3tHL2sxz3iQK7oFnr5
 y6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Sn0dnZOFeT+bItXnoSxlBiq/kd7e5Gr7bxLLAVDuPYI=;
 b=r5REOeMlpUf2VcDlRKIDNqLkV0mnUNQz1jHvemYO4eUle0OciOufDMbWkscQ9zJFYf
 Yq5rfNE4zL866CwLYBoSj0mCmRZMzeyMs4ugirWC8HNBUFA992EzhMzb3JK63T26RzH8
 ve5XKB+TKvH8b/7/v3eP14qe/cCnAwHdgVjhKtLg0MWihx6vHrm2t3R4elNuDyqxpLzU
 YTABfU4QAPb4RxY3vqrgtUA6CHsGUknNFAGM53p/QfcmQTnh4zRSxi9yneKFitAPrCXr
 8BlGqU348uj+bZqqQwKBJ1Zl928PxI6NqcRGZfrKyL7JSpsjrP2pgiSlm/ICwjujJ0vV
 OZ/w==
X-Gm-Message-State: APjAAAUTjhJuDRpdiv/ZZ+USo7ugxtH/orA0cU+3oVlrtypgDr/Bi/jl
 F1SJXqfjaCPqukp0ChFMI9MLmUTs
X-Google-Smtp-Source: APXvYqywpy89iy+WkDcdw1RStz4iuHnJpg3SFWA40cSMLEBFJGyln532GTph3EYVzVpuwnPZAB9PHQ==
X-Received: by 2002:a5d:4c8c:: with SMTP id z12mr30896357wrs.222.1576513776902; 
 Mon, 16 Dec 2019 08:29:36 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id q68sm19962334wme.14.2019.12.16.08.29.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Dec 2019 08:29:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 49/62] hw/i386/pc: Convert DPRINTF() to trace events
Date: Mon, 16 Dec 2019 17:28:33 +0100
Message-Id: <1576513726-53700-50-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576513726-53700-1-git-send-email-pbonzini@redhat.com>
References: <1576513726-53700-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Convert the deprecated DPRINTF() macro to trace events.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc.c         | 19 +++++--------------
 hw/i386/trace-events |  6 ++++++
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 4d7f7dd..907fc16 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -91,16 +91,7 @@
 #include "config-devices.h"
 #include "e820_memory_layout.h"
 #include "fw_cfg.h"
-
-/* debug PC/ISA interrupts */
-//#define DEBUG_IRQ
-
-#ifdef DEBUG_IRQ
-#define DPRINTF(fmt, ...)                                       \
-    do { printf("CPUIRQ: " fmt , ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...)
-#endif
+#include "trace.h"
 
 GlobalProperty pc_compat_4_1[] = {};
 const size_t pc_compat_4_1_len = G_N_ELEMENTS(pc_compat_4_1);
@@ -347,7 +338,7 @@ void gsi_handler(void *opaque, int n, int level)
 {
     GSIState *s = opaque;
 
-    DPRINTF("pc: %s GSI %d\n", level ? "raising" : "lowering", n);
+    trace_pc_gsi_interrupt(n, level);
     if (n < ISA_NUM_IRQS) {
         qemu_set_irq(s->i8259_irq[n], level);
     }
@@ -425,7 +416,7 @@ static void pic_irq_request(void *opaque, int irq, int level)
     CPUState *cs = first_cpu;
     X86CPU *cpu = X86_CPU(cs);
 
-    DPRINTF("pic_irqs: %s irq %d\n", level? "raise" : "lower", irq);
+    trace_pc_pic_interrupt(irq, level);
     if (cpu->apic_state && !kvm_irqchip_in_kernel()) {
         CPU_FOREACH(cs) {
             cpu = X86_CPU(cs);
@@ -759,7 +750,7 @@ static void port92_write(void *opaque, hwaddr addr, uint64_t val,
     Port92State *s = opaque;
     int oldval = s->outport;
 
-    DPRINTF("port92: write 0x%02" PRIx64 "\n", val);
+    trace_port92_write(val);
     s->outport = val;
     qemu_set_irq(s->a20_out, (val >> 1) & 1);
     if ((val & 1) && !(oldval & 1)) {
@@ -774,7 +765,7 @@ static uint64_t port92_read(void *opaque, hwaddr addr,
     uint32_t ret;
 
     ret = s->outport;
-    DPRINTF("port92: read 0x%02x\n", ret);
+    trace_port92_read(ret);
     return ret;
 }
 
diff --git a/hw/i386/trace-events b/hw/i386/trace-events
index c8bc464..43f33cf 100644
--- a/hw/i386/trace-events
+++ b/hw/i386/trace-events
@@ -111,3 +111,9 @@ amdvi_ir_irte_ga_val(uint64_t hi, uint64_t lo) "hi 0x%"PRIx64" lo 0x%"PRIx64
 # vmport.c
 vmport_register(unsigned char command, void *func, void *opaque) "command: 0x%02x func: %p opaque: %p"
 vmport_command(unsigned char command) "command: 0x%02x"
+
+# pc.c
+pc_gsi_interrupt(int irqn, int level) "GSI interrupt #%d level:%d"
+pc_pic_interrupt(int irqn, int level) "PIC interrupt #%d level:%d"
+port92_read(uint8_t val) "port92: read 0x%02x"
+port92_write(uint8_t val) "port92: write 0x%02x"
-- 
1.8.3.1



