Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C326B0F99
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:02:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx7v-0004CU-SA; Wed, 08 Mar 2023 11:58:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx7s-0004AC-LS; Wed, 08 Mar 2023 11:58:52 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx7p-0003yC-Rq; Wed, 08 Mar 2023 11:58:52 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7AAA4400EB;
 Wed,  8 Mar 2023 19:58:20 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 3048E1FD;
 Wed,  8 Mar 2023 19:58:19 +0300 (MSK)
Received: (nullmailer pid 2098280 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 14/47] target/arm: Fix in_debug path in S1_ptw_translate
Date: Wed,  8 Mar 2023 19:57:17 +0300
Message-Id: <20230308165815.2098148-14-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

During the conversion, the test against get_phys_addr_lpae got inverted,
meaning that successful translations went to the 'failed' label.

Cc: qemu-stable@nongnu.org
Fixes: f3639a64f60 ("target/arm: Use softmmu tlbs for page table walking")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1417
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230114054605.2977022-1-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
(cherry picked from commit 4a1103afb16efa64600ef0c2b03afe60f689fdc9)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f812734bfb..bb22271a1d 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -238,8 +238,8 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             };
             GetPhysAddrResult s2 = { };
 
-            if (!get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
-                                    false, &s2, fi)) {
+            if (get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
+                                   false, &s2, fi)) {
                 goto fail;
             }
             ptw->out_phys = s2.f.phys_addr;
-- 
2.30.2


