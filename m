Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A690F66B0B2
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 12:36:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH1IV-0007mZ-EM; Sun, 15 Jan 2023 06:35:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pH1IT-0007mA-FY
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 06:35:33 -0500
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pH1IR-00011n-Lv
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 06:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1673782528; bh=KLrrB7Vf/9vCpW2iJUNfMd5oC8b/PCB0lJF6hgv5ll0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=mAsWLI/Ekm5iHTj2Gk3BGBo2XYvPcB1VDh/YnLN2J6wBx0FsCwvrEbhv+qFS61DiN
 JiRqB+c3BphoFRLk4J11hfFD1U0u1dm9frVazZhGPmowB8uhG6WXwNGOWuk2i3zjmR
 A/94hb7JRpPKSoO5ekGnFuDXRYCkE84ug3QTCJN6TXldyb2RGv2pM8FeEhvi6qtgL7
 6EdX1bjNhNDb1MTJLaS5GucyyM6r/rHOyG3tk6AP+zn7uuWlrTfkVdgsQlahFaEivM
 T1/0j/5myBpPzmq+ZDagJXoLQy3t7Y47U1nj7UhOzftokcvC2q7O4y3MN5lmcxI2bo
 Ef4cGMWUJWYQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.161.25]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McpNy-1oh8a223dK-00Zu1S; Sun, 15
 Jan 2023 12:35:28 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH] linux-user: Add strace output for clock_getres_time64() and
 futex_time64()
Date: Sun, 15 Jan 2023 12:35:17 +0100
Message-Id: <20230115113517.25143-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:h8RPwBzcbkoC6/Wj05P2TJCh6xCtYkHl/XsUq33VbyWQeUxmSGG
 OpcUEfJMaBSWo6euGv31Odr49NZce280Lqb9PATH/Vjx5J+WajgBWIRsaktZT24EgqGyzAc
 SOPPqVnr3r9d/7Ou815915fKLOHCW0uR148YjKzQ37vanRYqh2X1LsM5Qzal7dWemupSYnS
 b5JD7vVoLHd7duubamN4g==
UI-OutboundReport: notjunk:1;M01:P0:p62wI6WhAys=;vVzZJGLKScS9AXdNquf26SQ9i1H
 vsORWKaHVWVYXW1yB6U1w3Zs4kkyoA6axKZTGfxbYh/iJxdfwBK2O6c8X3r4MITtnDWEX1oCJ
 B4UluZeoyhvdoCFd9cw+Ymrspz6lRlTiz3pYugQlHvvPtqxxAKdVAnZP/gYzEkNZZSgy7HpFD
 wUp2S7QKWgCfmP+cneEUu+tVsEEZirFjn+OLMkQmz4PzK7RsdjJNiIaPE4yTKfo5ylGLOCFve
 kTZyFLz2iqnHG9na89CI6kXij7W6HJZ5ZFolwqTv48EaHXu5KDenUYvUiKrkizXfudm1cRTc/
 HmYamurTCrd7HzXQA/VEAVR78WiJnX6vTnvdfYE4ptCOnTPbhPhknb+7MP3GCEG0i0tcILDdv
 qhIL8Pyk9y8fzdShi+kXT1A2bHeUGqMNgVs8b0xX76pibAE7fDpEmPrU8U1X0Zt6c6L66ay9X
 f+Oug+z9uam7q4nmWM0DAaDwTVoh4YsSPZZ6v+SIV2GuN1JKI/rRWFMaz7ZHRGzZ04wkNCVMp
 DZZwA8cNYDDwFJ4lgZ2z9Qnx2jySAtjdeVdByvNOi76KLdmzRXRKkGmQ6XKzoW73zUCADRmf6
 SehAxlfe75lVhkm6R0xoiNUm2WdywtCw+Wo7DRxYdt5AgA55R4fRNbrhT45mc1L1bP96ILrl4
 UWFd2lCd62aZ+ysedw4AafdEdTLfsBoCls4Avkf3IO0jcN7fRJvly2qRo2GwCTMK9mVPLE7CS
 Gwp5YMYr0ytrH7/JS31hhmUUJ7uMLBz+dXwA6M5pPrebJpnmYEmLqZrfkvY/w9ND+ITz4VjEE
 +hBEbMJn/Ta6ZmSTt4R3gg54XM1U9CmgxzUmL0SDYiLDWJuL0iu116Tkru81Eo2LkAYsA+0fO
 cpHPOtIG2NqtmN3z4R96qTm8EzKu8MwrUBkYcGka4YgrTzi6lqW3ABaVu4NAa51nnttmIPbO+
 pOxypQ==
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add the two syscalls to strace output to avoid "Unknown syscall" message.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.list | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 41bb6bbfbc..3924046426 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -86,6 +86,9 @@
 { TARGET_NR_clock_getres, "clock_getres" , NULL, print_clock_getres,
                           print_syscall_ret_clock_getres },
 #endif
+#ifdef TARGET_NR_clock_getres_time64
+{ TARGET_NR_clock_getres_time64, "clock_getres_time64" , NULL, NULL, NULL=
 },
+#endif
 #ifdef TARGET_NR_clock_gettime
 { TARGET_NR_clock_gettime, "clock_gettime" , NULL, print_clock_gettime,
                            print_syscall_ret_clock_gettime },
@@ -275,6 +278,9 @@
 #ifdef TARGET_NR_futex
 { TARGET_NR_futex, "futex" , NULL, print_futex, NULL },
 #endif
+#ifdef TARGET_NR_futex_time64
+{ TARGET_NR_futex_time64, "futex_time64" , NULL, NULL, NULL },
+#endif
 #ifdef TARGET_NR_futimesat
 { TARGET_NR_futimesat, "futimesat" , NULL, print_futimesat, NULL },
 #endif
=2D-
2.38.1


