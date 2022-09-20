Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E901D5BEFEE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:15:09 +0200 (CEST)
Received: from localhost ([::1]:57138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalWG-0007wz-Ce
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6O-00049x-6I
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:09 -0400
Received: from mout.gmx.net ([212.227.17.21]:48907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6D-0003IE-Od
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663695114;
 bh=gfeMI+E+j/dnapfMa/8omn/Mn/JySKbYTVeEcHy2pbw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=U2B6vajh64jLOjDYKmTnTkW706B6FhLUNP9Jrra9OPBPb/DzbhlV6N3zjqmuKAVD+
 rGVdc2j8CIWSXmZcqXkIMob+DWtRsEFXNsERthpoB1fB5jMPrZemMd4x7XKLcLx6a5
 Jk/J040H93Qdicol1UilfMu1AgCgNMYQRkm1TEkY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.174.94]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiJVG-1pFnHY0KgQ-00fRoZ; Tue, 20
 Sep 2022 19:31:54 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: deller@gmx.de
Subject: [PULL 06/12] linux-user/hppa: Dump IIR on register dump
Date: Tue, 20 Sep 2022 19:31:46 +0200
Message-Id: <20220920173152.199359-7-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920173152.199359-1-deller@gmx.de>
References: <20220920173152.199359-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:esA8DiE/Td8WIHkl741r0svowbw1RX0iSRsBqZ0xN7YWlm9bxHo
 3Xb0BmR1io/QPCad1wFUt+eE6RX+cK5m+pDKdIxRz9YOnp/wDWUA/KOqSt1Qm5Gc+vCLXwp
 SrXMc0ORnp372T20WuHfXX4izdaGXiFPnedzzJR++hgAxhB51+bjL5jC3rSUjngM5k0wxyM
 T64EIJxuukypJnjAdayRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6YRFFN4K8kE=:1pdQVxWd8SBiHmgjOvAnHH
 cYwue79SLrfVAhDY9QHjjxbhxCdHpaY76qKKxf6XBYNyRvn8OWuMcc8eh50q/7s2GZv9t+Id+
 axU8zz1r6pldzepuseM+KotjDkyNE4OBW9RYeb/AEEzJseVi70vvhdpMC3gsBj+8p1StgcPuN
 R9xPNoXXk4RiJEkkp7WWpn1NosQneI4t+7Xg+SDk3Qe9EUmnqMLaqzdpyY7bQjrPlCJraLYty
 PvjJP1rK55kc5IlcZpx64L4WxiRLSqYHH+57UWECY9El5X+sK+cf7WmJJ+3eVmneh1egsZglr
 16UX/EZ1W4msM4CeBMvBGuzXbbwy1wnwFV0cmv6BuPV+6eOYOke/n9SR/cEg/Q1E/F82z+tJJ
 tZKaAvn4mGAQInee+/VFVYb1KRGpv46HVOtOPxe+27uX+UBBqw/NXJLpkqKwX3t/P5PMfth9R
 zcVOIN0s/Z6AUXzpUIiXYsZXeQFjgrjfui+G+NxgtDRLqd4W6NjzmLeMndz3PbWou5uUFtNsW
 IusrL0mQLvQuvSYDX/yBmh+HZ3pwYCnHdagl+r8gbyKIlA4Z61FDqxgJwF2P6crVBOI1WPt4F
 8vk8l7+mBJKkm7yQvVLQXJ+Dr3v6tX6vNE/MnfKtjDjHsW4eMgkSwt7iYR6SztUI8ROByBm+s
 cwmhY9Ru/E+xPYFxVMRwYACaInD38ESu1SgkbshbliavlWdPIN7F3uMVm8AFNaE9RM2RFxwhu
 O8PJQafBZ3d21xwQbYcFiN5BxaZLdJn4OvImyyfc/dZGRKUm8/DAl1bOfk02zEY8hAqbcKQVx
 AV0ncoW0DOWwDLcannam78vpMRPVvntYTs60gw0YtdUcnasbkR1f4vrF1e0R6s85NlM64XK5C
 Ij7VKtxZVTSXZNEoIZmTZ87xZTlN4G6oFFACjHiNL7onYmQtCx+bbTWpocd/D2MAq83YOPZPJ
 9MArI9PWnXEgr9lUaadhWdkACzivSOzc8RBjvezJx9IxR76K4NDRah+rXN1G9wW27kPfxaDRq
 rAkWfO6zEJB56vj7W79jSZ1CsuBEXWGNzfTg4fGJ5MVck6ByCqnbOYO8wKFM3LISRdZpxmhbB
 ssEAopFrV3/hs7HoomVQwv+FL5om1nM6PRQTDCeMabMyCPkG6TN+CZhTkD0C2S5/IHXHGigWw
 LFlGQ=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
2.37.3


