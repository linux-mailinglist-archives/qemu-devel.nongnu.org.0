Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577EB5F45D3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:43:17 +0200 (CEST)
Received: from localhost ([::1]:53672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofj8e-0000ZB-72
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidS-0002BM-Fk
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:02 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidQ-0004Hm-NJ
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:02 -0400
Received: by mail-pf1-x433.google.com with SMTP id i6so13258336pfb.2
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=q0eg+3QiI3aRqtvdrrAtNwv7hcqy9NWtzJtlLArJ6SQ=;
 b=Ti9GjyB70cAqTJS00kZNjDd7U5FbRpi3bTpY3v5WE1sh9Z9qF2OtGCxclfbhDIXDjB
 Ae9cDlW21rp3wNpPPbjsgixksCCEhrD1l6SKZ0sVSsR6i2AfiK7n45jXsVkF4qYwRMnK
 sS7sGXyWGWzwpaGVAoptRpNTn4Csx3dLB2ZhRrHIo6CskvX0chFKXc1tdHqeg/mtcvWL
 5+T0tais4K98YnibGGeVbmF8UHXdAWoO6xYjy4E1yENhl7WBXtOOvVhDj4OfI3X0OHDK
 k8+oeWJN5R0KTiDXq6EekVTrCx6icqz00Nld82RvnOkEuV39lnZEfFsB2KmSzdZcbtS1
 fjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=q0eg+3QiI3aRqtvdrrAtNwv7hcqy9NWtzJtlLArJ6SQ=;
 b=rU2AKr8jH4M6odhCZbQkbAY/VIGrHXvtI9PwluTW8j50lXKJARScMolz+iQlNMLKl5
 l2TPnL182PIlWvzXtAUVNkFXLWWiRB2S6g3HumKxV1irjaqKdS/5a/K8/DSsgQjBo/0W
 rYN4wcW2QeUcpd+XJVYbA6ZxoiedE9RGznbf1Xv4Wnz/IcgFhphU8UedMv5so/csXorO
 SrqCsg7sUXHgFnEb1j1D4BE/5wlSC2y5o+9zh3lV86rKkRYRhtrw82df3H193cbIo0/q
 CfJXatfX+CSdk4nCtUVeKi/Dh2hDtdkxC1rhPdGIvOI7kH6HQ3A/RG3NoEyV/iHDOh5n
 Qomw==
X-Gm-Message-State: ACrzQf0WwCXRe57K980bpai6vuVba7/o99Pb3MEM0xLO7VF9s3JZnNjp
 fc5WOsP8asfrbuTbts/jabflU7p9g9aU5Q==
X-Google-Smtp-Source: AMsMyM66izGWFaSQInvNzHYojNLt/ObMzGxqEdYjVgakmYEUB7kWWgzVSdO7KXZKp0tMsh1s7EbTuA==
X-Received: by 2002:a63:590a:0:b0:439:6e0c:6381 with SMTP id
 n10-20020a63590a000000b004396e0c6381mr23460467pgb.141.1664892659918; 
 Tue, 04 Oct 2022 07:10:59 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa79ae5000000b00561382a5a25sm1240357pfp.26.2022.10.04.07.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 07:10:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v7 03/18] cputlb: used cached CPUClass in our hot-paths
Date: Tue,  4 Oct 2022 07:10:36 -0700
Message-Id: <20221004141051.110653-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004141051.110653-1-richard.henderson@linaro.org>
References: <20221004141051.110653-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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


