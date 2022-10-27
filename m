Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3846260FEDF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:09:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6Hp-00032c-5A; Thu, 27 Oct 2022 13:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oo6Hj-0002yu-NW
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:03:16 -0400
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oo6Hg-0004tT-MF
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1666890187; bh=tIEcQFFvZfoKgcfG5mO9ClGZoBFUGWrex+xMZo75rF8=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=MsX/3chOs9mOPO3mq9FasBqP7HkOkHU9Pk5LMJKpyTWFLJDL1VixZBkt/nHEnE/u1
 2V9fG6J7ePXFeDWc0eZHpLgGshslnAdAXhQjhYRVbuh7KA6R9rbL4NCpv3MEiqwCbp
 L164EmPM/QWW8NZVJUnl7PhbR3q7TcjYdw3hAd5aAygRxkjXY5qsPTPpUjOuq7Pnzq
 bmOl2CzrJ/JPnmmAiOGvSbaNSnizA+RhG2GpNvQX4uaC3s1oHgLMXayB3rF/3qBFU1
 kalBpfJ6YcDfo39aRhIohducBjPrDei8dKTw770V9rze5kRde2poVVb+Z/xmPomBRY
 hpAbCP6Wwmc7g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.164.228]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ml6m4-1pUoxq42FY-00lRpV; Thu, 27
 Oct 2022 19:03:07 +0200
Date: Thu, 27 Oct 2022 19:03:05 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: [PATCH v2] target/hppa: Fix fid instruction emulation
Message-ID: <Y1q5ye59TmjfojwZ@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:sQdPPsaRMK03WDCQON1LOiF28mPjpGda6SBxXEg73STxFWOrmqj
 h+hLhHp0f52j6Z9ugwGdToM5F96dkKCX2LL9QUFfOXlyO7gwrvQYLef1CvePuG5idBQEIc9
 AQQ6BCtP+B7RCjevYd2QSRseIvLOt7Vkx04L9OXSS45m5LQhwBQPMveaeX/0zz7fcQDnEIC
 PRtQJq/Z/ORfIB7YnWABA==
UI-OutboundReport: notjunk:1;M01:P0:1BFMCkA8FzM=;lA5CkyS0KPjuidc6CeBL34xcsoo
 z9M+I1f8nVIkhS3X5dFmMgb6Vpl8RO/lVLvsiYek5cqJsd0rGWFaEZyL/sbDjbJL6FK0DMr76
 nGSqG7/lNwETBNUxi3tutqvZu01OSuskeRIV9G7Ei3D2H3rBg3OxNJxfo9fYCbkXWsQJxyP0Z
 FBHYOCvZoPlvk+id2gYG7c+5HrRF6GPYoEQTuq/xep75vnZeUk3E+VOlh7+9bH76kqHNdBRqg
 pSvDr/2w0AFEX5kQJPEfmF4cEvTO+swExbYI8U1WNzg6o8uJXQ2wcPqL2rssIjkNykUh7rzDK
 LM0i3FFajO8ZQpcb6G40B8vOSEbnJutPrMaIomDa4Fvc/bgOVzjOLVcaCSwiH0X2NZOH3y9d9
 aE5Zewz/fSyOCaZYA9BqJbKXEqtiOaByLTHvnGnt2+gVSYf+crBWipIq5AWmW8l7QS6YuzOG/
 2cRnvu65IuI1YwZoYMQbdfN1UkfeaKq1KL0OmZXJ0yYrsP/LUw4TCbzhXSfWj5BqqZKEQbMRA
 LYOeEEnzDWRKRQGlOBgArbtQHPFdu1mOAunvOzth+gOuYSXUmneqB1IEaHeP6M3c947l8PyLV
 KIZZKG+TUASFMeHUsnS6tfm6WR2zBfDfPTzz0l7w+RNwStPken0fJn/EM7/xuIyOs0EKh0zrv
 godQ4HgdWVGrDozUwGgSJwLD2Grx+hhQCU6Xdnp5mGX++dNX6NlWIWDK2RVX1s41cXgMbICML
 TSMjxDcN4gr6kP8Ez3wD+s1AH4QEjiKhc/s09UO8HrX7QgCpsi/Rkmc4IcYiJS/RHFXv22JdH
 /n2az6e9utLnzclH7+GwEqBE9a7nFIcQMxaxXxT45WRSN1yF00GBebO/ZO0MEeXbht9XjWd7K
 M5lyzZp4+o7KbkpTm0aA3uxacKXcLjn8M3eLy/AuWPWHGxpUZCX0ELTF0KDcXvlvEkAbHSrOl
 aWxM80MxzNZxFVG9uKqg/2ePQWU=
Content-Transfer-Encoding: quoted-printable
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The fid instruction (Floating-Point Identify) puts the FPU model and
revision into the Status Register. Since those values shouldn't be 0,
store values there which a PCX-L2 (for 32-bit) or a PCX-W2 (for 64-bit)
would return. Noticed while trying to install MPE/iX.

Signed-off-by: Helge Deller <deller@gmx.de>

=2D--
v2: Add ULL to integer constants, enhanced commit message.

diff --git a/target/hppa/insns.decode b/target/hppa/insns.decode
index c7a7e997f9..3ba5f9885a 100644
=2D-- a/target/hppa/insns.decode
+++ b/target/hppa/insns.decode
@@ -388,10 +388,8 @@ fmpyfadd_d      101110 rm1:5 rm2:5 ... 0 1 ..0 0 0 ne=
g:1 t:5    ra3=3D%rc32

 # Floating point class 0

-# FID.  With r =3D t =3D 0, which via fcpy puts 0 into fr0.
-# This is machine/revision =3D 0, which is reserved for simulator.
-fcpy_f          001100 00000 00000 00000 000000 00000   \
-                &fclass01 r=3D0 t=3D0
+# FID.  Basically like fcpy with r =3D t =3D 0. Puts machine/revision int=
o fr0.
+fid_f           001100 00000 00000 000 00 000000 00000

 fcpy_f          001100 ..... ..... 010 00 ...... .....  @f0c_0
 fabs_f          001100 ..... ..... 011 00 ...... .....  @f0c_0
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index d15b9e27c7..981f8ee03d 100644
=2D-- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -3622,6 +3622,17 @@ static void gen_fcpy_f(TCGv_i32 dst, TCGv_env unuse=
d, TCGv_i32 src)
     tcg_gen_mov_i32(dst, src);
 }

+static bool trans_fid_f(DisasContext *ctx, arg_fid_f *a)
+{
+    nullify_over(ctx);
+#if TARGET_REGISTER_BITS =3D=3D 64
+    save_frd(0, tcg_const_i64(0x13080000000000ULL)); /* PA8700 (PCX-W2) *=
/
+#else
+    save_frd(0, tcg_const_i64(0x0f080000000000ULL)); /* PA7300LC (PCX-L2)=
 */
+#endif
+    return nullify_end(ctx);
+}
+
 static bool trans_fcpy_f(DisasContext *ctx, arg_fclass01 *a)
 {
     return do_fop_wew(ctx, a->t, a->r, gen_fcpy_f);

