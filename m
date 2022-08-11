Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1422958FF27
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:18:59 +0200 (CEST)
Received: from localhost ([::1]:42290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM9xa-0002hv-4Y
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9t9-0005A9-W2
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:25 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9t7-0005gD-A7
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:23 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 p12-20020a7bcc8c000000b003a5360f218fso2872961wma.3
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 08:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=onWAhbnVy+ThaXQuHWs27Iy0XNnH2wugpFhqCGTKkg8=;
 b=NDz44EPsPuVMVZrDjN+QIzylfhB8Fza2lKaO7WpF4RcHe5qAvvSdtfVV3JAvN2y/gR
 AYWpxGV+fhx947q4GqckMnbAKNOboe4OMT32XO3BhPTARfJIprGPT4gPBcj88Wf93wWI
 F0K8YQdjpZYbVqhGS0HAtBCBmq9NqxqtJW+6N4n7160/mjoP19F4BRrH0sYJ9c5PU9gR
 Zyad4/vvcuYIS09mfzg1420A4T+URaz0NFoCXH5MAxiGUGr6HMQiYCEHwae/mVPW9jPA
 D9BW6rTjlCb+Hc20Cj/+U8hrYbsG912DpPvMwk9o5Jbn/SzWQmYErg0Mq6j4+V2L7ODu
 vWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=onWAhbnVy+ThaXQuHWs27Iy0XNnH2wugpFhqCGTKkg8=;
 b=aoVQ292fgLCJ02rh1IzW7gyBI1z1nF1JKr7Z7tSYiXmjhLyc6NlOg6XMb5hHs9trLj
 hUGB/XLkuYGTuKvROn2S751fMbi1lEnoPSadeJvB8dJmoF0ANHFHlMGQPbjOKWz17CNx
 V2gE1j8voHBcp+Kefg0B/78Sydq7oHBmh8jU+rD5YYB5gXA3aF2NVu3vA7I2fRYZo4oj
 eB/zSUFf2tootjmdksiVj5yDAb0LETl/LzHNFVw2+Qro2ikpnI0izbsbKNjhEY5j0jgy
 X4qeriTx9a+PB+ODoMtzTQL9VeT5zL8q1+4f02xon+snOMh5lJ2QTSQtwckAH1NPGgcp
 QiSg==
X-Gm-Message-State: ACgBeo3vzhp2YYGExdc6ZpUyPPYsjso2OtaXGUe0kfJnAJXVQWH3g4jq
 srPzrQ+GyQwTvA7FEtpBRoWDgQ==
X-Google-Smtp-Source: AA6agR7VYAMQ5zvnKjz5AqON44s0FePnwwjGxUEKpOwqtY+KJ9mr35WMk89uvS2j82UH3JJ0vQz0fQ==
X-Received: by 2002:a1c:4c18:0:b0:3a5:3ddd:2f29 with SMTP id
 z24-20020a1c4c18000000b003a53ddd2f29mr5988674wmf.91.1660230859912; 
 Thu, 11 Aug 2022 08:14:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a5d65d0000000b0021b970a68f9sm19571421wrw.26.2022.08.11.08.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 08:14:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 952B11FFBC;
 Thu, 11 Aug 2022 16:14:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v1 4/8] cputlb: used cached CPUClass in our hot-paths
Date: Thu, 11 Aug 2022 16:14:09 +0100
Message-Id: <20220811151413.3350684-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811151413.3350684-1-alex.bennee@linaro.org>
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

  Before: 35.912 s ±  0.168 s
  After: 35.565 s ±  0.087 s

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cputlb.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index a46f3a654d..891f3f04c5 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1303,15 +1303,14 @@ static inline ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
 static void tlb_fill(CPUState *cpu, target_ulong addr, int size,
                      MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     bool ok;
 
     /*
      * This is not a probe, so only valid return is success; failure
      * should result in exception + longjmp to the cpu loop.
      */
-    ok = cc->tcg_ops->tlb_fill(cpu, addr, size,
-                               access_type, mmu_idx, false, retaddr);
+    ok = cpu->cc->tcg_ops->tlb_fill(cpu, addr, size,
+                                    access_type, mmu_idx, false, retaddr);
     assert(ok);
 }
 
@@ -1319,9 +1318,8 @@ static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
                                         MMUAccessType access_type,
                                         int mmu_idx, uintptr_t retaddr)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    cc->tcg_ops->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
+    cpu->cc->tcg_ops->do_unaligned_access(cpu, addr, access_type,
+                                          mmu_idx, retaddr);
 }
 
 static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
@@ -1606,10 +1604,9 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     if (!tlb_hit_page(tlb_addr, page_addr)) {
         if (!victim_tlb_hit(env, mmu_idx, index, elt_ofs, page_addr)) {
             CPUState *cs = env_cpu(env);
-            CPUClass *cc = CPU_GET_CLASS(cs);
 
-            if (!cc->tcg_ops->tlb_fill(cs, addr, fault_size, access_type,
-                                       mmu_idx, nonfault, retaddr)) {
+            if (!cs->cc->tcg_ops->tlb_fill(cs, addr, fault_size, access_type,
+                                           mmu_idx, nonfault, retaddr)) {
                 /* Non-faulting page table read failed.  */
                 *phost = NULL;
                 return TLB_INVALID_MASK;
-- 
2.30.2


