Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC274CA6CB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:57:42 +0100 (CET)
Received: from localhost ([::1]:38138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPU5-00035A-Mn
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:57:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPOes-0003cI-2I
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:04:47 -0500
Received: from [2607:f8b0:4864:20::1032] (port=43737
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPOeq-0004zM-6b
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:04:45 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so606001pju.2
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 05:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NNU3kDNYeQnPNa4auhryDFqI7kD27cCHuRDqOJvwXMA=;
 b=C2gMvY1+/nJLvMHmnnPPqSrKyDCHc6J/vul/b+dE98EpkcNqUykZg9sdUsyVzhVR6U
 8ftNCUENouBkNMqhmuI4Z8TK36OqGAkHdVRnagFRMNiuOt8A5QDWk7siyJnpIHfNnpe7
 5B86G4avh8J4+HEUrMsBzILD2emFKX4YyOaDrlaf90cbrFacxk1WPt5GYcw80HoekGMD
 dMNYsy/R7o2QMisxWDXxfrKWMPSco5sPTs0x03OMa+23aQRZZLcdfA66c4U6NLPxlfa8
 9UAlI7xWL69kpprel+kBLVIIXLUUZRrTiGZ8kp5ak0wJV09hUbFFiqTt4VWp5MHK4++5
 KHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NNU3kDNYeQnPNa4auhryDFqI7kD27cCHuRDqOJvwXMA=;
 b=3/MjQKxCetcqjLPDsSxf0FPgRoqDK5C16yFOH+Zq+epWJlms5n6u7/uB66VPq81GLc
 wSrrnIQSyQnB/8ALoL2WbDaXwJcw0NE/nNMgaDCaBr+DVfBoF5zdFkaj5JZb4IQpIDEj
 A1DoPyvmCbZW4dAerbdgHbsRobZlHq6k4O1RHhFgvxei/EekHQhcSE5qfYHQPVwXDrAK
 AWNAFilvGkkFHUF7LEkgbCOKdQkUfudqucZvN/l837vgc2gV0zlxWWgLszap8Mkz0dda
 /YpNsqCgDIedoHG86JfXVuJ2iTI7Do6r3m5reKKca7sxbQwX8XMx4pcn7FmYuaHeiH8T
 wTUQ==
X-Gm-Message-State: AOAM531mIBtxfDlpMJL5O9y1ANTXmCUxF3mW9CTaE3bsenCCDbgeQlCk
 F/gzXhiVSRqaC+EwW/GtUK369UpkD2diUg==
X-Google-Smtp-Source: ABdhPJzuW0MNUfTRHBsfWoxGZ0RWKYWJMXhyRBhFnAm5CSrxLkDEN4N+K40UlP3UBOJg6jCixjSZwA==
X-Received: by 2002:a17:90a:f8c:b0:1bc:cf23:2319 with SMTP id
 12-20020a17090a0f8c00b001bccf232319mr27173428pjz.67.1646226282486; 
 Wed, 02 Mar 2022 05:04:42 -0800 (PST)
Received: from localhost.localdomain
 (2001-b011-e000-59d7-a02b-4f1b-c415-11a0.dynamic-ip6.hinet.net.
 [2001:b011:e000:59d7:a02b:4f1b:c415:11a0])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a056a00140d00b004e13da93eaasm21947964pfu.62.2022.03.02.05.04.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Mar 2022 05:04:42 -0800 (PST)
From: Yan-Jie Wang <ubzeme@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/9] hvf: add a lock for memory related functions
Date: Wed,  2 Mar 2022 21:04:14 +0800
Message-Id: <20220302130417.18551-7-ubzeme@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220302130417.18551-1-ubzeme@gmail.com>
References: <20220302130417.18551-1-ubzeme@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ubzeme@gmail.com; helo=mail-pj1-x1032.google.com
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

We follow how KVM accel does in its memory listener (kvm-all.c) and add
a lock for the memory related functions.

Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-mem.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index 896e718374..081029ba98 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -43,6 +43,7 @@ typedef struct HVFSlot {
 } HVFSlot;
 
 static HVFSlot memslots[HVF_NUM_SLOTS];
+static QemuMutex memlock;
 
 static HVFSlot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
 {
@@ -140,6 +141,8 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
         readonly = memory_region_is_rom(area) || memory_region_is_romd(area);
 
         /* setup a slot */
+        qemu_mutex_lock(&memlock);
+
         slot = hvf_find_free_slot();
         if (!slot) {
             error_report("No free slots");
@@ -169,8 +172,12 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
 
         ret = hv_vm_map(host_addr, start, size, flags);
         assert_hvf_ok(ret);
+
+        qemu_mutex_unlock(&memlock);
     } else {
         /* remove memory region */
+        qemu_mutex_lock(&memlock);
+
         slot = hvf_find_overlap_slot(start, size);
 
         if (slot) {
@@ -179,6 +186,8 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
 
             slot->size = 0;
         }
+
+        qemu_mutex_unlock(&memlock);
     }
 }
 
@@ -186,6 +195,8 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
 {
     HVFSlot *slot;
 
+    qemu_mutex_lock(&memlock);
+
     slot = hvf_find_overlap_slot(
             section->offset_within_address_space,
             int128_get64(section->size));
@@ -201,6 +212,8 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
         hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
                       HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
     }
+
+    qemu_mutex_unlock(&memlock);
 }
 
 static void hvf_log_start(MemoryListener *listener,
@@ -271,10 +284,13 @@ bool hvf_access_memory(hwaddr address, bool write)
     hv_return_t ret;
     hwaddr start, size;
 
+    qemu_mutex_lock(&memlock);
+
     slot = hvf_find_overlap_slot(address, 1);
 
     if (!slot || (write && slot->flags & HVF_SLOT_READONLY)) {
         /* MMIO or unmapped area, return false */
+        qemu_mutex_unlock(&memlock);
         return false;
     }
 
@@ -290,10 +306,12 @@ bool hvf_access_memory(hwaddr address, bool write)
         assert_hvf_ok(ret);
     }
 
+    qemu_mutex_unlock(&memlock);
     return true;
 }
 
 void hvf_init_memslots(void)
 {
+    qemu_mutex_init(&memlock);
     memory_listener_register(&hvf_memory_listener, &address_space_memory);
 }
-- 
2.32.0 (Apple Git-132)


