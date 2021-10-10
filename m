Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603D34282B5
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 19:48:43 +0200 (CEST)
Received: from localhost ([::1]:59906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZcwD-0003Kp-W2
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 13:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcru-0000Tz-Jc
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:18 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcrs-0005p1-9w
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:14 -0400
Received: by mail-pl1-x62e.google.com with SMTP id c4so9685896pls.6
 for <qemu-devel@nongnu.org>; Sun, 10 Oct 2021 10:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Im+b1+SE02Qv2KjU8guCaDLdxStcEkFqEbgLcsDJx9w=;
 b=I4ZYoZfOncX7quOp3ibiSVKLECgadO7FAbEwwVFrKHIPLpSAPj5EV8CIYgL4R7BR0L
 hbzF/FKBEdqeVQ+JHX51Ppezq4SwvmTPJpxD7C52M5VDTpQjpxUD8bhiKzEWPh1ZywpS
 AWwR2ybocxiJP3pzJsYOCBaNSK2Sli8mLas/vo/8vEsWcTda8bFjaZ7G6M3dWnspUlcM
 rF272yh6YuYlF2+gDSUlTiqm4nXvTtOXiCfnt9lqFhST5HzkINGAHmJ3fLwrlVaK2q3t
 0ZP5O1epQZR2BYDDaasTww6dKsUFVRl7uvw46epJDO4ESxeZhWuFQcNN8UDPs3Ssnl97
 39KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Im+b1+SE02Qv2KjU8guCaDLdxStcEkFqEbgLcsDJx9w=;
 b=VQKmLI9SEJNbqbu34nE68VrqNht5XWc5H8A1po+SH6V0dyxqNBmV9K2ZtwpF1s465r
 jNDiiolgwV/0peCVFY8ZTpc2ZPTFrOTYTqAbXH1tjlREE7jTWZe7zujV8Am7yzMLI2Zc
 +2sV2uy2WePJ4uPjgzlCb6hxccBJ8I5GTfK14V/+uzus3NgR4M+6Cr731c5dfLi2ToZn
 F714LlmXmnwd/2nAIL9TrTsDd53d+tKcyXnCxWgmZ4T/d4OPIlvBbRSKucTPT7eUem4+
 n0+QqzNy8ykuGiJIm9YpfLo6vzrJTcIu4r3mXno48pjfRJN1TMXynz2K9yRyo+9z4EOH
 L4sQ==
X-Gm-Message-State: AOAM530A2nJRPiKbwum6qPJhkvpl5pPxEnvE52SGka9pZnhUDuMorhcg
 wJFRSKcP9ij9McZWarW6VcaWb5s6BGE9bvW4
X-Google-Smtp-Source: ABdhPJykcHPZXyN2ZmTvQ7m9oyMylUWXo5uz5P5q1BmYtf/Tfq1MVE0A0EvUPUlrLrNXCBUfYoiq+g==
X-Received: by 2002:a17:90b:4b89:: with SMTP id
 lr9mr25019163pjb.11.1633887850945; 
 Sun, 10 Oct 2021 10:44:10 -0700 (PDT)
Received: from localhost.localdomain (068-185-026-038.biz.spectrum.com.
 [68.185.26.38])
 by smtp.gmail.com with ESMTPSA id 18sm5095391pfh.115.2021.10.10.10.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 10:44:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] accel/tcg: Support TCG_TARGET_SIGNED_ADDR32 for softmmu
Date: Sun, 10 Oct 2021 10:43:56 -0700
Message-Id: <20211010174401.141339-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211010174401.141339-1-richard.henderson@linaro.org>
References: <20211010174401.141339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: git@xen0n.name, Alistair.Francis@wdc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When TCG_TARGET_SIGNED_ADDR32 is set, adjust the tlb addend to
allow the 32-bit guest address to be sign extended within the
64-bit host register instead of zero extended.

This will simplify tcg hosts like MIPS, RISC-V, and LoongArch,
which naturally sign-extend 32-bit values, in contrast to x86_64
and AArch64 which zero-extend them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 761f726722..d12621c60e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -39,6 +39,7 @@
 #ifdef CONFIG_PLUGIN
 #include "qemu/plugin-memory.h"
 #endif
+#include "tcg-target-sa32.h"
 
 /* DEBUG defines, enable DEBUG_TLB_LOG to log to the CPU_LOG_MMU target */
 /* #define DEBUG_TLB */
@@ -92,6 +93,9 @@ static inline size_t sizeof_tlb(CPUTLBDescFast *fast)
 
 static inline uintptr_t g2h_tlbe(const CPUTLBEntry *tlb, target_ulong gaddr)
 {
+    if (TCG_TARGET_SIGNED_ADDR32 && TARGET_LONG_BITS == 32) {
+        return tlb->addend + (int32_t)gaddr;
+    }
     return tlb->addend + (uintptr_t)gaddr;
 }
 
@@ -1234,7 +1238,13 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
     desc->iotlb[index].attrs = attrs;
 
     /* Now calculate the new entry */
-    tn.addend = addend - vaddr_page;
+
+    if (TCG_TARGET_SIGNED_ADDR32 && TARGET_LONG_BITS < TCG_TARGET_REG_BITS) {
+        tn.addend = addend - (int32_t)vaddr_page;
+    } else {
+        tn.addend = addend - vaddr_page;
+    }
+
     if (prot & PAGE_READ) {
         tn.addr_read = address;
         if (wp_flags & BP_MEM_READ) {
-- 
2.25.1


