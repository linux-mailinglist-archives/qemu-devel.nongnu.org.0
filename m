Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732C6649921
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 08:02:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4coE-0002Bq-Bw; Mon, 12 Dec 2022 02:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p4co7-0002AC-Vw
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:00:59 -0500
Received: from mout.gmx.net ([212.227.15.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p4co5-0005rn-Jq
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670828447; bh=p0B55hDZ6iPP/bor3LBrzxxfGzPW1ikFpE21hNWWt1c=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=RTqwYWGe7U4ZOPqdXFuePpUKi5emglbJ/g8BnBTWkZkdXY58v78FC2rQ3i5KX81jI
 yvM0kLLuboBFZ7z7KNVBaxhMagiTVejPVRRPu9Q7xUEPYQPHOAG1rwx6D8M2IA8jLI
 0U8Be0MQwFP7VCD5/YOUEpQhZR62I6WtL6/zY1U1dyt/Oat4GJmwO+W0pPYRn6ZUkf
 nlFr+NjklupL+ePX/HQ6ejAkM5MO53lIZspSIgU0owtqqCsei9dPnLN9+J82ZcnR1g
 1qbCz/Lp6XXdj/o3EOcBfQcQXrVN+wjN/Lv1eEUnu1Pm2bJR9iJRw39JKKg4t6b7PY
 c1mtO5baqMmXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.137.92]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7iCW-1oqgl316n4-014je0; Mon, 12
 Dec 2022 08:00:47 +0100
Date: Mon, 12 Dec 2022 08:00:45 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Vitaly Buka <vitalybuka@google.com>, qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Add emulation for MADV_WIPEONFORK and
 MADV_KEEPONFORK in madvise()
Message-ID: <Y5bRnRaiSOUKRjdW@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:4hcwySHZHkELp7Pq4zMyIE0oieNZk2j5/y/cUYaF9jDnPe8ZxkL
 4yj6Hx7xG9pmRWhyDjtG20VpFsh8Yu4csm6YNbOv17dT9zgHEiK82oGCxituIMQKtRiQn7A
 w9mVtRN8k2qX3jHDLYcNi1Y2q9kZ260cwVQRJ9D/r3wriw5F9LsjHpzuN0Vd/XaNu01HaEZ
 VPlG8TH+MvC1E6kQ09xZw==
UI-OutboundReport: notjunk:1;M01:P0:ZxpX6EmLGXU=;/gnkvwTsWUdSETWzt+DTZH/Dni3
 O6sd1fyn+9QAZBvKJJ7d9JQTgehM91apPVY7JCooXyvRicGynzpj9P3lNitQYeeWVBqd8Ds66
 yIk/Xk6iNn7CT94G0/6iXBv085WG11pQvYyua1vyJhsmFr0EwQVdnFgC65qa606AQKo4MZZ0L
 e+otz/haWIJShtjoWDYX7o9CkX6UiR5H39GCpQuq+47xpFcMwwIYMuGYQxWsTZ8osXvFBsgQ/
 YdBVU2LYx1TgLGnG/jzKmooW/ILz6XJejvUzmTwZuuFcqOZEhoMdNaW/YN1zUuKAFgIPD1xz2
 tWucrPTRH9rBBuOuveEnDUFZUa2uuczbW4kGd91DAubMeeoRDvMJ8NO4sEkRHiFcTjYOFR9cL
 9qqVBx9jn9nRv6YAfBvrrkdvPIBREWRgIpk6PH8idsDh+C2pGJhOHQjzxGDnozwq049Sqe7TB
 4H5hfHSCryE2cKzt8M9mOqQHMZ0+sx0dzV9C93wWTL69dymOx3uHEqFFfZS+3psbDOEHnY/QQ
 +NwVIeYBULvUMzjOAMo/t8P1Of3gD+3pK3wLPz185O+uJVrdFm2PrO9uH+Xk3fLr1PfuKb9TU
 /A/kZFQgqwhmfrsa6FjAWatmgMTxzdj4/0wigCKLcWf8Ruxrej0XeVe/2lDSj0IoSXhURs7z5
 vxNA6aH1gbPeNcjlnN7E+A9jhuYDEVc+szv23XLfYXKdqiIUcMX1C/jdmrzoS/ij4zYy+vsYM
 MeHYEOx86o/qd9a/93IgYjOH1qCXtnoYOHbUDQux10gwLZQUNfmm0ke0Ho4MYLeehxGB8lDur
 B1Mh/dEOAoIpNTVzabj8pa+Uk3vzxLftQOCTNALiYGPs5SThZDkzROKwIblPZwCTOF4N9xuWb
 wWONyhJms97tH65T8jSNv2AODIHk7x+WPMdsPSBL1VnbRklQ6aVVKQQzorvsXOnKk9OYgT4iu
 DWY170pGQiPArQyDkM8Yy+b0HaM=
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Both parameters have a different value on the parisc platform, so first
translate the target value into a host value for usage in the native
madvise() syscall.

Those parameters are often used by security sensitive applications (e.g.
tor browser, boringssl, ...) which expect the call to return a proper
return code on failure, so return -EINVAL if qemu fails to forward the
syscall to the host OS.

Tested with testcase of tor browser when running hppa-linux guest on
x86-64 host.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 10f5079331..c75342108c 100644
=2D-- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -901,11 +901,25 @@ abi_long target_madvise(abi_ulong start, abi_ulong l=
en_in, int advice)
         return -TARGET_EINVAL;
     }

+    /* Translate for some architectures which have different MADV_xxx val=
ues */
+    switch (advice) {
+    case TARGET_MADV_DONTNEED:      /* alpha */
+        advice =3D MADV_DONTNEED;
+        break;
+    case TARGET_MADV_WIPEONFORK:    /* parisc */
+        advice =3D MADV_WIPEONFORK;
+        break;
+    case TARGET_MADV_KEEPONFORK:    /* parisc */
+        advice =3D MADV_KEEPONFORK;
+        break;
+    /* we do not care about the other MADV_xxx values yet */
+    }
+
     /*
      * A straight passthrough may not be safe because qemu sometimes turn=
s
      * private file-backed mappings into anonymous mappings.
      *
-     * This is a hint, so ignoring and returning success is ok.
+     * For MADV_DONTNEED, which is a hint, ignoring and returning success=
 is ok.
      *
      * This breaks MADV_DONTNEED, completely implementing which is quite
      * complicated. However, there is one low-hanging fruit: mappings tha=
t are
@@ -913,11 +927,17 @@ abi_long target_madvise(abi_ulong start, abi_ulong l=
en_in, int advice)
      * passthrough is safe, so do it.
      */
     mmap_lock();
-    if (advice =3D=3D TARGET_MADV_DONTNEED &&
-        can_passthrough_madv_dontneed(start, end)) {
-        ret =3D get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED=
));
-        if (ret =3D=3D 0) {
-            page_reset_target_data(start, start + len);
+    switch (advice) {
+    case MADV_WIPEONFORK:
+    case MADV_KEEPONFORK:
+        ret =3D -EINVAL;
+        /* fall through */
+    case MADV_DONTNEED:
+        if (can_passthrough_madv_dontneed(start, end)) {
+            ret =3D get_errno(madvise(g2h_untagged(start), len, advice));
+            if ((advice =3D=3D MADV_DONTNEED) && (ret =3D=3D 0)) {
+                page_reset_target_data(start, start + len);
+            }
         }
     }
     mmap_unlock();

