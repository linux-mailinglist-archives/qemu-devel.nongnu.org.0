Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C47383CB8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:53:10 +0200 (CEST)
Received: from localhost ([::1]:45614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiMX-00028g-LA
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlf-0006jC-Sd
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:04 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:41665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlR-0004Uq-AQ
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:03 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MhToz-1lDTXj4AZH-00eZ5J; Mon, 17
 May 2021 20:14:45 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 37/59] linux-user/s390x: Fix trace in restore_regs
Date: Mon, 17 May 2021 20:14:02 +0200
Message-Id: <20210517181424.8093-38-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ize/B7UhVuk5fK136XV9ZGQcwUo7POg7AB5w59qw3EViKPs0Y7f
 tmLWQwjg63gla/LWcIkhqZrP9geeOPoL+/KcnfYIfPMaARdUHy23cb2H9bS4UeW4cobcV62
 LaC1Cs9pG1ohE7i6cpqRUhQUbERsA7r9PVhiUt/g2phbNP5TyLFR9avZU8brscAEssKwALh
 DzLBJhqhOQ16gYH/5y++w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yCen9tDK/1g=:bEXNQCOH3RfvHpZ4rkKXYw
 U+cHC2QyEugHJ4lm1mB/V1+orrADYep/kjuIDAnTmnGheF0VzFmUTrNRvFKyAfGF1mMtOUAeg
 9i+6TgY9JKWu2u4w4atO0pWEWIUVu7YZxrq93bwiZfO7LKBx3N3TaOoeNRHLD+G81UPnzZKRW
 SBPd4fYJtgewi8ArBIOjs3dQ6mgX8ZkK17qwpTfr+xuhndHgta6rCJkf+PgGelzQDBeI5ki+q
 2OFJmwxtz/D2kKmOu7UziMAIwZqfyTiaNtK410tVqQSdF52aN3tuQnzWGoKKaaVfpHxPc6zd8
 ALaaWelnNOkoYE5QBXypX6ml+mmt2lQBEHtJELfqRCn0p8Jo8Nn0Z5KtJQYryQoqWdnWCmGb7
 BtvWBuiDX+oDkqS/V1LXhmkSWcDSp3tyTH088LxFroQ0u7OwWllgnywMfoL6EFdWe0m6aCydT
 RyZnl4ssZEEoPf/fXenrDY/FaKqbUenxhyBT29OZ7UJnPICZSDsBito6KJTuGZul8OIyq0iww
 d4wiPWY9elaXRHG17iDR4g=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Directly reading sc->regs.psw.addr misses the bswap
that may be performed by __get_user.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-6-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index e455a9818dea..dcc6f7bc0274 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -232,16 +232,17 @@ give_sigsegv:
 
 static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
 {
+    target_ulong prev_addr;
     int i;
 
     for (i = 0; i < 16; i++) {
         __get_user(env->regs[i], &sc->regs.gprs[i]);
     }
 
+    prev_addr = env->psw.addr;
     __get_user(env->psw.mask, &sc->regs.psw.mask);
-    trace_user_s390x_restore_sigregs(env, (unsigned long long)sc->regs.psw.addr,
-                                     (unsigned long long)env->psw.addr);
     __get_user(env->psw.addr, &sc->regs.psw.addr);
+    trace_user_s390x_restore_sigregs(env, env->psw.addr, prev_addr);
 
     for (i = 0; i < 16; i++) {
         __get_user(env->aregs[i], &sc->regs.acrs[i]);
-- 
2.31.1


