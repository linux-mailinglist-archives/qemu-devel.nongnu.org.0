Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D6C6128D2
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 08:34:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1op2ou-0002VY-ET; Sun, 30 Oct 2022 03:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1op2om-0002V9-3O
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 03:33:17 -0400
Received: from mout.gmx.net ([212.227.15.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1op2ok-00087G-3m
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 03:33:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1667115186; bh=CbipF0whJiyJgPq6INaGjmI7kn2Jx/c4DhYcHTdF+Yo=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=FAQSDzGB22xJKJRPVRIYieQ3rjtj0wJ1tXrYkqWeqKBqJO8u9kXpH6xZs+MSpL6Cl
 aaXsL6b9XThHL2vF+cGLJOHpqLuWLhmcVFqRWEVALruDDZqdXU6qu06zecauYwKcj5
 p8dfmnuVEoVEHa/sw/wLhcaIMAtgNdeUjFxpIsGTd7/+gYJrxwiNJxd/AodDDvIKYd
 5+ny8u2v8X8/upttppq/tHsPQPb0LuX+Vp2s1sSpxIBjUs2AHSMfz8IPbq8VPa84ev
 a5+OBbEUdHuwNp/QDBlZ1Pd+5B52ktNcefkJMRB+VoxevUotFEF4jkv3Z2BuJLjFIx
 oSojOn+gw0d9w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.163.166]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mqb1W-1pSlGs1yNs-00mXXe; Sun, 30
 Oct 2022 08:33:06 +0100
Date: Sun, 30 Oct 2022 08:33:04 +0100
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: [PATCH v3] target/hppa: Fix fid instruction emulation
Message-ID: <Y14osIjoP/gfNYm5@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:WFfHCC+0aVBeJvcruCO5PcQojp3HqBSeIl2Yw2JWn81fYRQe7Kf
 nfZD6UnQaVqok0OK9cd9u+uk07o4fw2nigzzQBPO2vJFG5KePonq8WIw3DJxz7EbfP2T9Zn
 pBrP58hZs1l732f69Z3fO4r0/Uy3sc2F5Mi3EXP9CeJv9dPX8qmZ5GLEURhZJr6RAruCw9r
 QlCHTlSMqUqjiLQ+EL58w==
UI-OutboundReport: notjunk:1;M01:P0:Q9moubMfgRM=;BjtiVX9OYVnVSzQUvJQ4uRpPaEf
 2QJZm6Q5Pmg1K4/ZrMMBK3pLz1rJzomEo3aN2599KIfX/qV9x1gArgUmt2jmpzxlB115IUYNy
 L/eDWI+vhiAWBl01aMMlu1lZyOIukaNfDMfDlkQ12yJdZU3aKjNSrZyU4n8gdL9JLz/jGVsB1
 VXGW3gtSZ5Yj+GCec2oXmv3kcu3of0NEbRMMoYYcS64G8lLcWIniYlDVyNy/+4d8y8iSPZBs9
 iyBRqTrD+PeMJIqjJWE6rP21cup74gYUdJJO8LsUd8+XkzPH6AuDeAysBW3WtDuOyzRq+3aMm
 hfE4P2lmo5KECyAlwxdn3gWBd9BLkNgOXnLEAfgGn37A2h2EuCnjoTmJFLdcUIWEyKYSMTSCM
 TPntGioHOTkkVfriJoGDItZf6b6wcCDz7VT6ifJg3G5TF1Jk/GPHTOhE7dRtvccW1U0mK1uma
 zid6igSNFFVG58XJv2Mq8k9b95fPHVgAwdEE589INS+FGuMsdVg6isb+LocJHE1+Fvwhw5q2E
 1r6ASES2DWf6gEDrBcj+5dqVgtjXJ0JuBNJHoKGkc2o70c1yQ+ZI3ZnIH1z/opdZcjYNdSUHF
 Zx1egUYjXoBRQdNrRmxcv9ZRWc2UBeDrBuwGirYaW5wiA8y+Y8wjjPGMKkTgk2MnbkAzh3Zq+
 jlGgNQfKZ3JbvviiWchURw4TcF1V7WR7oQNaosKpzq3b7CvfFCnam313oiA6c9sy6z7NK3Tqx
 VtaNknw+DI258vVppQm/lOMOGH8vw73atbbprD8YS+x78FiKLiGmV5wZzoh5KzU8vWSOYJtHA
 D5d3IhbtrbCPnVwQPQRyX2vUsi26Tl1WjBEYL0kl0bmpzWzzjI4GE4G8lJh88iCxtib04Vm60
 su3oV0kwSyMpsT0Q2quZ09ESSQLiTRWNCeJup/2/WaFUjMfDIg4QwaX0hjIl1Z6Wo8Er9JAYx
 geuOEqkA2aMfY9l5AWZznzrxZTM=
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

The fid instruction (Floating-Point Identify) puts the FPU model and
revision into the Status Register. Since those values shouldn't be 0,
store values there which a PCX-L2 (for 32-bit) or a PCX-W2 (for 64-bit)
would return. Noticed while trying to install MPE/iX.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
=2D--
v3: Removed whole FID comment in insns.decode
v2: Add ULL to integer constants, enhanced commit message.


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

