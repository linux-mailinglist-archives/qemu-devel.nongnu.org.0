Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBE75B7AAD
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 21:19:39 +0200 (CEST)
Received: from localhost ([::1]:51774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYBRZ-0005Wy-PT
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 15:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLh-0008C1-Ne
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:33 -0400
Received: from mout.gmx.net ([212.227.17.21]:36737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLf-0007en-Pz
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663096405;
 bh=mY+wLW2vmfGlhMsU/mvzcZXQorGEa3wiKqNw2eh+Pek=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XPiz1S6pHhmxPiH4WTapyDq2szT+T6sOLpFtO6UulH1xMRrMu+VLjcrOnhrejU9yY
 k/Ay5K9UnGSDsbquvuUcFnv+uTnbD8X4TnUuWpvlHhzrEkA51oO0kqBFVE95WIkEKb
 l/ciobos30RrPMzPy/gjb6+5okOz4yQA837+g4lM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.190.164]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWici-1onXPY3piS-00X4qP; Tue, 13
 Sep 2022 21:13:24 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PULL 06/12] linux-user/hppa: Dump IIR on register dump
Date: Tue, 13 Sep 2022 21:13:15 +0200
Message-Id: <20220913191321.96747-7-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913191321.96747-1-deller@gmx.de>
References: <20220913191321.96747-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xd4shsXSZeDiYGJ/7ZxBtGJD4TmK+eSEC9ox5hFfQn9JyQZOyy9
 V8MGM8/gA8BSS0/mrCWk4YhfTLh4iYNfxSFZdUOmeNXkLXO2zgutWTaVg17VeEOmXWl0Mvj
 ZA060i/3IDDwhRLNOdYjMGzYv7ZGGluMZRkEnI0cx2hvxp5S4QjAM8oTcQEpSDjPSDcSk7v
 WA/ZUHXuPxQrUUPXE4gIg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QqXrFxFbq0A=:aTYxd8rWZdCrqRoKE1cNM1
 aNmcm3mOFsYj11f4lWrQS9o5eRsiMKhLDBW3rwIl0TvMGadB+t5A6JPweozgg6uPbBVpZRUlI
 Rlu9jW4c936P7OoTL+hVR1aRnZ1aCnqM1VC/4qVR3aTHsP1XGOTGK/okVZV29PVTz0swiQyPf
 d4dnA3QLo+XXNsilumjNjKgPq8i+u283Es8/wzB9une5OIctiewoZ9savZ9Uy69t99lMuzvcA
 9OUUF6toRmPphxJsndoLwiIt2MKMQgiJ7foPUccHLBJrD6RWIofUONPXMyAUchHaLjI3AHirq
 MX7HRhO0MUTbKaAKKpKcTpWvETD3Lvm9JZgV086yHCGfITFVtOMJssANqTs8bYshfw5VNhGTv
 kNsqmVwlQT8dR4vK4/W49PtKoCCfZLIyWKe/y/BLFlHAjVn2zAH+gB68feVeaXFvOku9wBPvZ
 U4XRVP/s0po60CZM7W+nrJ7EvbaQT2Dhnh0ex9YsNb6zacsY6nnRn3s9AVX5eikK33Cmm4E2P
 z09X4g4mps3mW9VJwf2LI2Zd8ACg+V+7zVfy1zjqoajr0wog+SHye9zxGPwhOdRsEwxLPRXt7
 YGwX8FOjMOPRHsfrRYYEspFSuOInwPDleck8cnGRICKpSBXVHOhFSJwuWYdIuVAC5EA8WyG54
 yaVKYaEJ/qQtHZq9G24C4Q//uHgTY2rHnCKyeMpSAjzyWzcuW9GxIjOA6s3ZwNE0LHvzursxj
 dx8CJjfV8LlnRpIrQE/1bhZ5Rg6tAsJzHN2hihIeGu/5f3TC8ZTWigJZ4P3/1txLwZhqcv8la
 OY9cK7Fd+cRqFoQPiH1JDk3UE8+L9qngxp1d+AtvD9+QUUeHEQLbYz5hG9UKPsvKuER0PRAMs
 67b02vkZb0IwrpwOjNdAcFp5lCa1D4hisl9YqGlk3zNiLiQSBlsSIYLZdtnGYluxiR4M4HMZC
 pb4HyLCHXUW4fqXyNDweA2wKZtkF+eJq2ejzcyGS8AOg4mfc6LXvSatFIkq5mTseLMB4aEbns
 peusPx/1+lnEeZE/cAnYchI8N2BiFj1xjxIffTVR9mqA6EJEo9Wmdt1er0P55MKmWKYnvgQXk
 lHSChZV635vC75H9UXPrYKDb+Za3Wu9bheabwOOPMH1lmyF/aPnzFAAte1dAOkSOG4yUmPH6T
 dG7baiFevjbvVRdVK39yySkXkI
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
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


