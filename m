Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF9A4CA5DB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:23:49 +0100 (CET)
Received: from localhost ([::1]:54036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOxI-0004tn-73
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:23:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPO4C-0001TJ-VH
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:26:53 -0500
Received: from [2607:f8b0:4864:20::530] (port=36494
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPO4B-0000f6-BZ
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:26:52 -0500
Received: by mail-pg1-x530.google.com with SMTP id t14so1499873pgr.3
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ynqt3y5s/uUAaEi3pDIc2AV9gtv8UZRUMS//euNtFRg=;
 b=gUmPBL/k7lAfumaVWyYy4Xim2PIXtKlr052WgI8flxq9T18PcYFfmJp3X6bvtr2mhg
 gVIA6FGHjpgoBp78OanXAxokw65cvSnvWGj4K8v9xGkO1ozRnZIl1GoP/9nRkfm1zQiu
 ph0JZWSUgw00L5d8C36fQ0GtQXAwDZDapIwamqYcNWHIso4iH1SpLz8X3Q9RSTwNoU3n
 E1gqyqU5lZa49d55fs7HVKAUFF6TcVx+iNJiCKms+UCETN+h2Wv/sCBwJ3vXKg8l52PP
 tq4d3jh/RWSIZ13D9aQPsVVWXakwZjW5nmKAuJAddmaUeXXii+RLoSYDN4yF6HMZAIR1
 ErsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ynqt3y5s/uUAaEi3pDIc2AV9gtv8UZRUMS//euNtFRg=;
 b=RrmIAyVKO79Bdu6MlVLxSQcdKk6aNssTpZUKhVbwyGeiyKuHA/T6/w9sL1vFtu5878
 2e1LMRBYSR7mUzWZxu+S/sn5ANDSNN3EN3lItn4iiiN1Cdpvdj0f2xZO8f89ql8A6iKL
 OhxMaLDEvSebjLt1BmEAkeiByYfy9B6hXqaZJj4zKz2ogJa6i/Smzz4ZQSVau/b4Ts15
 ub2He5G4FvXBxT/mN8RyXjnwv98Gs2kuE7w5slVZEGRtNBbhTyOUpEAD1Yxkn+pgM3lB
 6QekSCDPU2ua3Qe9YOF0KnXoXr8KVgGHnA3yUT5FQpvprr0LExyuHbZz7eUleGRya5A5
 2BXw==
X-Gm-Message-State: AOAM530UnDOT4JVNS3N/MVslJZAGd7k/5ygjrfHPWpExs21zgJZ9JHV5
 kw30WoidLVHS8WTsLmY4pXgksRk6lWafuw==
X-Google-Smtp-Source: ABdhPJzP9/vBPNM+TYnEb/5zwgbxTY006PL5Do96f+3qCH5TxAFa+Jlkt7bVuk3kbMlPX8wdax2p3g==
X-Received: by 2002:a05:6a00:124f:b0:4c0:6242:c14e with SMTP id
 u15-20020a056a00124f00b004c06242c14emr32670178pfi.83.1646224009642; 
 Wed, 02 Mar 2022 04:26:49 -0800 (PST)
Received: from localhost.localdomain
 (2001-b011-e000-59d7-a02b-4f1b-c415-11a0.dynamic-ip6.hinet.net.
 [2001:b011:e000:59d7:a02b:4f1b:c415:11a0])
 by smtp.gmail.com with ESMTPSA id
 mu1-20020a17090b388100b001bedddf2000sm4912971pjb.14.2022.03.02.04.26.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Mar 2022 04:26:49 -0800 (PST)
From: Yan-Jie Wang <ubzeme@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] hvf: rename struct hvf_slot to HVFSlot
Date: Wed,  2 Mar 2022 20:26:06 +0800
Message-Id: <20220302122611.15237-5-ubzeme@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220302122611.15237-1-ubzeme@gmail.com>
References: <20220302122611.15237-1-ubzeme@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=ubzeme@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>, Yan-Jie Wang <ubzeme@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the QEMU coding style. Structured type names are in CamelCase.

Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-mem.c      | 14 +++++++-------
 include/sysemu/hvf_int.h |  8 ++++----
 target/i386/hvf/hvf.c    |  4 ++--
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index 6b82be3220..b8e9f30e4c 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -30,11 +30,11 @@
 
 #define HVF_NUM_SLOTS 32
 
-static hvf_slot memslots[HVF_NUM_SLOTS];
+static HVFSlot memslots[HVF_NUM_SLOTS];
 
-hvf_slot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
+HVFSlot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
 {
-    hvf_slot *slot;
+    HVFSlot *slot;
     int x;
     for (x = 0; x < HVF_NUM_SLOTS; ++x) {
         slot = &memslots[x];
@@ -46,9 +46,9 @@ hvf_slot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
     return NULL;
 }
 
-static hvf_slot *hvf_find_free_slot(void)
+static HVFSlot *hvf_find_free_slot(void)
 {
-    hvf_slot *slot;
+    HVFSlot *slot;
     int x;
     for (x = 0; x < HVF_NUM_SLOTS; x++) {
         slot = &memslots[x];
@@ -91,7 +91,7 @@ static hwaddr hvf_align_section(MemoryRegionSection *section,
 
 static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
 {
-    hvf_slot *slot;
+    HVFSlot *slot;
     hwaddr start, size, offset, delta;
     uint8_t *host_addr;
     MemoryRegion *area = section->mr;
@@ -172,7 +172,7 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
 
 static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
 {
-    hvf_slot *slot;
+    HVFSlot *slot;
 
     slot = hvf_find_overlap_slot(
             section->offset_within_address_space,
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 2c4a97debe..0aafbc9357 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -17,17 +17,17 @@
 #include <Hypervisor/hv.h>
 #endif
 
-/* hvf_slot flags */
+/* HVFSlot flags */
 #define HVF_SLOT_LOG (1 << 0)
 #define HVF_SLOT_READONLY (1 << 1)
 
-typedef struct hvf_slot {
+typedef struct HVFSlot {
     hwaddr start;
     hwaddr size;  /* 0 if the slot is free */
     hwaddr offset;  /* offset within memory region */
     uint32_t flags;
     MemoryRegion *region;
-} hvf_slot;
+} HVFSlot;
 
 typedef struct hvf_vcpu_caps {
     uint64_t vmx_cap_pinbased;
@@ -58,7 +58,7 @@ int hvf_arch_init(void);
 int hvf_arch_init_vcpu(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
 int hvf_vcpu_exec(CPUState *);
-hvf_slot *hvf_find_overlap_slot(hwaddr, hwaddr);
+HVFSlot *hvf_find_overlap_slot(hwaddr, hwaddr);
 int hvf_put_registers(CPUState *);
 int hvf_get_registers(CPUState *);
 void hvf_kick_vcpu_thread(CPUState *cpu);
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 4ba6e82fab..2ddb4fc825 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -113,7 +113,7 @@ void hvf_handle_io(CPUArchState *env, uint16_t port, void *buffer,
     }
 }
 
-static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
+static bool ept_emulation_fault(HVFSlot *slot, uint64_t gpa, uint64_t ept_qual)
 {
     int read, write;
 
@@ -469,7 +469,7 @@ int hvf_vcpu_exec(CPUState *cpu)
         /* Need to check if MMIO or unmapped fault */
         case EXIT_REASON_EPT_FAULT:
         {
-            hvf_slot *slot;
+            HVFSlot *slot;
             uint64_t gpa = rvmcs(cpu->hvf->fd, VMCS_GUEST_PHYSICAL_ADDRESS);
 
             if (((idtvec_info & VMCS_IDT_VEC_VALID) == 0) &&
-- 
2.32.0 (Apple Git-132)


