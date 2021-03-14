Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA14F33A51B
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 14:59:09 +0100 (CET)
Received: from localhost ([::1]:49750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLRGu-0004sA-UN
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 09:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lLRF4-0003CP-I1
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 09:57:14 -0400
Received: from doohan.uni-paderborn.de ([2001:638:502:c003::16]:47808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lLRF1-00033W-Mb
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 09:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k9ZlXKOyc2IW4Ig6UfUilFIVrDCIcDzf6/Kocp8tSLc=; b=A8lbJ0IqaDi/86o827ewygNaJD
 3h67k5x4fi/+zVxJj97BBcRbmvAACAooxjw8W7Riy0YfEE8k+H7eCVC8lqRyNGHDbVPH0V2yYxHtb
 Yxw7zPn3Uz3//aIAptMfL1VekqxhoMZuFPW6Cp/X/L8a/gdhrCHdcDoR5S8hfVb6365s=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] target/tricore: Pass MMUAccessType to
 get_physical_address()
Date: Sun, 14 Mar 2021 14:55:09 +0100
Message-Id: <20210314135513.1369871-4-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210314135513.1369871-1-kbastian@mail.uni-paderborn.de>
References: <20210314135513.1369871-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.14.134815, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800002
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=31367612, da=103339293,
 mc=567, sc=4, hc=563, sp=0, fso=31367612, re=0, sd=0, hd=0
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::16;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=doohan.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
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
Cc: kbastian@mail.uni-paderborn.de,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

'int access_type' and ACCESS_INT are unused, drop them.
Provide the mmu_idx argument to match other targets.
'int rw' is actually the MMUAccessType, rename it.

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210127224255.3505711-3-f4bug@amsat.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index 81171db833..c5e997f321 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -33,7 +33,7 @@ enum {
 #if defined(CONFIG_SOFTMMU)
 static int get_physical_address(CPUTriCoreState *env, hwaddr *physical,
                                 int *prot, target_ulong address,
-                                int rw, int access_type)
+                                MMUAccessType access_type, int mmu_idx)
 {
     int ret = TLBRET_MATCH;
 
@@ -72,13 +72,11 @@ bool tricore_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     CPUTriCoreState *env = &cpu->env;
     hwaddr physical;
     int prot;
-    int access_type;
     int ret = 0;
 
     rw &= 1;
-    access_type = ACCESS_INT;
     ret = get_physical_address(env, &physical, &prot,
-                               address, rw, access_type);
+                               address, rw, mmu_idx);
 
     qemu_log_mask(CPU_LOG_MMU, "%s address=" TARGET_FMT_lx " ret %d physical "
                   TARGET_FMT_plx " prot %d\n",
-- 
2.30.1


