Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D405787AE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 18:44:16 +0200 (CEST)
Received: from localhost ([::1]:59126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDTqx-0001b6-HX
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 12:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oDTnk-00065j-Q8
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:40:59 -0400
Received: from mout.gmx.net ([212.227.17.22]:44421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oDTnj-0003bc-2J
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:40:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658162445;
 bh=X2f0ttMTvxkzXmjuicHwCe/L8lmDPVrbNcEObqvABTw=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=As3ilEq/l3+nhWv+qwGul5zjwvlpTbOrPTFDkm3r/wJnt3+HE+y+lobNjFXmtjDyl
 shHZCMvvMqL7hmnOo7kgRcYRyp/WPJiMR/4qttBwgdPz6cv3wwGio31Lg6FkWb6Ik+
 KxCCzxstlZnTxE1u/E+tQ/4zZGfAy3GkOOkdq3I8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.165.57]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSKu0-1o6yVZ01tI-00ShfA; Mon, 18
 Jul 2022 18:40:45 +0200
Date: Mon, 18 Jul 2022 18:40:43 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: [PATCH v2] linux-user/hppa: Fix segfaults on page zero
Message-ID: <YtWNC56seiV6VenA@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:2GCG8lLvZOXVBj/E1xUmVb68ibWJYiwsvmXcvNIFwt+so6izUkR
 6YZgkny4rSG2X88B9DgBtXrzNuxAZQQGxWndqlV22Rn/jcwLcDOkKj3oFNEcUZ7gZ1WkH2c
 f7E94Oy5fkyIyML+cleQrn03UeAjhyw5IXoA2hN2mo31oWQCR1QI1M6s7L6CUeGQfaWaUxO
 6voxn8lQFGeB+pmMKROzg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xoz9KOGKtXc=:B1IUPGrw/cg0vPYERv//uV
 a/E5NMBgH/E7WJCMxiKhKLHJg9K3jtJDdgv2IwN4Mz8gAWjrOM7ruwtyG/jB5ln0ujqpcIBeN
 MyiEpHD/zPCUGR7lRRCQaaJ11Yx8PjaTXU6x0RX8a3Vk+7oxWrOP31IBi4NXHk6c9ha2Rfz5M
 2pR92yoLZinXXXVDY4z9rcRSg/MsU/OjTw0Yf6u3D0wxwDwmD4h/ll7E/Ji3qLkwX+v0z652k
 aoJeIZAnlk37BfBvDGIF3T2VF97yKw6wx9+v4mPlNcmA+ShwDT3ImyCtRNJ78MM3w1rsHYP32
 H+8i8kH7QC9zOSsIUWjRg07UsDsK56wEvNHs0E28h55kXts4SbSFKvChuThpOybugS5+iTNFE
 izAwVFFmlS2sDSBPq+4j9MiaaCZgOUnlGRgpx/SR5BKGlqQ9pGyYWcA18TvZoCPB3ooAxUeXo
 b5AnvMeXfF7qdj6/14JBpi28b5Qh4WRs73MzVAZ7VMu+KEcN+v128+9jdlip22yFtpQQKoKOu
 gXJIZGkqsWJDasVwsWjP87IqxjoudwJgzDMNswyz+e6fMgA1wTPAobMW8UhLBBOvTfONv3NpK
 PBLZ9IRhZmdEP8jmnlNFZUFamo+78SFPoGh21aVLdrvrxIkKuvRzEKElfa3BqFmd2d2lCcfH8
 kXQxmqloaJ8t2nTeW6XlRx2Quv2+kzcoxG43gpmJn/1FL8i0EWHxas5Vqiy8iNocJOG69GwbL
 qfhPoqEi/+LGX7tkXJvkKzKXipi97G5/hsFbHYyng2bQqiqw2wkFkhAAzHAZg8NkYFAY52n6Z
 y1IyMg6thx2YAL/RKCXyWXfZFd2CKI42K5IkBvRrLtrzX93oRlL2fgSjS8PNLA3iRmlenyObs
 GhFy9f0XsAIOBhm8pkRqU0RsA9Gkde+l/JmIWmak2G5bABByjRWnpVQuw2exNlzlcAAiaJ6m9
 4UKMbH+xe9kbirAavaCkm1x741UxS97B/5WnJ6jWpzKQT1HUiGC9PjTKBzn92FH7FXjUXnscb
 Bkfk4wQdV/lWssjFP+gD3qmCpM+rzBomcRH1Do9J4ZUk/8rA5QOuvOaB7KsbG/zcI8ajQ3TfE
 tbleTrACZ+PjFz2zgo4yo+WxBiWw7iRPeswyAn2yJhQf8G4o3voxEoHYQ==
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This program:

    int main(void) { asm("bv %r0(%r0)"); return 0; }

produces on real hppa hardware the expected segfault:

    SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_MAPERR, si_addr=0x3} ---
    killed by SIGSEGV +++
    Segmentation fault

But when run on linux-user you get instead internal qemu errors:

ERROR: linux-user/hppa/cpu_loop.c:172:cpu_loop: code should not be reached
Bail out! ERROR: linux-user/hppa/cpu_loop.c:172:cpu_loop: code should not be reached
ERROR: accel/tcg/cpu-exec.c:933:cpu_exec: assertion failed: (cpu == current_cpu)
Bail out! ERROR: accel/tcg/cpu-exec.c:933:cpu_exec: assertion failed: (cpu == current_cpu)

Fix it by adding the missing case for the EXCP_IMP trap in
cpu_loop() and raise a segfault.

Signed-off-by: Helge Deller <deller@gmx.de>
---
Changes:

v2: Dropped the "+++" in the commit message - it confused b4 and git-am.
    no functional changes.

---
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index a576d1a249..8f374aeef6 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -143,6 +143,9 @@ void cpu_loop(CPUHPPAState *env)
             env->iaoq_f = env->gr[31];
             env->iaoq_b = env->gr[31] + 4;
             break;
+        case EXCP_IMP:
+            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, env->iaoq_f);
+            break;
         case EXCP_ILL:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
             break;



