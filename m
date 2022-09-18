Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB8E5BBFB0
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 21:55:48 +0200 (CEST)
Received: from localhost ([::1]:55100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa0OK-0006Bf-2V
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 15:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Ex-00071i-1j
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:13 -0400
Received: from mout.gmx.net ([212.227.17.22]:40065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Et-0007bQ-AM
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663530357;
 bh=BcxOqfmO/trIQjNo29cpvGdH85hMR3n5nzwaODzaDdI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=AakXdKTCOgodGc/B+QYsC88Yv2rhwRPauKUwEEw7Xzz5acCfGpGsY1JRedPD6kvs7
 awMtMDAgSvEghSrqYr/upVehQ+bdHTe/gfTb5BG+II8S0Mcj7nM85IUz2PaHtzeKX7
 Wn5L4Ck6T3ZrKp4oFzxAzFj8JqGHIFNGUJCUikG0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.165.224]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRCOK-1ouoL32TvY-00NETT; Sun, 18
 Sep 2022 21:45:57 +0200
From: Helge Deller <deller@gmx.de>
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PATCH v3 08/12] linux-user/hppa: Set TASK_UNMAPPED_BASE to
 0xfa000000 for hppa arch
Date: Sun, 18 Sep 2022 21:45:51 +0200
Message-Id: <20220918194555.83535-9-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220918194555.83535-1-deller@gmx.de>
References: <20220918194555.83535-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HY+kf/Y65LgVa5qfzSjc8Krxp4/08TXRzHMpk6DrOjIahBGBAJu
 HuidJKobczQRsn4uwLYJ9EqDO3Nsw1rdBwcgH6ETZQeVV3AgMj8J4nyfDNvvWdtLa49Sr6k
 YuL8z5+AZF2FetttEttWy4jWXgCBdb0gEa1DhfBlcw6+s2Io+y1OT8Vyz/5Tzf4eCPWfiUq
 zJEjX+xjTLZDhxtEqh1Ew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZV2wiyguwSE=:0aYDMuMusNujKMJslBzTDb
 tKzNQdJ3fqWxCcXiG5S4lSm/lll3hkCOgw6jkboFd+b8/zstr8pySMLq7eoHIvUH+LwbaAIGU
 WUUt4xg/gWhFUj6qBGDvtaA3P35Q8AeGADIjzzaZ6o7ta4DJzFlJyVshzR2z8PfHh8tcFbdRq
 KTaLDWPeDc6Xpii1WTIZGDML1yt5zN4Ro9DoF5WycEKy3GrVOebCyA0naWX7aGVzKUva4ayo6
 avF1X/+j9xNMLoJgs+3m81elUsGDeqWtkT8U5LBc+7hKI6I1EwurUdU/2Pk6dJMeM317Lxqry
 qbDuOv5o6AW3QoGOWx8cE67XicorPJEQQasoVyhEX5XFdxbqqB4NX5NXTSdv+NabXpuC/TMiQ
 XgXQaDUHdppUq294pNRxVHHsgVb+5fn81FoojfI5eFYe3d1ULerf37KflC5I3CrJNffD9hlgJ
 vi3aWgsSvu8yGOUpMOA/xWPKlxmE4vwzPO3FMz4X2Bau6+GtnsLvC99UY6Xl9fHQdzWdcXiby
 KsWWakApdjswHmuJYl94WKJvulL6otcozShrZTBB2RytNu+c48Z8SZZtIbFRVwuFAYif7Km2p
 8555noSiRiA7UMbVUU/SwKMTO8/UqjMpXvJPWlzxvsSJbWLo6qPPtezMn2CXVdT9BsbxGRuFZ
 rJ/1/Jc5H5WBSUBeqbGo2EvuHwLVDO+vebFK2lUBxu3uvu0I2ZYhH7737jCKa3nhvmMrUfbjO
 QhCk3GfZFFoDGrWIVxsSXEriWgVgvshT+EQQtHd4WRccNmm4G4XpM1d1Rt5DmNkkx2tvETFi1
 DZCbofprBp9Ih9epcKvGQT62cP0JBvyMPFmZgLor6nRb8O6Ea1z/DpPm5bP8tp05FlnIQLaJ0
 K5iV3lGEBKUD5WVRws8FZ6LVOkG8cGI0Gn5fwj3KoArcLaNy7O0vZP2AWbMmY/XSjRXWJ5UlP
 Mt4Q0gRLVrFayVUPivksjqK+Dn9C+Hm4U0EUOzoEeLYWIXaWcP4ag7Dck+R7r9r+cO+iekT/Q
 JgRKY1vx89qhBQI89hT2TKbJxj4mmRUQAdWtIzvJi1Bww+wiVvR8Tx020oKYMnEKJGvQawpdV
 9RzAcG6XVUcbQyL7MlJIOG/LiQmlqBidGCLRxuPK90dEsM70BGBrZDgaW3dObh5C4gw4LKYv7
 6p3T3Gau+P71BsejOachFaFUOl
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

On the parisc architecture the stack grows upwards.
Move the TASK_UNMAPPED_BASE to high memory area as it's done by the
kernel on physical machines.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/mmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 048c4135af..dba6823668 100644
=2D-- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -251,8 +251,12 @@ static int mmap_frag(abi_ulong real_start,
 # define TASK_UNMAPPED_BASE  (1ul << 38)
 #endif
 #else
+#ifdef TARGET_HPPA
+# define TASK_UNMAPPED_BASE  0xfa000000
+#else
 # define TASK_UNMAPPED_BASE  0x40000000
 #endif
+#endif
 abi_ulong mmap_next_start =3D TASK_UNMAPPED_BASE;

 unsigned long last_brk;
=2D-
2.37.3


