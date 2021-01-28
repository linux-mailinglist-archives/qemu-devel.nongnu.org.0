Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1769D307880
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:47:26 +0100 (CET)
Received: from localhost ([::1]:59102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58Zu-00070L-M9
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:47:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58Ua-0000ZY-LI
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:41:52 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58UY-0007J2-Id
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:41:52 -0500
Received: by mail-ej1-x634.google.com with SMTP id g3so8114510ejb.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tCIz4+GwmUuvCIaVJUlWNUkHVZqipaJXGWDe+SF+xJU=;
 b=mMd63wZWlHpQPxmiOUvNFP4wBrZla3efITsuj+kR9rGfHaHnWnRcqwYH+ANpd3QuY+
 lsH0vWxaAqvJ/idAW6IiBY/Gak44I95VBdYlzFKfhlxndLG7KQeke+GBsDxGZjK91V8L
 /+vszRVetyjJf9hjJ7/pZHnNQW0OyWCG/5tySPEn0qXf1/4eaSQ8B6ECg0eJY4ugo3cj
 ZKw3iNtBwb+FycWa2NRn07N866qtosrC7PL0QI+BRTdPmsc89cBCulxVK323FNeb5v4Z
 0eIVTOmkagGwYdpPfmR/S2dCTXlB1+8eKQZE6fi9xug82GGlFmY9wm065y6IjtjVZo8S
 CCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tCIz4+GwmUuvCIaVJUlWNUkHVZqipaJXGWDe+SF+xJU=;
 b=Y1T83pMveaIyQ3bWiAGokSEa/b8+iJKv68LCaaJGwgHecwcfjkPvGDZH3TwTeIE5S8
 yGPqASgxoNWFoqMShIMC79KBOEnOYR6XOEqlxXPnISf4gohsc3iIEmL5VBiEdw6n/GKw
 idf0078TarEmj37/yDfMqieiRcxvR17X7BsAbaNt7HoA7fojrhsHe9TEDRgzy0F+yd/l
 JACtyjFrgDVybDHmkQzjydqlA8vKoPZXTqy8U95ndvkwloLNMaZR1IRqo0cUtnk/0STn
 udYX+osIAnxSxuA/EOsi+ZlyF2WeCvVYA32bz/ZJNDumqz0LEfbEgnpMG/1zIeUHw+2i
 2kCg==
X-Gm-Message-State: AOAM531m7z/6k34rHZ/faYJaljvB6YZlxTt9JDJQ/9MJD+OhWnXSKPzr
 ptWMPF2eLkt62dQOaKgKHbffJXmqcy8=
X-Google-Smtp-Source: ABdhPJxb3AGz+Etq2GDGsGfMHcZeLghZWJ5UzbrxebnKOz4HLfRXcOKwX+D266V9EIbtZpXuuqf9ug==
X-Received: by 2002:a17:907:10c8:: with SMTP id
 rv8mr11097097ejb.228.1611844908906; 
 Thu, 28 Jan 2021 06:41:48 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s2sm3183742edx.77.2021.01.28.06.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:41:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/13] target/mips: Remove access_type argument from
 get_physical_address()
Date: Thu, 28 Jan 2021 15:41:16 +0100
Message-Id: <20210128144125.3696119-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128144125.3696119-1-f4bug@amsat.org>
References: <20210128144125.3696119-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

get_physical_address() doesn't use the 'access_type' argument,
remove it to simplify.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tlb_helper.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index d89ad87cb9d..c9535b7f72f 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -259,7 +259,7 @@ static int get_segctl_physical_address(CPUMIPSState *env, hwaddr *physical,
 
 static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
                                 int *prot, target_ulong real_address,
-                                int rw, int access_type, int mmu_idx)
+                                int rw, int mmu_idx)
 {
     /* User mode can only access useg/xuseg */
 #if defined(TARGET_MIPS64)
@@ -492,7 +492,7 @@ hwaddr mips_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     hwaddr phys_addr;
     int prot;
 
-    if (get_physical_address(env, &phys_addr, &prot, addr, 0, ACCESS_INT,
+    if (get_physical_address(env, &phys_addr, &prot, addr, 0,
                              cpu_mmu_index(env, false)) != 0) {
         return -1;
     }
@@ -570,7 +570,7 @@ static int walk_directory(CPUMIPSState *env, uint64_t *vaddr,
     uint64_t w = 0;
 
     if (get_physical_address(env, &paddr, &prot, *vaddr, MMU_DATA_LOAD,
-                             ACCESS_INT, cpu_mmu_index(env, false)) !=
+                             cpu_mmu_index(env, false)) !=
                              TLBRET_MATCH) {
         /* wrong base address */
         return 0;
@@ -598,7 +598,7 @@ static int walk_directory(CPUMIPSState *env, uint64_t *vaddr,
                 *pw_entrylo0 = entry;
             }
             if (get_physical_address(env, &paddr, &prot, vaddr2, MMU_DATA_LOAD,
-                                     ACCESS_INT, cpu_mmu_index(env, false)) !=
+                                     cpu_mmu_index(env, false)) !=
                                      TLBRET_MATCH) {
                 return 0;
             }
@@ -752,7 +752,7 @@ static bool page_table_walk_refill(CPUMIPSState *env, vaddr address, int rw,
     /* Leaf Level Page Table - First half of PTE pair */
     vaddr |= ptoffset0;
     if (get_physical_address(env, &paddr, &prot, vaddr, MMU_DATA_LOAD,
-                             ACCESS_INT, cpu_mmu_index(env, false)) !=
+                             cpu_mmu_index(env, false)) !=
                              TLBRET_MATCH) {
         return false;
     }
@@ -765,7 +765,7 @@ static bool page_table_walk_refill(CPUMIPSState *env, vaddr address, int rw,
     /* Leaf Level Page Table - Second half of PTE pair */
     vaddr |= ptoffset1;
     if (get_physical_address(env, &paddr, &prot, vaddr, MMU_DATA_LOAD,
-                             ACCESS_INT, cpu_mmu_index(env, false)) !=
+                             cpu_mmu_index(env, false)) !=
                              TLBRET_MATCH) {
         return false;
     }
@@ -843,16 +843,14 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 #if !defined(CONFIG_USER_ONLY)
     hwaddr physical;
     int prot;
-    int mips_access_type;
 #endif
     int ret = TLBRET_BADADDR;
 
     /* data access */
 #if !defined(CONFIG_USER_ONLY)
     /* XXX: put correct access by using cpu_restore_state() correctly */
-    mips_access_type = ACCESS_INT;
     ret = get_physical_address(env, &physical, &prot, address,
-                               access_type, mips_access_type, mmu_idx);
+                               access_type, mmu_idx);
     switch (ret) {
     case TLBRET_MATCH:
         qemu_log_mask(CPU_LOG_MMU,
@@ -884,7 +882,7 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         env->hflags |= mode;
         if (ret_walker) {
             ret = get_physical_address(env, &physical, &prot, address,
-                                       access_type, mips_access_type, mmu_idx);
+                                       access_type, mmu_idx);
             if (ret == TLBRET_MATCH) {
                 tlb_set_page(cs, address & TARGET_PAGE_MASK,
                              physical & TARGET_PAGE_MASK, prot,
@@ -909,12 +907,10 @@ hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
 {
     hwaddr physical;
     int prot;
-    int access_type;
     int ret = 0;
 
     /* data access */
-    access_type = ACCESS_INT;
-    ret = get_physical_address(env, &physical, &prot, address, rw, access_type,
+    ret = get_physical_address(env, &physical, &prot, address, rw,
                                cpu_mmu_index(env, false));
     if (ret != TLBRET_MATCH) {
         raise_mmu_exception(env, address, rw, ret);
-- 
2.26.2


