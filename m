Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5EB3C5B9A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 13:57:58 +0200 (CEST)
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2uZR-0005Ld-GG
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 07:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2uVw-00009x-U6; Mon, 12 Jul 2021 07:54:20 -0400
Received: from mout.web.de ([212.227.17.12]:50417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2uVu-0005sk-Uv; Mon, 12 Jul 2021 07:54:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626090843;
 bh=aY3Mw3hwsf/JlGVdZQgu/Xo23JhYBMtJ8fU+3Y4C52o=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=JGTeAOjFxyEQhyH2qNn+m6mG5ULG5XuaP1Ve/CwJXvlPyoN9NjAHjdzfMmvDYO1tj
 CTpftEKQqFlh2q3uYA2l3X94xLjTFG8XtbXzdEp8//K6BFucX91WWEdPj0QiVKXsTs
 uN9aqQ9gGDCH+w7brLcImwE1EJttJQrF40Eskr7A=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.76]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M28WJ-1m0yZ82SRV-002Y8d; Mon, 12
 Jul 2021 13:54:03 +0200
Date: Mon, 12 Jul 2021 13:54:01 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v5 2/5] replication: Reduce usage of s->hidden_disk and
 s->secondary_disk
Message-ID: <dcf77c296d0c9335effc82cb0fc22b65e5eda593.1626090553.git.lukasstraub2@web.de>
In-Reply-To: <cover.1626090553.git.lukasstraub2@web.de>
References: <cover.1626090553.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bVlCT.=9durZQY4dY2r3RCn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:aTD/jUkY9HIl09Fy3RdWJBgW9gT+cUK1u9XRCubmwJdS8qkuRDc
 4EX3IYm1swi0PGkU3fFqK3lKdpnvwy6a5LJUv6J9jVQNMV1E9IkkBOm4BySHvg361JgZIOY
 XSE9qZK55rZ3WKObBHxEVArW/uDunVjWbt0nS2kU1d2uIdYsWQiDVETaz+V22d8i/EQE12o
 OhlrdtuN/CoLbqrxopkJw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1xRWH4pzFXk=:yMA+6uj8utghZ3Yf6Y2OqV
 SlYdKuJZ4e+tXDhqTp8IHDqG43KjBrg090m103vjNLO7iLnHp9RGoktHOfDynKoNwu/FfkeJs
 IxlxlTXpffgvpd22S5CfoHPs+KVWO+wstfhTFtrfuwj4dtlczF/mBrT7u9SplDmQsyoz1NxCg
 lDjtmXAwEFpCIULSriBeidz5oDDOfe0SMFxwOoy6CvoE1eQIwFLOKm+G9/mqlsTHKb7OGMSmu
 6okszG8+CPMWGh+ytGfTp+nasL2PrNpML4zzTOV1I2tIkoo0Emh/IgOiePhzcxXjmwg30ETvy
 LOHCdc6QTJSqJdgH46C3XXJgG5sRr5imh9FGHlxh2zTt7MtwWr5QUOFb0D7WiS26Awu9oaFAi
 vHqBnH8gK2yU0FZlZJZrNsjKj997DWUMl+Oga24/rXoZk5sXTVhTzsfr9U4Dj7/37hQTV2K0+
 iu3VlwG43CKmzSMlEaygj9t2MhJPSpnKnq+1xE7+PWwI1OlK4Vv9yTK0tigITsDZ06ZxzVX6b
 ntGLg0174TXQFDmm1EsQaoe8vLv0xExZASi3madc78UEN/JNt4dqgCTa0XLG9skih+aSV5tt2
 h6Ok4mHyFA0PT7QQxrK478yWA0jKMeUZ4ufN/bekv3Kj6c8IIvgFakZu2NfJFICYwPgleqg3F
 mzKPRfl6fY7nWMtp3iTM9W2acqdQvWhQ7BoBP9nws1LUkChaifgdmTsHpRxn78oA6z8azBffH
 nm65KcgpS/NS4DBKBu7RNa3tR7aZCbk1eMGZbthpK+G6sl5IfBIX1j0IoiPvj594yRmRUaof3
 T35W21mqPAJW5OL0Vj2OwwCJNedBjgwG8BS8NxYpw1Eiv2PrWLzN+EcqCfHf0PMqsisIu3sZa
 Qsb4FPUl/DezK8T1+Yt5QIaxuQEswQ3q1VJGjWG3oHztghDXj8ab5ZRTqc8pmn9lEdWGiSsxF
 fubly06RKtB7v8P4TkoqX5OvTnDIIaPEnsfJM687eKLn3Wce6qp7VYHmMl7LNq4+9y2uuFE1f
 K6opPuGtARuVdesrNplJ0TZW7luONAAfXx+FjjNP68UHc41rEyxNTmE9IdnFuZdevcFpmPlxA
 PN0/ZW0maJA66JKu2ZYChE9EdgrVw9E0Fr4
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

--Sig_/bVlCT.=9durZQY4dY2r3RCn
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


--Sig_/bVlCT.=9durZQY4dY2r3RCn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDsLVkACgkQNasLKJxd
slhEFQ//WDDiTUWaWZ37znziHyt5Cd9CdbZ21Ks35LS96QAH4a9WTyOisdA0T4rE
68N1BshAWVgiPexaz7GbQP6SxLWRNlWbEDjLMbROF/o0xOvxy8cB4k991QE1BkHD
WLxWCYku72luWHfjUyLrzsPVwmPTQxJw347dk1hYnQuZ4z5VSqeyCQqPvI58/6dX
bVmcfm5YzaS/RB9HYLKC8lymtCXMiOvT4hHHvajTg3WnCFhKRqXXwY4QpEopeB3W
WVRKOVAixF5KoW2bg9UTl1KGgc3tAwEnVTgos1Xv2V07CXsJp7G1bL0LrtbwYbc/
M7rM5Qwbw/PqMW7jV20UAPvvPAzMoAv0d2E+t3s5GXAL0T2JSVOq6lq32Qmk26AD
Ak3RL1OAdkEwuvUmkLZPlPD+o47aQldBs/zyx6jCVRRloTdOaCHPILUpZd8zfQtP
tDCwHTWeRPrjsFnyWsNOsUcp+CBZWWHbsSRKTiHWfQhYGEOn35qBMovHbhACFVZv
B7AnOHZbALH6Ijm22zu9+NJ7wYZT9Q7NTxiricdow7XjIfy7ABUPphiYbcUqQCcz
/gCD2a/dOpb2Hd6Vp1im8ahm+i3k4xLoThlU1K2RoJqglnF1YaewiQjYzxH8SxQ1
Qw8N9bs4X8zBPsXRlK4V0TJ87LAplm+McOw3H/11JiI3x14cKFo=
=le0I
-----END PGP SIGNATURE-----

--Sig_/bVlCT.=9durZQY4dY2r3RCn--

