Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802D14888FD
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 12:48:56 +0100 (CET)
Received: from localhost ([::1]:51956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Wgx-0000At-JA
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 06:48:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6WaG-0001Ws-Aa
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 06:42:01 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:55451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6WaC-0008B3-Ta
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 06:41:59 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MGR3r-1nA9EN2IX7-00GpMf; Sun, 09
 Jan 2022 12:41:54 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] target/m68k: don't word align SP in stack frame if
 M68K_FEATURE_UNALIGNED_DATA feature enabled
Date: Sun,  9 Jan 2022 12:41:49 +0100
Message-Id: <20220109114149.1275322-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109114149.1275322-1-laurent@vivier.eu>
References: <20220109114149.1275322-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:M3/VBfkwK9kedevXqesYS1Qbim8gso14q6uPC4i0xitlTxaMoHZ
 CDvn1FkH2dYOp+/3HhFPi1M7f0rITvc4OFfDBiIR8a2yERzpWwg9S7lgWouVOxhVlMUjwt+
 vOsvEVkKGADPxWrL60bxTuplBG+NaWfdGQd3kQxtxI+TKL6ZVcornDGOD9YIFTnQoj/D2rs
 r8x75ryL7H9ifrr6E4hcA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8zwJO17ea/U=:MEx4bsQiyHKPSHyPdlhfj1
 LndthHyoN3UUi7ttEYbmg0AwFdFycDf3/z6oUMaFaMwS95Zxvz+p3IS16AV3cB/TyPTRp06EL
 9zfZDQtGVyig/MOBszK6h7fsLFBAw7pAKhXmr2FkGpv19hHMjowF+eXgDmGg7qmuMj41lw6/F
 1Jv7u4EfCkqldaDpx4MwCBHHHXjnLOp1ni/WKGRSXLJvzV6QKYhtmetQS56nfxUZ7Hb3dhZv3
 oU73fZgv/+VfUTYucP3KIzz4mGwO4fJji4WVWRps/CjbH0hPTrOgNH1LQso4/rGLIpQ154aAZ
 22XBU4rGdvIoFuBEc2dR5WE1yr15odfIb5gj9+8VxtbfIpTyVyICP7SdJ8D8LHDR4jOV60RZt
 jLKagnx0EDP1xQJG5aczD+Ud8bf6iUA1zKvRnxjuNazcbRUwboYDrptemGeek5uvuRUUvAR1O
 93ksA/FGZnYjEIlWkW01hMCppvmCZJg+EGnEFYX5NFqpPm38sfmHS3uyRMuRQi3liTyiioHo2
 3jwQAE05wXyUzI7iYsIHgnMaiMT2wzRnbW/uM5qapC6dK2fyliTNwK+qbLTo/MqqrPIysmNng
 SxLQtOBuEcFAONhx7pbLCdKgu1JUCvWwGoAVIih3tHrM2yQHFucevm7rtObjyiQ+GwxV0iimD
 jedNhyOr+0K/tROS4uWVMdr2HAZV1qeRU19x9SI5KLtD7ppkMJCdcg9r8e0OZfc3jQ/Y=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Commit a9431a03f7 ("target/m68k: add M68K_FEATURE_UNALIGNED_DATA feature") added
a new feature for processors from the 68020 onwards which do not require data
accesses to be word aligned.

Unfortunately the original commit missed an additional case whereby the SP is
still word aligned when setting up an additional format 1 stack frame so add the
necessary M68K_FEATURE_UNALIGNED_DATA feature guard.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: a9431a03f7 ("target/m68k: add M68K_FEATURE_UNALIGNED_DATA feature")
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220108180453.18680-1-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/op_helper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index c0f4825034ae..acbd4735154e 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -415,7 +415,10 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         oldsr = sr;
         env->aregs[7] = sp;
         cpu_m68k_set_sr(env, sr &= ~SR_M);
-        sp = env->aregs[7] & ~1;
+        sp = env->aregs[7];
+        if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
+            sp &= ~1;
+        }
         do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
     } else {
         do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
-- 
2.33.1


