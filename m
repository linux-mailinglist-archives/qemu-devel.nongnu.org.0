Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562D76D3997
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:57:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1wo-00071e-Ng; Sun, 02 Apr 2023 13:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wm-0006wK-8Y
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:56 -0400
Received: from mout.web.de ([217.72.192.78])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wk-0004Cv-Ma
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680458210; i=lukasstraub2@web.de;
 bh=uD0yPQy46Dhm1GKDNQ2Z+mjWaN0hh4FDx8761C9QICQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=PU22aoKWcrvyWyuWPebtjdgie0VjsDxTbqdSi1jrHbef0oqdxRXJ73ojtZPWYG8/B
 uglmDPOb9tM9Zp/sep5KrdioOPbddBZxT5AQkHQInfcSiiMCbOqgxhEY4tQm4mS0dK
 v3iEM6SlL85dHqg/ZeTFdER5PWgaD6hysgskerYCgL/3SSWMWA/k3z7+ZHDDrz5Rmv
 pezdkbv9thf8BAfOuJ20Zhw9PGOFhHaVnP+DOoREaAbLvBcS70sNMvmJyVAen3KtW4
 HIV8oL6fCp7hqI4N++QLscW1bRTPcJe5YsQ4nBQgkyEjY4TuO9x9GRSFOWbI1Bsjza
 lco1PKYcxL8VA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M28WJ-1pgYyR2tgH-002NHv; Sun, 02
 Apr 2023 19:56:50 +0200
Date: Sun, 2 Apr 2023 17:56:49 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 14/14] migration: Initialize and cleanup decompression in
 migration.c
Message-ID: <d2e81233cdd90002213a118c266060b739d377c6.1680457764.git.lukasstraub2@web.de>
In-Reply-To: <cover.1680457764.git.lukasstraub2@web.de>
References: <cover.1680457764.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JfDtzNv5ymNQMg7=xZdCJVM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:mDmYvNswxKOqH0dcZX//2ZFAwptpKBTmBsyp0L1gJ9m1pmDd7EP
 e92Zcf7wS3ZpCiEHVa/Syvamq+5ZcZQJl990n4/vWx1qWKWIHQb9a05Xbo9uOHDM3GfZl53
 gGmlzEeJ0ypyTMGg7JRUON0dyf7QwWStryAHOkLw5joG9YFle937yPKuJDBj6AgyYTURG7S
 bgbBBNKUvqvZxfz2xNVhA==
UI-OutboundReport: notjunk:1;M01:P0:RYlcS/pKWSM=;GpBwB0pe33Lk0NCOaO9mimXwSXg
 dDHqLKlDPFpoGG5WATc6DnoZdYDWSjAbUNlATXQBTBFoJDhEbdrxKv1IR0UIOjdMJXScqCpif
 nXp2Tc8/FGsQu48ce2z8+b+Me5n2pi19bIROJ8s4wHU7HhnAi1BG6wURqIh8txkygY6L6ePkT
 ZrQmywrXSOs1Nn2jfDF27LHapRdUrkwk5z5ot1B6n/9gSJa8fyAymsUt56jGZkUA9xMKWkGnS
 VIjdc+I3neZjzsKjMYFCr3IQ9+o5L5s+WKWeWH2FAShRKaEKyese6KZd9c9Dt9jKc6oi5E0CW
 vLM2S0ojWIa+HHhcz4iH1UZrKHVictKb0eVXP4QEAMyaSm66dSKk3TnPTosqyD5nd7lylr3G4
 lCc1Zi5nLtic1+OkN+LLu2ZblHzQDKc9cbaV5jcS0ZIxKk3TY0rJtJhmggN2jeSUoKgHV8r3e
 NBPn43iimlXP6ulwFTWxR0t6g2XZlMQ3XwdKR/NPaewMYBrkx9I/SynlUQ4L8maKPhSjIdzd8
 mpT85C+gg6fKCMjusQv6Yti0ZS/yeiXKmjY6orhtoTXSpeujgR8+6YCTB2nsMv1qIg844OhPo
 K0yP2baR/5BJYpwRNqqXc5AGvIC6M0tR09dxVRsPiYm5pbwPgmGlRGWQiKVEQwMxRyZYe2vQk
 Rlxs8EvnuuJqIHpDVRsuoDW7Qx+RdVJ60piDCwXmypjrgyTsVe+00F+yUS9/s6Gg49szvzAWe
 vENIsIqUtX22jrrh9PjzKxfL6DgGIIE3PmySEcj/8AFbquI/u5qpnCFmZ9Xp6isrBF69OOzN5
 AVhn2OYWAWHUZ1pE47mC3TkOqDHKWYSgoZVSaaKps1B+r/lFLHg4HI8kqbGYuSlpnfNH5l3Vc
 LelF4k7LcI+cayjXkc2+8pQCoKoFY7zEcyQXppwTTqOarAIYcSufpBN4+fOaTis7Vd4Tj7LIl
 1iuQZGUUpQFa0N51PJ+fSI8CsfM=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

--Sig_/JfDtzNv5ymNQMg7=xZdCJVM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This fixes compress with colo.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/migration.c | 9 +++++++++
 migration/ram.c       | 5 -----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index ae2025d9d8..cbdc10b840 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -26,6 +26,7 @@
 #include "sysemu/cpu-throttle.h"
 #include "rdma.h"
 #include "ram.h"
+#include "ram-compress.h"
 #include "migration/global_state.h"
 #include "migration/misc.h"
 #include "migration.h"
@@ -316,6 +317,7 @@ void migration_incoming_state_destroy(void)
     struct MigrationIncomingState *mis =3D migration_incoming_get_current(=
);

     multifd_load_cleanup();
+    compress_threads_load_cleanup();

     if (mis->to_src_file) {
         /* Tell source that we are done */
@@ -598,6 +600,12 @@ process_incoming_migration_co(void *opaque)
     Error *local_err =3D NULL;

     assert(mis->from_src_file);
+
+    if (compress_threads_load_setup(mis->from_src_file)) {
+        error_report("Failed to setup decompress threads");
+        goto fail;
+    }
+
     mis->migration_incoming_co =3D qemu_coroutine_self();
     mis->largest_page_size =3D qemu_ram_pagesize_largest();
     postcopy_state_set(POSTCOPY_INCOMING_NONE);
@@ -663,6 +671,7 @@ fail:
     qemu_fclose(mis->from_src_file);

     multifd_load_cleanup();
+    compress_threads_load_cleanup();

     exit(EXIT_FAILURE);
 }
diff --git a/migration/ram.c b/migration/ram.c
index 9072d70f7c..e9a295fab9 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3559,10 +3559,6 @@ void colo_release_ram_cache(void)
  */
 static int ram_load_setup(QEMUFile *f, void *opaque)
 {
-    if (compress_threads_load_setup(f)) {
-        return -1;
-    }
-
     xbzrle_load_setup();
     ramblock_recv_map_init();

@@ -3578,7 +3574,6 @@ static int ram_load_cleanup(void *opaque)
     }

     xbzrle_load_cleanup();
-    compress_threads_load_cleanup();

     RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
         g_free(rb->receivedmap);
--
2.30.2

--Sig_/JfDtzNv5ymNQMg7=xZdCJVM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpweEACgkQNasLKJxd
sljYjA//SvJmFjTM68tgq/FGvGx/byYqgJILJjp3SPyCf6d5ah1C7cLHMpck2Cvo
8iZEwEQHMZvU/CcimsjsYtyCQfOL/esSKEbyKuEN3WFobWN4SPHq5SXlZHFEPeiM
2/wZiakuOza19uOQGSXzMytsX5olSNYeSlyeWdJweceKiQpz+Wzjqiosrgvff3V3
TgA7MHK/8BPQSYj6Go0/MfXpDvSTKU/iTbZqb99Kissfpveue+Yrl54SMltAoAga
rwqwoKI/F1a+SujZiT45iQSDxnEI0hLr1SPEA0XsfgLW/7kiN//3Afk3bZzvQDDO
kD/ZRLRpQiqoVe8FHRwhGCp6lERPdUv46Z+Cx2vpiGg2qo+MQ8AtzsrTcfYgHE0b
wgkrtf8lQb4ZhgEgJ18XU0Hfc2ZpJ2rUYf0oJKy+I3QF7lXfn9n3I3Eyp0mnBGf0
NS5pHqM6JKnYsv6l3gUQvk1e8jFJ9KYqn1iA/aSMvBZ2Jzf9jdy0pmzyMRfzkL23
mTGnogxwlVgYRSCeMzyMvzKmxgNKPRF0LK2mPW+WHpnjoMk1XdMkjB0PNMB/+GXN
rZtvIF9I/KS0mwFB8Wnfe2N4TCoLqf/yrjEiUkVShRUy9TeBolv4eK+vj9jhkXBC
saZjKoE2vs2MATj7mJephw8hu7207AegolWotBQQ1O4GKdbMbEQ=
=OR0H
-----END PGP SIGNATURE-----

--Sig_/JfDtzNv5ymNQMg7=xZdCJVM--

