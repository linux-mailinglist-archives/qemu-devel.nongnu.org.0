Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062726FB6A2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 21:12:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw6GI-0007ER-9O; Mon, 08 May 2023 15:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pw6GF-0007E7-06
 for qemu-devel@nongnu.org; Mon, 08 May 2023 15:11:03 -0400
Received: from mout.web.de ([212.227.15.4])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pw6GD-00041A-EH
 for qemu-devel@nongnu.org; Mon, 08 May 2023 15:11:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683573057; i=lukasstraub2@web.de;
 bh=0QH53IRgOPhT49cv5vsdm5gVQIKWEzSU5q9yPGwkZWk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ltRJdQoTuEKMo+tbTwvlbVE1gpc1B73hee6jZImk1QF0rr1Fvqp+R7rpNn/+s4ZEh
 7fIfmHt2VpKDTje+kADEUZZDuZCmpKQvEUE/oEKJRI2ADkbkTa29VbzPWjmYl35VEx
 a/thCBW3dZQAlUpKfux3e0Xnnp3h4Dwq9P7zO69IwxiPsP9+Ebr+uig6NdrYopPbYS
 aQjGyKomnHE4GV7qA99ckpkvFAvaHIAESyYqMzDf15wSSIokUnnD8aZn26HHA8yUxx
 0vX/+vg4Wm7zEHyL4HaT5GvEwxeS66FVMZPFsz+1RxVGIBlHF13kHrI4jojBuZ2/0L
 QXX7wtK1/4HAA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.98]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MUCz1-1pnXff3d3b-00RIQj; Mon, 08
 May 2023 21:10:56 +0200
Date: Mon, 8 May 2023 21:10:55 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 2/6] ram: Let colo_flush_ram_cache take the bitmap_mutex
Message-ID: <35cb23ba854151d38a31e3a5c8a1020e4283cb4a.1683572883.git.lukasstraub2@web.de>
In-Reply-To: <cover.1683572883.git.lukasstraub2@web.de>
References: <cover.1683572883.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9xKn0ey7D/FG6=z_YqRWPBz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:Jdr5G3n2E6kpeS4hvyaa7eCAvWjLD1iXSr+vQ3RGLXYjjc3EBN3
 DWXtQtj17JMQjEKdAcQqsT8gFq3WbNY8lhLFicRRCOiVP0hCQ1PyWgJKL/y2jXcnvQsJ34r
 b06JuauNTh2+zYmcrQ59mmjNvDbB/6vNVtbvkye7H90mKhmUznpEhleXDrVC0/iH6cjS9n5
 7nn5HT0kgvPZ2XPPiuMZA==
UI-OutboundReport: notjunk:1;M01:P0:Ul7hvAOpr4Q=;ivephjLNZcFV353pSwe2W7VMcYW
 vKNiUGHxT8OoXIdAjYchjAnpaJIhom9mulM1DF4ASJugDiDgjqtzY1ZO2wIOKa5iGCSugolQw
 aULxRvhrmPXv5cu2+6Gp2mBzzc8GOM0LWKpmffVBSohE6maHlyGjK/3CPEqHSvIpr7pPC7QoN
 PlRHgwxzCget1VHGX/r/aZ0XxqrsFZIHozOqZXkWcQJMINBQsji+0CZ6XCQOlxzu20oWILNlE
 fNxZwaRm3bFg+B+VNzFMvaxWtzbXyDVxVYJjY/ho0jVbnpCLNybnZjS8HunWpMa459P3PNraX
 sS9nF8HZHOt/dcjM0F3x8fCghvcK8goORN1rY1WycipUCfmQOZZX7Q+eCBdVtZ9nKfEc5twjf
 b/eXTspJ7/DYpvTrvMZYxFKjLBl7tmDnAJlH0CoAIYRQfG0Eihx3U+Ss01eTMEEH0Da+mrNm/
 EbOxbVzpZtI9ejDwB/V/0VpStPty8YSgEx+FA5k52fagq99/YhBU+v1N4OXVVWP3Szx8GMilo
 2YtNE69jB8PvmKRUr+MU7tGadaci7Gm2u7jJJcnm7F0y26imY3Ggo6l09hEptezp0T5INdMjN
 ThhghTNLxv9vDfxv5usHxfzswO6ksgfAv80Mu5cnpXGSOIUSqRUgO1210J3CZQw3CIwjxGtUq
 0kt+Fe+WMAlLcoOCV3F5vB8oGUbd4Ppvv5RmRYKF43Cpx/pjmtujEOBzAbAve80SxziWIXrZy
 +b/hvX0VjzBKu2AYS1fTI0a4SI5plmAM7tR0Y5i+otr3CJivJvhx08hj/33wjCyKroLwlX29T
 1noTVNB+b5OohDd2V+ehp2qVLFQFf7NrFFirPhTW+Xjaxy+fKYvrG64I0de4UJD9zMKx2Dlbl
 Oh9+9jwQuwy4Ner4/jNnJTr7+xTk+y+xnqfAIu9WnvTYG9JsWp95vhEj5m/BwsH20yN/VuiDf
 Eve+C+ArLSUphu+EA1mRMe9Wb/4=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--Sig_/9xKn0ey7D/FG6=z_YqRWPBz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This is not required, colo_flush_ram_cache does not run concurrently
with the multifd threads since the cache is only flushed after
everything has been received. But it makes me more comfortable.

This will be used in the next commits to add colo support to multifd.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 2d3fd2112a..f9e7aeda12 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4230,6 +4230,7 @@ void colo_flush_ram_cache(void)
     unsigned long offset =3D 0;
=20
     memory_global_dirty_log_sync();
+    qemu_mutex_lock(&ram_state->bitmap_mutex);
     WITH_RCU_READ_LOCK_GUARD() {
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             ramblock_sync_dirty_bitmap(ram_state, block);
@@ -4264,6 +4265,7 @@ void colo_flush_ram_cache(void)
             }
         }
     }
+    qemu_mutex_unlock(&ram_state->bitmap_mutex);
     trace_colo_flush_ram_cache_end();
 }
=20
--=20
2.39.2


--Sig_/9xKn0ey7D/FG6=z_YqRWPBz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRZST8ACgkQNasLKJxd
sli26w//Qn2WyISkF8paMAQI1WXkMumAzTKKa7efk2c8V8I0N3GpdsCjm8q2paMP
bCEqX7A+TCTy3esAuA/fAM27SBbqieegpxcuTNLYHlGw13sX9FCiBRADfAUc6eMD
Cj9KsEY+yWgfpE//yE2BEkbssI+LahEfGhVuuyNHLWa9RlXeOWewikKssy2dPFYC
73jrSzTJ4t2abn6owZymPQyWK+y8C/XOQn2CmnplLFiIjFm5mYmewKtp3asfnomo
359gnw7EPV+KO/w7zU2Sy5Qje+30CmULa4VUj6+DAb7VrBvqMmNVqDeBQAgv8qzQ
V2RUrDS1w53IxlbEj+aXqNIECiuxavAlc3OYe/zcuBZ99BIWdkpGzAuM06UAP6HI
tTmg5Ct3vvh5XTCnRptl1aDvwQ8oVbXbbFh+O1HdH3t4uJLkZXGeyT3Q5q8vgJkU
gedTWho6zu9qpIo8EnNDJhowxh48rSWeEwRrP9rv8CyT5JpoE+l6nzaPNedQb0VM
9f6C9cC+JGKOTAp/W8gkT80lBHqsuzzZy4fPA7BdA2si3Tw51C5tgTu3nZrw9x+b
vCRhuJhn24W0GNjYG/EU6d/mcHgyh4yntOxZfxcDXiPamQiiEcogs0Tv/8yv1Oja
skkRQ7NHUyGBzVYQ6NFDXAbNwe+vKXu3za9s0KjRssSl7HcBsl4=
=nk4m
-----END PGP SIGNATURE-----

--Sig_/9xKn0ey7D/FG6=z_YqRWPBz--

