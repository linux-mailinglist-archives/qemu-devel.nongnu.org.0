Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C9759937A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:36:00 +0200 (CEST)
Received: from localhost ([::1]:34260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOsnf-0001cy-RG
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseX-0001t2-E3
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:33 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseV-0002ky-QO
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:33 -0400
Received: by mail-pl1-x62e.google.com with SMTP id 2so3132048pll.0
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=zDz/TIezAGhDTjjMc0+1pA+Hd7qL30qFYVrbSwswVFk=;
 b=U+2p8ax6lMUONdaDQ+mL3Ay/Rl4HuoGYrPdClY0w92nsEcMQW8QaqzBJOqrNpLy9/4
 SDXxgdGy/+8T79dGElH4fBq9NsD4u7B8HAcqNzv+sg83eD+v+jrrCXK8Xwxk8CGmc4Lg
 ziWn1wuASavlZM8p2Nyh9nOhF4bA2n+bPJxK4V9/FTbry26J0kHGgm4FNjfPG36TWtyg
 k9aYpv3J/HYoWgiNvVbxRkusuIQuU4c6A0DYw++HHiPGnAhXDJippSoe11+IhdpbfYe1
 qJ3oDVmoOfOy+pDTw/bsZpfv04f6qXd2pHGRAb/lHOWtvX2fXm4WQp4983HfHZrW9EHd
 rraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zDz/TIezAGhDTjjMc0+1pA+Hd7qL30qFYVrbSwswVFk=;
 b=dtwhg0vKWCPIvO1rf5MJcXcOc3UhwJsTwTIysDv66j6+tq1kP7tKZx7OpI4s9K+qMt
 8Pw0WCO+ZxPl+w0UzMeCNwjJdWom4MeBUktbXD52snfv9tiLekqMtAA3LO9Gq2gr6Jpc
 rH09HowOeTLLcSI33WguyculT+HHZGy8SNolJ1hRcyuRYmatxHCnJQ4nCrE8upROkkVM
 IxNiHGEfvESWvVv5tOBuoH67vzxP3XexNvnWmm0lPpSeOHzydqL3Tz4q1BkYajMu43O9
 E2qTj1YaLGwNRG5a6brHxBm14HQ7leiYP8tspLoTxVOVoSjIcRHPnE76MGYoTeO7GoN5
 j3qg==
X-Gm-Message-State: ACgBeo3zfrH1DHNdm+B3LomwmaFLaa9ZqWrkL12W4Jdszs5JfI/2FWJ1
 ODQEJ9FBgd7BPgE6HqdLHBnb6sD7SNW4tA==
X-Google-Smtp-Source: AA6agR79XBA+FjcAjF8THlzRYNMxNNQDxg8Ej38q0cFYabwKRRi/Q4MMhXuACYVENjYvs7nvD5nlXQ==
X-Received: by 2002:a17:90b:4b05:b0:1f5:b540:de3a with SMTP id
 lx5-20020a17090b4b0500b001f5b540de3amr6201352pjb.43.1660879589480; 
 Thu, 18 Aug 2022 20:26:29 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 11/21] accel/tcg: Move qemu_ram_addr_from_host_nofail to
 physmem.c
Date: Thu, 18 Aug 2022 20:26:05 -0700
Message-Id: <20220819032615.884847-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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


