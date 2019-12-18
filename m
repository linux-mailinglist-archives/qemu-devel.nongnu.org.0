Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7A0124724
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 13:44:34 +0100 (CET)
Received: from localhost ([::1]:53656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihYgr-0004wk-4F
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 07:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53345)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3c-0006y8-9v
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3a-0002Lc-VJ
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:00 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43642)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihY3a-0002HG-JR
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:58 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d16so1985298wre.10
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 04:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WOlXgr5dZa9g4c2a4JN2toyyzN/vi7Wxgjlick+Xxu0=;
 b=DXgcoH4l/3iV6ULg2ZN9xXRCxKgJI5KNZKomQXqwcZ5abiD9twAZm8gQtET2AioCg6
 e72bXRE9yUvoQpPZ90McmauI7bMiZiKtHtVoZiB6WPRQfOcPJ5fDC/yllzE/scPUwoQk
 4IKKE58NAM1PKHH9Ah+j6ARdPy8tEm8VLQQm87ePMkqpw9CKQgKdZ1V6655L4vsO90A9
 qNjNV166ZE1AbuXS+i2azlJe7Yx+olB8PsO0hSb5EF8L1mX9GVl0LfML9ZgEpjpzYSHd
 DzjXB/88nQoouM/5G6PgHvzsykfPp0zGIIYxceAfT8zE+Re7wu8ieaoN/5YUwslBKmLB
 pxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WOlXgr5dZa9g4c2a4JN2toyyzN/vi7Wxgjlick+Xxu0=;
 b=P2GBCDEc2RrKEX+b46l0L0CGkuV4vHc/z2Z7IxVIyzifH44jVC+fgYSZcplGyS18xg
 IV6CiUi0fC5LKnOXOK2N6DDywsLq59vxnRmLntwhmgcflXVh6bhSbC2/QnAv5Be8rplt
 PgbEUHJo1Ix9u4PQ85o+tihHLsqZiDsSAAuHqI8rgIKCwif9L2JDaUAUgnwazyt53Jxz
 wzIF7G9AYZ65TYxAE/83PFpafOAfFQ4/fJw6Wd2vVVDk4ojukkdebVfaivHIsRfJkyc+
 hI+Z4b2SPN2lpjCbVchFBtiJjVPaNu/z/2GKXsrglSoqKmdBwHI7XTkYyyaEWlTauTyZ
 BdPA==
X-Gm-Message-State: APjAAAVUhB6k3bkQQ07ZzNcdhqx+Q+W2OEeiUPil0EJRUDMVoAS1QD1Z
 Eogwh18VW9Dzk2kkX8gpEWmqo63O
X-Google-Smtp-Source: APXvYqzUknMQshY2w4SQ6DOB8HB53WnZnAnVge94gTia/SrQJhy7k9U1hwonEKAftJDTZzt0ITE2zQ==
X-Received: by 2002:a5d:5403:: with SMTP id g3mr2492287wrv.302.1576670637404; 
 Wed, 18 Dec 2019 04:03:57 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm2236838wmf.46.2019.12.18.04.03.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:03:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 53/87] hw/i386: De-duplicate gsi_handler() to remove
 kvm_pc_gsi_handler()
Date: Wed, 18 Dec 2019 13:02:19 +0100
Message-Id: <1576670573-48048-54-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42e
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

Both gsi_handler() and kvm_pc_gsi_handler() have the same content,
except one comment. Move the comment, and de-duplicate the code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/kvm/ioapic.c | 12 ------------
 hw/i386/pc.c         |  4 +---
 hw/i386/x86.c        |  1 +
 include/sysemu/kvm.h |  1 -
 4 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
index 8703f19..973e2b2 100644
--- a/hw/i386/kvm/ioapic.c
+++ b/hw/i386/kvm/ioapic.c
@@ -48,18 +48,6 @@ void kvm_pc_setup_irq_routing(bool pci_enabled)
     }
 }
 
-void kvm_pc_gsi_handler(void *opaque, int n, int level)
-{
-    GSIState *s = opaque;
-
-    if (n < ISA_NUM_IRQS) {
-        /* Kernel will forward to both PIC and IOAPIC */
-        qemu_set_irq(s->i8259_irq[n], level);
-    } else {
-        qemu_set_irq(s->ioapic_irq[n], level);
-    }
-}
-
 typedef struct KVMIOAPICState KVMIOAPICState;
 
 struct KVMIOAPICState {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index dff09e4..ea7320b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -344,10 +344,8 @@ GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled)
     s = g_new0(GSIState, 1);
     if (kvm_ioapic_in_kernel()) {
         kvm_pc_setup_irq_routing(pci_enabled);
-        *irqs = qemu_allocate_irqs(kvm_pc_gsi_handler, s, GSI_NUM_PINS);
-    } else {
-        *irqs = qemu_allocate_irqs(gsi_handler, s, GSI_NUM_PINS);
     }
+    *irqs = qemu_allocate_irqs(gsi_handler, s, GSI_NUM_PINS);
 
     return s;
 }
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 80e33be..d18a3ef 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -295,6 +295,7 @@ void gsi_handler(void *opaque, int n, int level)
 
     trace_x86_gsi_interrupt(n, level);
     if (n < ISA_NUM_IRQS) {
+        /* Under KVM, Kernel will forward to both PIC and IOAPIC */
         qemu_set_irq(s->i8259_irq[n], level);
     }
     qemu_set_irq(s->ioapic_irq[n], level);
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index aaf2a50..141342d 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -515,7 +515,6 @@ int kvm_irqchip_add_irqfd_notifier(KVMState *s, EventNotifier *n,
 int kvm_irqchip_remove_irqfd_notifier(KVMState *s, EventNotifier *n,
                                       qemu_irq irq);
 void kvm_irqchip_set_qemuirq_gsi(KVMState *s, qemu_irq irq, int gsi);
-void kvm_pc_gsi_handler(void *opaque, int n, int level);
 void kvm_pc_setup_irq_routing(bool pci_enabled);
 void kvm_init_irq_routing(KVMState *s);
 
-- 
1.8.3.1



