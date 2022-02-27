Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5594C58EC
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 03:07:58 +0100 (CET)
Received: from localhost ([::1]:42226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO8yb-0005LJ-HR
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 21:07:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8v9-0002Qq-JY
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:23 -0500
Received: from [2607:f8b0:4864:20::534] (port=35596
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8v7-0007Rw-Eu
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:23 -0500
Received: by mail-pg1-x534.google.com with SMTP id e6so6942927pgn.2
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 18:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MvxCNCGUBInjDmFx14YA3wZL3SPbsmtyRwG14WPc7Rs=;
 b=keIznYC/Z1JY+KJR7oMM1Q57SAHBei7AkD5c4BKmwDG9uOhUiSmTueQaDhYg03B/cC
 PGJyPTc7iw9bCWPAxWsJGt1WGoc2r0gPiGAew796cnzl+MfwUTQOPbqd+yA2TxIKkXJa
 T6LQdDkJUJXbNhPm+c1IFyCB1d7cVccRNNYsH0ewXocxPcf7LBRRmPbXeBnLD6Ak+N8m
 tpP/5uSw3k7HkP0XqFQWmmZktE/b9hh0sJoxIFDmzWMk0rOJVvChqrS+1pXHuqHJ0mKu
 YtNsfOxWQNcwJRmp5voCqe+oRKu5IpngxcsqSlFSp93Bi9mo5kmTeyv2VYmWrWVkMJqn
 jIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MvxCNCGUBInjDmFx14YA3wZL3SPbsmtyRwG14WPc7Rs=;
 b=RVzETB8p8iDXZGZREDA+1wEvHq4S6/vatWQ3mAT7vXVeukwEI57o1HB2saY4Ihiaix
 4momHElpHhzxV4DGboBDKuzTP2uaViX9esipmysfInZ/mkVCz0sKQdCxuzK6zRMNbX2/
 gcd7y+PtdAOgbYUhtaPcwgVJIIuOiHKK5tq7Zk7G7mNxMdJ2IIrdgZKDN3Gnmk0gIyIU
 vl/PY7aYdQIEYA/T0PJoJJ+q5iPUS7+1HodTm4mElDUnF7Ycqot62oNaTOlwC9cXqtSH
 +zFmRFmZ8uaq1xyEEj8osEApLRJva0nniUX2PSHYM3JixqYKbi1bQZcsosn9GD2ZkeqZ
 jlwQ==
X-Gm-Message-State: AOAM531434Xquxi0o/Ssrq51K5U7pYwFrxKQuLLYTyK+URRukslPDB0g
 LcsZRAPuygEUu00aQpJLGaYgos0b2Lwxg6Zs
X-Google-Smtp-Source: ABdhPJzkyBxNhSWBQUn6EaG/gwDqevYW51wCTH0ewrj2ADY+1YmyxcGXTKgbrjvq0Xt1m+I/m+3jPg==
X-Received: by 2002:a63:ac58:0:b0:373:9e90:3b7a with SMTP id
 z24-20020a63ac58000000b003739e903b7amr11925100pgn.262.1645927460242; 
 Sat, 26 Feb 2022 18:04:20 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm8304021pfj.43.2022.02.26.18.04.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 18:04:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/9] accel/tcg: Support TCG_TARGET_SIGNED_ADDR32 for softmmu
Date: Sat, 26 Feb 2022 16:04:07 -1000
Message-Id: <20220227020413.11741-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227020413.11741-1-richard.henderson@linaro.org>
References: <20220227020413.11741-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
index 0e62aa5d7c..0dbc3efbc7 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -40,6 +40,7 @@
 #include "qemu/plugin-memory.h"
 #endif
 #include "tcg/tcg-ldst.h"
+#include "tcg-target-sa32.h"
 
 /* DEBUG defines, enable DEBUG_TLB_LOG to log to the CPU_LOG_MMU target */
 /* #define DEBUG_TLB */
@@ -93,6 +94,9 @@ static inline size_t sizeof_tlb(CPUTLBDescFast *fast)
 
 static inline uintptr_t g2h_tlbe(const CPUTLBEntry *tlb, target_ulong gaddr)
 {
+    if (TCG_TARGET_SIGNED_ADDR32 && TARGET_LONG_BITS == 32) {
+        return tlb->addend + (int32_t)gaddr;
+    }
     return tlb->addend + (uintptr_t)gaddr;
 }
 
@@ -1244,7 +1248,13 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
     desc->iotlb[index].attrs = attrs;
 
     /* Now calculate the new entry */
-    tn.addend = addend - vaddr_page;
+
+    if (TCG_TARGET_SIGNED_ADDR32 && TARGET_LONG_BITS == 32) {
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


