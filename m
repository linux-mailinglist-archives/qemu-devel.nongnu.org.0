Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F57D399C85
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:27:07 +0200 (CEST)
Received: from localhost ([::1]:54044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loih0-0006cv-Ez
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loicu-000677-Ve; Thu, 03 Jun 2021 04:22:55 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:34273 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loics-0008Mt-5K; Thu, 03 Jun 2021 04:22:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5l2XJ0z9sWF; Thu,  3 Jun 2021 18:22:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708555;
 bh=NFKIMo5AUBuTBPGOCKmYP7SyF3yhT7sS+1RbVnlz39Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AO1Th8tvcDISqAHQfKcMaRu/tiryryIkWSnKKqLxOODu1XjoJnQ9VwLHI/b5XxO/a
 bQx2UqrLF4UZWUUgxEpQQVZwwZ/j0iOXITYx9UuQg6nd6E8hlsObtA4aN9JGjHQHMe
 qb/gYpeMY3XaiY85xLtzo6FV7xAJB8R+mNTv7WUw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 01/42] target/ppc: cleaned error_report from ppc_store_sdr1
Date: Thu,  3 Jun 2021 18:21:50 +1000
Message-Id: <20210603082231.601214-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Changed how the function ppc_store_sdr1, from error_report(...) to
qemu_log_mask(LOG_GUEST_ERROR, ...).

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210521201759.85475-2-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index d957d1a687..9cf3288b7a 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -77,13 +77,13 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
         target_ulong htabsize = value & SDR_64_HTABSIZE;
 
         if (value & ~sdr_mask) {
-            error_report("Invalid bits 0x"TARGET_FMT_lx" set in SDR1",
-                         value & ~sdr_mask);
+            qemu_log_mask(LOG_GUEST_ERROR, "Invalid bits 0x"TARGET_FMT_lx
+                     " set in SDR1", value & ~sdr_mask);
             value &= sdr_mask;
         }
         if (htabsize > 28) {
-            error_report("Invalid HTABSIZE 0x" TARGET_FMT_lx" stored in SDR1",
-                         htabsize);
+            qemu_log_mask(LOG_GUEST_ERROR, "Invalid HTABSIZE 0x" TARGET_FMT_lx
+                     " stored in SDR1", htabsize);
             return;
         }
     }
-- 
2.31.1


