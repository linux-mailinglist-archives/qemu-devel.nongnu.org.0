Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC2C5E667F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:10:12 +0200 (CEST)
Received: from localhost ([::1]:40930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obNq6-00054U-Fm
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obNex-0001Gv-TQ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:58:39 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obNeu-0000vR-NY
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:58:39 -0400
Received: by mail-wr1-x431.google.com with SMTP id x18so9969924wrm.7
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Qi/Jq9vAe/ynL99P1jKgO//PJIcQTC65awVNXqG6oLE=;
 b=fFf1HjTjwykz34p2ihmdaWqY7zrjkCANDfbW5f5LeK8hJYt0MHnjr3jyltJhZbbKNg
 RwRe0TiOhfWzlLEcADCqtEoWqVVzfH4PqacZ9Fa+rGun2k8+vYk6IQJon9BS/vFw1Ri9
 wgIFS4kaAGzCzKt+CW2Xi5LBfwJ/vR7E4rfaFKiXQZ2MrYsUuaEseObnmdDTw/zI8nHk
 DjRLv3BS+eIgHYLnqzwga7cPGC8oNv1iA0XScHDpXyqpx8KCOpqoWp4/PE07g7SV3O3O
 kDpTkw9zVRFbaY9VJ6WlAXY2rLBbCswgQPbFaO+zZ2iP5z/YS135iyOGlifw9YtBxuXH
 hctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Qi/Jq9vAe/ynL99P1jKgO//PJIcQTC65awVNXqG6oLE=;
 b=Ub988IZlWhwiobUKDj82Lr2Wm1+bq1Kxvz2pO5E3Veh0ML6vQbyp3uIBBdr/ykZQyK
 I8tXis/aoj/ffYePEGqmA9rYZDodo2KHLkSIFN4e80U+g05NOF+TIRxSeyuNqr3gP+FL
 /Y9ngUmO8GEVtqyAK00Pekhu/Jw/gZB00lyuAPLbIcy3Gan7QWYJeuLMVXIBGwLFKOn1
 hNlmuhHFsDYk9nDnoRxfb2vcRdc9cWOYVgcD5OzJnw0XaJviga+u6ydAkqMO/6a+zdTT
 SrWYpOd85/oi08pUkmMO+dM6peAI//1tIdWaMyD7YlRkU550P74MVZ/LkOD8Xnu4VkKg
 6+Jw==
X-Gm-Message-State: ACrzQf1asLoQebr9CN+Q2SNhVOYxOwElE/XDHv3LBoXSbeZB7MfiH0Jg
 bd57yelffDHw8ygQGffalVpP+Q==
X-Google-Smtp-Source: AMsMyM4MbmwtEVRCNo+a9FMuCWDtelduid6BlyS4QJ2xwi0Yy1Isro9AuTd04wz6xuiG0Zk6Qw4Qkw==
X-Received: by 2002:a05:6000:144c:b0:22b:dda:eeb0 with SMTP id
 v12-20020a056000144c00b0022b0ddaeeb0mr2430147wrx.335.1663858714797; 
 Thu, 22 Sep 2022 07:58:34 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c220600b003b492753826sm6019245wml.43.2022.09.22.07.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 07:58:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6A70A1FFB8;
 Thu, 22 Sep 2022 15:58:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v1 1/9] hw: encode accessing CPU index in MemTxAttrs
Date: Thu, 22 Sep 2022 15:58:24 +0100
Message-Id: <20220922145832.1934429-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922145832.1934429-1-alex.bennee@linaro.org>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We currently have hacks across the hw/ to reference current_cpu to
work out what the current accessing CPU is. This breaks in some cases
including using gdbstub to access HW state. As we have MemTxAttrs to
describe details about the access lets extend it to mention if this is
a CPU access and which one it is.

There are a number of places we need to fix up including:

  CPU helpers directly calling address_space_*() fns
  models in hw/ fishing the data out of current_cpu

I'll start addressing some of these in following patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use separate field cpu_index
  - bool for requester_is_cpu
---
 include/exec/memattrs.h |  4 ++++
 accel/tcg/cputlb.c      | 22 ++++++++++++++++------
 hw/core/cpu-sysemu.c    | 17 +++++++++++++----
 3 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..e83a993c21 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -43,6 +43,10 @@ typedef struct MemTxAttrs {
      * (see MEMTX_ACCESS_ERROR).
      */
     unsigned int memory:1;
+    /* Requester is CPU (or as CPU, e.g. debug) */
+    bool requester_is_cpu:1;
+    /* cpu_index (if requester_is_cpu) */
+    unsigned int cpu_index:16;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
     /* Invert endianness for this page */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 8fad2d9b83..5d88569eb5 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1340,8 +1340,13 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
     uint64_t val;
     bool locked = false;
     MemTxResult r;
+    MemTxAttrs attrs = iotlbentry->attrs;
 
-    section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
+    /* encode the accessing CPU */
+    attrs.requester_is_cpu = 1;
+    attrs.cpu_index = cpu->cpu_index;
+
+    section = iotlb_to_section(cpu, iotlbentry->addr, attrs);
     mr = section->mr;
     mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
     cpu->mem_io_pc = retaddr;
@@ -1353,14 +1358,14 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
         qemu_mutex_lock_iothread();
         locked = true;
     }
-    r = memory_region_dispatch_read(mr, mr_offset, &val, op, iotlbentry->attrs);
+    r = memory_region_dispatch_read(mr, mr_offset, &val, op, attrs);
     if (r != MEMTX_OK) {
         hwaddr physaddr = mr_offset +
             section->offset_within_address_space -
             section->offset_within_region;
 
         cpu_transaction_failed(cpu, physaddr, addr, memop_size(op), access_type,
-                               mmu_idx, iotlbentry->attrs, r, retaddr);
+                               mmu_idx, attrs, r, retaddr);
     }
     if (locked) {
         qemu_mutex_unlock_iothread();
@@ -1395,8 +1400,13 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
     MemoryRegion *mr;
     bool locked = false;
     MemTxResult r;
+    MemTxAttrs attrs = iotlbentry->attrs;
+
+    /* encode the accessing CPU */
+    attrs.requester_is_cpu = true;
+    attrs.cpu_index = cpu->cpu_index;
 
-    section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
+    section = iotlb_to_section(cpu, iotlbentry->addr, attrs);
     mr = section->mr;
     mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
     if (!cpu->can_do_io) {
@@ -1414,14 +1424,14 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
         qemu_mutex_lock_iothread();
         locked = true;
     }
-    r = memory_region_dispatch_write(mr, mr_offset, val, op, iotlbentry->attrs);
+    r = memory_region_dispatch_write(mr, mr_offset, val, op, attrs);
     if (r != MEMTX_OK) {
         hwaddr physaddr = mr_offset +
             section->offset_within_address_space -
             section->offset_within_region;
 
         cpu_transaction_failed(cpu, physaddr, addr, memop_size(op),
-                               MMU_DATA_STORE, mmu_idx, iotlbentry->attrs, r,
+                               MMU_DATA_STORE, mmu_idx, attrs, r,
                                retaddr);
     }
     if (locked) {
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 00253f8929..cdabc577d2 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -51,13 +51,22 @@ hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                      MemTxAttrs *attrs)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
+    MemTxAttrs local = { };
+    hwaddr res;
 
     if (cc->sysemu_ops->get_phys_page_attrs_debug) {
-        return cc->sysemu_ops->get_phys_page_attrs_debug(cpu, addr, attrs);
+        res = cc->sysemu_ops->get_phys_page_attrs_debug(cpu, addr, &local);
+    } else {
+        /* Fallback for CPUs which don't implement the _attrs_ hook */
+        local = MEMTXATTRS_UNSPECIFIED;
+        res = cc->sysemu_ops->get_phys_page_debug(cpu, addr);
     }
-    /* Fallback for CPUs which don't implement the _attrs_ hook */
-    *attrs = MEMTXATTRS_UNSPECIFIED;
-    return cc->sysemu_ops->get_phys_page_debug(cpu, addr);
+
+    /* debug access is treated as though it came from the CPU */
+    local.requester_is_cpu = 1;
+    local.cpu_index = cpu->cpu_index;
+    *attrs = local;
+    return res;
 }
 
 hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
-- 
2.34.1


