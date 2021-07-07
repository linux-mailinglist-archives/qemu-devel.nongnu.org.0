Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5DC3BEE2B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 20:18:16 +0200 (CEST)
Received: from localhost ([::1]:46638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1C7i-0007wZ-CV
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 14:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m1C5X-00056q-Hb; Wed, 07 Jul 2021 14:15:59 -0400
Received: from mout.web.de ([212.227.17.12]:33021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m1C5V-0004qe-OI; Wed, 07 Jul 2021 14:15:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1625681745;
 bh=z7lrDC5xLnEAIV2unpQs0bzHJemGMfXeo2L4v6OClWg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=AXHob9JkIZvYZnyyEtMU6GMHND9zhWc32RqB0Rp8FYwDu7WBBMumy6RhgbYYw/vav
 /DGv4KgD2MqJel1iEYAlTFtiwXPcmJG3m8x0a7UMyoHh3H75wMbEtXXPTg8rp9epGF
 HZeWKXX5Gi1hi3Om0ngrvXWGXeJCxnyhgaw4bFQA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.194]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M8Qtq-1lF9jX2DB4-00vu7Z; Wed, 07
 Jul 2021 20:15:45 +0200
Date: Wed, 7 Jul 2021 20:15:44 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v3 2/4] replication: Reduce usage of s->hidden_disk and
 s->secondary_disk
Message-ID: <55248d9609e35b5ec0625a770cc99c5d36a7326f.1625680555.git.lukasstraub2@web.de>
In-Reply-To: <cover.1625680555.git.lukasstraub2@web.de>
References: <cover.1625680555.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HQd0stZVGT0FW5Br/pTvs.t";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:W1crjgxwW/hOIFH+ZzKLFTsqjTIoWJ2wwKh6bbLy+G5LMaL1xoa
 yM7vyqEA2nHjnchsenkQhWjbdD4Y+yCmObIcS9QbQ97KwfRh0Jnx44JmgMDBxPnWUxc2Ttf
 5qxqAAdAD4Uslx7czVktofOICRHBkMr2aqrmxtCJMXOowYePz/zdgrkhPk3DK9MS6N5e14x
 WRz4g99BNk+ayn4pep68w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/OlDzypH+h0=:IeV7H3louI0wef2GC1dwIe
 EUzbNDaV3BN6bJ3ZtwUZzvqNyNhXKYBc8Azk7H+t8fmTqzuiBYe+S4yO8ls0WObrYkzni9G61
 RiVQOxsXxnMI5k0CSdMPpwzcl71H1AoxLqKOHWpHGYFihRImLOqqD8zXQHc/S8rf7IHiANZEx
 lmtgjjWwEFi5tQzscTeKwvxRSxcTB+SeuZojYZG7odFvyUTYixa8YkUThcVYdSVJoO3ZN/oTx
 8D0uyQ92UqFq57O9ThJTehhSJGPPP77OXZVlEM881wXEJN6tUVcxtqpN+zjz4pt8H1/daosXL
 hQcwL6zPtTTPdpKSuURh7+vV1kK23x2Ibwg84wpDYoFqUfWL495UoNTZeANX+upmuiyYYZdWB
 WqF+xQksGws9vnQ4lNayHKfk7ZsKzHk05YBsQhVL4lr3Jv5sw2HrjYMo/dWAZwqpb0YeLowU5
 9O2gSDgPSQ9cgb4JtzmQqiDo+2gE4FKftSWfN0TgZxXext3dOHtKuI+qkaL71QokkBGAkYuH+
 5pK+SAVJKWiolmIUYN/nH8JMAZ4gRrlsuQjKquX2iJRpZp6jt9WYCv1++oTeqQMyslKddxp24
 wTu1v1+n1CFkEuegbpfsjkBZsygjugb/IsC93S1OMcdOnmw7hfjaxJ3OPtkW0TLfcNMwc1xS7
 TVDkz9J4zkbZHmb0FQP8QuUAMUiIhglSfjRNwwzCGQs8xl/z8vZGIb/I3kcKlOx8ETaVzZ5cT
 FfAtzPfUgWO+vD0GozWbRQBjIQaebj1G9zu0TCdvCluKlPjR6iyggXWohEjgh8oxMta8glUA4
 Vd9JqomVglC2LzMfclE5nHvNtAz46LXxc9C/qy8BeNyxjSHVZBX2jpW+Amh2TgCM4Igwykz9Q
 +Z7b9GMZrB7ELncIJonmglEkAoMpTbHWWEisRFj1der7P0fA2crYRnf4krg/dkWICHi3IoIFb
 XTe8Mnyfi8RsdQ4yqpIof92+DkfZTUA0NVmQG0rfCVhhHsLjcE1Ju1h7ANRWIxrACJS0RQWzX
 TZm4HHir+TE6UL5u9Ks2hhpOZ3j0d8Dw7bGOZC4wknXgoOHl8gSiwIR9X2d/G3wGZhc6my56+
 7DWVtoD7YDfhRgxANvoCKUolH70FKuOwIur
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

--Sig_/HQd0stZVGT0FW5Br/pTvs.t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

In preparation for the next patch, initialize s->hidden_disk and
s->secondary_disk later and replace access to them with local variables
in the places where they aren't initialized yet.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 block/replication.c | 45 ++++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index 50940fbe33..74adf30f54 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -368,27 +368,35 @@ static void reopen_backing_file(BlockDriverState *bs,=
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

@@ -396,8 +404,8 @@ static void reopen_backing_file(BlockDriverState *bs, b=
ool writable,
         bdrv_reopen_multiple(reopen_queue, errp);
     }

-    bdrv_subtree_drained_end(s->hidden_disk->bs);
-    bdrv_subtree_drained_end(s->secondary_disk->bs);
+    bdrv_subtree_drained_end(hidden_disk->bs);
+    bdrv_subtree_drained_end(secondary_disk->bs);
 }

 static void backup_job_cleanup(BlockDriverState *bs)
@@ -454,7 +462,7 @@ static void replication_start(ReplicationState *rs, Rep=
licationMode mode,
     BlockDriverState *bs =3D rs->opaque;
     BDRVReplicationState *s;
     BlockDriverState *top_bs;
-    BdrvChild *active_disk;
+    BdrvChild *active_disk, *hidden_disk, *secondary_disk;
     int64_t active_length, hidden_length, disk_length;
     AioContext *aio_context;
     Error *local_err =3D NULL;
@@ -499,15 +507,15 @@ static void replication_start(ReplicationState *rs, R=
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
@@ -515,8 +523,8 @@ static void replication_start(ReplicationState *rs, Rep=
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
@@ -526,10 +534,10 @@ static void replication_start(ReplicationState *rs, R=
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
@@ -544,6 +552,9 @@ static void replication_start(ReplicationState *rs, Rep=
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


--Sig_/HQd0stZVGT0FW5Br/pTvs.t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDl71AACgkQNasLKJxd
slhIBxAAu5LN5ll6uow+2ju39GkBgMTLgVCOZm+k2+kwTBj4irwJdhHoqRsrHaVS
mgBhP2HoVmTnCg+Qw9NIQTjaGdm31mRt4z5wNZxvugl3h2eRslLu4UFwBGwrOnX8
Y7t2R7odEF6mptBkx7WLPMbUrK6e3B1lvUs4CHDwORb91o/mQUa613r3OMbMvHgj
xYTbKGjw8Vgk1j65go4ERSHaEafCFylzkIOoHB5t3JGe08n9uq4Ht2Wt9B7H16Jf
1JyNE1xxHF0YBZRkMVGYnf10iDLhFhWwu0DgIaQwD6vWPAyGMYSfsm+jaj617+/J
iW4KFz7FccDVGaWeYfOlLLcmpt3yCezGz4J5MkU0I2HMy/RYAMyYy8iERjJjhla7
hKbtNRo1+UxMmAaSi9mJfrobi0KO9efQyf2isOazvFqMxDMUvVyPf9FAzOiIyn5e
jIVCT21riL9phATQ1fEVmVs8ykhbEw0Y9FPofsNj0biqlSJ8/65CyYIrsmX7iWIA
tEB5WrHZhbiRgs13os6YOPn5vHo4DzfCH+rtetcaBj0zM3HzAPtses3XMK+UqZ9w
pRNEBDWfB/1Zz0SsMYb9ge5uKKjSqQzHTYqCxtzR3LfAG+7Bab+OGvlRZ3rcScX0
AfbPaFu/Tt3gfC8vhpNagK7u7GPTrI3lrzwqQCUgGbxivEKN8GQ=
=prvG
-----END PGP SIGNATURE-----

--Sig_/HQd0stZVGT0FW5Br/pTvs.t--

