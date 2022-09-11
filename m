Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E33F5B5091
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:25:42 +0200 (CEST)
Received: from localhost ([::1]:46596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXReH-0005Rj-Mn
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXU-0002RQ-R3
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:41 -0400
Received: from mout.gmx.net ([212.227.15.19]:57811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXR-0002lN-OV
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920314;
 bh=mY+wLW2vmfGlhMsU/mvzcZXQorGEa3wiKqNw2eh+Pek=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=J4h7bQika8mASeGlPZ6mXCaQzTvqfMBsoFvE0Qw9U1bQO/u0JNtpP15ty8LNI1BMy
 DOceVfkNKwllaS3vwrbdCYKvsdViS87WM5FvAb8pvG686BMKoUXXPFYP3HfW4vk5/H
 jPXQfikkrTTGKnfmCjBmYbVkUS3lSHgZAivfaDR8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.178.88]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKGZ-1oZuUt129B-00Ffts; Sun, 11
 Sep 2022 20:18:34 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Cc: deller@gmx.de,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 06/12] linux-user/hppa: Dump IIR on register dump
Date: Sun, 11 Sep 2022 20:18:24 +0200
Message-Id: <20220911181830.15851-7-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911181830.15851-1-deller@gmx.de>
References: <20220911181830.15851-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JKLGHdANE9gt3JYOI3lV/J84wSserbqzfQBPsfghP6vPpzgyavC
 IzYWo5349MNDeMP69Qricc7jCo7AhTAxoxgUANXBB1uCwKf+6hxap03l61JBXKaHg2U/eIB
 rYIactzcA5K7a5QiMlYYei7ZXKK+27LNRpKV3AWIdMTetcWOj9utSzzu4AVtH2yo4LvuSI4
 ltX9uRvDMk2tKaHWpjqZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:B/UiCn3xcEA=:G89b47vCUG4UoD42/XqLfK
 GRT9c3V2Lu8N339QJVYkN+5mSsGnAeQaRMg+7LAntgOOdult/e800G9Lc+q4p5Setow8Wd4TX
 fqy3IS5qvRLjZ6rtGPvlD+LGcuCQ77xijnlw1W873/JQj06i91j5VGIHJHO7hD2HOIWhf5hZY
 BMVxh1JaxDrlzAU1y8C9Y5tRhKVy8Org/v+zrYASW8lhZ8Nyjc1h/A6+lnCXWQATg8V7lMbuB
 tXnEbb1hPZ/no+6LVHZBk3N/sAuujnJtAjdjPMFWwH8nGjhifta5l61iGvpya3gD1u2cAwDGE
 MAz0u8NeQsLH8mS7blZHUwLH3418h80zASAtN7t9pLfWAjrZMRGSxWwGGn5vSwXm5Qy+6w4Cu
 OJA+NC7wgHy9ZriiaH3/3jJYrqla43m39IAsMGIBNVeQb5tMB2bP97Wi6j9MkudHqX49E+NyI
 QyQ9YNDf2F5I2e86Q7Tv/7qoFBMEglbGbdgtBzJ5B5IvTXsIROqhJCq6X3p1RVbURmpf4U5Gc
 hJZNYQNMI5zWBg+m4ujGqczUQWAOKBjKNo009O/YDj39yj+j2I4xpF667A+ZVuTh5WdCsB5MC
 1id1mwacnQeSnMb5i4Necm+BIzTftFepqYmTzi5peBchXZS8fHyHeZq+lVUGVFdG4PL9hEzsD
 COcO4JIfF2w69rlnJSUtjcKeurLxqSUMeaJshg6MxUoj0gAiVsyXEkBJBja4DAPaSFBzIxYUr
 ak6rxmVWkleDzRrOwK4c4eqD6E0w+uWKyGhvjZIAg4SS2oCxIcbnGoFMgFEd/2AQaqLH6GxgA
 7LfztPVWsiUnhQANvbAn6wCOApFIz4BNKxyPuGS0O7lE2TODUpSQvpc0rcUwxu1Sd7CmQp9Sh
 F5oV4rMAglF4OnyN+D74q2CpdH6zSgL+cGUCylJxtiIXTs3CRhQll75reQW7LgdRrRD0fsDNV
 S4wizhJhWP4SE5EgpO7d1TOpzbn9+hYuuVJ7fnLe/82j6IWCHc47VQabgwCLRNZ3p1vMHIivv
 VBtVc4DD602UZ3PVJ+9PGZwmqbmowkaoKE9CPXrsHH3WKus1a1K/HMVNj/XuG3Vo6aPHzw3PW
 eEBEdJ0iOZYbj23zfr2UocbbWcPTpmYjS94j4LzUSqSG5RrLLCEsotv2KOUeFjc8yz2x+Z3D+
 36L3c=
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
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

Include the IIR register (which holds the opcode of the failing
instruction) when dumping the hppa registers.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 target/hppa/helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/hppa/helper.c b/target/hppa/helper.c
index e2758d8df3..74b8747083 100644
=2D-- a/target/hppa/helper.c
+++ b/target/hppa/helper.c
@@ -85,9 +85,11 @@ void hppa_cpu_dump_state(CPUState *cs, FILE *f, int fla=
gs)
     char psw_c[20];
     int i;

-    qemu_fprintf(f, "IA_F " TARGET_FMT_lx " IA_B " TARGET_FMT_lx "\n",
+    qemu_fprintf(f, "IA_F " TARGET_FMT_lx " IA_B " TARGET_FMT_lx
+                 " IIR " TREG_FMT_lx  "\n",
                  hppa_form_gva_psw(psw, env->iasq_f, env->iaoq_f),
-                 hppa_form_gva_psw(psw, env->iasq_b, env->iaoq_b));
+                 hppa_form_gva_psw(psw, env->iasq_b, env->iaoq_b),
+                 env->cr[CR_IIR]);

     psw_c[0]  =3D (psw & PSW_W ? 'W' : '-');
     psw_c[1]  =3D (psw & PSW_E ? 'E' : '-');
=2D-
2.37.2


