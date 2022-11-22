Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC3D6348D1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 21:59:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxaL3-0007N6-D1; Tue, 22 Nov 2022 15:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxaL1-0007LS-Da
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:57:51 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxaKz-0003VP-Hz
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:57:51 -0500
Received: by mail-pj1-x102d.google.com with SMTP id ci10so8054981pjb.1
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 12:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jYJr4MboKWNHHDRIY0tG/HwSzvYPNM+yCVJFiR1T/6U=;
 b=yIQweY/x3WAaQEb3kMCyWN3gVf2imWNtjuaLviMlwsfuJBX9tWdqVjlU2IBqq2E5xP
 Sq4QXlJE3k3YDxPhn85QE/D6RpY8GnWzk5EPwbOO3gmAlvDWY/SJRbN7irtsrSQUNLLh
 UO9bM/jMvNU43imhqnQAOUZes8xdqJQEuA/ktkKGqClI6W4Qh+6CHIe8Zs/HHUxx6FYy
 52cXWUDt/AyAsEOcrzt5gPyTmt9MSZ+IaHn9oRExnZnVoR/j+F01qCogrkRrZtOoLvdL
 UQBJi5twe2SuF3tokzVc++mLcLvBMT/o8yLyTjUpgMXl2VvthKOXroh2y86jWYt3MuZN
 ZKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jYJr4MboKWNHHDRIY0tG/HwSzvYPNM+yCVJFiR1T/6U=;
 b=jFfUduh5Ix0BPiUv2WvGT5ymbeAWoNFcpXPpa30u3FrHhdD/r5ngkSqx7OCkV1ui9m
 S1ec/0Lce13qMaYv/1cYZp7G524QO9tOiOPeoChV15kMwlkEopvVEdyPSRfVqjJKF8xv
 2AACffu3bjOPUGkmD0e/b1XeywsXmUbPUrjM9W6J3L6OyhC5/zK02tZaXh8kaUojfpDu
 omR+h+AdN080KHvz241SEBrFCDiR02W9+1Hh95+9act4ZML2/Z8voCqqkVmIVbAxMml5
 jk5rG5qZjtnkQvuCCd3gcitZFczCOmUwzhIB23APGV9BR1BlS+PAlTGsbgG+LcpxMH9K
 JYHA==
X-Gm-Message-State: ANoB5plHpEsDBYGt4Qiaq8PjutXtE4WFjLziPtjQXY32MbuRYIcpptkO
 kTVlxnv7KYGwSu73Z63C+GtGSvERWqNpOw==
X-Google-Smtp-Source: AA0mqf6cEURCX4e5pVCAZ5rBg3bEpfdc5ig2ZUaQWI6xhaul6m3FWQa2dL7twHFmf2HqN2z0PKolCw==
X-Received: by 2002:a17:902:e80f:b0:188:f571:cea2 with SMTP id
 u15-20020a170902e80f00b00188f571cea2mr8808245plg.146.1669150668241; 
 Tue, 22 Nov 2022 12:57:48 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90f5:6f8b:e78a:4a0])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a170903209300b00186fa988a13sm12383807plc.166.2022.11.22.12.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 12:57:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 7/7] accel/tcg: Use WITH_QEMU_IOTHREAD_LOCK in
 io_readx/io_writex
Date: Tue, 22 Nov 2022 12:57:39 -0800
Message-Id: <20221122205739.603510-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122205739.603510-1-richard.henderson@linaro.org>
References: <20221122205739.603510-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Narrow the scope of the lock to the actual read/write,
moving the cpu_transation_failed call outside the lock.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 6f1c00682b..8b86b70c60 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1356,7 +1356,6 @@ static uint64_t io_readx(CPUArchState *env, CPUTLBEntryFull *full,
     MemoryRegionSection *section;
     MemoryRegion *mr;
     uint64_t val;
-    bool locked = false;
     MemTxResult r;
 
     section = iotlb_to_section(cpu, full->xlat_section, full->attrs);
@@ -1367,11 +1366,10 @@ static uint64_t io_readx(CPUArchState *env, CPUTLBEntryFull *full,
         cpu_io_recompile(cpu, retaddr);
     }
 
-    if (!qemu_mutex_iothread_locked()) {
-        qemu_mutex_lock_iothread();
-        locked = true;
+    WITH_QEMU_IOTHREAD_LOCK() {
+        r = memory_region_dispatch_read(mr, mr_offset, &val, op, full->attrs);
     }
-    r = memory_region_dispatch_read(mr, mr_offset, &val, op, full->attrs);
+
     if (r != MEMTX_OK) {
         hwaddr physaddr = mr_offset +
             section->offset_within_address_space -
@@ -1380,10 +1378,6 @@ static uint64_t io_readx(CPUArchState *env, CPUTLBEntryFull *full,
         cpu_transaction_failed(cpu, physaddr, addr, memop_size(op), access_type,
                                mmu_idx, full->attrs, r, retaddr);
     }
-    if (locked) {
-        qemu_mutex_unlock_iothread();
-    }
-
     return val;
 }
 
@@ -1410,7 +1404,6 @@ static void io_writex(CPUArchState *env, CPUTLBEntryFull *full,
     hwaddr mr_offset;
     MemoryRegionSection *section;
     MemoryRegion *mr;
-    bool locked = false;
     MemTxResult r;
 
     section = iotlb_to_section(cpu, full->xlat_section, full->attrs);
@@ -1427,11 +1420,10 @@ static void io_writex(CPUArchState *env, CPUTLBEntryFull *full,
      */
     save_iotlb_data(cpu, section, mr_offset);
 
-    if (!qemu_mutex_iothread_locked()) {
-        qemu_mutex_lock_iothread();
-        locked = true;
+    WITH_QEMU_IOTHREAD_LOCK() {
+        r = memory_region_dispatch_write(mr, mr_offset, val, op, full->attrs);
     }
-    r = memory_region_dispatch_write(mr, mr_offset, val, op, full->attrs);
+
     if (r != MEMTX_OK) {
         hwaddr physaddr = mr_offset +
             section->offset_within_address_space -
@@ -1441,9 +1433,6 @@ static void io_writex(CPUArchState *env, CPUTLBEntryFull *full,
                                MMU_DATA_STORE, mmu_idx, full->attrs, r,
                                retaddr);
     }
-    if (locked) {
-        qemu_mutex_unlock_iothread();
-    }
 }
 
 static inline target_ulong tlb_read_ofs(CPUTLBEntry *entry, size_t ofs)
-- 
2.34.1


