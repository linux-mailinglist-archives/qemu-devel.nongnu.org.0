Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0CD6D399B
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:58:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1wV-0006mN-8i; Sun, 02 Apr 2023 13:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wG-0006l2-Lc
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:26 -0400
Received: from mout.web.de ([212.227.17.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wF-00042m-0s
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680458179; i=lukasstraub2@web.de;
 bh=E/gR4Jf5Nf3Qa1UNaMPS2dXFHp11a7smLFb8Et5TmiU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=uqvEMOj+HZ9k/Zc08yxrqXqX41w92j1epAKIqU/LXKR8jegdc92aPt+S6eu6Z7iqw
 nVitkb5N/rbaoedXaZTIfxHf5Pn9WIPEv5RLJVmVSAVexhJw5YSvgjOT8s4rAtXF7+
 tPKDni3ePtDxbKayC4aV4PEu9NLftsSYTfTOt0qSr1UMR1T5SP3rpuiQ+OmK7A+iGK
 g2z90p2UKBi5O7oD+Youfr6fO/su86lCllFmYeS273micFReE0uGpI0+nZEVSc+EGE
 7V+pmbu50ikNMYyChlJ5/mJ8h4zaOaats4Mna54ADuwsXe3X+l4SZbLLJJ7B+KpE8B
 rRgctce9+0ciQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mw9xG-1qaixD0DVE-00sHy5; Sun, 02
 Apr 2023 19:56:19 +0200
Date: Sun, 2 Apr 2023 17:56:17 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 05/14] ram.c: Call update_compress_thread_counts from
 compress_send_queued_data
Message-ID: <3b5bd7f0d654e6409dfbc993d323292a845ff811.1680457764.git.lukasstraub2@web.de>
In-Reply-To: <cover.1680457764.git.lukasstraub2@web.de>
References: <cover.1680457764.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZoFaiSZlrmguVT8gL35/U0S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:EbPxqyUDacwnk2hQi58XP7lJUg0rouj4hcvES+yX0OofNJNiLrZ
 um1BDvY9plai14YDz5k4YMOeVAjiEjw3uEuDOgKyBoe6X2qnzxarEFGrAa/aEWm6r4inrzs
 JrXvNXr3+LsW0FKAC4DI00QAlfTzwf9e+NohhGZefHqTacwps8bX1QlOIZ5nPpx0hL1iwyr
 2OYm2T7NgnOm2F7EkCLvA==
UI-OutboundReport: notjunk:1;M01:P0:xgqyU1G0AVI=;5H3fSMP4bAJ7XYZKmDJBCsxz0fA
 RlAo7s77bRg3Mwj0B7+6verq26jXZ96kcnBO+7IEyZTNtw3QtR5xzsaH5CfdvNiKkKChyQxsr
 b2ezFRm+rEVx7mmqYWDHwIsWEiF2/kK46dpK/wGlcuKzfU6aZfcepD+6YsSMSOZZ42Q0EOs6A
 qxzgelPBYDOrrquC5NEhGtcy/nGR1xunZJ0I5acxQAEjlZOcoRrMMOTUCEf3zlYBaCPYEvohN
 TF8XMGGYfxztscuCrMBHw5bFnvbXVs/xSszk1J6NOr2MrqOvHmyDQYaFH0I0AnTDwJbmUOLJq
 cQ6JXI3Hz5YL4GWJGFmqaIfB4xQyZBT33vv7mS8O4joy4o65OUrMGIV//IpFmCSE6pSy4ygly
 jH0HG9VkC6n83trSUaoLU+HjAX9hws2P7IQhrkUhQyQTifWj5ccVOJ12d+HGfL4FcnZoqp/ho
 0DkdddIp5Cbc/vyOnEIBx5AjOvVtVc9+tFXHV2wKOTD6y8iyne/GOaMAfMiK2VvD3ZaJtyS2T
 w1uErO101rq6fZfTJ3MvsP5Xk21GGjAv4ZNZ/nmbNgvv76umFMTPltQu+hEghvzao6nUUlUFt
 oXI3/c/czWYGT2GmEvyLEUHM/eYy1Kr9eY6OXSNcLyuDU+QxFHCTqV5uPO9bHALVh7VwMkaqc
 gA6RGC5qPHv29ODRjqC7zS5qdPi7dxtk3dqfrSZTYu8ml7/FRSug47K2bMuFRw7XSHTHwSVLW
 iher9dHlDWD18u88cDIAVS8OrfFs7EX4FZ/xNiO1OumZ6o16loPYtd9ZVkVNTNwBGNUMxHydv
 s17tfqqN3BPxevB9TMIaOTbCGF4Bf3pNH/kF9Bes+xxF52uf3Ktcn69n5ihLxsKQZ5hgGEtdc
 XbbkzoKL7xUhkP60Bn74mbNcPARJCgC+zTjDWEPKGY1nX5exxv5BE6XApwE625NVgu24abx4R
 VkDZgV8EkHJK1aNFU3CGYBTOMfA=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

--Sig_/ZoFaiSZlrmguVT8gL35/U0S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This makes the core compress code more independend from ram.c.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7ab008145b..f55eb0e587 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1551,12 +1551,14 @@ static int send_queued_data(CompressParam *param)
         abort();
     }

+    update_compress_thread_counts(param, len);
+
     return len;
 }

 static void flush_compressed_data(RAMState *rs)
 {
-    int idx, len, thread_count;
+    int idx, thread_count;

     if (!save_page_use_compression(rs)) {
         return;
@@ -1575,15 +1577,8 @@ static void flush_compressed_data(RAMState *rs)
         qemu_mutex_lock(&comp_param[idx].mutex);
         if (!comp_param[idx].quit) {
             CompressParam *param =3D &comp_param[idx];
-            len =3D send_queued_data(param);
+            send_queued_data(param);
             compress_reset_result(param);
-
-            /*
-             * it's safe to fetch zero_page without holding comp_done_lock
-             * as there is no further request submitted to the thread,
-             * i.e, the thread should be waiting for a request at this poi=
nt.
-             */
-            update_compress_thread_counts(param, len);
         }
         qemu_mutex_unlock(&comp_param[idx].mutex);
     }
@@ -1599,7 +1594,7 @@ static inline void set_compress_params(CompressParam =
*param, RAMBlock *block,

 static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t off=
set)
 {
-    int idx, thread_count, bytes_xmit =3D -1, pages =3D -1;
+    int idx, thread_count, pages =3D -1;
     bool wait =3D migrate_compress_wait_thread();

     thread_count =3D migrate_compress_threads();
@@ -1610,11 +1605,10 @@ retry:
             CompressParam *param =3D &comp_param[idx];
             qemu_mutex_lock(&param->mutex);
             param->done =3D false;
-            bytes_xmit =3D send_queued_data(param);
+            send_queued_data(param);
             compress_reset_result(param);
             set_compress_params(param, block, offset);

-            update_compress_thread_counts(param, bytes_xmit);
             qemu_cond_signal(&param->cond);
             qemu_mutex_unlock(&param->mutex);
             pages =3D 1;
--
2.30.2


--Sig_/ZoFaiSZlrmguVT8gL35/U0S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpwcIACgkQNasLKJxd
slhOSQ/+JzeCgyTFZx0He3JstajBCPNh9WAasVAbGanW79dqDacvNy/eka3tFbiQ
00iTHiDj5roV35iFmHfELmXHKvkIQR3HKuX+o3MO8PEsc8qOuCZdqFmi7arCSoi4
yC2Jw5EdjTKb6RxtxpUCYMsIhWVPUMgeFzOxEQMYDJ3GLQyzdH3F9Yyk58GL2bmd
s0Co+buf15j4/KULDio2R4mLqgZklIAMeBSezW/MLr7GaR/HeAMKbIbrK5a3L+Rx
MpiUJgXwox6ZKrhVVDnW4hx3aTurnv2vd9HrPGSA9T3TF/T74J/l8RNvmBFwFAPq
RaPbWeORDFwBKDKInmse+4dHo/+Ot6MtqixyZOfCXc44rwMbJdxSrIfE6fzzoHsL
FXcpioLKrO52rhJrLpQkMnmJup0GI8rTcDiyaX0xfIecwfJv2MNcXmbz6GHDiQvL
GDb/iqPyrwYB7DX0YhM0rYLlNG0pC1Po1Rb7Zkgdboflgx5OBE5Eh2WAXJm34pb+
e+9+MudFABG4+hAz62TxQbmpSHWFKXU8eP5SIOL5aHnzNhTjtTo0C74SfyKEt6iH
wOK04cewnCCQkKMYAgYHY7jDUBMtgGzbtSGL+XVspngWeQ6KsC9w3jLc6JbaWZtZ
aQivfe7MpMkXxLuLTKhbYesKUA/tys4/4TQbYMeEovCp/n81+Wg=
=pIZI
-----END PGP SIGNATURE-----

--Sig_/ZoFaiSZlrmguVT8gL35/U0S--

