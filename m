Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447715EE73C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:03:47 +0200 (CEST)
Received: from localhost ([::1]:49914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odeDa-0004NQ-5O
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddey-0000F8-0n
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:00 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:46017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddev-0006UI-MA
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:59 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MFsER-1oSKjU3oy7-00HP4H; Wed, 28
 Sep 2022 22:27:56 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 24/37] linux-user/hppa: Fix setup_sigcontext()
Date: Wed, 28 Sep 2022 22:27:24 +0200
Message-Id: <20220928202737.793171-25-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Yl7synyoCd73u0n8oevPC8QAPPUlz3/TwiMxB6Gg3S/464KYySd
 wJiie6BdYeO0j0am4hmoLnUNR+6kox/jAcVTcWfjxS+EmQXUzDp8qSaW09+z1OHuvmRTVov
 JvBWeeX39gRaVCNQ04a33zt0RPZ3FABf5khg0Szl35+QWTcHY24E8aUsFVJ4VnGNkAk29K6
 YCkf0XpE/77kfXl8t10GQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4skR7yT3VWI=:+u2f8y1U6s952sFINklm4F
 pMIUhkig4k08epDSYE2ZFBBkJXJi7Pq91CCpfXY8QF86W/bPZnTW4CcS7aJxBVw9mrB6TrPnV
 y0GCPqFOKqZ64xDS1FJEdSBPprWGCFDGVizgETILxxm9MVeTXKh53nGJaI5yR2pOoSGA7ycwY
 wvDIlInV/cU9gBAtbqtuDuu98xGukvBUKuqQ6akvVO4wyM9aBCRSlXQNC+Z/gKrV8+K8JqS9C
 kzZNVNmZNayo9BAympZUnd/npx21vWW6Tb4ZXoCdcB947jxXblo1tlNHZZi4Nrb5mqh4mjDn4
 nqUGtwNsDHGflftl9io7L8fYhT2ZOYs098JAFwpHBkg4b5nh51CqYF3E5majk094cy13WPznx
 nSZIGDg4pyRojC4qRgjehzV9WsKtn+MzJ3GuDaGPno/ooXQFLej+vaaiXrGay5F1bhjhIwYyq
 oASwrstd7NGiEJT8HbeWvxx4rGcChSf+CqVmV2J04AzFvid8J1Z2h5L+Erf6TKBufCCjpOa5J
 ZPkbXe/7ibII9vrkw7PZkNc38ibP+SVvUcSYUovuAlPRAzhNU6g1Sn1XwEYsBGuWK/eq7Ett5
 M5urstprdzPjI3AO2iaFT/PWQ58zZ2pJkZUaTnSNHNGbtVXJvmD+XWVkYt0u0bEsGIRu3EsvW
 RfD7enRqyeytrPmVjUihhQp4mhRpOxsAwwq5UH9I6VsBLaxQ/iCkl1gyKM1KXsTqmihENZaMT
 gT5hSQchGCVNdlmwSH7lPJpGE3WqlmUQKfx3w1bzzCrGWDEctuJAP7jmsjEgEGNDaDiH8VeKG
 dZkfyc7
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Helge Deller <deller@gmx.de>

We don't emulate a preemptive kernel on this level, and the hppa architecture
doesn't allow context switches on the gateway page. So we always have to return
to sc_iaoq[] and not to gr[31].
This fixes the remaining random segfaults which still occured.

Signed-off-by: Helge Deller <deller@gmx.de>
Message-Id: <20220924114501.21767-8-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/hppa/signal.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index 396e310dc92d..f253a1586461 100644
--- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -49,23 +49,13 @@ struct target_rt_sigframe {
 
 static void setup_sigcontext(struct target_sigcontext *sc, CPUArchState *env)
 {
-    int flags = 0;
     int i;
 
-    /* ??? if on_sig_stack, flags |= 1 (PARISC_SC_FLAG_ONSTACK).  */
-
-    if (env->iaoq_f < TARGET_PAGE_SIZE) {
-        /* In the gateway page, executing a syscall.  */
-        flags |= 2; /* PARISC_SC_FLAG_IN_SYSCALL */
-        __put_user(env->gr[31], &sc->sc_iaoq[0]);
-        __put_user(env->gr[31] + 4, &sc->sc_iaoq[1]);
-    } else {
-        __put_user(env->iaoq_f, &sc->sc_iaoq[0]);
-        __put_user(env->iaoq_b, &sc->sc_iaoq[1]);
-    }
+    __put_user(env->iaoq_f, &sc->sc_iaoq[0]);
+    __put_user(env->iaoq_b, &sc->sc_iaoq[1]);
     __put_user(0, &sc->sc_iasq[0]);
     __put_user(0, &sc->sc_iasq[1]);
-    __put_user(flags, &sc->sc_flags);
+    __put_user(0, &sc->sc_flags);
 
     __put_user(cpu_hppa_get_psw(env), &sc->sc_gr[0]);
     for (i = 1; i < 32; ++i) {
-- 
2.37.3


