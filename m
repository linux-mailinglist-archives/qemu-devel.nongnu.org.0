Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA575BBFB4
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 21:57:50 +0200 (CEST)
Received: from localhost ([::1]:35304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa0QH-00007Y-TP
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 15:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Ew-00071g-Gz
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:13 -0400
Received: from mout.gmx.net ([212.227.17.22]:58411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Et-0007bV-9x
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663530357;
 bh=gfeMI+E+j/dnapfMa/8omn/Mn/JySKbYTVeEcHy2pbw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hEIRm/apvEKYA0r4yjRylblfb1FFmJI2z77jzEL+Y31FVt2678YBXLuD9dczOtq6i
 KZwxp0//Kz0w48mT4USNmmm5/3wAnyx/jeM9O+UVa68YXNCrCIrlWV+O01bVe1X9ne
 qK+tV//gTUoJO03jrde6ooPKUM1E0EoH06NxIUuY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.165.224]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4Qwg-1pGNm714vG-011T2P; Sun, 18
 Sep 2022 21:45:57 +0200
From: Helge Deller <deller@gmx.de>
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PATCH v3 06/12] linux-user/hppa: Dump IIR on register dump
Date: Sun, 18 Sep 2022 21:45:49 +0200
Message-Id: <20220918194555.83535-7-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220918194555.83535-1-deller@gmx.de>
References: <20220918194555.83535-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FS2DbyTAP7j6mPf37QNE5m/gRwvZCIWnG6rvz7qg/fj1mWhmlcp
 8d3A3/BZ8lDHT5RqgIoyrR8YlpgIfyv1FogsoUrdEx+fkFh1rIcqPVhasxHw7ZdK9o6VkJv
 bWYRkCctAvvaCsLaO+vN6oPn/tqd5eIyJZeHkNMf4+p7l2gbQePZF/LH6Zhro+TXjz+x/8X
 m5zmZBsglHZfpsrzXGzSA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Nicl1jm3re8=:4vCZtMIrZchR+Z/QIsEtjX
 JoiPl5FI9oZ1MlXfDpVz19SGPk/6f3B0eCxys9bMxrAEq4xmo1bON8ewp+p8CuO1QCpRrlzeY
 f8YqyP2A8dB4yEsjc/dxgkj0MLjXJ+BLUjfTbxUVM5OfG+eYY4kTRu0273cMPhlRqlKbMdKzt
 jvNwQws+S6wxQ/Js767bednTCQLEHEGKloTHqIWVGj5tmKwZfg89GcyzOXeffRXhj+HzQIgBb
 59o4OepVMlpNo888ITScemLrgdRV3PqA5DR8+mgAHCRiUnvWlhsUrqhou57DRtosdz75bicHh
 3o9nrSE4HEYr6VBqg16YngUl55q1C6dGaJ5BTQmKIgbg4Vy53f9i5M2vJaLxAOAc2EzRUaVs0
 qRYar+RIcdMUDGeRyuihyrHLrOY5FaGEIQ7pj+iW6kAJFtnv3RYDUEpRT2zli6CT1qO7Lga16
 mnqbhNQfYZHkNdgSQ9eQ8dZJTsfgPzimczRXgA0xxH0afjZ0F4q0zRZ8vntvgOBlsUk0+fORE
 tmnDzcn+zHPy3zVhUUpbzDLMWrsknhuba6bfPUMbwNyXhGTppyGGZQJWy4MTMN8pzyuano/FO
 5miuzJzXRcRZveJQeA4wtbvhLIDiU/LGn0VOUt1or2VMqT0AloKhNQqATTLiXXpiAfro9Mrk+
 fT+/D+JmobrMOk1ymWm+G/tgoRH7hI5TSyil0FAJGjBEcFavkEnHAyxxY/BfqVR0cBjNN6kia
 k7wlkeHjcfyt6CPyS7qpo7L4FHgJu56QnJJv5MhF9XjfWReeLXH6HMnoHSYleDLLwmikeoS7f
 uO10MY9Xh7s/FuqyDLGb0CxwL4fECaTCXDSyeIOZH2iWgoOTNO05F94dRpSFGjKYWBDTISpgd
 X6cQDR58ZMy+FL1LLY6BVvqHVXQ2zCE2GNiO1mjtM7Lc4MC9UFpwXvxtvuw/UHLVm+oIrwG2S
 nxSAHKwXA68eW79k8MEKOPDIjYnX41WOsI3B6tnxribe1Hehi8vNwKCoXpOqPtGZtaM+W8dag
 FU3ZwHRU50PXSZQI6qardkB/9pItImhvpvKSRDr/gmvQVtt3F661upri0mZS0x7kPbPo3gSIF
 3sriwaV6lTbdxYDgL2zqhzLMy2qCLyVYU634yxk/eF7G6HaQVqBuQQ2QNKO26ytrMLwKaSI89
 JU1ydY5n0mYG6cDlepjRbzVp0y
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
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


