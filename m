Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74A762F0ED
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:20:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxX4-0001RL-AM; Fri, 18 Nov 2022 04:19:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxWu-0001EQ-4n
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:19:26 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxWp-0005wh-R8
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:19:23 -0500
Received: by mail-pl1-x62b.google.com with SMTP id y10so2865315plp.3
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xTLomTDMGtupPpPOgZN/MPA3hVB5xteqtzEufUeeVc4=;
 b=nBWVdlfG6jGTS4BPabqBGsFnyN8T/2fIUjbvNY5uhj45+YS35FEr7D7/CHU6CTxast
 VYDALSnmODgbS4TbnsvC+Pzl0b6D2khMDzlO1Bmg+wb+v5xUMA0jYiuEdMoJ6hohvcPi
 ZZNy4hWgoaAED25vEWCSmTVPFd4uuQIBHLf+uk8iBCR1sBpGVTR+h8+BdOmUtuQ2c+uk
 L+v/cFlIGtGf0QoaFI0phmDfbvYkyV0mjxFRYzLym1h1IHISP4vi3qygUN3KEDD5uxCK
 3eYMbma2V8xbybp/3Ff+OqlkB1my8z2/DknrznzDy42iqveEZ+NrBR7WEpzjULriyZWl
 7Zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xTLomTDMGtupPpPOgZN/MPA3hVB5xteqtzEufUeeVc4=;
 b=EZmDsLk/UX4RO2AN6Ykhy6Rz+ygADHovoKuUOKeOCP74QG1zdiZu4knbIoUeq1IXBo
 4086QzeDbtaHsGEJepow+sDHpxgiGDv2N8PUsY17hhLBG6PtKX6tJsDU4+V44dK6oqqT
 j235OdRssLPEZ93of6WpE+IVSsC/9zXr/2VCZphlNxGCM95hW2inNCfp0VSgsSaK5ort
 sIzOa+dZjN9hD6xhJ3kPjihEGYXqaBGs2LFn7d7Qq7ubzLAv0FHFmOCAt7vlVDR10aBN
 N+GRVKUalPWVuhwgdNpSQWeqp0gsR7A2aHEE3ibRHjhl+v2aQkPYLrUHkxSsPXmFCh5K
 znsw==
X-Gm-Message-State: ANoB5pkUU01eHDIeAaDgJSl0Ekd1RDxtxMDdCj/TAzpPVP9ArcQ2Nsnr
 MrcDNh+EYhxlW8RjuFpCvCLuLqfgAy6AbA==
X-Google-Smtp-Source: AA0mqf5BXFsWKVCUOQsEf9R1UDXJwuhjjKdyeLWl2KK9Hnlx3b92tVnAQE4OnV4lxlbumWCcYt36eQ==
X-Received: by 2002:a17:902:70c3:b0:186:ba52:1dc7 with SMTP id
 l3-20020a17090270c300b00186ba521dc7mr6670895plt.41.1668763153253; 
 Fri, 18 Nov 2022 01:19:13 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 a27-20020aa794bb000000b0056e8eb09d57sm2672305pfl.63.2022.11.18.01.19.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:19:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 7/7] accel/tcg: Use QEMU_IOTHREAD_LOCK_GUARD in
 io_readx/io_writex
Date: Fri, 18 Nov 2022 01:18:58 -0800
Message-Id: <20221118091858.242569-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118091858.242569-1-richard.henderson@linaro.org>
References: <20221118091858.242569-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 517b599c5f..d177afcad6 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1356,7 +1356,6 @@ static uint64_t io_readx(CPUArchState *env, CPUTLBEntryFull *full,
     MemoryRegionSection *section;
     MemoryRegion *mr;
     uint64_t val;
-    bool locked = false;
     MemTxResult r;
 
     section = iotlb_to_section(cpu, full->xlat_section, full->attrs);
@@ -1367,11 +1366,11 @@ static uint64_t io_readx(CPUArchState *env, CPUTLBEntryFull *full,
         cpu_io_recompile(cpu, retaddr);
     }
 
-    if (!qemu_mutex_iothread_locked()) {
-        qemu_mutex_lock_iothread();
-        locked = true;
+    {
+        QEMU_IOTHREAD_LOCK_GUARD();
+        r = memory_region_dispatch_read(mr, mr_offset, &val, op, full->attrs);
     }
-    r = memory_region_dispatch_read(mr, mr_offset, &val, op, full->attrs);
+
     if (r != MEMTX_OK) {
         hwaddr physaddr = mr_offset +
             section->offset_within_address_space -
@@ -1380,10 +1379,6 @@ static uint64_t io_readx(CPUArchState *env, CPUTLBEntryFull *full,
         cpu_transaction_failed(cpu, physaddr, addr, memop_size(op), access_type,
                                mmu_idx, full->attrs, r, retaddr);
     }
-    if (locked) {
-        qemu_mutex_unlock_iothread();
-    }
-
     return val;
 }
 
@@ -1410,7 +1405,6 @@ static void io_writex(CPUArchState *env, CPUTLBEntryFull *full,
     hwaddr mr_offset;
     MemoryRegionSection *section;
     MemoryRegion *mr;
-    bool locked = false;
     MemTxResult r;
 
     section = iotlb_to_section(cpu, full->xlat_section, full->attrs);
@@ -1427,11 +1421,11 @@ static void io_writex(CPUArchState *env, CPUTLBEntryFull *full,
      */
     save_iotlb_data(cpu, section, mr_offset);
 
-    if (!qemu_mutex_iothread_locked()) {
-        qemu_mutex_lock_iothread();
-        locked = true;
+    {
+        QEMU_IOTHREAD_LOCK_GUARD();
+        r = memory_region_dispatch_write(mr, mr_offset, val, op, full->attrs);
     }
-    r = memory_region_dispatch_write(mr, mr_offset, val, op, full->attrs);
+
     if (r != MEMTX_OK) {
         hwaddr physaddr = mr_offset +
             section->offset_within_address_space -
@@ -1441,9 +1435,6 @@ static void io_writex(CPUArchState *env, CPUTLBEntryFull *full,
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


