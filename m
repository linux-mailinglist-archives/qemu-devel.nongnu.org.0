Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D85320B1E
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:50:43 +0100 (CET)
Received: from localhost ([::1]:40478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDq4I-0008WS-Ot
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:50:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppn-0006b8-5Q
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:43 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:54820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppk-0002lQ-Kl
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:42 -0500
Received: by mail-wm1-x32d.google.com with SMTP id w4so11177154wmi.4
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kvgdf6CrEywh2p1Z7lUVw89ToUYIfaIA15k0msXPWKQ=;
 b=JHC1Bndyw69cHqot8243bASvuNju7MoSv6/TNf5JFEVwXnD5XaF8pZXpy/fYVESeXT
 1qXIGnmbBCDzZAJZMBCCUHip61/332MUn7cRTzaI/n00Qb3rSQJyJLD/qKNvIAKUdZal
 uNyJtJ65brswp6tDBIbstfSZbjvKkNLrx0Wd0WkrPVDKiZMq4arwv5FWCf0DWrEYnxRh
 H6TDcQtH+U8blBqb6Ie5sY3iij3bwg838+iNIeW2cayGQujRi0rwhQkym+baxnop+keb
 nu3S5pBKy00Tp+XehX2tZquB3XAxE2El4YV+Se4+TVrttDHmJUV+NrnMWus6Po4tlpHl
 6j6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Kvgdf6CrEywh2p1Z7lUVw89ToUYIfaIA15k0msXPWKQ=;
 b=d7e+C+TwVLZgj7ZutCbR1yMjinqxWgpURAh6QXUzGnwYZ3z76b+s1ehCRJMnLDJ7wW
 Pl81T5DlaYU9TuX+82K9RDOiGXZ5rGgsp5cCe+LhoXV5BjyeqUpP9pMeggKij8IuccoT
 CVYCAU+2lTqibWUuPZRoWgvLRyLfFshVuMoEEm9GwwKhZlolG2kTXsaWwvN+zbhEAZQc
 Y4VWKC00QKX3t5tag0047nBrTFAqBAIRA3UuJS7fuqQO0Q0biwkq6fAWu6p/MawhRkwE
 +Z6Y1Z1VRtjnGUbIEbvGHSPZ8YGmXkogbQ4tIejpLw+vcNeLFUoKJVTRLMMP5WlnVAJL
 EAaQ==
X-Gm-Message-State: AOAM530OjxZusc9aSBvQrAXwc12ipHmk9DFhl1gjeglUqQ40SrT58cQx
 QsY+Kaq743GBKcuomCi/hRJXnsiMkFU=
X-Google-Smtp-Source: ABdhPJx5GCwILYx/0Fs9vJRxtSvGWNRuYNUHCVJxkGiRl+k8zi51ZaXFVsI1jrxl+xWz6s0ZoFM2YA==
X-Received: by 2002:a1c:28c1:: with SMTP id
 o184mr15886861wmo.183.1613918134319; 
 Sun, 21 Feb 2021 06:35:34 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j17sm21874256wmc.28.2021.02.21.06.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:35:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/43] target/mips: Remove access_type argument from
 get_physical_address()
Date: Sun, 21 Feb 2021 15:34:01 +0100
Message-Id: <20210221143432.2468220-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

get_physical_address() doesn't use the 'access_type' argument,
remove it to simplify.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20210128144125.3696119-5-f4bug@amsat.org>
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


