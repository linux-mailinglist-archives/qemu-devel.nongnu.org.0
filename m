Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0E265938F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:07:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2r8-000315-NL; Thu, 29 Dec 2022 19:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r6-0002zk-9e
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:36 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r4-0002gZ-Ia
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:36 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 n65-20020a17090a2cc700b0021bc5ef7a14so20320249pjd.0
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yTAFA5u9VpP4tWGyC/Uni1rtwcEMMx/BI1MBDPeSpjQ=;
 b=Ux57F5sVqlCG8QYQDCHCLHXGC9OrJDcdjUG1Oly4PodSzKqDN7CQ3I0BKmzeLEYARC
 3NRGBtvOHIkxuqewC/907+ssP1DfQQq7qRUmVYQsj6OUZ02Sm7R0Jtk8QNCt+4wK0tpC
 pocvlI2RUc3TQhaoByuaozEA+tVFb9X4rZguy1mtaj4hbty1ZwgjYL/bGtvIRFhETw4B
 Kbla5NTQGzYNL/Q6M8eL/HdChbaT6vCyDn6ixHt0V2/3TDGtLY0qZJT+GusoEmbFdIbw
 G4J3yvqe0doY/xe+yos49ND9yrnSJthbL+IaCguRV/x1wMkfaOYAavOVEd8ag+KSi3i6
 ukNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yTAFA5u9VpP4tWGyC/Uni1rtwcEMMx/BI1MBDPeSpjQ=;
 b=zawUmGx5SF+iFOSVY0Cpudb0m7FOUrLNmrjoh9M5ULteEAN6NKRxXPZicFptZadC4Z
 WrDyDncAwxjxRmajZS+ICaBlj2U3OGuHtFeUvwT+BQ1QnkWpbAm04JAV8Veihxlegb/a
 VbLE4qIQssyCAEiuKlpB8zIFX30uhoTMJSLikuFDUaez2B83Ogh5R6x2ZhG41EmYR4Qc
 iUWnJS8/uP64872QSfeg+HcsIsY0nB00dsui+7SAHdHB7p/PKn9WOMRfWcq/L8TrVhEY
 gYKCqmTurhk5iHp2bBTgkHiN2isfr/vV4Btw8rND7+Nj6oa6BLX++YYXUTj++bi7Y7wK
 /OyA==
X-Gm-Message-State: AFqh2kpzp6xwyqaYP8/4UDD5UPim1BbS3twMRURp3ZWb9mg8zzhh+lI6
 3a9nMjH+XVuF+pMfT1urgDsw2M7uwJLuljm9
X-Google-Smtp-Source: AMrXdXs6CALUgcIePhqTYrbYl9HImaFL7hn6eh0wezcjRcberlwms4CQsY141GEuHcDizQ6L21imqQ==
X-Received: by 2002:a17:902:b609:b0:192:4ed2:7509 with SMTP id
 b9-20020a170902b60900b001924ed27509mr31905401pls.15.1672358553306; 
 Thu, 29 Dec 2022 16:02:33 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 11/47] accel/tcg: Use QEMU_IOTHREAD_LOCK_GUARD in
 io_readx/io_writex
Date: Thu, 29 Dec 2022 16:01:45 -0800
Message-Id: <20221230000221.2764875-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 03674d598f..4948729917 100644
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


