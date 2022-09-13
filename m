Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218205B7AB7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 21:23:03 +0200 (CEST)
Received: from localhost ([::1]:59120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYBUs-0003aA-9S
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 15:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLn-0008L1-CX
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:39 -0400
Received: from mout.gmx.net ([212.227.17.21]:37159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLf-0007el-U8
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663096405;
 bh=hdJ42ybplqITg2E5Kl2mdXF9WOlHmOsWF08yplJbwKI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Y7GzL4QfaV042fe9rYRK76eVq56cT/nepqwkZOmmytH0Gtwi9r+/XN3oSEIJYqsif
 XIJwVyHQyFCygmT0FjC+DqqFdjfBvaHvDmtNMhFkQiSicZQhm8PifyCC3/1DN8b921
 AIgZcXrq5eP+daBx/rLurPxjbbBnWWjEitSN3rxY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.190.164]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mgeo8-1pEvgP0Hoy-00h5Ez; Tue, 13
 Sep 2022 21:13:25 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PULL 07/12] linux-user: Fix strace of chmod() if mode == 0
Date: Tue, 13 Sep 2022 21:13:16 +0200
Message-Id: <20220913191321.96747-8-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913191321.96747-1-deller@gmx.de>
References: <20220913191321.96747-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1Olp6EPYRrYCix8ILN0lr1tUUp1lH/Fj3F8S3Sbk5PrllI4YCl7
 BU3HASEskRJ/ONgiit41DVWe2cykqkZUdtLa4yLBoef8iWXpRnBgfEeo7ozr36GEEPDFUzU
 Ig6ZiQEfh4ySeQKbevg4y7FRT9wWpNNf5VCKR5bJ6CeX6zmqpWcRFbSfQD5+iC5THz8KJ4m
 bKgai5ILEL1Xe6qAuMolQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fgUxVMeBU+M=:tCuWD9Gi9AJUMPKORkOVa8
 L6/zCVbF1E2J+vmbIJkU+9CALsg57/no2LgRqjkXLzH7OkaDva/V/lmdfDUAUQGnMxFSGP27W
 lHqVhlp7XoZxZwBzvAxOBfeeMH0lxx3Mt64sAO8TjZLMIpJpdKDf44N9sT4HXQS5sidn1BNkL
 yaZP7RxYbczcEe5lSzmUXyz0OlQdxIhpU803lTLgG/T/ts/fcwhUFWb1bsDVNQ2fxJopDP2dd
 szyRPfQecjyPEyiadCBAKwhH3AbRhasVnmaKminBkoscGnVJt8Lk5WA3RMwlEifCEeP18pSht
 DtVk4zqv759G7xwEc/NAAt5PxDVoeynSapOMmosLeaeec9oYIsCUWtUfbVERnUpkulb5AH8Zo
 5uOh3XM9Wf30VorF7ShoXr+PRZ8mswuTpWQVGo9nQ8DphoVCfooGsCsR6gGDqGD4qKuhpN/zm
 JeISENvYPEtmdyciL4PoTDtm9zN/G9UFWYnhBp8HCGF2AWXsyVtH1MYaFJNrTXGqSpoazpyb2
 yhiqP4cAS+qrzTLGPhF35swPH8BlTa7lRzs2/oiNtmt+0AND8xF5Mn+cNqSk2w4Zr3muEIRTG
 9FJAVIV7KLK+9F2rLq1EqAlxL8jUmjPOCxVlFYZDI6MHvMAbPguuNn+o1nilXvgggUMhP80gB
 3ObbI3G/YF0rgZe8B6UHnns8jx2goftcfeWrSAKJ4rbullU1lKCjMvd3vxR5NgvaN4eHMzCtw
 9UWlLa+58kbCuRSGT4Urn7Z9p0LjyoF4+5ClnMx/nxHLWiol63eZ8RFMHMbb5qFUNYbfohR5W
 CHA1qM7t+LF9YNHyR9nFJ/LHSE5lqhsWc80omyio1yIQd6jvTQKqxYXdX/3y6jWVi2yN7OKrT
 QPEdHv4a3K8x3DTbXZNshLZt0H40GK/egGmxWKeZssixbzD7Q6XZp66Mj0xQXP/w+FaF2IPcJ
 YlXmQAPcrWVDNNcKPgHNiTdGZ/FXhpdjSCCsxHS6+ERLxCbStombkgI/jzP+/WH2CMoH4rxi7
 n+ZsxcHGWVkwtmwzTMSP8IdkXr/WYAdcWDHgKenAqqHRcHxxXEjhIK01m+2N2CVNTad42jRhN
 +jywEI4BkI5XyMMk0OZHqHlGSzpg08GWDin2ajTKu/IfGWFQL0yWWpWG7IhkoNx0TsLqpe6aI
 8ziohsnzDcbrA1JgdjRJP6pxMz
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
index 5ac64df02b..2f539845bb 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1505,6 +1505,11 @@ print_file_mode(abi_long mode, int last)
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
2.37.2


