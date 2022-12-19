Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5078F65158E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 23:30:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Odi-00089J-48; Mon, 19 Dec 2022 17:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p7Odg-00088n-B0
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 17:29:40 -0500
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p7Ode-0007E3-IL
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 17:29:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671488976; bh=U8DC5Fd6BpgVxj/XU1DU03+aQGVtmjh4bK8voYGFtfk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=HElbOQ4uk9vXA1TZanJPY/FZuoi9KhOb8wfzcBvrr9eYCanFImPB6sqHisfw/N/CV
 5mQRRu+PHK2N3vbtuWEKBd0amNOk5n7gYD1PyeQNsDuQcukvmBhPdru2xQyfizmRd4
 jJbINVToWyjwVt8iMBRBpggKEtZtGcaiVHjUZxe/LxIFhlr7YnDgG369gTjPGbFHID
 VhVZhICtPjlB54ELbOooOEuPT2IT1wFpDr1VfehSsPJkZLqXt+xP6+rytZf12yYif5
 JlakDakqRxZzsfGSbis/IbLTJDMnpYOW1QHaY2TBYxYZeWsJleFtdrAxYCK+oM0pD0
 p5OW/Xk8UFQZA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.151.196]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXp9Y-1pNoVA1I9E-00Y6Ae; Mon, 19
 Dec 2022 23:29:36 +0100
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PULL 2/2] target/hppa: Fix fid instruction emulation
Date: Mon, 19 Dec 2022 23:29:35 +0100
Message-Id: <20221219222935.284704-3-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219222935.284704-1-deller@gmx.de>
References: <20221219222935.284704-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p20dXiVCopYrwaoFqtQEiUhlayW+0jXae5n3de9QVr70o7X2ybB
 AxiIsRmdKtm+GDSjvCMm8xaURYQnLZ7yxj7rLMYiIo74xHZ5q1Jg55AxUYt8fMk+DwWVkJs
 N6AMhcsGLdpMgtRSucy2sdzRgkCC+cga8qaBbjSfHcFACchbW3xMjOo3B0a1mvOnuIufYi4
 ZzP2JvNolEBkJh0gmMo5A==
UI-OutboundReport: notjunk:1;M01:P0:ZQVw3/5UfHQ=;sIp1jtXqcO/hB8f+z1FK11YjzOK
 79es0Vpj6OYh8dsYwC4vZ7xZNnB3TXMqStsKS0v/uPC6/q0ijD7gfdb5uT9NvGpXx+l3UUH6F
 MCUI2V1MNlvPn4fSKpgbcypqGMrTmJtysL0VM9+meocuf59ZnRk34DhMwufjH9yCcJZ40bKEx
 kpNsrOqepFnEskH449y9IOR0mA55bHYz8hiiG3N3nVXhNKCBFQKgpMG5hS8GPFpofLue6ByLr
 85nymi4auWeh9tZpzG2QrgBooWZ1xXAMF0qvpNP5ZTpRR452SyNRuxLpls+rVefHYdw7eB6jX
 e1LmrQoZXn9cLVg1tRyxj2qFfv4Cmkz0PIRptk6mFnlT07ZI6Vvp4DPXj5nSVxMw3hp2U+GGR
 sOKfonXYcNN/XPSMaUMofc1mxfYGl0rSKDnvBjvqd/ADDLcYlAJ+oHpr+H4kBA55YTcGEotmn
 QnX7HoaVhqzKtmqudh8Qo73zPsGGV4GnvX+bgQc8OG+d3qqqOr0zkPedYTouri49GJCXt6kiH
 ClbRV5mrlHn3Lah5vUjq4tBvAtTKadqzwNKmXODzPLa7BfyioTAtjLgBuPLjqv8sBKcpk9F3L
 t65CHB0HSWgTLIMDVqsvq42H/n9f3e2SK6BuQDicX8AGdvsfSEybA8nYfsxdUFyBOId12awoI
 UWIxRJpCwBgioydjkUYwJgaG4bLSJxrNABaQnYBxmwOFj2PguDrgeVKH8JJdzjD48pJvlm7T5
 29vplHQloI7ZQ4CNbZQTa4h6v+GJRyEAnBEUsxDKg0ukva1gsFF0dcE9Fprkj5bplH4RkYiSN
 chUtR5Pj/J7Eo8ubC46mOhD+8uqDXI+45i/mn17xme/0DcGxpOs5ztBOnXBgGZ2HFt+IFEeVF
 Tm1LhXO02vZw3W3CoL65mnNGT5UNvwYdAmZj2Kxg93CtyIMWQQg6lNH9dDUSFDp0wsO47R8Oz
 CSVQ3g==
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

The fid instruction (Floating-Point Identify) puts the FPU model and
revision into the Status Register. Since those values shouldn't be 0,
store values there which a PCX-L2 (for 32-bit) or a PCX-W2 (for 64-bit)
would return. Noticed while trying to install MPE/iX.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
=2D--
 target/hppa/insns.decode |  5 +----
 target/hppa/translate.c  | 11 +++++++++++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/hppa/insns.decode b/target/hppa/insns.decode
index c7a7e997f9..27341d27b2 100644
=2D-- a/target/hppa/insns.decode
+++ b/target/hppa/insns.decode
@@ -388,10 +388,7 @@ fmpyfadd_d      101110 rm1:5 rm2:5 ... 0 1 ..0 0 0 ne=
g:1 t:5    ra3=3D%rc32

 # Floating point class 0

-# FID.  With r =3D t =3D 0, which via fcpy puts 0 into fr0.
-# This is machine/revision =3D 0, which is reserved for simulator.
-fcpy_f          001100 00000 00000 00000 000000 00000   \
-                &fclass01 r=3D0 t=3D0
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
=2D-
2.38.1


