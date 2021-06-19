Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6117B3ADB26
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:40:13 +0200 (CEST)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luex2-0001nY-Em
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejy-0003pe-42
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:42 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:41580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejv-0003dx-4V
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:41 -0400
Received: by mail-pf1-x42f.google.com with SMTP id x73so10280306pfc.8
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CGmZkzk4V2WoIYclr+JhIOxHAFi329cCw8zNPXEAFb4=;
 b=NkCrZIpOV1wk+xCetUIKP4ShbHbaafKPhsltVOTu+rH/yahV3U+ZzanyQXNc6jUbDk
 OePbZLeD0GkmPvPOAE9JJclRAaGXWX84R8nza9DECmRp3JSUREUUi2nKiqoIybl/AxoE
 5a+RPYE+Ff6nMlFJZee0bhDtdrJuqxEtviAiEiozNK5INYNiP2Mwm33ZSETDuw455ucb
 JSk7Y2UgPB0bnvEoeNRETU0NwTclWgf3KE+7sS1LmRX8MuyBYFIjGcLstTDT7WIYUngN
 h5R/qOm2ScMlgx23pY84gOn4D/W9BWWoWR6G+NLSnDvwRTc3k5hieVYVFCaEvdQhY1r8
 o8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CGmZkzk4V2WoIYclr+JhIOxHAFi329cCw8zNPXEAFb4=;
 b=lSnF1MFw3fm8qIoXisyMPQG3X8b6kY8knaBro+4mCrVInucW8OqMt96CkMHVX+864L
 T5znyV4LUqUkxh2gy7W9hR9DR0K57qS9jFczRw3I/JQ4AiG6lLUYylmsieEe4vL0892O
 P8APbULpAexYFUrIz2XWZC9PZgoSittSsYG+zrY/v+uMLNKwlTkGolLhCZhGFztZmLTZ
 HV+8kkGk9dr24NyOn3dWRvOc/3Dlc4ZHsyS7fukcYMOJNoBBZLcv9qefWm47EDouxpax
 8y4dp3qIy84dASUs6QNJLg4mI2rWctFMGMGCDZyeOMHVkCdDr0aVIHhzk+pPmvPULd/M
 O1UA==
X-Gm-Message-State: AOAM531PxpQVjoOz7xXchEPQmHvUQxMr44r4bylFX7UFJQxfUXivDFh+
 hvd4OKWyZvmigf/kcr1R+r0mecDTpByxSg==
X-Google-Smtp-Source: ABdhPJzFqMMvPjZAReUR2ltNRI3eCYPqMfGSSV+1xQM/JWGuWvfVbBJ1CXibjgKGTb3T4XRLoUyvkA==
X-Received: by 2002:a62:b50b:0:b029:2fc:db53:a56a with SMTP id
 y11-20020a62b50b0000b02902fcdb53a56amr11417932pfe.30.1624123597835; 
 Sat, 19 Jun 2021 10:26:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm2084241pjb.37.2021.06.19.10.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 10:26:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/15] RFC accel/tcg: Defer some unaligned accesses to memory
 subsystem
Date: Sat, 19 Jun 2021 10:26:26 -0700
Message-Id: <20210619172626.875885-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619172626.875885-1-richard.henderson@linaro.org>
References: <20210619172626.875885-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For unaligned i/o accesses that do not cross pages, do not handle
the misalignment in cputlb, but let the memory system deal with it.

RFC because this, for the first time, exposes many guests to the
existing mr->ops->valid.unaligned checks in the memory subsystem.
Previously this code was only reachable when guest code explicitly
calls memory_region_dispatch_*.

This does in fact trip up the original m68k q800 testcase, #360.

Since this hasn't really been reachable, I'm willing to bet that
every device is wrong wrt mr->ops->valid.unaligned, and possibly
that we shouldn't even have it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 6209e00c9b..905edab19b 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1929,12 +1929,6 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
         CPUIOTLBEntry *iotlbentry;
         bool need_swap;
 
-        /* For anything that is unaligned, recurse through byte_load.  */
-        if ((addr & (size - 1)) != 0) {
-            return load_helper_unaligned(env, addr, oi, retaddr, op,
-                                         code_read, byte_load);
-        }
-
         iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
 
         /* Handle watchpoints.  */
@@ -2425,7 +2419,6 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
     if (size > 1
         && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
                      >= TARGET_PAGE_SIZE)) {
-    do_unaligned_access:
         store_helper_unaligned(env, addr, val, retaddr, size,
                                mmu_idx, memop_big_endian(op));
         return;
@@ -2436,11 +2429,6 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
         CPUIOTLBEntry *iotlbentry;
         bool need_swap;
 
-        /* For anything that is unaligned, recurse through byte stores.  */
-        if ((addr & (size - 1)) != 0) {
-            goto do_unaligned_access;
-        }
-
         iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
 
         /* Handle watchpoints.  */
-- 
2.25.1


