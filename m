Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8F45E8BFE
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 13:58:35 +0200 (CEST)
Received: from localhost ([::1]:46544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc3nm-0007LY-69
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 07:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc3at-0004Lf-LS
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 07:45:15 -0400
Received: from mout.gmx.net ([212.227.15.18]:36477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc3an-0003Qa-1L
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 07:45:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664019905;
 bh=9mDTRgDgEAEQ9XZte8gnccGZQae4pGNUlPhIB0AT4eA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kuB4TPaqfuPOBqJh49K53pu5yhdJyKTaAhoCMktLTq1mTFGcCy+5h+y9M2vqQJjkU
 1b3KeYSoBsom17xqpFmLNAiEnrLnPAtVuTb97qHTutkV3UrvjXx6Kxvl0mQ9xovmj4
 96XcsTB9lUvgLL7MNxsmBh2fGYZqOSLGVUO5xgYs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.155.187]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVN6j-1ojNJO0lNP-00SQ4n; Sat, 24
 Sep 2022 13:45:05 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 7/7] linux-user/hppa: Fix setup_sigcontext()
Date: Sat, 24 Sep 2022 13:45:01 +0200
Message-Id: <20220924114501.21767-8-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220924114501.21767-1-deller@gmx.de>
References: <20220924114501.21767-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pS6DMUcVFMXlepHN36lejGvPreFxCnsY8hfyHCUS7AEyKUQ3Awu
 FniAQX3iOMDoyTUyLueHlyVzI5z3e46Z1y10YFPrEA5Xty+gNzsqeXWMjsrwPij6YrRTsWS
 uvNXgcAdxhr0lKPEcFGb0WZozvY1gevYl6tbjv6z7InwpuIKiKUbFiQGl4Mg+l3HpFRKRyF
 E2zk7n/dfUcQBThbsXLwQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DC2QMtI5b0A=:m04t+ZRThI1zcFcd6AwtUr
 R6dmPcMn9nxiuaWbK8p1ouoXliL68O+a8Yvh8qiOMftqaTRket7/pznBVLGV8G9SIiJP9v3GN
 WNn6AMuEimBO/KMXUqwj+UrorMvdGHQD3Zr0nKVPneG6isR0Y6Uw9/Ra8yEQY0UKyufcAilQ+
 S2Y0PcRV2sUwMUCIFYU+2Lw4dXF5MFKKltEhW7SKvfl9mpWESF/vavTqCcXH+f2HENlLg3WjR
 ieU1JrtTpXsa1UUDML10kybJFZ1gKPDNgvPWoQZG7UdSPaB+Uc6Udl3NfN041CycJdZuhP6T1
 2JcFaYkkwXtt47kVfL3ALIpMX+xvNoSjmnbue3wPdbxWFA05wJ2RP8/E/EmxHAmNeuf2Yz/TG
 WdrCiagHVJWmSA+2m7W1gh0Zy3JxmK3EV2SCNlHOjPD2R/Lwxqdi7d4Rr+RizE/hKcqFdhKqF
 xJzWR5wDhnFgFfryGWBVJRAej+iKdIcrJmO4gTLKyo+Qef5uCPdf4MnjNmTTBUeqSelGb+aK9
 89CvV6B3fYu43enr5ZU6HAm2nm1AGlSYclZ1VeofHBbIM8QZC21r6rD/COqfOACxGfitNZMFc
 nfKOzVsHQKx1LPxlllCH2uxLA+FDTTgmp3Bwr6PqZfGzEqQ+VjuZ/I39oNX0ZLx+PD9WS8XYb
 y2WS4HF++EPFLh4g0ievwEdEVzeOSrpxredgTKbFePS3cPnjsvtWs4p/8wSL5e8s9H9PKJaSF
 SrcmJG0CiSt/EK0PkBoquAibCARRYTmNp+4zOcj8K+wZhyF33P/8QnAS4iCKK5CSd46DWtRnI
 IMlVQwVxcHei6U0xQnoLZDe80hfKqhl4NWrazSM2fWtQy0R9xCgJ5Np+epjEubmLzDnEjJCZU
 wuhXBdjWWCnZsxvvcT5/akpctCO2XQXd8dGr7eKIWPtJMVLWTy2X9+ba16e296R5+WIgJ1ZG/
 2DDgMrO8VupHEGN0hbHKrZiMj6vbmC1ffXZruJ3wOxqqYkeQLd8U8KYchgnS4jcPdXMd5+WUm
 nOVeBLnB8k1gpPPnoSWuos3Sj1mtJDJlmvguRFAJoU4SVarOHWqC2A63YedKa517qLDmprxAX
 HhKUoblKFWNmVypkIzCn9czYao4dj5IsL3CXfBu6SlTopYQGZ9q0mylGsjQY7PDOOUSLyTek2
 20H2Zk1i/JbxTH7Y8PO5NTNiyQ
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We don't emulate a preemptive kernel on this level, and the hppa architect=
ure
doesn't allow context switches on the gateway page. So we always have to r=
eturn
to sc_iaoq[] and not to gr[31].
This fixes the remaining random segfaults which still occured.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/hppa/signal.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index 396e310dc9..f253a15864 100644
=2D-- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -49,23 +49,13 @@ struct target_rt_sigframe {

 static void setup_sigcontext(struct target_sigcontext *sc, CPUArchState *=
env)
 {
-    int flags =3D 0;
     int i;

-    /* ??? if on_sig_stack, flags |=3D 1 (PARISC_SC_FLAG_ONSTACK).  */
-
-    if (env->iaoq_f < TARGET_PAGE_SIZE) {
-        /* In the gateway page, executing a syscall.  */
-        flags |=3D 2; /* PARISC_SC_FLAG_IN_SYSCALL */
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
     for (i =3D 1; i < 32; ++i) {
=2D-
2.37.3


