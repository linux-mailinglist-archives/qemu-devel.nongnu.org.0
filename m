Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F19655BEA
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:10:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOb-0002Lu-MW; Sat, 24 Dec 2022 18:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOW-0002Je-Fc
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:36 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOU-0006IC-RN
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:36 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 gv5-20020a17090b11c500b00223f01c73c3so10043197pjb.0
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yTAFA5u9VpP4tWGyC/Uni1rtwcEMMx/BI1MBDPeSpjQ=;
 b=h4R+IEWDg7AsbdYpogSE9GwcRT+dLfleqZ1++jgZL+FD6N9tSvOHBbLcJHBE9hBHZW
 ccTQbuRyUzwzm31xHHEarZzsH3m3RYj6rlMxuPUGOTdLNWEVbfaWY/+bmwCvc+J1/T1N
 2u6r9EvZs+pcj/gQl7/7o89VWS5Z3u5djuNK16/M3maRlazP19qdEhwDOLbLe8q6RLo5
 VWMCiszi4KtxdqTX2DMBkkqqlS0j8m2yjnqBeHp/qcskmJYSE2lsYmMdZdIvxoTMMEj3
 vBHaN5POaHC8xu9xHDMCDHBEgV4L2FsC6wvvKsM/YfazD/HsE09lz1JtNF0j7WcGJ2rn
 teTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yTAFA5u9VpP4tWGyC/Uni1rtwcEMMx/BI1MBDPeSpjQ=;
 b=2waXFh5+iyFiKJ9PYFijbkwHDWp9Jjdopkvud9B9uBMYujhLoQH6iEvQqPvKLCEADx
 vMZ2HRk7NZjm9tUGI9V15N+wJOJbyJSRAEGI0frf5UmommgGXrlLv6pQA2BakFSCPcvv
 GH96t3XeF3ZQ3YljsjMiJZAfBsPz6nZPj20exrCqeS1o0mxAU1ZF6HrIrK0hVohrJ64M
 Ac3RruM7pHH7VVLBDiYGSpX8gbJ7mGo7w4fsk6mTxoGHf/t3i4vYX7JW6XRGfjkDWuxD
 8kNfHW1uJf70JpDCvy6kh98T0AFoqX+/dnAL1tBhCEfM9zUGruyvCj0opbrjovYHXzQi
 DCtw==
X-Gm-Message-State: AFqh2krNjfwsYbJi2UKJmLVHEF2gnNMolKFlDPdABlz7BrYXzg+lvbUg
 Aj8axblT4uSIhcpYJmBUxkXq7FLtlFbBg73J
X-Google-Smtp-Source: AMrXdXv67op9fYhF2b+1VjH62sxX0qWIfqizhPtuk0Xa7G3T76QsiadfToiKRFEwv1Db0VyJC0nAaA==
X-Received: by 2002:a17:902:bf43:b0:185:441e:2d77 with SMTP id
 u3-20020a170902bf4300b00185441e2d77mr16505843pls.14.1671926253390; 
 Sat, 24 Dec 2022 15:57:33 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 11/43] accel/tcg: Use QEMU_IOTHREAD_LOCK_GUARD in
 io_readx/io_writex
Date: Sat, 24 Dec 2022 15:56:48 -0800
Message-Id: <20221224235720.842093-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
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


