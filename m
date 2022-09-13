Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9363A5B7ABC
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 21:28:17 +0200 (CEST)
Received: from localhost ([::1]:55504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYBZw-0001DR-RS
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 15:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLm-0008GG-3X
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:38 -0400
Received: from mout.gmx.net ([212.227.17.20]:60469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLf-0007f3-U0
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663096405;
 bh=Hpg5DACac3hGaxdzOdQRYHv676xvOkEBzGXsw79EJAw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=F3mrlhp4xXWytSo0R/GbONBCWYdFlzoDaRufg7BEr59gQFY8iNJSMc++WGLq5eWFC
 CRRvVV3II/Tm5vbip4cRaksz6EV0LmGIC4TG3p6FScoyMow4XfLD/oWkxRV9ZFWb2s
 nQML3XhRc+iHkC1uLo8TJCtrbMQBNx5yCE+IoTIQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.190.164]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MA7GM-1oSAoR31DO-00BZiF; Tue, 13
 Sep 2022 21:13:25 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PULL 11/12] linux-user: Add close_range() syscall
Date: Tue, 13 Sep 2022 21:13:20 +0200
Message-Id: <20220913191321.96747-12-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913191321.96747-1-deller@gmx.de>
References: <20220913191321.96747-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yZqzJWUuJWlYLSv+PAS+hUpF8SfCjiRVCI5p9O8gkvauuAahMfx
 Ez75XFP0TU3EhaxlE2Z3fzyyK6omf7F6/Sui0vDYYoGvdwmaTreqQwfuCRGXkV1SpeOHczt
 vtJG9DN+kLAJ2acPS239+pZiS64xmsCtPR3HPyoaXvqFSKY3PCxD8KXIYPVhV66y7W1msyj
 n5p5+u+YXzYhcU2GKB9LQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Hg7XGZbv5bk=:8vKugFQmh/+BHlP1G7Y3CX
 b5W9OE370syoQVTbsS9tOVUaDunpsQ5JMO0PieWuAYRjTGmWggGS8BbjSIn1bmDcovGoG994A
 2dbucIVQ2mU/Q4dAX+HnuzLKvaGXgjdmM/9cLOEoGKvIMV0hAMEHrBw9f2bQWur5Hz4ocoohW
 Uzf70usM2lFaIE14RUKrvllNc+TDri0VUvSWLUy9RnInK+t2PhULgAuSCQ2N2N/MlouriOK8Y
 4HQ4W4PjbfQbiQ2sTODe0jXIz+65AmKWjWEBrCnwVD+2fEM9ELiJt00bHHS96Wtwzs5EA+Y+3
 CFoTrtP8V9dGxz4Kla7p/6cS0ulCYtBhshIH6lQ+lNc0hwptGcqENVHemvGxgDSls8X2Ti+xm
 8/MKA32YMFPMvJKyQHXbETiCD7YZSrFFFiDkkMjKz2qk4FGP5qbdmi/Tqr4thzhqVIAhjZsZJ
 zUIQ+JM4AGa6ViPwQFJv2O6cLEo0JHS21Bos9OONkNt29zSjGPvtG+ineHG9C2D3sFnKhXPv+
 mrZ/ze/1pLMNsQLiNqTL3PnfK8Xppdilxgu51OvxsBRuLgtp2b3awYx2iXe5j+hpb7fvvtOOE
 IQ76ayt0gYp9aIL6N2PXlciZSCuxIEzYleHgg6GlsckxCWoWZJwlLwmPjl5teropR5+JaoEwb
 Ilzlsdvaodq0/r+7UWAW6kfHJoFifeNv7vHoG5McankTmBDOfjAbFVFT5o5etJhBZFpjk9vYw
 Yd0NUmr79RJ6OgeOUgk3YIYpaTs//Gpbg/HpSiNZSLktH7/X81ADIndsFu/6FvS6Uy5bu+8vS
 cBSuk7Uc5tAXNJT/SmSTiA8BL++VCGa0W2PM+D8U1v7Z9vou3oL4X78iBMuJRAq4L8XZv7pg5
 dnS69aKR4/tXrRCVkMHAmetqcA19Z5ZgzXLcOGRXq8nQfMDmzAjDAnIrvKskkOTSiYakZm5xn
 Gyt+ZcTK0EDvQ/Yp/gXKIOUrjY0RGfTyW6CTytyHF7Fbbbfs5Pf1ruFYjTPLRpLdNIkut4sRX
 WvAa0LbEo37yuLs/gQvRGRRtRH4tEvKR00CpTwMTXgi+aGHeOFEoam0Rc/khqOidrTKhRHPG8
 qTeva34SQGBTgxlAIcR2ij2Mey0kIORQ4Kyg1lws2OfNWaYpBzaOx2ghOES9Te0TodQuPnTms
 7wRw9aeA7qrCZwoy7fPpbwMENf
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
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

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.list |  3 +++
 linux-user/syscall.c   | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 215d971b2a..ad9ef94689 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -103,6 +103,9 @@
 #ifdef TARGET_NR_close
 { TARGET_NR_close, "close" , "%s(%d)", NULL, NULL },
 #endif
+#ifdef TARGET_NR_close_range
+{ TARGET_NR_close_range, "close_range" , "%s(%d,%d,%d)", NULL, NULL },
+#endif
 #ifdef TARGET_NR_connect
 { TARGET_NR_connect, "connect" , "%s(%d,%#x,%d)", NULL, NULL },
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index df018f0e32..e63025a5e3 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8721,6 +8721,18 @@ static abi_long do_syscall1(CPUArchState *cpu_env, =
int num, abi_long arg1,
     case TARGET_NR_close:
         fd_trans_unregister(arg1);
         return get_errno(close(arg1));
+#ifdef TARGET_NR_close_range
+    case TARGET_NR_close_range:
+        {
+            abi_long fd;
+            abi_long maxfd =3D (arg2 =3D=3D (abi_long)-1) ? target_fd_max=
 : arg2;
+
+            for (fd =3D arg1; fd <=3D maxfd; fd++) {
+                fd_trans_unregister(fd);
+            }
+        }
+        return get_errno(close_range(arg1, arg2, arg3));
+#endif

     case TARGET_NR_brk:
         return do_brk(arg1);
=2D-
2.37.2


