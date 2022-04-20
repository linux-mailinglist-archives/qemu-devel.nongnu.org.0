Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB5A508182
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 08:55:45 +0200 (CEST)
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh4Fb-0004iw-IH
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 02:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nh49w-0001gx-Hh
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 02:49:52 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:37589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nh49r-00064N-NQ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 02:49:49 -0400
Received: by mail-pl1-x62a.google.com with SMTP id v12so978211plv.4
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 23:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HcOyFFr5uNW7p7L81tPw2b4BwpcJtuh1ONNlb6nVe4M=;
 b=KMHYwzjEI+ebVWexmryb9LqrzMou5rD1VOxY4g++9RznQ2zCHUg2G3QE13W4c+9eBi
 5Ij+s3S0AHOa4mESz/YKYa91vaIcAwAtYpQAtIidCw/bSeG/yrmgiPIZGNVwhWP98CKO
 ZzeEQlEOUxo3fJBaUCUO4f4icm8xk2oW9j1dxmhuNRGmL0U83OKSp6trb1C3lH8Av2bs
 7UdvHq22LMD+j19rCdYRJYOysdg20Tic7nUhRjRTajWlF7Xcb/g7+67WcMsjfrGyrarL
 GppyCqEcw6V/Z0zfSckiUbeuYWN8P1iJ/AsPS4L9k8ZrwsoeLRrKMINnFyc5HKfVGbyZ
 5xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HcOyFFr5uNW7p7L81tPw2b4BwpcJtuh1ONNlb6nVe4M=;
 b=E09r35kRA/Ka7abevkAKHHUBysrhJZZx3gPaNVudmW+4iNe8G24WEwvkW3QVwqu5HD
 u8SxaUPU56biKUK7xuQ4Mcq8me8s4/0flxiwQhzm23fptL6X7Vdbbl50h+wfXlRYDd5X
 8BJmRltIy1hnFQLCEB95FmzcoO/2qVaVVPGIdiSKCO40HvVoBjsU6F1xEARkExKZrNgI
 iy4ew3Yhbm0OcHBj/N3oK4VaWGTDZqJFHSVTNzQQ1bOE+VCXIcUsomZ/4rBObAbQ6+kf
 M+qBxG9tuguOglIA7+XZv9YVEiy0oaQ3CaDZ6rzVmpN6x6tpL3wQg7pEaYE+04Lsa/n6
 nMAw==
X-Gm-Message-State: AOAM532TX/gCdld2LMoM0Ppn/Gt7Rml9CA+2N7Ofa4wBxGKNaxyrRDDz
 H4niPgFWm6dmCWbaqZ/m66/AEQ==
X-Google-Smtp-Source: ABdhPJzsd0pNleubZJHKgQS/43ueWAxY6PsKNye2Ti0mGMN3QlsMfh5pUgiFuErY/MxX+pZJHwIo3w==
X-Received: by 2002:a17:90a:600b:b0:1cb:8ba5:d3bc with SMTP id
 y11-20020a17090a600b00b001cb8ba5d3bcmr2756907pji.42.1650437386064; 
 Tue, 19 Apr 2022 23:49:46 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 r29-20020a63441d000000b003a97e8f71e7sm10148921pga.88.2022.04.19.23.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 23:49:45 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: pbonzini@redhat.com,
	peter.maydell@linaro.org,
	mtosatti@redhat.com
Subject: [PATCH] KVM: HWPoison: Fix memory address&size during remap
Date: Wed, 20 Apr 2022 14:45:42 +0800
Message-Id: <20220420064542.423508-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: zhenwei pi <pizhenwei@bytedance.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu exits during reset with log:
qemu-system-x86_64: Could not remap addr: 1000@22001000

Currently, after MCE on RAM of a guest, qemu records a ram_addr only,
remaps this address with a fixed size(TARGET_PAGE_SIZE) during reset.
In the hugetlbfs scenario, mmap(addr...) needs page_size aligned
address and correct size. Unaligned address leads mmap to fail.

What's more, hitting MCE on RAM of a guest, qemu records this address
and try to fix it during reset, this should be a common logic. So
remove kvm_hwpoison_page_add from architecture dependent code, record
this in SIGBUS handler instead. Finally poisoning/unpoisoning a page
gets static in kvm-all.c,

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 accel/kvm/kvm-all.c      | 47 ++++++++++++++++++++++++++++++----------
 include/sysemu/kvm_int.h | 12 ----------
 target/arm/kvm64.c       |  1 -
 target/i386/kvm/kvm.c    |  1 -
 4 files changed, 36 insertions(+), 25 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 5f1377ca04..2a91c5a461 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1167,11 +1167,14 @@ int kvm_vm_check_extension(KVMState *s, unsigned int extension)
     return ret;
 }
 
+#ifdef KVM_HAVE_MCE_INJECTION
 typedef struct HWPoisonPage {
     ram_addr_t ram_addr;
+    size_t page_size; /* normal page or hugeTLB page? */
     QLIST_ENTRY(HWPoisonPage) list;
 } HWPoisonPage;
 
+/* hwpoison_page_list stores the poisoned pages, unpoison them during reset */
 static QLIST_HEAD(, HWPoisonPage) hwpoison_page_list =
     QLIST_HEAD_INITIALIZER(hwpoison_page_list);
 
@@ -1181,25 +1184,48 @@ static void kvm_unpoison_all(void *param)
 
     QLIST_FOREACH_SAFE(page, &hwpoison_page_list, list, next_page) {
         QLIST_REMOVE(page, list);
-        qemu_ram_remap(page->ram_addr, TARGET_PAGE_SIZE);
+        qemu_ram_remap(page->ram_addr, page->page_size);
         g_free(page);
     }
 }
 
-void kvm_hwpoison_page_add(ram_addr_t ram_addr)
+static void kvm_hwpoison_page_add(CPUState *cpu, int sigbus_code, void *addr)
 {
     HWPoisonPage *page;
+    ram_addr_t ram_addr, align_ram_addr;
+    ram_addr_t offset;
+    hwaddr paddr;
+    size_t page_size;
+
+    assert(sigbus_code == BUS_MCEERR_AR || sigbus_code == BUS_MCEERR_AO);
+    ram_addr = qemu_ram_addr_from_host(addr);
+    if (ram_addr == RAM_ADDR_INVALID ||
+        !kvm_physical_memory_addr_from_host(cpu->kvm_state, addr, &paddr)) {
+        /* only deal with valid guest RAM here */
+        return;
+    }
 
+    /* get page size of RAM block, test it's a normal page or huge page */
+    page_size = qemu_ram_block_from_host(addr, false, &offset)->page_size;
+    align_ram_addr = QEMU_ALIGN_DOWN(ram_addr, page_size);
     QLIST_FOREACH(page, &hwpoison_page_list, list) {
-        if (page->ram_addr == ram_addr) {
+        if (page->ram_addr == align_ram_addr) {
+            assert(page->page_size == page_size);
             return;
         }
     }
-    page = g_new(HWPoisonPage, 1);
-    page->ram_addr = ram_addr;
+
+    page = g_new0(HWPoisonPage, 1);
+    page->ram_addr = align_ram_addr;
+    page->page_size = page_size;
     QLIST_INSERT_HEAD(&hwpoison_page_list, page, list);
 }
 
+static __thread void *pending_sigbus_addr;
+static __thread int pending_sigbus_code;
+static __thread bool have_sigbus_pending;
+#endif
+
 static uint32_t adjust_ioeventfd_endianness(uint32_t val, uint32_t size)
 {
 #if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN)
@@ -2601,7 +2627,9 @@ static int kvm_init(MachineState *ms)
         s->kernel_irqchip_split = mc->default_kernel_irqchip_split ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
     }
 
+#if defined KVM_HAVE_MCE_INJECTION
     qemu_register_reset(kvm_unpoison_all, NULL);
+#endif
 
     if (s->kernel_irqchip_allowed) {
         kvm_irqchip_create(s);
@@ -2782,12 +2810,6 @@ void kvm_cpu_synchronize_pre_loadvm(CPUState *cpu)
     run_on_cpu(cpu, do_kvm_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);
 }
 
-#ifdef KVM_HAVE_MCE_INJECTION
-static __thread void *pending_sigbus_addr;
-static __thread int pending_sigbus_code;
-static __thread bool have_sigbus_pending;
-#endif
-
 static void kvm_cpu_kick(CPUState *cpu)
 {
     qatomic_set(&cpu->kvm_run->immediate_exit, 1);
@@ -2883,6 +2905,8 @@ int kvm_cpu_exec(CPUState *cpu)
 #ifdef KVM_HAVE_MCE_INJECTION
         if (unlikely(have_sigbus_pending)) {
             qemu_mutex_lock_iothread();
+            kvm_hwpoison_page_add(cpu, pending_sigbus_code,
+                                  pending_sigbus_addr);
             kvm_arch_on_sigbus_vcpu(cpu, pending_sigbus_code,
                                     pending_sigbus_addr);
             have_sigbus_pending = false;
@@ -3436,6 +3460,7 @@ int kvm_on_sigbus(int code, void *addr)
      * we can only get action optional here.
      */
     assert(code != BUS_MCEERR_AR);
+    kvm_hwpoison_page_add(first_cpu, code, addr);
     kvm_arch_on_sigbus_vcpu(first_cpu, code, addr);
     return 0;
 #else
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 1f5487d9b7..52ec8ef99c 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -40,16 +40,4 @@ void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
                                   AddressSpace *as, int as_id, const char *name);
 
 void kvm_set_max_memslot_size(hwaddr max_slot_size);
-
-/**
- * kvm_hwpoison_page_add:
- *
- * Parameters:
- *  @ram_addr: the address in the RAM for the poisoned page
- *
- * Add a poisoned page to the list
- *
- * Return: None.
- */
-void kvm_hwpoison_page_add(ram_addr_t ram_addr);
 #endif
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index ccadfbbe72..a3184eb3d2 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1450,7 +1450,6 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
         ram_addr = qemu_ram_addr_from_host(addr);
         if (ram_addr != RAM_ADDR_INVALID &&
             kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
-            kvm_hwpoison_page_add(ram_addr);
             /*
              * If this is a BUS_MCEERR_AR, we know we have been called
              * synchronously from the vCPU thread, so we can easily
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 9cf8e03669..fb72b349ed 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -622,7 +622,6 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
         ram_addr = qemu_ram_addr_from_host(addr);
         if (ram_addr != RAM_ADDR_INVALID &&
             kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
-            kvm_hwpoison_page_add(ram_addr);
             kvm_mce_inject(cpu, paddr, code);
 
             /*
-- 
2.20.1


