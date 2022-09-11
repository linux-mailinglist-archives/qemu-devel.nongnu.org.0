Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41B55B5092
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:25:42 +0200 (CEST)
Received: from localhost ([::1]:46598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXReH-0005SC-Pn
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXW-0002Rz-9a
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:43 -0400
Received: from mout.gmx.net ([212.227.15.15]:51709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXU-0002lX-7t
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920314;
 bh=9HKRSmBH0uIQursAz/Lfos/ipwIs650RLsxkMdvi+zc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=jc1R6nJlvTAbRidnhGtb2sYvLRd7SJOU42RjhGqXjzdqjtJEto2o7aVt1Y4p8oyu1
 WC1p0zQ4yTRpNk6WpPxvejaPe6JNpoKc2X9cA5JczbLyCbK1hddoZF2Tzq1yB6Abs6
 nuRujNYkn8H47Y351+/5e/9fUSLwU6f2Xb0uAB/c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.178.88]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MjS9I-1pCngm2DEY-00ku2x; Sun, 11
 Sep 2022 20:18:34 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Cc: deller@gmx.de,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 08/12] linux-user/hppa: Set TASK_UNMAPPED_BASE to
 0xfa000000 for hppa arch
Date: Sun, 11 Sep 2022 20:18:26 +0200
Message-Id: <20220911181830.15851-9-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911181830.15851-1-deller@gmx.de>
References: <20220911181830.15851-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:H2dp5pajeCCYJA/AFKO5UL6waakRPRAWdN3MNlSSXdbbTOATrHt
 ct/x7ENH9g6+mKHl3hMPuWZ4KIUlI2fjXe1t6gzt0tLYJei6fg3fDFRNgfJaLrfV050n9UI
 ElSWUuTkFmQGspkZKg/2iCbwCsiOxBGWrqBA1+qnQLXAwvhPtcjI58Xyw5OiIrvO+PB58cF
 acuNdm28QXJB9cFWNCEjw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7Y2BTDE0Rrc=:Nj1monD1ddcx7WnXYZKxKQ
 Sy3qawhtduAHXtbWAGTAF+I6aIwWNipPgtWs/dsL3xWzK4MX+3CDHVT5QnpYkSKyhX/NgYymi
 dDu/0TxmP5He3JOeXCNsiBX+tT72fUm327hH+ua1mJOjxktItmUd+D9DZBOdONUwGSRNFGpSG
 bgxIVdFSUgXoieSiPrapmN8T44RFqFoGVy0C393HemPvYkBtWR74jzjXvxZYuKz+8jd7lC8g/
 acVYiHljxyFcbWrpyRiZT+MfWhV2Zv2fOOt5ockNkGn/JhYmBQKewr2Zs+dN08AZcR1BD2v+a
 4VPBkM8j0xcIR5areFzTyAmtbRV7XS1eaV371PWEZ1mfTz+rfX6EuUm6uzDfwc9rcKIMt0Utj
 5750qGvHnVh8YHhEEgg9nvFaaut4m9Tn6+BRHygKuDHLQqxT860zIqLpviymw3MzhJgqY6OLI
 UXbq4OykNwXPHComMieB1h8udtISzcp19J3C457E6s6yBscMYMnx6kdUSL2b7y1xEMuUDlC8p
 MwU8IXDUfJXvulh05LSgFc9Apz3cnTu343Cj4ogHxu7N2S+N48nZ94SpPaPIEQqMb09nlmOtn
 mVfLZ0U1oHB/iO1h04peJk2zlT7CljYCs7p8FM/AVT9TTHEwAc6luAaSzEaGH2vNpNKsnT1gv
 noRhOMK80/G+Xm2qMQ+bVk/chKWmFY5pFXXzroH3jKd24HoTBHr3O9yzUcgAjeI5UiWyd3imV
 F3HtHELkDrt7PQzHtiXOw8JiOAHR/Vl7I5qd9+C6Twc0w1EqmT39XjHU9JbtIgorr0/G+dUP5
 sBlKfPIk3EJj4+9+udcr1BZXjTUH1uNImYAIvGuQ9Kfv20INIz7bn9n3FtVHhp9NalL5feExF
 /JoQw5tJh2uhbx041fdpFuxUxwuxTFFlouCe+z0uKhtvdkRwqClolYOvCpc0uInLSrav7zAop
 Cj8U4s3VRdHwlz7886PNHhQ7KTotYv+OVPsFXPrO+Pgx5dijy5UaP+7+NgviAnNioLrtVmaHW
 vwXXtQX0RyrRH1/0n6tNI58vkV1REmGQuGAG/VMp6VYrCTyX2Hwws/DJjPuwajWRtiwYZTBeO
 Ttof3sN6gSYFI3yGI1Wv9e5VkcGVWGrHAlsDW6Zjn5V0yLepQYsujWnrponDkhZI+fsNi4aoh
 WpC7L1qJDpMrSVziUn49NCs4Hf
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
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
2.37.2


