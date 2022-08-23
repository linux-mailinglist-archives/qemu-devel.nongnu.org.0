Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A23959EEC9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 00:12:27 +0200 (CEST)
Received: from localhost ([::1]:35752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQc8I-0004OJ-14
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 18:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc26-00007Q-0a
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:06:02 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc23-0001R9-Aw
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:06:01 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 c13-20020a17090a4d0d00b001fb6921b42aso2840767pjg.2
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 15:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=R/p+r484m5PYDR84cT2Qqy34G8SbgJ7J/HJ5T0WBYxI=;
 b=or0gIywj+8+/74uG/fqhZWvKvDpRAgaxjOUhgCoXqcBoL+ouhncoOTxsL1nsXcsPpX
 CsBpaqvpGJe6r/ZtpewzkavCuaNHAOtm45316CTqSsS6QIBqrX0KCxXhHZuts/iAfHE3
 JsttW5ER1f+Mf3n7npIgwHLAayKLvr+309vmTWhdbFjuUtYsamKU9vH5bq3s6PxLNFIH
 newRxWQDSd7jy76xD4098bX/mgqp7uIiJxynIYDCC6hwZyPpaEGKXqyJnkHoCO8VVcP/
 aEZlYXzdcDAN8SElyqpQKTDneUWE/nh5JY9O4Uhs8w/qWp3SOqQgEFibZk4PO/Dm+pwe
 YQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=R/p+r484m5PYDR84cT2Qqy34G8SbgJ7J/HJ5T0WBYxI=;
 b=GdukvUp+A5lU9boP5+mXTcgr1bxMwX0jdhNVOneuKBjUqG6caUJS3vZ7Z/LjZ+MHIg
 bZkIaCZtwi8pRZHjD0YetYhRzVEGHcbugEJeg/If5fvEZmP4PHWxAihrLBu5hAhcN3as
 oLdGoejgz1GcibRU6FPpHCm8PtwlguVN7CUlREFi54layjfJaH9Ut83/03YfuhjsUYdh
 rWa4OtK2GhAW/6jGXy2W9O+iLsJBW9OiH7irlrZ8yVkUwoL42yLd28pwEhXayY4V0KDa
 n6rhTAttbmJScy2CL4E/ZUzPma5IsghhXyOG+KhtfjjETsAkm4/8lZM/FYpxtX9kn9Kt
 x+tw==
X-Gm-Message-State: ACgBeo36hFcsL15ieBMli7dj/EKhu8hz4gbSy3R/rXXq60kkA9gFVs38
 sgxOCuA+ySZXWktzMAZgkGrG21TvMq0i7Q==
X-Google-Smtp-Source: AA6agR7TnUaq5FMh+t4kd81EGxu2mQ4ljOzQpqau55stvzlpm21uwqVMgD6M13uZTG+7vuIVpK0xkw==
X-Received: by 2002:a17:90a:bf05:b0:1fa:d8f9:5402 with SMTP id
 c5-20020a17090abf0500b001fad8f95402mr5087637pjs.197.1661292357911; 
 Tue, 23 Aug 2022 15:05:57 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902f60c00b0017292073839sm11020974plg.178.2022.08.23.15.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:05:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com, laurent@vivier.eu, alex.bennee@linaro.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 11/20] accel/tcg: Move qemu_ram_addr_from_host_nofail to
 physmem.c
Date: Tue, 23 Aug 2022 15:05:33 -0700
Message-Id: <20220823220542.1993395-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823220542.1993395-1-richard.henderson@linaro.org>
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The base qemu_ram_addr_from_host function is already in
softmmu/physmem.c; move the nofail version to be adjacent.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-common.h |  1 +
 accel/tcg/cputlb.c        | 12 ------------
 softmmu/physmem.c         | 12 ++++++++++++
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 2281be4e10..d909429427 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -72,6 +72,7 @@ typedef uintptr_t ram_addr_t;
 void qemu_ram_remap(ram_addr_t addr, ram_addr_t length);
 /* This should not be used by devices.  */
 ram_addr_t qemu_ram_addr_from_host(void *ptr);
+ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr);
 RAMBlock *qemu_ram_block_by_name(const char *name);
 RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
                                    ram_addr_t *offset);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 43bd65c973..80a3eb4f1c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1283,18 +1283,6 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
                             prot, mmu_idx, size);
 }
 
-static inline ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
-{
-    ram_addr_t ram_addr;
-
-    ram_addr = qemu_ram_addr_from_host(ptr);
-    if (ram_addr == RAM_ADDR_INVALID) {
-        error_report("Bad ram pointer %p", ptr);
-        abort();
-    }
-    return ram_addr;
-}
-
 /*
  * Note: tlb_fill() can trigger a resize of the TLB. This means that all of the
  * caller's prior references to the TLB table (e.g. CPUTLBEntry pointers) must
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index dc3c3e5f2e..d4c30e99ea 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2460,6 +2460,18 @@ ram_addr_t qemu_ram_addr_from_host(void *ptr)
     return block->offset + offset;
 }
 
+ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
+{
+    ram_addr_t ram_addr;
+
+    ram_addr = qemu_ram_addr_from_host(ptr);
+    if (ram_addr == RAM_ADDR_INVALID) {
+        error_report("Bad ram pointer %p", ptr);
+        abort();
+    }
+    return ram_addr;
+}
+
 static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
                                  MemTxAttrs attrs, void *buf, hwaddr len);
 static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
-- 
2.34.1


