Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2850E6D398F
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:57:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1wU-0006mG-4r; Sun, 02 Apr 2023 13:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wL-0006lX-EP
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:29 -0400
Received: from mout.web.de ([212.227.17.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wJ-00043A-Ny
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680458183; i=lukasstraub2@web.de;
 bh=e2XBwHQYkP9RiP5KdODNOl+mStbytDh0Oe+Nqmiewxo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=iIILrW2WagbhdkMSIEZ+NTokQWt4Lw6G28tO+arX/BSzro27mgUidJGXjXK70KZot
 vr4C7DuEZHVmWT81b1/4Dg6gXcHpNy0mQ3jiFdN2Ylhwg1jN9R28maG1fbVgy4Xpza
 d7R69P6iwzd3nYi7/1CjABRnTbmRZihFMJZDak7J/9iLVNcf39n+w2rF1d0tb+9Wj/
 1855x2I7bex9JhwMDk4FkfZ/tpoGnMNc2f7RnPqaFUvwnTW0ReWNrP8O6hdcCt+uip
 NCZbHG5puPhm1FHy/48fNIEsf60fQoAHvixyA8ZJ6BNBDzWVmwkcEbogbkyS+yUVQG
 NJr/5KBBas5ww==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MpCqb-1qCvmr3E6h-00qGn8; Sun, 02
 Apr 2023 19:56:22 +0200
Date: Sun, 2 Apr 2023 17:56:21 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 06/14] ram.c: Remove last ram.c dependency from the core
 compress code
Message-ID: <736329ce81b99e0e1cb6aa9683dbae0d39a235bf.1680457764.git.lukasstraub2@web.de>
In-Reply-To: <cover.1680457764.git.lukasstraub2@web.de>
References: <cover.1680457764.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kJGx69ZLF8dGfJtCKWkgZvD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:9vsTi2epGLxGxhj8b6v6ue58lBkyQYqy9XADsrGjH8hIOA4DfAP
 XJQ7IgnRSzuqVPlnXAcR2JnmHrAoJtJmwXsRAbUfVTbc4gdFMnZEvp0KuAoCmiIf0pJMIAP
 q8ed/7d7QVKyxv8nNIfTUKSaPRGRlRe0UczgexaSdMtBKZDdPvpXKX96tmwf/19oxsPZxY+
 nfO4OplwNMUolrxwIZvqw==
UI-OutboundReport: notjunk:1;M01:P0:K4Ae7fw1IcQ=;y0AHcwI0z6P0ILtiL9+KNqNY/1f
 aVPBO4AxeVYAG1o3iODfb1GiZtSSzu9qsf3tmnIOu4YgCFCuOY6PCAwxd0uxBcMLi71W6gEKG
 G7Il+m3KCIscduH0knoaRUtYjru2hXc7g+vD1GBVbqAlJ3ZbkIvSzN3RG/MKNhdJ7aqk8zXTZ
 Zp41kmgPhS+dT5qL6HvPSXeSLZ/q2iwngLpd/nb3asQVSB7JePcPZ57+ONomoiuvDflc92uUL
 huLm58lTCTytSU/JKMNrIG9bS7E/43mxui3yiIDTN3LT/s0u38DS033ACWjJQzgW297AO6iH1
 HjyapEAEPCHFdh19b1iQtinGM/HInyillAHlwBJoq7uA8kyfcEX+QNFTJqVVQmds6bYe9ZONq
 5l8VcwaeISVkpmnJTJwyJ1gI/f9iSIt/hNgt2xyrJ6+YEd508avrHUF/DHscHBr8iKtUKUYLe
 M0WCUK69gCus7pG0N1O58mg/oYT+tGpxDM8BqtvOfYL51XxhQlpYkU51KxmEJvQAw4lXrbJxs
 gaJ10kyk1nwQ+TlhnmTTZ2U2B4wcOkIvK7fWyx2ipDulaWFVbpgehuegjWEc50xUpj+3qI6kz
 EvTr95sl7+lVWqB+4pv62ng4xGBCAHZvEURg4vCui2QoHorefC/BbrWT1vPw/qVXrVW1mR62d
 jA6hFmVcFCF65+N9p08AXM8usArQt6EBbydB01ogwWpQmA26S8k5wmQwSGG2//fDRwEOJOKDI
 mqXjqrbDPkedkbbSVfTC/WsvOkm+I/jSv9HZQjYYjE6B1Mi+SJNgarWkbsbhE3cyEJp5nS/zM
 JcLp8WOtfwtRGu1wqPMp2NLfePIpCGq8NCD3o78XVwv/ULChGRGSWkm23TjB/+V6hp3oHL3Vr
 8peqj+zFYHbYS8ZQR1Lb17wutfscI7cg03jOr2M3zDOn5ly4FO5OlF/YENkCG3n11wDNkc03W
 1Es7sqTEY7v8INHj/NdljvLxP6Y=
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

--Sig_/kJGx69ZLF8dGfJtCKWkgZvD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Make compression interfaces take send_queued_data() as an argument.
Remove save_page_use_compression() from flush_compressed_data().

This removes the last ram.c dependency from the core compress code.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index f55eb0e587..20428ccf42 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1556,13 +1556,10 @@ static int send_queued_data(CompressParam *param)
     return len;
 }

-static void flush_compressed_data(RAMState *rs)
+static void flush_compressed_data(int (send_queued_data(CompressParam *)))
 {
     int idx, thread_count;

-    if (!save_page_use_compression(rs)) {
-        return;
-    }
     thread_count =3D migrate_compress_threads();

     qemu_mutex_lock(&comp_done_lock);
@@ -1584,6 +1581,15 @@ static void flush_compressed_data(RAMState *rs)
     }
 }

+static void ram_flush_compressed_data(RAMState *rs)
+{
+    if (!save_page_use_compression(rs)) {
+        return;
+    }
+
+    flush_compressed_data(send_queued_data);
+}
+
 static inline void set_compress_params(CompressParam *param, RAMBlock *blo=
ck,
                                        ram_addr_t offset)
 {
@@ -1592,7 +1598,8 @@ static inline void set_compress_params(CompressParam =
*param, RAMBlock *block,
     param->trigger =3D true;
 }

-static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t off=
set)
+static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t off=
set,
+                                int (send_queued_data(CompressParam *)))
 {
     int idx, thread_count, pages =3D -1;
     bool wait =3D migrate_compress_wait_thread();
@@ -1673,7 +1680,7 @@ static int find_dirty_block(RAMState *rs, PageSearchS=
tatus *pss)
              * Also If xbzrle is on, stop using the data compression at th=
is
              * point. In theory, xbzrle can do better than compression.
              */
-            flush_compressed_data(rs);
+            ram_flush_compressed_data(rs);

             /* Hit the end of the list */
             pss->block =3D QLIST_FIRST_RCU(&ram_list.blocks);
@@ -2363,11 +2370,11 @@ static bool save_compress_page(RAMState *rs, PageSe=
archStatus *pss,
      * much CPU resource.
      */
     if (block !=3D pss->last_sent_block) {
-        flush_compressed_data(rs);
+        ram_flush_compressed_data(rs);
         return false;
     }

-    if (compress_page_with_multi_thread(block, offset) > 0) {
+    if (compress_page_with_multi_thread(block, offset, send_queued_data) >=
 0) {
         return true;
     }

@@ -3419,7 +3426,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
              * page is sent in one chunk.
              */
             if (migrate_postcopy_ram()) {
-                flush_compressed_data(rs);
+                ram_flush_compressed_data(rs);
             }

             /*
@@ -3512,7 +3519,7 @@ static int ram_save_complete(QEMUFile *f, void *opaqu=
e)
         }
         qemu_mutex_unlock(&rs->bitmap_mutex);

-        flush_compressed_data(rs);
+        ram_flush_compressed_data(rs);
         ram_control_after_iterate(f, RAM_CONTROL_FINISH);
     }

--
2.30.2


--Sig_/kJGx69ZLF8dGfJtCKWkgZvD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpwcUACgkQNasLKJxd
sliNlA//b7rv1GsGSK+ns/+okGBepOHqmffOKX0utQPLhUhoPVM2qJ5dwcSe6F3n
6u2ykeFOaemRQ4oJeuIASwXvAxYwQpDYhhqjLm2wAQTeEBFCx52FDW0i6Zoc6clK
FCTCRiCmYb5Kvhm45mMcULU6odbAbnt2/XwfYeLGqAD6rvTNR3+RYUnhYcypM6sc
fw5wfYCDpppsel3ze21VQj222tw6OGz5bhcPrysrhlVdhAgCQvqar5Onhn+csj4z
kjVuruZIlMWISB7MCxRM6xfN5UNBVWSum0d10l2vCUIA1Sc4wumfdg0gQSptxWo+
FZFkVreIATyyiqFhFyLJS1lzIMDIATB/do6t++Yni9tABVPKsvb4I0jweJMZDvQx
ZDcxdkaYH4WzK7c4IQGSVkQK08nnnmqTF/txvi+jCG+R1FrcRGrxYThIWcNS+6vq
fewoooewEv8rX0Kr6f+CvjlJUeVyD3b8X1NFNDDQ7/FampGuStLeGjoFTreDZhlP
nYK5yVBqFO45ki3+4UBsoiIR1zVXG7Bi4gtRt9kuT3CUQvBnb1BVOTDwVTUcrdGH
2CYnDRWmiMDtiNcswQZKm/e+6PAx+M7opjv8iIqyOUaAvxuzXCicXno4YUFpnLLl
xdv0lAxOCfVBTXcxGSxWJ9ufL4H24XW3PmeP5G2qPBQ/G5RmjzU=
=9ply
-----END PGP SIGNATURE-----

--Sig_/kJGx69ZLF8dGfJtCKWkgZvD--

