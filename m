Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806315F14E2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 23:30:58 +0200 (CEST)
Received: from localhost ([::1]:36194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeNaz-0004c3-Iz
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 17:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNWm-0005yi-C5
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:36 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:44935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNWk-0005NZ-Qs
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:36 -0400
Received: by mail-qv1-xf29.google.com with SMTP id u9so2598983qvo.11
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 14:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=q0eg+3QiI3aRqtvdrrAtNwv7hcqy9NWtzJtlLArJ6SQ=;
 b=gXgkyclBy97wgzH7IIBI22naGrqOCCM8tFf7caLBrcQFb42HVOhV1ABXMqu5XjWzcK
 E09GX5Ad9ICGX99tkIPsViwHukzlw2hWWMBAhV7ALovmvQm8QjtpMhHcfApKN5ICzDMZ
 sd33LONboCW0ni+5nmnc+abOi+0lxFWEh0oX06MtMcX54BqtHzU0M/f9qUgY/Lwcv9sB
 C4keIQ2/My3V8E+6iECvOmt6gBukhYuvLir49o9Yafv1UNASkRC2Xq1QrdrMGE14k1Bq
 ywC5uOnkDVI9A6fsrpInbpMQSZUbAgD189QM7GVPhMY54CgFfERssMOVm7gESXWAlMLP
 dNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=q0eg+3QiI3aRqtvdrrAtNwv7hcqy9NWtzJtlLArJ6SQ=;
 b=tE/5qLP+TaZHAD9l24kbOspIuWOTLHnfSf8mqRv9Gy2mWKkyjOSu/YKwdeWlk2XeLv
 uM8B0f+g6sr0WakHkjDI9Y1drLBwoTW+qKfEmjCsdKBun/wODwcTBgc2k7p9u+cEhf66
 Cepd4rJ407wLtVFvQslNzBV4Oebn7TzOBpbkAYeFYKXTmv3/L6iDfbZuTrzqHFF4jB/l
 Hm6q3lgZ0m41y6hXhwBqg/yTJzDZDdsSsqJvL37xhzjaJ1HD8SZNpzy6/zR+8zo+EDrl
 AVNmQ1GPXqT49Cs6cPxQ6yXrzVKbTmCNR1gGpj8tfvrZWJxrM6agAW7KPAfEASMvX6gN
 2Ycw==
X-Gm-Message-State: ACrzQf3PFquL3wFavAKiqYC9tPcUjTypBcpixsbOh3s3e5SWsCyVq5AV
 uzJ9XY9S997lO6FILfmNj65wbs1JnFv9qQ==
X-Google-Smtp-Source: AMsMyM7XSoqFmK9UJM0uXCTAudcTr0B6NSC9pzgTvdueUdsjuoQu1fQg9OgoZLWI/rZDttc0pCMN9Q==
X-Received: by 2002:a0c:f550:0:b0:4b1:7af4:eece with SMTP id
 p16-20020a0cf550000000b004b17af4eecemr65594qvm.110.1664573193789; 
 Fri, 30 Sep 2022 14:26:33 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05620a28d200b006ce813bb306sm3696370qkp.125.2022.09.30.14.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:26:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linux.org, alex.bennee@linux.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v6 03/18] cputlb: used cached CPUClass in our hot-paths
Date: Fri, 30 Sep 2022 14:26:07 -0700
Message-Id: <20220930212622.108363-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930212622.108363-1-richard.henderson@linaro.org>
References: <20220930212622.108363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Before: 35.912 s ±  0.168 s
  After: 35.565 s ±  0.087 s

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220811151413.3350684-5-alex.bennee@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220923084803.498337-5-clg@kaod.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 8fad2d9b83..193bfc1cfc 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1291,15 +1291,14 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
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
 
@@ -1307,9 +1306,8 @@ static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
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
@@ -1539,10 +1537,9 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
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
2.34.1


