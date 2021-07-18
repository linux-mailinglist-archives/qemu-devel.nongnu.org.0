Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72B13CC967
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 15:53:56 +0200 (CEST)
Received: from localhost ([::1]:45150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m57Ex-0006RP-Jx
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 09:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@gorilla.13thmonkey.org>)
 id 1m578W-0004Ck-Mp
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 09:47:16 -0400
Received: from 13thmonkey.org ([80.100.255.32]:65365
 helo=gorilla.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@gorilla.13thmonkey.org>) id 1m578V-0007fr-85
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 09:47:16 -0400
Received: by gorilla.13thmonkey.org (Postfix, from userid 103)
 id 70C6D2FF093B; Sun, 18 Jul 2021 15:47:11 +0200 (CEST)
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] Fix nvmm_ram_block_added() function arguments
Date: Sun, 18 Jul 2021 15:46:50 +0200
Message-Id: <20210718134650.1191-3-reinoud@NetBSD.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210718134650.1191-1-reinoud@NetBSD.org>
References: <20210718134650.1191-1-reinoud@NetBSD.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@gorilla.13thmonkey.org; helo=gorilla.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Reinoud Zandijk <Reinoud@NetBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A parameter max_size was added to the RAMBlockNotifier
ram_block_added function. Use the max_size for pre allocation
of hva space.

Signed-off-by: Reinoud Zandijk <Reinoud@NetBSD.org>
---
 target/i386/nvmm/nvmm-all.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index dfa690d65d..fdcd37ed3e 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -1134,13 +1134,14 @@ static MemoryListener nvmm_memory_listener = {
 };
 
 static void
-nvmm_ram_block_added(RAMBlockNotifier *n, void *host, size_t size)
+nvmm_ram_block_added(RAMBlockNotifier *n, void *host, size_t size,
+                     size_t max_size)
 {
     struct nvmm_machine *mach = get_nvmm_mach();
     uintptr_t hva = (uintptr_t)host;
     int ret;
 
-    ret = nvmm_hva_map(mach, hva, size);
+    ret = nvmm_hva_map(mach, hva, max_size);
 
     if (ret == -1) {
         error_report("NVMM: Failed to map HVA, HostVA:%p "
-- 
2.31.1


