Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6196A1169
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:46:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIRk-0002tv-KV; Thu, 23 Feb 2023 15:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRi-0002tB-8t
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:44:06 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRg-0007To-Hi
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:44:05 -0500
Received: by mail-pl1-x632.google.com with SMTP id l15so15653875pls.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 12:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1qnhwX4yflIrdAFP6huqsV3m6ZntpB/Nux3MPFDNhmI=;
 b=e2+Z/XP3GFTAF/aOVg0WIAh+mexIOmxR6DFmL8nqNwpeOGXlbSdc7YSTz8r4M7ToI8
 ZWDtc1zQJExswHP5rn0tEKWJBLfpVX0st6uTYnqRiurhfkRgtU++7BVbpEpG5w+3kR88
 d99YdhT7AyYfTCdO6XlS1vSV91l/1HUa9jGThgEFxudiIL8FHk59+hxMqJya3DSFuuv6
 98JBCWpnq/ZAxFb5UQtEhI8tieMs+jJBh5RgzQYyqFEox4KwYXP+IcZF+M4VDwH0eZ7E
 6oBHiVKRuGVo/n8x526VnCe6Jqx1C/WDWOsjx4C9PW11P9c2mI9sK1XDHMME22Y4O6tL
 GPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1qnhwX4yflIrdAFP6huqsV3m6ZntpB/Nux3MPFDNhmI=;
 b=hRZoomptDmLGdVviNHt9PaW60lKcmGz5GZBEYiR62l9wlnqTGNjSOp+YnKsr9oxFF1
 uFaWS2w7eAWjHfDQpCNEVq2jtpiTHz/6V6HN9V9t/onKjOtyW1/TxMdFKhNWGpxlkLgW
 LAwOmD97277Yck1wtx0gWGb4FeFuR3Y0NJaqeeoB2ENDfcKJ7aAD285P0KurCehZ1GdG
 EcaC4pKdxHz6o5sgax5AQBNmPAW799Z2ebMd/hczoG6bPO3K93fcFP8Ibu41d+c5dX/v
 HFeSx7suiLsuxkQ3dccDusFNrdt5QK9mS2gUPbmXkbAP1Ux/Zf7zxbCfU1Bg8848aq1m
 ATuA==
X-Gm-Message-State: AO0yUKUA4M4JIwxta5LL6KKKN0Wziq7RdTNcztMUWA84mGm1LReXa6HU
 hppLHFjiVZVRQKUIo7zKwaydq54EuwgQhyZtx7g=
X-Google-Smtp-Source: AK7set97fO0Md7B1toCfjuw+PuUJjCvPvodGYTK+qxmdzfdT925is5PVoKwHT6b+tXZJ/TCMl3/Xyg==
X-Received: by 2002:a05:6a20:ba9e:b0:c0:c9b8:56 with SMTP id
 fb30-20020a056a20ba9e00b000c0c9b80056mr4821871pzb.29.1677185043203; 
 Thu, 23 Feb 2023 12:44:03 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:44:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/13] accel/tcg: Add tlb_fill_flags to CPUTLBEntryFull
Date: Thu, 23 Feb 2023 10:43:39 -1000
Message-Id: <20230223204342.1093632-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Allow the target to set tlb flags to apply to all of the
comparators.  Remove MemTxAttrs.byte_swap, as the bit is
not relevant to memory transactions, only the page mapping.
Adjust target/sparc to set TLB_BSWAP directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h   | 3 +++
 include/exec/memattrs.h   | 2 --
 accel/tcg/cputlb.c        | 5 +----
 target/sparc/mmu_helper.c | 2 +-
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index ef10c625d4..53743ff3f2 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -170,6 +170,9 @@ typedef struct CPUTLBEntryFull {
     /* @lg_page_size contains the log2 of the page size. */
     uint8_t lg_page_size;
 
+    /* Additional tlb flags requested by tlb_fill. */
+    uint8_t tlb_fill_flags;
+
     /*
      * Additional tlb flags for use by the slow path. If non-zero,
      * the corresponding CPUTLBEntry comparator must have TLB_FORCE_SLOW.
diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 1bd7b6c5ca..5300649c8c 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -45,8 +45,6 @@ typedef struct MemTxAttrs {
     unsigned int memory:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
-    /* Invert endianness for this page */
-    unsigned int byte_swap:1;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index cc98df9517..a90688ac30 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1168,14 +1168,11 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
               " prot=%x idx=%d\n",
               vaddr, full->phys_addr, prot, mmu_idx);
 
-    read_flags = 0;
+    read_flags = full->tlb_fill_flags;
     if (full->lg_page_size < TARGET_PAGE_BITS) {
         /* Repeat the MMU check and TLB fill on every access.  */
         read_flags |= TLB_INVALID_MASK;
     }
-    if (full->attrs.byte_swap) {
-        read_flags |= TLB_BSWAP;
-    }
 
     is_ram = memory_region_is_ram(section->mr);
     is_romd = memory_region_is_romd(section->mr);
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index a98dd0abd4..fa58b4dc03 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -580,7 +580,7 @@ static int get_physical_address_data(CPUSPARCState *env, CPUTLBEntryFull *full,
             int do_fault = 0;
 
             if (TTE_IS_IE(env->dtlb[i].tte)) {
-                full->attrs.byte_swap = true;
+                full->tlb_fill_flags |= TLB_BSWAP;
             }
 
             /* access ok? */
-- 
2.34.1


