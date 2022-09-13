Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B81A5B7AB0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 21:19:46 +0200 (CEST)
Received: from localhost ([::1]:35116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYBRh-0005nz-OP
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 15:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLk-0008Db-Un
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:37 -0400
Received: from mout.gmx.net ([212.227.17.21]:35123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLf-0007ei-Px
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663096404;
 bh=gOzGCQ60hMjauReMswDRPOey73euwoUtnmC0Mkn8oTk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Y5WBszzskLyEdtDtsFwEajdo3ebxzwWaPlm1zNyF7u5Fhsksyd5YGUKcc7XTWHciv
 uF5c6pPv1OfJn2yxNHFudzuWHYXv+qBTspuaqIOnMsy42ssZZOFYIJGLDaFXtg+Yt0
 FwkwhSsl9kSc8szIhdkdeR17pAsz0iZHQ58o21WE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.190.164]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCKBm-1oPxt03C8Q-009Mmp; Tue, 13
 Sep 2022 21:13:24 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PULL 05/12] linux-user/hppa: Use EXCP_DUMP() to show enhanced debug
 info
Date: Tue, 13 Sep 2022 21:13:14 +0200
Message-Id: <20220913191321.96747-6-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913191321.96747-1-deller@gmx.de>
References: <20220913191321.96747-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KIYApavx8bNzzwOrKJriprdAOSyu43pvEjSsFucxyDJpiPGE0+F
 HXtWIkDxXtB6zjFQPHqWHgUjf9AJ2IHpYPG7wXRq7N4WhNX558+whPWtosDONmyIvk2odAr
 uXmywYzmL/B00l1qWEyuEYgATA3OCM1/fQzE4zq4IJ4ZkohXm2ThH9/qc6mA54F9BYNa/wc
 IDXGhSuBNM9p/0HU3DljQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PSZv3LTvJhc=:9e5HCpoIYJECnnsSAw3988
 TO3D8bpGk3R06ZldwdyFzLhvldEHvR2QdCFu8tFS6gu/auIv5qoOziD4Pd9JjOOPg2xFMK/m3
 XkCDmJkQ8sZaT6n2o67dXgsx+KpyuZnV0GNSioHB93s0GLYXBqnJqbLhY3byl4e9bb+Ur2jAc
 USLHTcHzdW0J2L8FAzz4NxdAUfuO4ZIMgn/AdNXUMDvztIaDUDGlon0R7jjfOdrZYeezi53D9
 2lNu8OKYrpjWskQg/WfLCb/NCo9VBw44IzOzS13mgznCiA7P2NI6gb7/XbiSi63jjGVjaCypi
 J/63AXHvSnKUDqqGkvf7hHjKfYq2v08r9kVwPFSYlV7bsHt0EzQwo0LlGMapMeLKa8Xoyr9oD
 yn7S464TD7TqNBr5B/hcwJrEZwAtZenRnQXAeWeVS8I0lG+rH5Olv6OsETbTp5jeOlgZo/Kk5
 1JWYF4Unc0+mARwC+w4RmBu2w5N/f7MC7axBOBcCGqdPovXnP5xrReGNZOgp+MR/g7sx0t5Qi
 HTQ7PTZbAEIFMPMtmCIQp02HAku4byA9cRnQKAvlkQl0XUZZAu30G/HLBb9sayZhAXGHhOOmK
 Lw4CrzuStfob+bMC2v7IaCKdV2TTTmKEnTzv6Bcaq82tbvgBczHOcFAYEc105aoxCpp2vldLZ
 PG/ZRPDXr+F89L9Fso78m1ruDK4aAkLC4nzQ79hnf3yFYaxGlOwGaQpoYmzQt0EFs+a6WY8T9
 3nipE0hC96wsCNdDismcX0JdgdPFGFvxXIviknEJ0I8Auod4mMPfEgA4wEARQYRK7Dvygj8ow
 K7z0eBUq9TDFuWrHain/tZbov+YJLLkbsrFAm8U92GOygyULmMK952ptj3ZzvL/hPFc1+5G6K
 ynZFIMPI1RtLygmHLANFLdHmcFDsJkX5oL7KmHB8fUAN9rWkbe5yQQBL1WaVKjF4aafYYFqyz
 Krepnj1L1ulrqZE8J3+chYCFg6x9AlXvVlE/iTJceg2YL5U4/kZWXSkAmyPFentkMD9DD9XYd
 Xn+5BJdugCg1U8OxgnUN7d4IJ0XkJU0PSlt3HJvpxZFpEJ/ydZ8n2f5bLnHFCp6yGAVSOVol3
 kap9fGjGQ0Tbsr1Tiy32AWR1aoPSg0d+6cDESLUhRibttUL4nrfYcugGA2uV48JFmN08SDELh
 8OtuzE3sxna2Ddd/SA3j7DgpeF
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

Enhance the hppa linux-user cpu_loop() to show more debugging info
on hard errors.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/hppa/cpu_loop.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 64263c3dc4..1ef3b46191 100644
=2D-- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -147,12 +147,15 @@ void cpu_loop(CPUHPPAState *env)
             force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, env->iaoq=
_f);
             break;
         case EXCP_ILL:
+            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", t=
rapnr);
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f=
);
             break;
         case EXCP_PRIV_OPR:
+            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", t=
rapnr);
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->iaoq_f=
);
             break;
         case EXCP_PRIV_REG:
+            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", t=
rapnr);
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVREG, env->iaoq_f=
);
             break;
         case EXCP_OVERFLOW:
@@ -171,7 +174,8 @@ void cpu_loop(CPUHPPAState *env)
             /* just indicate that signals should be handled asap */
             break;
         default:
-            g_assert_not_reached();
+            EXCP_DUMP(env, "qemu: unhandled CPU exception 0x%x - aborting=
\n", trapnr);
+            abort();
         }
         process_pending_signals(env);
     }
=2D-
2.37.2


