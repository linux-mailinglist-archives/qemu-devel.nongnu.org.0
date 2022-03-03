Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE95B4CC7F5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:24:20 +0100 (CET)
Received: from localhost ([::1]:43298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsvr-0006NP-T5
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:24:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsZ2-0006D9-Cl
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:49 -0500
Received: from [2607:f8b0:4864:20::102f] (port=40746
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYq-0004KP-6m
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:37 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 em10-20020a17090b014a00b001bc3071f921so8872617pjb.5
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1XkfzGvn+ZlmZZNrl7Dk1RW038tolY/tjYs6706uD7c=;
 b=UWfD1YkGnU6ZtDvLvGlz8eSLOw1CJ1MYin9WEGe5wLMP/BxizntOJPxFyIBDc6Y3Rn
 GJMggH2T04KWs8HMAqB4WI/0Nq7z1w/7aLJjAF4Cnp4+ZzxfPxSRHPu8g72FfwyOLQDu
 vEjo06V3mLCdmxJCWhWJOausjVjCzpFQGawhnSg7bJ2H5HRrxtgNp5kyOOWKav9e9sYf
 QBxvw8cnfboVM0bCBRTTfL5TI8PnhWlIptkSwzxtQTIASNGe3IHb72XjMjRBGGvUA5BY
 PUfPIYUSOu1Mc6g1vMfwtYEruIlW6HL+7DhjFWRerZEyqbmya5XDkrEI7k3n2tz9/NUi
 FK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1XkfzGvn+ZlmZZNrl7Dk1RW038tolY/tjYs6706uD7c=;
 b=gnxAUeHTp+wKTgoH7tH3fJgxnEV4iQNH3LXDiQPRnuNd4NIKkfPgL1Q1uEy7FDTvhH
 YKNuco0BCMrfwDhmo9Po1SGaw2vPIzDGVd28MZLIc6iZBcN1y/lHS0oyELdlLr/WS75Q
 wyr45prKsGNJNdG2SVVa3b9dWu5WkYko6XiNu7kilFIpmu1DecnQtSN0ciN+EL/smyd8
 rTKH3Q6Y4mZYCvclBW5G0FbxynLqE1mlWWPFGylVWpJBQCvU64KuYq5NkcLI8lu7pBy2
 SscTZ7t3Ss0RmdHKMxT3oholE5YY4M2oPT4mlJg/sQ7zMfdQJQnXV+5OmmGbJjjOaBxl
 yNuQ==
X-Gm-Message-State: AOAM531DP/Oy223p3sMUJ09o49hEAmni/KSMb1dF8PfLUM/UdFMNrSIV
 hOCemeohCgUioHi8ushMwYcepCHoOdsWrg==
X-Google-Smtp-Source: ABdhPJwaji2A0VFGnhWeRz6uMRfoGH8eUsQeNCgMlysApqvFKIWJ53K+fl73qLSYbVxuMjS8q3Vu0w==
X-Received: by 2002:a17:903:11c9:b0:151:9521:d5c7 with SMTP id
 q9-20020a17090311c900b001519521d5c7mr11388492plh.73.1646341223486; 
 Thu, 03 Mar 2022 13:00:23 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/30] accel/tcg: Support TCG_TARGET_SIGNED_ADDR32 for softmmu
Date: Thu,  3 Mar 2022 10:59:38 -1000
Message-Id: <20220303205944.469445-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When TCG_TARGET_SIGNED_ADDR32 is set, adjust the tlb addend to
allow the 32-bit guest address to be sign extended within the
64-bit host register instead of zero extended.

This will simplify tcg hosts like MIPS, RISC-V, and LoongArch,
which naturally sign-extend 32-bit values, in contrast to x86_64
and AArch64 which zero-extend them.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


