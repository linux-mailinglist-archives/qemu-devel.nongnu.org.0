Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA6F4CC602
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:28:04 +0100 (CET)
Received: from localhost ([::1]:49442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPr7L-00075k-QR
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:28:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvq-0001x3-1F
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:10 -0500
Received: from [2607:f8b0:4864:20::42b] (port=36415
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvk-0007SZ-3y
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:09 -0500
Received: by mail-pf1-x42b.google.com with SMTP id z16so5562349pfh.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 11:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1XkfzGvn+ZlmZZNrl7Dk1RW038tolY/tjYs6706uD7c=;
 b=KZghr0Rv2uDZt/caCMlAE/o4Apx1JJYT5WjYz+YUxBOkCq1LMBirKiFg1h6ADGFjsp
 t1UW6xUXP/Hq7rCA+p3i3rQT6TF9oPKp22zjCJvUtwMk2+un9lc1k8n0pqUqVrZVF95h
 d/8eLUUm06199tDvi/Gc+q+Ik72M5skCn2MARHrkS/hhh+cc0cILPZ9vaEWofx+uicJ2
 kMrxN1ZGiap4iKr7VshnixBDZ6Fxlso3Uw0pvn/ajfxOE+oPYSNoHmG11u/ZT8fWeghC
 S56RZZ+muPlwg/+ZwjJg1KIyUwg4r/Q06CjdIY0TijIi3bFFcLGl2LcdCJCIUxh/CCrJ
 pa6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1XkfzGvn+ZlmZZNrl7Dk1RW038tolY/tjYs6706uD7c=;
 b=bZ6vuxRhMZNc2avCseCV48WGvCmK+2Bar/nCEungvonX65WkiB7u8y33UkF25UQfE1
 x2cKMiQ06gu+tjN5ZaGg5c/agSJi1+7z46459WdrGO6Q8skSxjw1Do4SAqDZFmD/VpDj
 RqG80nVh55wXmm5TdbgIULLNBxCcjITp5Wl2AcbbKok5ReczoGh14rrEFzom4rt/lpZG
 6fjI/OKhZZpSbh9Q4BnVkzrCuqmVtln9k2URgYUXJfFbF2Fkbto6SHdgXKi8E3v4y/5h
 ehkEZbaVv0BnGgehrO0nlDVFXc/gPvbl9k4e/coBrebr9MfFeBdRLoXD6x2RxwaDgwUr
 uHow==
X-Gm-Message-State: AOAM530JOMItsGI8wGUPVPOx2Oc+uQz+cAuBj5au8bnx1+2+GAxrUhRa
 KoZi08TCKz6GmupEEmThwYquuNHbOWZ1oQ==
X-Google-Smtp-Source: ABdhPJxv2FEtl46h0UGFHqaWmmZJKQv6RyKElTeQ0DuWNyRmcLdOaBbcPMakA15SYXSP0IlCP9l2LA==
X-Received: by 2002:a62:586:0:b0:4e1:dc81:8543 with SMTP id
 128-20020a620586000000b004e1dc818543mr39572150pff.0.1646334958440; 
 Thu, 03 Mar 2022 11:15:58 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm3318043pfh.46.2022.03.03.11.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:15:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/9] accel/tcg: Support TCG_TARGET_SIGNED_ADDR32 for softmmu
Date: Thu,  3 Mar 2022 09:15:45 -1000
Message-Id: <20220303191551.466631-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303191551.466631-1-richard.henderson@linaro.org>
References: <20220303191551.466631-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
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


