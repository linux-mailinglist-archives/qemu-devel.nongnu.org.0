Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796556E8E89
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:48:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQtu-0007Op-MK; Thu, 20 Apr 2023 05:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQtr-00079h-UP
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:23 -0400
Received: from mout.web.de ([212.227.15.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQtl-000848-C4
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681984091; i=lukasstraub2@web.de;
 bh=PE/+RPtZ58nDtwqM02B/f1sR/LpHOgbdvtCrUvSs5Vw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=BmkuCidWQO2uw8qgazUrnGxXpiJOMAJfhEXKFZhtnsqhlJgMpBz5QU0jR/IT8IZRU
 gL1nRJiV+qvX+AscZO/MOQBNcVkGcAUOn5DThBdhZ+AxXqhSIINRynHSIXL2HKJTKT
 g9tRAUFXxEDjm0ZpjLN8IdbdGZrvmu8UoRCn4jW39PPEuwru5OGJ8PiAX6FhZm+qK5
 BgLV7IeacFOVSns1/dnhvIceAP8OlVoGoodIhWtTW5K/wEAE8/i9gsjX8MR4MYBFAh
 4yNk4Kxsi2pSHLJp3sL6uRTreMnALUb4FAp1Aa2QcE7+0/lqOMWbLPLORXcYxPqaGY
 rP5ptt4SA0i6w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mt8kX-1q99hi2Em1-00tR9A; Thu, 20
 Apr 2023 11:48:11 +0200
Date: Thu, 20 Apr 2023 11:48:10 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 06/13] ram.c: Call update_compress_thread_counts from
 compress_send_queued_data
Message-ID: <d32e80847f7e809c0a905149e3a2745384fde98d.1681983401.git.lukasstraub2@web.de>
In-Reply-To: <cover.1681983401.git.lukasstraub2@web.de>
References: <cover.1681983401.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UrVxLMVCj9g+5EYApw70dko";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:RhZnjKHprqgazYTV1zVudc/4tkllovOkx3q1qgiyEjdmUJjXTf5
 uMQEyw2dzncdqqf/v8qvGow56P1U5j1VvQBa1IO9xqpyPYA/cG/XJyS68uzNfMMRkiUYA+r
 ETNwWETy9jkcdcuIpG1H3bW5YTagK//aBYKFswsoIm8i4Hno8ucH78Psy/I8D0Qwx4E3Knq
 5SSy2EOeXKeX4+Yoqn49A==
UI-OutboundReport: notjunk:1;M01:P0:GeJZdyX0q7Y=;XFgMhJqAyLPCy6w0meht5jSEi4W
 1DSa9RhsFxugh0BVEcjT82qydLG+et4x1JlaPxpQ96PL6RKdrs3R2nsQ1qj99gE3V+PUsY+xe
 TMoMW6NQBpi+ZXco2+A2v82CcMcJI7QNnJW/HITYznT80lWh2+7sSMJiZZsihSs2PfPJO0RaE
 4QBwUPUFGmmJ6gQe4eI5ZO5S0hdOeeBEl01e3vEbaJte1w09+OutMhWp7nz55++MIdVVa3sDc
 1sjtlHaGJxIR3krTiLwRLn00PMlmGCRAdRzkeLQipLrwIYKNE0KuCynHAhfVfwLfx7ps+kij4
 C1UdhK/IwUL2XYInT7VaUlVp1eUojR15gCdvKCwav9h8hLAJRmdavV7znGA4QqA/FDGt1PJTO
 C8MwFIve/p70hpNBRJzokYPYWVVY+tieu8qOVhhwkW2Gd/aZfWpjPAt5WMba065aEBVBUI1hc
 Yr5BxNEZrpB29pk2xPLhgG1WHZrXQHnkYjspKXv/IfgWSi1uo6IXfBSVeTnRfwU1jUOTLrMoL
 DcLr5fsLknKyWYdZ/hz9+trGtGDeBhnMTu6esatUcG5Nb3k3KerBhBotMBhbt1DTOWXRqeoBu
 p2gEA98u9DCmjFjgVIoYAv80HQxfWOrbOnolgdYiH4QxO3SuJL+SUVcLmS3H2TGRVQSut8RaS
 CyHw0A5Bu+VsqoR+xZDqyucnRdf6T7niND+DW07qNuGTP55TyviJqNL4cu253Z6lvRgD4B+Se
 QczWM/XmeQiYlOU1LuQRuX3OQ0oE9QixTVbfclqi9edYz5CcVvPaiVDp31X9qa2f87ln7rImw
 BtBKiMSy5XDShVZZ/lC1jn+pL4kCijHVq2E7ogi72LllJMtCsrMOR3ZhLHFyWLFy2K9jUdHL6
 a2w/bwvKK/Nx/HJCrj9RyGWcrNFqcuATfrM+GG9JUjdEMeUc5RUCU66HRFIGjjTQj/OAZQMCN
 kJ5QWrkDzXantKCp37PMRj/mB/I=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/UrVxLMVCj9g+5EYApw70dko
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This makes the core compress code more independend from ram.c.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index d248e1f062..3894d0ae79 100644
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
2.40.0


--Sig_/UrVxLMVCj9g+5EYApw70dko
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRBCloACgkQNasLKJxd
slhG8hAAr3Wcz8MwrTgcCcLx7DVeBtSEup65A+YirFw89XqtBXMKKvYzLoHG7Emd
+N+Nnb1lzV9QmCIFydBHOCtefXu7DOx4MTJr8C8ezEBzDr3EXx1h1vNKoN2UhUqk
Ci5C7b/ScUCCKBS1u9kLba/CZyoCJE6EOR5MaTOC4mFkcjv7v12I9dSjrGK/n74O
W8KIBT79CatCgQ9KjocCWyJxRLh9WRGdnt55XgFn5PXQbU4RfelHJbHkM/y3ldo0
cb1tw+obOa7Kxf6MpACGEGRlhfUReBexpdcVyh0OgvHD3GK0+G7ovezh3nyIPWzU
ZnHkF2OtaWgHHbJ3s5OnWqQJDaXeEYiFf0UdWCHRL0yD+Bd/cmvEqQ1YHjMKobKh
c8F1yFsLUvOLUdM83NtHQftT/dnXzPtOIEfOaTHPc6o7NsuSIcwsYKpLWOLJDiF+
ZFiGGOIaDxvMJRD81LLKOYWRVvzSPQKzAxcbd/Gi1tJG6h7vC2nl4DD6u0wi5IgJ
JQ1TjM/uGmHJxVHilvq5DMD7UQ1ZY4sXRHYBOmIAb2FqVLu2e1piYgjZd27CNCT+
s1xq4OuMmeOKKhCBpYbt1xew4+cedFlrwE/pu1mN6L0wwRZB3ySmsYw0Ra3LjwAW
YSJg7ryFss8prWxDhMUUi01ZCHQ4M6XdBERD6RWevuUDJB1Vr6k=
=bxif
-----END PGP SIGNATURE-----

--Sig_/UrVxLMVCj9g+5EYApw70dko--

