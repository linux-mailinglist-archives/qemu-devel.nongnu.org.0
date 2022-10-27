Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3656460F058
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:33:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwQr-00041a-En; Thu, 27 Oct 2022 02:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1onwQk-0003ah-Ck
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:31:55 -0400
Received: from mout.gmx.net ([212.227.17.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1onwQi-0002Su-7Z
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:31:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1666852305; bh=ICbMXheNHq45v9RQNSYXaSxgo29J4VK3ICo55TCDGwc=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=bMql6H5rtcs/pE0YI/nxMfJtvL9jVwLEpW85fRLAww3F0PmxORfjh/vhkvEiyMCFM
 wGMGdRDWdlHHsUs8qW9N+C+Q3HSJ2e/5JkOhIJaVSP1DP4lhbQPG7NF7vsqiq4mSHA
 WdyPaMu6zXPJ5SdmIQaKZAn5aEhz4vQN0nSICPh1iQk1iKxy7m0neZwWWUCNFh03L+
 VuB50/qWPlkVObgjzEn14eiYFzTKlA6qQsf+dmEHVHtyWXmTnyd7irf4I340wXLt+d
 iq/aEpUscaQ4F/4pkd4G1cAx0X8uvIMHklrd+hLAWOFEmqatONCg/yfpdpbyhhTOOk
 zoXkhcrdZoXYA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.164.228]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJmGP-1oUUfY3Fbl-00K7mg; Thu, 27
 Oct 2022 08:31:45 +0200
Date: Thu, 27 Oct 2022 08:31:44 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH] target/hppa: Fix fid instruction emulation
Message-ID: <Y1ol0OCotNwb6ccV@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:2cBptxlB2WQUT+baxDPz4gWefQEUFCSFJn6qlkTjjKEPIgUe4WB
 PKJmwv6skNYOc0TZ1cesLws/iTbc4X5KnyB1hZRCvvpfz1oDvcRIss+SjQbhfGeLGGooJZE
 R8hWg4TS+wtirNxtzMVVawKl9qVc9R360gLcGvKViK7Jwm6ZdZimIu2ZZWhKmqH0C3grCf1
 0UNyMLyqzF6dfxJKq/Uaw==
UI-OutboundReport: notjunk:1;M01:P0:0cNq2mtFntQ=;J9pXy+6ccOAjOKuZ7cnlujI1wpo
 hv+ZI67LIQVQFSBU+dHl/3eLjdCzG+Evxdjud7kCGjqHPFxsmPBodMEZ5ZzjVYjaC8ZFoUwjo
 gWZpcp2NXh7hyP6LpGadqaHjG9ZU8yKA7L1yrPvFxvRSI2vuV543Gb+NZBhUHu3BogBZdeRxA
 hwkvMNKArgI2waf/Kkyh9bGdd9KolorMaldfI+QEyM0M6DXHkaj18TCG0YCh8Cq6Xe9SmltHi
 MbRVAJSONricRUv6sHuGaCxzdyw0yroVAIIFxomsmeKG/Xt2BuzNxQ369S/9kPGUTmTVgMJWd
 Ec7MrBg/QeEe125wN68Q9mmPpgT17TQMYqffjH1ACWaggQT3CrHxdT8igUmMGbkQnhzg/iw36
 5v4XT8T04P80X9klj8+MYVaTyZHLfOupN+u7z1xnuD+U90kig4tjTdRIBTxv6XpCGgMO89/nN
 1OT3ApReDs5LFUBNfQ3UUYIjCY35ghH/+xkdfRQ8tKGz37sFB5p/cQfwYFVPijCtlqX1kbJ/D
 1bqUQjqlURdR4IPV5qXpVt3Ws3dcicQJ11C2NmJRWsX7znGxu0qKOHWVLwjrOhZWC2LpEDppl
 kquoU9aCMYAqChJ8WmfW1WvuG0urbbFdlF52itza68X6DKS/FJoL+6fpZYAHrd8D3/TjlxZv8
 rsh4MrNXac4ZbFquDG2x0vjzjOR5fbSarIesUN5uzwWS2jJ+iyUtldf15TZv21iXFyWHraggU
 hgBgzZvmvsssKXTOFdXfEZi9N1nbOGtkhqyrQ6/Isw7V0LsnfNVoPLq2/EnJ3DWV7siUJVG27
 YHoVz09bl5qMvG9e6SD0c+ofdRHln0Wr1cLJRNf2/XjYiV+pP9U9UEtzYebNiBoLB51ILlXwc
 k3Js8ht8TSwzPETUT9P5va6S2CV8lutnZQRBmGmF5LYNdA9V41lMEq1LuYTnKYdTvZgx1fdN4
 YKn8WiggMIKCLirCvGj6ytCuYbc=
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
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
would return.

Signed-off-by: Helge Deller <deller@gmx.de>

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
index d15b9e27c7..845c00fc4a 100644
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
+    save_frd(0, tcg_const_i64(0x13080000000000)); /* PA8700 (PCX-W2) */
+#else
+    save_frd(0, tcg_const_i64(0x0f080000000000)); /* PA7300LC (PCX-L2) */
+#endif
+    return nullify_end(ctx);
+}
+
 static bool trans_fcpy_f(DisasContext *ctx, arg_fclass01 *a)
 {
     return do_fop_wew(ctx, a->t, a->r, gen_fcpy_f);

