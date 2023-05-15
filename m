Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4C0702880
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:28:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUUO-0004gE-3M; Mon, 15 May 2023 05:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUUK-0004dG-OL; Mon, 15 May 2023 05:27:28 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUUJ-0002uF-4E; Mon, 15 May 2023 05:27:28 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-52c30fbccd4so11524268a12.0; 
 Mon, 15 May 2023 02:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684142844; x=1686734844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zkh/PAEKN8BVQW6YM5l0nufuvJOuPOvJMEVEtv3f5V8=;
 b=bEkz9Y0N3WFyLWUppWkd8JOyGmGIx038IU4q8XNCuy0/ruXRvTLbB0kCnt6YH4lqL9
 84EIhcjoLYe1/xeUJQIj3QuDziJwQ4Tdr45fKcqLdJWIueLK/xr94cdP+A6okvkygDEV
 NI3xt5FY/jojj0zWM3F/9AbIVHaGZUJhguN1AlNvZoLmDVe6Z1VYgv6Rqr8Iy+jV8lSE
 vLjPjui4Epoe3Tjz77TMtgFUPu9NFM5M0hEmtc0xhkES5jTjOxVn6/MOOC18/SungyoW
 vHK3AKHvOFYaMzAemr7w6D8ZOj+v7lpaU1Ykqcc+d5CnBj7qJIsWJV6wO3UASO/7kXrt
 Zc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684142844; x=1686734844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zkh/PAEKN8BVQW6YM5l0nufuvJOuPOvJMEVEtv3f5V8=;
 b=k2P19FPTuYoIEEL7VgXIC9fIhMPeBbjE6NoKoh5asESbdOlXU40iU2fk3eySnLxvwC
 3ulUbc5wU+/jByXefnzGbMZshUdZsZDp6XFoVWge54e9/3XgEXKpw5JzmKf5vHd0V8xs
 H4mzSK08IGm9345uAxD65aqfPqCEhRn9R34RkcLsR0u//Hwk+sH9mMJ1YfPAvPZhNA2B
 yAxCd7aakvH2lsq+f+zuCmjRUPg5x60DZAtrNuEDiYDMjUvXMNS1DfEg7A120VSSPcU2
 UqwQX0q2KaJwn8otXKA1PULaPpneDU/BgS07oZk4MnNmIQfcAZOmhp9XgzZIbzQ4b6O6
 gt3w==
X-Gm-Message-State: AC+VfDyV8dPreMWUwkXyTu70fgWpm1a3dkbrJoRTqpDcbsFO1czhesuM
 LgyvMzOnqqqucqopg/itz9jgIAldaDo=
X-Google-Smtp-Source: ACHHUZ51v6GiIGvQcgYAIRGwkd5VMaDB46x2nCSEDW0H6rbBR9La6DyEmrDP0+nIGs6t/jWZf/U3Rg==
X-Received: by 2002:a05:6a20:549e:b0:100:4369:164a with SMTP id
 i30-20020a056a20549e00b001004369164amr37714251pzk.46.1684142843875; 
 Mon, 15 May 2023 02:27:23 -0700 (PDT)
Received: from wheely.local0.net ([202.168.30.146])
 by smtp.gmail.com with ESMTPSA id
 n20-20020aa79054000000b006466f0be263sm11387818pfo.73.2023.05.15.02.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 02:27:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 5/9] target/ppc: Change partition-scope translate interface
Date: Mon, 15 May 2023 19:26:51 +1000
Message-Id: <20230515092655.171206-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515092655.171206-1-npiggin@gmail.com>
References: <20230515092655.171206-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Rather than always performing partition scope page table translation
with access type of 0 (MMU_DATA_LOAD), pass through the processor
access type which first initiated the translation sequence. Process-
scoped page table loads are then set to MMU_DATA_LOAD access type in
the xlate function.

This will allow more information to be passed to the exception
handler in the next patch.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v2: new patch to deal with bug in patch 6.

 target/ppc/mmu-radix64.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 031efda0df..1fc1ba3ecf 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -380,6 +380,14 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
     hwaddr pte_addr;
     uint64_t pte;
 
+    if (pde_addr) {
+        /*
+         * Translation of process-scoped tables/directories is performed as
+         * a read-access.
+         */
+        access_type = MMU_DATA_LOAD;
+    }
+
     qemu_log_mask(CPU_LOG_MMU, "%s for %s @0x%"VADDR_PRIx
                   " mmu_idx %u 0x%"HWADDR_PRIx"\n",
                   __func__, access_str(access_type),
@@ -477,10 +485,10 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
          * is only used to translate the effective addresses of the
          * process table entries.
          */
-        ret = ppc_radix64_partition_scoped_xlate(cpu, 0, eaddr, prtbe_addr,
-                                                 pate, &h_raddr, &h_prot,
-                                                 &h_page_size, true,
-            /* mmu_idx is 5 because we're translating from hypervisor scope */
+        /* mmu_idx is 5 because we're translating from hypervisor scope */
+        ret = ppc_radix64_partition_scoped_xlate(cpu, access_type, eaddr,
+                                                 prtbe_addr, pate, &h_raddr,
+                                                 &h_prot, &h_page_size, true,
                                                  5, guest_visible);
         if (ret) {
             return ret;
@@ -519,11 +527,11 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
          * translation
          */
         do {
-            ret = ppc_radix64_partition_scoped_xlate(cpu, 0, eaddr, pte_addr,
-                                                     pate, &h_raddr, &h_prot,
-                                                     &h_page_size, true,
             /* mmu_idx is 5 because we're translating from hypervisor scope */
-                                                     5, guest_visible);
+            ret = ppc_radix64_partition_scoped_xlate(cpu, access_type, eaddr,
+                                                     pte_addr, pate, &h_raddr,
+                                                     &h_prot, &h_page_size,
+                                                     true, 5, guest_visible);
             if (ret) {
                 return ret;
             }
-- 
2.40.1


