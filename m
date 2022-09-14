Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AA45B8D9B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:55:28 +0200 (CEST)
Received: from localhost ([::1]:55394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVfb-0001wj-QQ
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUxj-0005lL-A6
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:10:12 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUxd-0004P4-6a
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:10:04 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso11115272wma.1
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=2BRQIFYhGXX3NZ2a5yWXs0RohY3X8tQiSkdK+Z3nAt0=;
 b=H9w0sCum2LsofztkvXjsvZkhm3Icjhf9rP2fQdZX7H48HCui2r897Kc62b43l/idBR
 u08Hcy+K24BiLS43mXv3aOM5EW3k8A1OecmwyIw2kD1V7adKUD0t5fvsYyXAy6GQDLjO
 KEkDG0jXn5qPLu/I1M0oRnnfmG9tvp+22MAYuPxTcmLkeL4tXjT8oFaSeoGgZIGlfpY/
 /4uccENrYaHaUn0PRwn45ZyyRXJCP9HEj7cOPbCn0UjcwN7UWLm87rGEVZZSpILCD6ms
 qQnrxYNeqw2qMs4tYqV2F56/3CtlfDxXs1gSITTSGbCCRt2cr3MrUR5nFx9cLmYmLyT5
 CTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2BRQIFYhGXX3NZ2a5yWXs0RohY3X8tQiSkdK+Z3nAt0=;
 b=kDUAK9H+Oop6PdIVuXGu1WekwYD6W81wBh39oJAY9gfa9a3ix1sniFwBRRMmteEr4a
 HVrqUYd/fyT2Uu78K4IVd9ak/Ez6cYIAuUNMQwmW+cf+yFC6/PzfJAXyfP7dDPmcnmZN
 kemb2+bRPs7uONnKUNTXl+NFlueTWA+9DfQIUvQ7/eKjngvlwaA1sOl3vd44eTqlHUTK
 1g7zKUii8pasWEd8t3Yo29h8KVbTQLLohoc6RTUnlMGkxVwRpcn0ebtqzWR9e5oZceCT
 K1fcnSpi0LsAKsmL/ypPQRHOWTx2KyqP4roxOB2dUUikjPb4pqkexjwcPODxVYoM8bDh
 mKmg==
X-Gm-Message-State: ACgBeo3FWxL4zlFH/v0ZgGSoP2sljrasELXD4ajN69ZAEBfGgPbL10cj
 B4vnEk3plY9zensj5Dv33H1BCQ==
X-Google-Smtp-Source: AA6agR41tqTJOelRowrPr+NArEjP7XK1qPhRiEjhY2wUkvjHuP2FGQNh+qTPf59bXX318T5PADS6Ig==
X-Received: by 2002:a05:600c:a47:b0:3a6:5848:4bde with SMTP id
 c7-20020a05600c0a4700b003a658484bdemr3636095wmq.189.1663171796799; 
 Wed, 14 Sep 2022 09:09:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a5d4885000000b00228de58ae2bsm13869284wrq.12.2022.09.14.09.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:09:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3FBDA1FFB8;
 Wed, 14 Sep 2022 17:09:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH  1/4] hw: encode accessing CPU index in MemTxAttrs
Date: Wed, 14 Sep 2022 17:09:52 +0100
Message-Id: <20220914160955.812151-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914160955.812151-1-alex.bennee@linaro.org>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 include/exec/memattrs.h |  4 +++-
 accel/tcg/cputlb.c      | 22 ++++++++++++++++------
 hw/core/cpu-sysemu.c    | 17 +++++++++++++----
 3 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..3bccd5d291 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -43,7 +43,9 @@ typedef struct MemTxAttrs {
      * (see MEMTX_ACCESS_ERROR).
      */
     unsigned int memory:1;
-    /* Requester ID (for MSI for example) */
+    /* Requester is CPU (or as CPU, e.g. debug) */
+    unsigned int requester_cpu:1;
+    /* Requester ID (for MSI for example) or cpu_index */
     unsigned int requester_id:16;
     /* Invert endianness for this page */
     unsigned int byte_swap:1;
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 8fad2d9b83..68dc7dc646 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1340,8 +1340,13 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
     uint64_t val;
     bool locked = false;
     MemTxResult r;
+    MemTxAttrs attrs = iotlbentry->attrs;
 
-    section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
+    /* encode the accessing CPU */
+    attrs.requester_cpu = 1;
+    attrs.requester_id = cpu->cpu_index;
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
+    attrs.requester_cpu = 1;
+    attrs.requester_id = cpu->cpu_index;
 
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
index 00253f8929..bd7ae983ed 100644
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
+    local.requester_cpu = 1;
+    local.requester_id = cpu->cpu_index;
+    *attrs = local;
+    return res;
 }
 
 hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
-- 
2.34.1


