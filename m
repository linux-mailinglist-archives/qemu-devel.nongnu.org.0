Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76EF5A2A57
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:07:37 +0200 (CEST)
Received: from localhost ([::1]:48334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRavo-0007Ka-13
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAo-0000ee-TR
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:03 -0400
Received: from mout.gmx.net ([212.227.15.15]:56177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAk-000553-Rc
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661523535;
 bh=W/3O0t423mJ6phUG7vJJvRCtfA/7EJAlySBMTy/Tz34=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kOQY1mxv0ShrXUnmuOASKzz7o8Pvr2tMlJ9x5LYSy/Lzode5DcHe5ReCT6htoazru
 tnxkvoHuyTKIYoFR1Qn1h3vQsx9NXuHOlbgmefXlETDymi1WlsUY2wqW+Ht4HWKblm
 gpIHSoHc/AsH+OnAkV4wror2PPZnd7LP9IIvuy/U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.171.190]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7K3i-1oUrxb0OFQ-007hYE; Fri, 26
 Aug 2022 16:18:55 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 08/13] linux-user: Fix strace of chmod() if mode == 0
Date: Fri, 26 Aug 2022 16:18:48 +0200
Message-Id: <20220826141853.419564-9-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826141853.419564-1-deller@gmx.de>
References: <20220826141853.419564-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4LofVz4sy4ygbo1u9+BQFa+aZzayDzwcYzsgbB1B5SEZy223uYP
 yv50/zGcKhLmlemvrQ36ERC1kflGnfafduwkM7uGGkVgjFaN+1REnequFOuWia7wJgTEmhe
 yoB9+yP7p9TIHeGHzRe8Pudt/NTBaBBvOW2LTf7wwSJhLwgAMNkJ5qHL+I1aUItKTmpToHf
 UzCbigiSRiXpplYxA1PJw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PGuMhHM2BGw=:DGv59cq7mvDmRCDIAygBL9
 6Ond91Jjdc9EgxUZlTazc2UEcHeBCZZ3loPBkHToF8dMKnz6llqOZsvqvSXm+VV4tGh7b0gdb
 uBXt/NjjxZnFUCZ6Lm6FPLTnqyUOPURl53ajdGx6RZB63KzYpQTyqseFGJNe7qi2+v12ySJo2
 HiSChJSlxrP517WvIMzgI/3wr5KlOh1Hr30uk/VrhvCC/J7taCNkxF2nJs+1aTclCZ88NGIgK
 lzFs+8jhvRt3RKz+jlLwYlzqjN+l78CESqovfhlRnZrcVk6NwUBWczbxwUtc5KTkvLprr6vlR
 35k5ZHepqaZrCkUMbhOz3Y0k1LIFwt7qvhiSsn/wnZT3r9djeReRRC5LKhz7gfSnyCtVzAaZ0
 Jh5I5FIRI+88w+cOsdSY6pahrWOSD1+aK7OwSNy1tOj1/1/UYnSia16/emiYUxmzVT4Om017w
 k/fJHIopww4GHWKexlBDDZEu2f9pQThcinemTczJTWe6NoOISpVNTeL3acdS9jtyW1MDzYEQb
 ICcWRTwLFRrwCvA7MkNAsIvcm5EQ94+36/bTqoVoxs+HZtrM6793W5TOAUTfDihqgEQ2qOCXf
 5/e9FIqi1lH9/80Yu2EsYmY0f1oVqxEG4Qp6lpA5R8QA8MiA8flZbXOzGt3ksFDsci6QtutdU
 rA4MTTl6iYqbHgexLLmgK2zyMk/CCER11sI3YiowUgoafRoIucpkJqfRAsJtbPXQajme7hDjV
 AYdmcbS07s6HLYr+Qvuto3PeGwbY/YI3nAPXxr+KxnUpHpYO53f2NG1L/YyXCGVelmfDMYYRc
 ndoyMNElKiTK//dz0akKQ29WCfwstxy5R7WSMFyRdAdlSDA2VkSAo8RzzSaMHEelkzu1Zpo4H
 B7815rzt1E2fsclFnPyLJ02r4dfjURJ+6Y+5b8BHP/ZeZDLLWUPsLCUIa63+gPky/huzXImBj
 hIKyO3C/NQxmFlf/X79ZbUQCnlUZwJm0xKqDSPgW6fQGw5LlettFhBUmRNIM3rLkzhWuuPOGZ
 p5uCa53RERmbZwudzahcHyO1EVovczcAKgbz3DQfMGzAiITWYL2WEIAKb5tOg8sZvDC2A0q50
 j+nKANzfbZPwOBHX0slKk9ZOAxsQCmpnM8E6FkjktRCiDSeOQZqSFbW/w==
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

If the mode parameter of chmod() is zero, this value isn't shown
when stracing a program:
    chmod("filename",)
This patch fixes it up to show the zero-value as well:
    chmod("filename",000)

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 86b2034c81..d1afa0e12a 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1504,6 +1504,11 @@ print_file_mode(abi_long mode, int last)
     const char *sep =3D "";
     const struct flags *m;

+    if (mode =3D=3D 0) {
+        qemu_log("000%s", get_comma(last));
+        return;
+    }
+
     for (m =3D &mode_flags[0]; m->f_string !=3D NULL; m++) {
         if ((m->f_value & mode) =3D=3D m->f_value) {
             qemu_log("%s%s", m->f_string, sep);
=2D-
2.37.1


