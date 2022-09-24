Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD5C5E8BEB
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 13:52:44 +0200 (CEST)
Received: from localhost ([::1]:49996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc3i5-0001b3-Vl
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 07:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc3as-0004Kj-CH
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 07:45:14 -0400
Received: from mout.gmx.net ([212.227.15.19]:45065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc3an-0003Qz-1c
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 07:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664019905;
 bh=oS0kxEt+F0E35jkxOGn6ha6sD9LlgtX+JRCZyYDzpiA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=aX/T2H1ILKgTFqavzugpoNmiMuwLolfZUX8e0dhIVNdiswcQ29xpihKFo6kz9CjSE
 /USSUgWtpXKYmWqPPTV43+Jjr+uR4rFw2tK4L6PU/wr8inf3gULkESoDvO6o0an9+M
 uXJEMgbun0abI1haAZcckAKcwJSsV0z94Bs//fUw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.155.187]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYvcA-1opAbg3SwC-00UseE; Sat, 24
 Sep 2022 13:45:04 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 4/7] linux-user/hppa: Drop stack guard page on hppa target
Date: Sat, 24 Sep 2022 13:44:58 +0200
Message-Id: <20220924114501.21767-5-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220924114501.21767-1-deller@gmx.de>
References: <20220924114501.21767-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yVQSzZ/ST5tvwbbdjx8o2XAYic+f0oBu6Z+BYdqf9N9iFvhFgIw
 ND/34MWOP4j+ZUd7UX3z5/nong3ih2hjSPUMt0qJCjeBHKEUAyQPC7ixd3xe29X7NNRPOWO
 U8UxIFmvf7y2EigMnv5F5sQnsHdsDwKPjFOhzMcCLq95HcBrpa/MlG3xdBvGViI47F9+tFS
 uy/seOpTDiZYhWrvqMSqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BbTprprmKr0=:lVPJjfZtUGvFjX120Edefw
 ZSFsBMGkMrdcFaov0SvBCj91E/8VGZDJDi3ge0w/LzAHEPOUAUkKbhTOB05QdUCjLGG8WgJBB
 YCzB4N/zhnZnAngU73XzUusgj3sc203KAAlgVt4Ay6DAXrtqAXVZK5M9aXsBMVRa5VO4TRlxy
 rxw4dNeuGk06T/7vBFkVdasMldR288BR4IoK3tn56vnNjOJdrhu4SPENkm6XbOuFGmxrPEpir
 TUEww4G4rislJDnCnTe2XPUomZDCYhT0D8kHRDq6nzkCoOKy3d7wwtKmsLO1PRwLyJ/Dvp3G5
 aRX9Xy7ajlDxquYAuwBvsMEAmhKs+gipt5vXeyZ7KrQBFx1WLq8rbFd0c3TH16q0HQgA2d9C2
 +y0NMIJnmplSV8RQXEIqjypBMqsUTBXsd4ytS1ZqGG7C2WsBWldGsYap10JbOZpk1poYT94Oz
 aT6KdJh16sgeeuUbjNrd7tMPhtDQZisI66MT05OV7rgFNRBaqKBE8K5YZ+h1zj4OOdz7L9tUH
 FrIqrVcP7+LKVpw75+5jVxR8WY5buPBoPoCawHY70O283qrq2D7kgXrhlnVhJfstnEOxBBusM
 /WT3jP4EogXtZRRB5VPInSxlCzP3lO+0bs/o0rP1FXhwKvpaXSW68MzApkdRhq24RaUlp3SSj
 SM4FPDB8Tet+Yjzz4kNCfT7fld6AuZNbOU+BMoKdisRYzNQP4aPofAoiawt+Ha13tD+UoOXeg
 L8mi6Eqo/aNjaxISMl/mvkoTfBnWKBjdLL7qm7Um3i1kd0AWwQOzYHJSIZB8GduM3EMhPoQ9C
 La4qs21945ZbEuDqPJD2FAO/R6O1tmD4aM23AOGSxMQhS9lJU0SYKUsD6evcFea1Y9gCC8tYi
 dolQ+tNazbqxXz7XGUzkZ5PaPiKwcGdKJDt8DM81ZuYiXGSOsQQ3ld1UClhY8FH52kkdzsPPE
 9AHAruklxTFaZqIcAoV544vXjRDSWZTxV+czBJVybMdTg28EVmRjYpRS8NVJtxouFBiZIMtdJ
 u5IE24Gesj5gd9b/1Ylp3H1ofRzJM+Tj4okw33ZAMgQi9V2eg3H0KpqmOZ66ODaI0JNevkW+/
 4mb+ZeEXbHJmkV5OHxpQ7NW3pXZGiAM6aPMid3CiY2JRlQ3S/is/Z+yTEFNheupyPDirmFkJK
 aCZ00qWb7ybMM3vjzzzs9bbgll
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
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

The stack-overflow check when building the "grep" debian package fails
on the debian hppa target. Reason is, that the guard page at the top
of the stack (which is added by qemu) prevents the fault handler in the
grep program to properly detect the stack overflow.

The Linux kernel on a physical machine doesn't install a guard page
either, so drop it and as such fix the build of "grep".

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/elfload.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index ce902dbd56..51ec5dd668 100644
=2D-- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2033,9 +2033,15 @@ static abi_ulong setup_arg_pages(struct linux_binpr=
m *bprm,
     if (size < STACK_LOWER_LIMIT) {
         size =3D STACK_LOWER_LIMIT;
     }
-    guard =3D TARGET_PAGE_SIZE;
-    if (guard < qemu_real_host_page_size()) {
-        guard =3D qemu_real_host_page_size();
+
+    if (STACK_GROWS_DOWN) {
+        guard =3D TARGET_PAGE_SIZE;
+        if (guard < qemu_real_host_page_size()) {
+            guard =3D qemu_real_host_page_size();
+        }
+    } else {
+        /* no guard page for hppa target where stack grows upwards. */
+        guard =3D 0;
     }

     error =3D target_mmap(0, size + guard, PROT_READ | PROT_WRITE,
@@ -2051,7 +2057,6 @@ static abi_ulong setup_arg_pages(struct linux_binprm=
 *bprm,
         info->stack_limit =3D error + guard;
         return info->stack_limit + size - sizeof(void *);
     } else {
-        target_mprotect(error + size, guard, PROT_NONE);
         info->stack_limit =3D error + size;
         return error;
     }
=2D-
2.37.3


