Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE18B5ED972
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:51:15 +0200 (CEST)
Received: from localhost ([::1]:52350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odTik-0008Mc-Hw
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEL-0008FD-MV
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:52 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:43097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSED-0008Fi-8E
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:40 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1My3Mv-1pS0kd47ix-00zXJ7; Wed, 28
 Sep 2022 10:15:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 27/38] linux-user/s390x: Save/restore fpc when handling a signal
Date: Wed, 28 Sep 2022 10:15:06 +0200
Message-Id: <20220928081517.734954-28-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VJd4pE/Ez6uezQQ+HpdqZ5HrIVflV/cv2HmUc81oPrQSt3bipm+
 fzf5j3boPCwccRFLFzXsb6ns3tG2NLOk9hotq+7ta183uZBcsAAHdemndK1ANgeBgZ8wtAG
 VY6Y/PRXpQnVCCcCtNDdn9yR2Vr4wDam3HtX2My8E/tFc7pJ3CIx6sfE5GqPdOH0i234WwY
 FdiOjLwmxt3PxJIQMgcxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+2afVwXsjaA=:Kky4eThTtiYveYlDOFOPf4
 6Z8hpYusPzjGHUn7SjaH9rXDFpcHHDX2uy6p0ykBNR+3SLcbdXV2h/r2WN/4rGy+sfskJWxb0
 aSzCauxTbcQoSc3/vJ1655bHMYUDjg1b3fxl+jPO1Y3mhFGexJLSVl9kLq8V0cDJSp3dONzyf
 d2GAqMZWRPg0dyoP/yLwyNURJxw8lNEF/OUolF3TD4rdRaR6L7CMF+CvY2td8K5NOlOSjKElF
 fdef7geu7A77hwUKRU+U8U/5hWRI6O+LD9F/Ro7hqN8wunBgirm9K0RPDapZFIyLBfsC0Jrtj
 2rFI0Yp2YCnuBB6NTpCGN9q7IHsQN3UpY9xfPadNb8zdY2lLEAhQeN6kS+/i85WY4xcHDqKeD
 d6JglbnoFsflfnCV6B6UN9xrt0+HWPTcbg/XMs1Ej217yZvjBi2BtLALFC5DYG79E1tQE2jpM
 4gCXzSFpvCNTs0QPVZtKcwmPuFcQvtpfTB9nd4e3lHmkpFfaC6uB8/BKpDa37PHmCf7+Rr5IY
 LgOLg5j/keLLYZoxpCucXO+CFpzfCLBuquTzOqBMxCPk/KUxGiJhGDZTzrpOwX6jVe2AR3E1V
 NXDm7OQqRGWX5wIoOjIYTDvPj7PTmQxk7TlB55X29MvvLycyVgVtAAnTEV5A0apKYtE3wvlNA
 LhEk9+FUNbMwqgAQlLCFU7SinuCSC7Hgesxd+H+VjivY8OwHMrwShUeHnejkKsZR+Swsi+wwA
 onKcMMfKq5CAnupD5cdj8aNsgWbauxEOk+c9YHxOrIbr8x/Ja2LI/hJEnlYB+RRP5nyu/qIWP
 +7RmSWJ
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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


