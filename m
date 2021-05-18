Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6575A388167
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:29:42 +0200 (CEST)
Received: from localhost ([::1]:54040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6LV-0005PO-AS
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64i-00013S-D9
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:20 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:38803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64W-0006LL-3f
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:20 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 q7-20020a9d57870000b02902a5c2bd8c17so9760636oth.5
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ga6+PvszREjIhxPzZ4wKB8ru0YkaJYB0oJlgtxa3ZkM=;
 b=FqjVjxK7FBBoMkX3/VJQo6F3VfY8kNbunHSSjfnW09eaLRIc3M6PMVNPlaqDghf6k3
 yexF9+xild93TKPTk0iAdclCGUV9U+A1t+4Sf5SIm0GaDobG07oLThtUyq+dJcm49zPA
 qlKLMvu11vuwnjPVSkvZs3Ohg1ogWteXkm1+wZUT8QkA+OwRiP14+SXIbwBPS57RcPLE
 xCpZpH22v4zggjcMejheHQTjN7J8PV0MzwqHDUlyEqGOrW61N1hcMPErxURHHQnLE+aw
 ql8ZqJLjyVN7W2VbZQfrB9ki3eN5WpogMUdlqwRf+3f+aw0bGPqRndsVHsXd3BFjS+Rt
 fJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ga6+PvszREjIhxPzZ4wKB8ru0YkaJYB0oJlgtxa3ZkM=;
 b=s3nMX2AqaGJLIs5ttdarUwrNBqzBfbthjFfHF5vaQ/4sKOjGAcpr+NcSm1G4hbzaGv
 /QEvCRF0RqBXSLoYHb31bxOl2oSESpBIuS4T4gIMVpoUFpzR21OnhEQpiCLZWRNU9yiA
 ML8F3Pi7Rr9QME+Av4jCEGo/KEBRPbLtalWHPKD0PYY2zM5i7ZFC/KHlVG76k0y3QxTP
 1aUotfic6T/P9s1Q0cqPyZqe/g8XWdQMUBWstrjQ6S/DUpM9UTc8zDzVO81Mg1Vsrlys
 OCbGyquztIxjqc3CWxMrQdWAAvrKrz9GV6IPjSqrQzTZyuguk9x8zVMcJWy4dK1wjdj4
 2Stg==
X-Gm-Message-State: AOAM530wOlhH1lQt3zKR0aqpOUP5oPXXSGZsZL6S+e/hdnZYRze0Hxge
 sHk2ojUqnx49SlDYlVBMtybofJpxyJXCpTGM
X-Google-Smtp-Source: ABdhPJwrg9kK9cZpWXvVgtlJqun6nsWZsGB49fzeUXOSLNF8DB4dG4KrXdKjL7555seEphfnyNG36A==
X-Received: by 2002:a05:6830:151a:: with SMTP id
 k26mr5475361otp.10.1621368727162; 
 Tue, 18 May 2021 13:12:07 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:12:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/24] target/ppc: Use bool success for ppc_radix64_xlate
Date: Tue, 18 May 2021 15:11:41 -0500
Message-Id: <20210518201146.794854-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of returning non-zero for failure, return true for success.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu-radix64.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 76a5cc8cdb..7af3e697b2 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -464,10 +464,10 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
  *              | = On        | Process Scoped |    Scoped     |
  *              +-------------+----------------+---------------+
  */
-static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
-                             MMUAccessType access_type,
-                             hwaddr *raddr, int *psizep, int *protp,
-                             bool guest_visible)
+static bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
+                              MMUAccessType access_type,
+                              hwaddr *raddr, int *psizep, int *protp,
+                              bool guest_visible)
 {
     CPUPPCState *env = &cpu->env;
     uint64_t lpid, pid;
@@ -493,7 +493,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
         }
         *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         *psizep = TARGET_PAGE_BITS;
-        return 0;
+        return true;
     }
 
     /*
@@ -511,7 +511,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
         if (guest_visible) {
             ppc_radix64_raise_segi(cpu, access_type, eaddr);
         }
-        return 1;
+        return false;
     }
 
     /* Get Process Table */
@@ -524,13 +524,13 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
             if (guest_visible) {
                 ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_NOPTE);
             }
-            return 1;
+            return false;
         }
         if (!validate_pate(cpu, lpid, &pate)) {
             if (guest_visible) {
                 ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_R_BADCONFIG);
             }
-            return 1;
+            return false;
         }
     }
 
@@ -550,7 +550,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
                                                    pate, &g_raddr, &prot,
                                                    &psize, guest_visible);
         if (ret) {
-            return ret;
+            return false;
         }
         *psizep = MIN(*psizep, psize);
         *protp &= prot;
@@ -574,7 +574,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
                                                      &prot, &psize, false,
                                                      guest_visible);
             if (ret) {
-                return ret;
+                return false;
             }
             *psizep = MIN(*psizep, psize);
             *protp &= prot;
@@ -583,7 +583,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
         }
     }
 
-    return 0;
+    return true;
 }
 
 int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
@@ -594,8 +594,8 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
     hwaddr raddr;
 
     /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
-    if (ppc_radix64_xlate(cpu, eaddr, access_type, &raddr,
-                          &page_size, &prot, true)) {
+    if (!ppc_radix64_xlate(cpu, eaddr, access_type, &raddr,
+                           &page_size, &prot, true)) {
         return 1;
     }
 
@@ -609,8 +609,8 @@ hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
     int psize, prot;
     hwaddr raddr;
 
-    if (ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
-                          &psize, &prot, false)) {
+    if (!ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
+                           &psize, &prot, false)) {
         return -1;
     }
 
-- 
2.25.1


