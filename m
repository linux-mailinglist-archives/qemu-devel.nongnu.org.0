Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC913C3F5A
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:01:08 +0200 (CEST)
Received: from localhost ([::1]:36126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gZX-0005bY-9b
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2gUd-0006p8-VW; Sun, 11 Jul 2021 16:56:04 -0400
Received: from mout.web.de ([212.227.17.12]:42337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2gUc-00056A-3m; Sun, 11 Jul 2021 16:56:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626036949;
 bh=mmt3HbfkTVy5HTBlhSqrOQDBD0vuxo3OiXHbwdj2bJ4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=OFGQU+YOCOH7mbTh6rvkmHudI8TXGJC06mqn35kFc7fnef+24a3Ms8tyGlrtOB7dh
 C1+cDXTQnitfbW+uhPn/pzv2AI+DlkltU06aCaKb4HvHe7aB8b8Ypm7wlQpj4jwny/
 QWrsgE2tB9O8C0m7oQA1HVaEMXZ0StpQ4ZTG6Y1A=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.236]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MXHOz-1lhSqW1tEz-00WBt6; Sun, 11
 Jul 2021 22:55:49 +0200
Date: Sun, 11 Jul 2021 22:55:46 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v4 2/4] replication: Reduce usage of s->hidden_disk and
 s->secondary_disk
Message-ID: <dcf77c296d0c9335effc82cb0fc22b65e5eda593.1626036515.git.lukasstraub2@web.de>
In-Reply-To: <cover.1626036515.git.lukasstraub2@web.de>
References: <cover.1626036515.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IwRTz8Xu7K3Gy=Bg4knhtz8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:ngMQiIXqLt+05Yh8mSpHQdoT5y7eV9ZfM64lFn3Te6Ncsxfh0d9
 QNEcXtjpd7USdAk2AkMD11AKvywso2Tmnddsm7zWLFqBqupDmGD4ZvsZK0TDfRfG/ADS1l6
 A/XltXDS1hvXnsSGi3tZyQOMwXpKt+nMD5Ua1jsTiPPaLTSB56gpsTKVhQosY1l//Rhx9Hm
 8tVwMHqBcJa+7foIGxsog==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xtzbft4ZQpo=:L8JoqDzOEjEwyhQr3t4BYb
 40WanGBK4PHYsGyWKnxGgq2J9a7XRQIn96BOhFtbzRCOjll1/EL0XhWDitkcaDwIoPY82AuQW
 D+3FB95hL/JhtivbnrWAX2bh0IgT379l8z0nHg1wCalnVpQRnmkFPaeFU2AhM/wM8rZY8c4Ab
 TEO987n67zIKGn5UCFL3rPRat2JIFZVxScFgZeSumVBhGOBinLTEtRnOWLV8qr70JpTdT6Snx
 FKLx1VxjOwNy4LAiGXRbdwip7Nvod5tuNf2swtNDkr37fJqDvXHUuQMgVvpfDZrZ/YOmkJlAy
 nuQvxSItq4wSuKbJ4dBugESjw7SjnYM+MeKptUj4W+PMQ3+jOyFFM9DCm8X6jbihRqLP1kzK+
 Gb2yGTAvi/zPG+H/GW1Tql5oGm7mlX+sDDwdLtdEm1AFT1JeMW4Ph+AGk+34/jmTWNNurBxjp
 Cb79cyFIe2p4iBv+s4ZUGGuOxX6qHZ8gUG9pqkMYHdKNH6qNZqM0nX6qUGMTu2nG4rCrwJxMm
 esdZbLc0mhDFtrJi54tjov6mWLe51g/mzCjlaxu8DLwxSi46ysFjcIGI+tWQfssIUMOjg3CVL
 NgHwkQCFY+5sBCKgTgBUPns6uvnfI9TPJHREGNL60+IJdanDKWNJetiNPoLFGUl79p6e8FFl4
 Kw4vmRecn2sFSjw4eDXmpPc2ARGt/S2K5F0wSNX1/qvalw5uD7R+FgqX0uCr7tDYgn5D0Yvjt
 64rmGCReRCBGmC7dUHC5mZTnNTmkj0WXNGyPJYjEYwlgaB2D0HQ+7In0j75WZf5HSCWNBISGm
 3SKnXXcxEJoOSirR2XerOLAYfyUAZkDNyg3UxLjTudQXWbe9qNOGz3Wj2P6dmPoIkWnRwDW7Y
 ekQeo84FUbz2H+mVCgSCHi+iRGQa5k21LjGMgFeoHpo5QkylNV4FqppbbbJ1q/5tjc5GAC1ke
 ny+zwSTTMCvPF5TfevjpO/ToZ+WpiaEXnNys3Zd9rvU/uM67J68vwvTf0Uisiji8QtGh0OALr
 gXzGk18MD4csDtC3yflt0y2Tvt6H6jp5B5deq2VJoby8Uf51g0f/McuUPI5D+1hfPhGCUrGnw
 JkH2ObAayeOyikpkT7DaPvlNjMtZDO/f2qT
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/IwRTz8Xu7K3Gy=Bg4knhtz8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

In preparation for the next patch, initialize s->hidden_disk and
s->secondary_disk later and replace access to them with local variables
in the places where they aren't initialized yet.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/replication.c | 45 ++++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index 9ad2dfdc69..25bbdf5d4b 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -366,27 +366,35 @@ static void reopen_backing_file(BlockDriverState *bs,=
 bool writable,
                                 Error **errp)
 {
     BDRVReplicationState *s =3D bs->opaque;
+    BdrvChild *hidden_disk, *secondary_disk;
     BlockReopenQueue *reopen_queue =3D NULL;

+    /*
+     * s->hidden_disk and s->secondary_disk may not be set yet, as they wi=
ll
+     * only be set after the children are writable.
+     */
+    hidden_disk =3D bs->file->bs->backing;
+    secondary_disk =3D hidden_disk->bs->backing;
+
     if (writable) {
-        s->orig_hidden_read_only =3D bdrv_is_read_only(s->hidden_disk->bs);
-        s->orig_secondary_read_only =3D bdrv_is_read_only(s->secondary_dis=
k->bs);
+        s->orig_hidden_read_only =3D bdrv_is_read_only(hidden_disk->bs);
+        s->orig_secondary_read_only =3D bdrv_is_read_only(secondary_disk->=
bs);
     }

-    bdrv_subtree_drained_begin(s->hidden_disk->bs);
-    bdrv_subtree_drained_begin(s->secondary_disk->bs);
+    bdrv_subtree_drained_begin(hidden_disk->bs);
+    bdrv_subtree_drained_begin(secondary_disk->bs);

     if (s->orig_hidden_read_only) {
         QDict *opts =3D qdict_new();
         qdict_put_bool(opts, BDRV_OPT_READ_ONLY, !writable);
-        reopen_queue =3D bdrv_reopen_queue(reopen_queue, s->hidden_disk->b=
s,
+        reopen_queue =3D bdrv_reopen_queue(reopen_queue, hidden_disk->bs,
                                          opts, true);
     }

     if (s->orig_secondary_read_only) {
         QDict *opts =3D qdict_new();
         qdict_put_bool(opts, BDRV_OPT_READ_ONLY, !writable);
-        reopen_queue =3D bdrv_reopen_queue(reopen_queue, s->secondary_disk=
->bs,
+        reopen_queue =3D bdrv_reopen_queue(reopen_queue, secondary_disk->b=
s,
                                          opts, true);
     }

@@ -401,8 +409,8 @@ static void reopen_backing_file(BlockDriverState *bs, b=
ool writable,
         }
     }

-    bdrv_subtree_drained_end(s->hidden_disk->bs);
-    bdrv_subtree_drained_end(s->secondary_disk->bs);
+    bdrv_subtree_drained_end(hidden_disk->bs);
+    bdrv_subtree_drained_end(secondary_disk->bs);
 }

 static void backup_job_cleanup(BlockDriverState *bs)
@@ -459,7 +467,7 @@ static void replication_start(ReplicationState *rs, Rep=
licationMode mode,
     BlockDriverState *bs =3D rs->opaque;
     BDRVReplicationState *s;
     BlockDriverState *top_bs;
-    BdrvChild *active_disk;
+    BdrvChild *active_disk, *hidden_disk, *secondary_disk;
     int64_t active_length, hidden_length, disk_length;
     AioContext *aio_context;
     Error *local_err =3D NULL;
@@ -504,15 +512,15 @@ static void replication_start(ReplicationState *rs, R=
eplicationMode mode,
             return;
         }

-        s->hidden_disk =3D active_disk->bs->backing;
-        if (!s->hidden_disk->bs || !s->hidden_disk->bs->backing) {
+        hidden_disk =3D active_disk->bs->backing;
+        if (!hidden_disk->bs || !hidden_disk->bs->backing) {
             error_setg(errp, "Hidden disk doesn't have backing file");
             aio_context_release(aio_context);
             return;
         }

-        s->secondary_disk =3D s->hidden_disk->bs->backing;
-        if (!s->secondary_disk->bs || !bdrv_has_blk(s->secondary_disk->bs)=
) {
+        secondary_disk =3D hidden_disk->bs->backing;
+        if (!secondary_disk->bs || !bdrv_has_blk(secondary_disk->bs)) {
             error_setg(errp, "The secondary disk doesn't have block backen=
d");
             aio_context_release(aio_context);
             return;
@@ -520,8 +528,8 @@ static void replication_start(ReplicationState *rs, Rep=
licationMode mode,

         /* verify the length */
         active_length =3D bdrv_getlength(active_disk->bs);
-        hidden_length =3D bdrv_getlength(s->hidden_disk->bs);
-        disk_length =3D bdrv_getlength(s->secondary_disk->bs);
+        hidden_length =3D bdrv_getlength(hidden_disk->bs);
+        disk_length =3D bdrv_getlength(secondary_disk->bs);
         if (active_length < 0 || hidden_length < 0 || disk_length < 0 ||
             active_length !=3D hidden_length || hidden_length !=3D disk_le=
ngth) {
             error_setg(errp, "Active disk, hidden disk, secondary disk's l=
ength"
@@ -531,10 +539,10 @@ static void replication_start(ReplicationState *rs, R=
eplicationMode mode,
         }

         /* Must be true, or the bdrv_getlength() calls would have failed */
-        assert(active_disk->bs->drv && s->hidden_disk->bs->drv);
+        assert(active_disk->bs->drv && hidden_disk->bs->drv);

         if (!active_disk->bs->drv->bdrv_make_empty ||
-            !s->hidden_disk->bs->drv->bdrv_make_empty) {
+            !hidden_disk->bs->drv->bdrv_make_empty) {
             error_setg(errp,
                        "Active disk or hidden disk doesn't support make_em=
pty");
             aio_context_release(aio_context);
@@ -549,6 +557,9 @@ static void replication_start(ReplicationState *rs, Rep=
licationMode mode,
             return;
         }

+        s->hidden_disk =3D hidden_disk;
+        s->secondary_disk =3D secondary_disk;
+
         /* start backup job now */
         error_setg(&s->blocker,
                    "Block device is in use by internal backup job");
--
2.20.1


--Sig_/IwRTz8Xu7K3Gy=Bg4knhtz8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDrWtMACgkQNasLKJxd
sljDdg/+PzmK588wDCPQUG8qkPeyOvaVtL9NeJDPXFM1EwPO+qI8xvDnexVsNbQw
XlB74H9W21+BMjHl86jVtqTKc0QPO03Bj96yATjP/mHI89AYE+elnW5iHLmFOFXh
icKunkKZ1KMoj8d6+6oqsnmrTekEXDNZQnEcl23KiBP4pDHGuz1KD3h8XqxNjEeT
lD2rgxm1vnwM+CEtNWWWg2HSSWW6QXzKvlR6NakIyitN52EC2zi3dR4erNaDSDat
Y7fHx4vlo8ckMb/ILINQ8H67NIrL+IQo1p9uKA7kMqiYswF73Ld/G2JWrtFxaU84
J49YOuIFHxnV0MV9DNgjOD3Grw7AFRNYH2lF99jg8TTznw9OZ5iZ1vHQuhgn3KiF
61lrpsY5vJ/4CROKQxJ+WM6AVzFnM0EShiYYUeQQxdVid7ulSE3TdhV/MXpEulxP
6uf9kHqmpssaObqyvtYUQpHD0hsD7k5f7aRKIy9eoyRRt4Nw9lvjU9SZp5feySYQ
UV4staxsb1CQUwahNTnZYGB6uatBi05+FSKctVLZlIhRCOgJZL1Hh0BjBBJq/BMx
BwurOTnuwOVRmEoAWvnoiJgBUC502U5u2YxMX64kKUcUeIJh3H1kl0kEPlJ36D6u
JYpST72sUcpJq6KiMG/78ORUcuZmxaRKPkJ1JCXrb84Ys/Vi27g=
=twHq
-----END PGP SIGNATURE-----

--Sig_/IwRTz8Xu7K3Gy=Bg4knhtz8--

