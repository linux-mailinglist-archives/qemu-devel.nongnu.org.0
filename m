Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1072A5EE6EB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:00:22 +0200 (CEST)
Received: from localhost ([::1]:56616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odeAH-0000dW-3V
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf3-0000Xr-AH
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:05 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:54091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf1-0006XZ-QG
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:05 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MsqMq-1pWYf10ZLc-00tCN8; Wed, 28
 Sep 2022 22:27:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 27/37] linux-user/s390x: Save/restore fpc when handling a signal
Date: Wed, 28 Sep 2022 22:27:27 +0200
Message-Id: <20220928202737.793171-28-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jnnsk/uMhUG3yUw3SRxgr2/ekcHwOPllFlejO+8EvoL5fEl6yOx
 y9N0+ClfirnJPisjGcdv3aad9k00M/WY/pxLMxmHniX8kz0OxZaaVTMCQA2URHdzUMajw4F
 WCxM2o4/1xA9Oe8eg4ZpJnwD4s+919kzVUif7Q+TNO99KViCf7GkUx1Jdc3qMluDJ9DPP7U
 K9f1M/+Ds9X5MxGx3iyUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zjCLBIb8sGc=:TqJETjaSMAta6NE+QxUPEw
 rnJGUJgp0hZJQamOjSWvMSmYfxBoMdYl6+fro5Od5joN6x4DC8LXIj33d2A/IxVtLKht+nzvQ
 D0/N1ocnttUGg4DeZyqvxtuc5IPB1cziJWJ00EEBtjfCFoL3c/NBjVRd5oSfq5bFykVx0r1Ae
 9aZRDTw/lRjdCRF6cstE+PP/i4+A9wtelKHuoaVFSZldIKiq2DOjyu3V4vu0ARCoUPFg/mlrE
 LUslaNE1LVwOFLtNe7lswyUDFaI1dfIx/TL7vy4ZdTYClT+cn9NOZEnUDDCSzUa7TjOPmgoNm
 dm7ab/WMZ+A/7rlXPPZyksbWtBlFYp/9TO+Reav8bzxugZiFU1GFM970d7e44xmhT+1CGzvUm
 e4ebXKPeP6bcECljpvqH6wsWpavZ8QMK4g5lxP+wzJnEm9x4q2pRFYChsDX2y1m1HypA7YX55
 IZhmfMtEmq+FV7Y4iFrvgO9fs4Zj3hR95ubYsHw8dqE3pk0h90mXhicXv6yMUsKkB2JCXiUL+
 wgFpGkFvXRl5BhmXTUOQufPFc4+K9LRpiGS/tH3SK5+5UrmaDrn7E/v58OkK9+mAY/mv4cDZ4
 G8VaqVZOqC22bb9LAb57FTbjeHqkGwVJXmLzZalrtzdZtujZPGpTdTwAblICjmLkG//sVnkeC
 FkyHTFoKDMpTOFVxGSVx0Urnu2urYwMImMYK7LVwbbAb5+vW1ng9vzGSnqOQPcudnZ3mDFY4D
 dQ4Ed9Jo5Y77C6fMoa5cldsAI/mkOrCOO6ytgYwfc8zLsONtD1FTX0f7TqboQUGJF+dm6o6UA
 6YgIMiH
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Linux kernel does this in fpregs_store() and fpregs_load(), so
qemu-user should do this as well.

Found by running valgrind's none/tests/s390x/test_sig.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220817123902.585623-1-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 4979c4b01791..f72165576f3b 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -146,6 +146,7 @@ static void save_sigregs(CPUS390XState *env, target_sigregs *sregs)
      * We have to store the fp registers to current->thread.fp_regs
      * to merge them with the emulated registers.
      */
+    __put_user(env->fpc, &sregs->fpregs.fpc);
     for (i = 0; i < 16; i++) {
         __put_user(*get_freg(env, i), &sregs->fpregs.fprs[i]);
     }
@@ -331,6 +332,7 @@ static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
     for (i = 0; i < 16; i++) {
         __get_user(env->aregs[i], &sc->regs.acrs[i]);
     }
+    __get_user(env->fpc, &sc->fpregs.fpc);
     for (i = 0; i < 16; i++) {
         __get_user(*get_freg(env, i), &sc->fpregs.fprs[i]);
     }
-- 
2.37.3


