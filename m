Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B716D3987
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:49:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1ov-0003In-Sx; Sun, 02 Apr 2023 13:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1os-0003Gp-QO
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:48:47 -0400
Received: from mout.web.de ([212.227.17.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1oq-0002h6-B1
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680457719; i=lukasstraub2@web.de;
 bh=g8CpH09MCnsv7m0q/+YFIHQE1GLIeIMiUJ3+xuDtBac=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=RBNjM5tzudU/v5v5fqsmig5/UhOM+nq/awDLUUB1JXRDysAmNFzNbxpA21bWh8fml
 Ap/JrJqR/iNe1Lf4eZyLBUnGQdYbThA1yl7NUiFPaRkqK7e+a+cueo88WGVu5ePxnm
 ZXrbdlHTOT8o+rKrhYCYfRBSdyewpTS/PKj7/VIRh0FoauZPQ95T8SHILd81JRZxhl
 YS5smBXuRzx4A8zG1BiN6Yzqqy5Zhzu0JACgA0EF6fTaxx62uCRtkpSGoFSlVtjn7u
 nlHVYddSdBPbkMEPFyILdUcP84iptKsk6u8ciX89yxcbm/9hn2Kp3LIi11i2bYFFCL
 86AZC6zw99Slw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MBjMM-1pZ57T2eho-00COLC; Sun, 02
 Apr 2023 19:48:39 +0200
Date: Sun, 2 Apr 2023 17:48:38 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: [PATCH RESEND 2/2] migration/ram.c: Fix migration with compress
 enabled
Message-ID: <f0cbd720150d72951e1cafe88ba75e853993f359.1680457631.git.lukasstraub2@web.de>
In-Reply-To: <af76761aa6978071c5b8e9b872b697db465a5520.1680457631.git.lukasstraub2@web.de>
References: <af76761aa6978071c5b8e9b872b697db465a5520.1680457631.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z/gE0F3EOf5TXEjYcoT9w9j";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:hBDurFHeYOZwIjj8l7DLAiHbQuT5o0U42fO11C6pRIgLehIZyw0
 5/PbZ18jKaVMiPGoTw1qgQ0l1xlilWp1jIpmMMB9MHVIck94ZosZOw8tO+EGUYxUOUXd8BL
 mWSmAdZR6msf9IWf91mnD1wx5YM5Vlnhp9LZ+uq3WhtEZ5J0zUuBxa+tX3WUhMlN3l9MPe6
 7JuQ2keW25s2kuyzWXQpg==
UI-OutboundReport: notjunk:1;M01:P0:4d/CN6g3mPs=;TRb0limn6WQEXujp+ZaevjHaPjd
 IpDpZl3pT1XQRdkG/TqZMswUjuc9fnO2bgBDmZwesTcUC0rVC5aSlQIemfSvS+6eVzXWISQKR
 4ehccBAUaTNeeS7rnnig0/kR2QV3IyYpaqJy+y9peaacP4upAsXyqPaAqYXHi/QGM3ybEtr5f
 Xoe4y09xq5vhrtQF7pZll3LGliHtxeMpod2ybPmLbf7PFQPVnE35sAd4VTS0CxR1BzgAja3TC
 DjhIFj65XcdKiTCQFDpHW64yhL4KfQLSIqZjrumOOxjDptU0ehBfSc1AbOZ07DLcmlhAHnttY
 TMG+M92r3wMU4SRm9auqtn5UOvq7xpC2VftQ7ZReHSyZivaJUSNu79zzA/Z1hQLVXVr80z3Xk
 hDRuHKQEkU3+6qbanHYIApjrhyH3IZzdrF0wqVB2qNc3DyQtkuj6JbSQbPjJG3gSmXxidTlJx
 Fgl7nr2NAPpRvebjRU8KrdERqdzQaieJ0qTWNQcKI6wS1uVhOOgGBncr+QTIKz7tK647wZ9r8
 j9iNkag22K5qrqKM0ZH73l4rghT8Xe51lyUxXFrF47IOjSkgSMoU/ICIvF20Jc8iNfArZAXpd
 /CLSO555Gmk8Fho9+YrM1b0HmATsEVE7u/2MfFtSoxB8XB47/VjDDrWHmvfR+LpH+TkemdyaY
 h1BEf7M8Fzt/AEAep3PWW0OJGjUJIYakFgAUI8FgJc+MCcioV9EjvLrGf1/KXaScc3qiCa1YQ
 bqh5f+oYZxRDXT6C63x6jT6piECxlqrJ0M7T4f1YM8rcPTTLtC34+XbNRmWeNxg+Hm0lcmCiE
 xV6LXXmEo00iLN4vS32ss6l7E1k2EY2MX9qRgKCHNtPN+9sHHGyF4e69fA5X6A2aM6baLnNoY
 L1y90qxxI3QdsKtlPhdIbvDFO/ptL2TT3TUaINHesG/rT2MZZqlzH2QxSijnivneXEQgnXVCS
 yRZTFemlVir0zFch45TADVUwcJc=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
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

--Sig_/z/gE0F3EOf5TXEjYcoT9w9j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Since ec6f3ab9, migration with compress enabled was broken, because
the compress threads use a dummy QEMUFile which just acts as a
buffer and that commit accidentally changed it to use the outgoing
migration channel instead.

Fix this by using the dummy file again in the compress threads.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 96e8a19a58..9d1817ab7b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -688,12 +688,11 @@ exit:
  * @offset: offset inside the block for the page
  *          in the lower bits, it contains flags
  */
-static size_t save_page_header(PageSearchStatus *pss, RAMBlock *block,
-                               ram_addr_t offset)
+static size_t save_page_header(PageSearchStatus *pss, QEMUFile *f,
+                               RAMBlock *block, ram_addr_t offset)
 {
     size_t size, len;
     bool same_block =3D (block =3D=3D pss->last_sent_block);
-    QEMUFile *f =3D pss->pss_channel;
=20
     if (same_block) {
         offset |=3D RAM_SAVE_FLAG_CONTINUE;
@@ -867,7 +866,7 @@ static int save_xbzrle_page(RAMState *rs, PageSearchSta=
tus *pss,
     }
=20
     /* Send XBZRLE based compressed page */
-    bytes_xbzrle =3D save_page_header(pss, block,
+    bytes_xbzrle =3D save_page_header(pss, pss->pss_channel, block,
                                     offset | RAM_SAVE_FLAG_XBZRLE);
     qemu_put_byte(file, ENCODING_FLAG_XBZRLE);
     qemu_put_be16(file, encoded_len);
@@ -1302,15 +1301,14 @@ void ram_release_page(const char *rbname, uint64_t =
offset)
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_zero_page_to_file(PageSearchStatus *pss,
+static int save_zero_page_to_file(PageSearchStatus *pss, QEMUFile *file,
                                   RAMBlock *block, ram_addr_t offset)
 {
     uint8_t *p =3D block->host + offset;
-    QEMUFile *file =3D pss->pss_channel;
     int len =3D 0;
=20
     if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
-        len +=3D save_page_header(pss, block, offset | RAM_SAVE_FLAG_ZERO);
+        len +=3D save_page_header(pss, file, block, offset | RAM_SAVE_FLAG=
_ZERO);
         qemu_put_byte(file, 0);
         len +=3D 1;
         ram_release_page(block->idstr, offset);
@@ -1327,10 +1325,10 @@ static int save_zero_page_to_file(PageSearchStatus =
*pss,
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_zero_page(PageSearchStatus *pss, RAMBlock *block,
+static int save_zero_page(PageSearchStatus *pss, QEMUFile *f, RAMBlock *bl=
ock,
                           ram_addr_t offset)
 {
-    int len =3D save_zero_page_to_file(pss, block, offset);
+    int len =3D save_zero_page_to_file(pss, f, block, offset);
=20
     if (len) {
         stat64_add(&ram_atomic_counters.duplicate, 1);
@@ -1394,7 +1392,7 @@ static int save_normal_page(PageSearchStatus *pss, RA=
MBlock *block,
 {
     QEMUFile *file =3D pss->pss_channel;
=20
-    ram_transferred_add(save_page_header(pss, block,
+    ram_transferred_add(save_page_header(pss, pss->pss_channel, block,
                                          offset | RAM_SAVE_FLAG_PAGE));
     if (async) {
         qemu_put_buffer_async(file, buf, TARGET_PAGE_SIZE,
@@ -1473,11 +1471,11 @@ static bool do_compress_ram_page(QEMUFile *f, z_str=
eam *stream, RAMBlock *block,
     uint8_t *p =3D block->host + offset;
     int ret;
=20
-    if (save_zero_page_to_file(pss, block, offset)) {
+    if (save_zero_page_to_file(pss, f, block, offset)) {
         return true;
     }
=20
-    save_page_header(pss, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
+    save_page_header(pss, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
=20
     /*
      * copy it to a internal buffer to avoid it being modified by VM
@@ -2355,7 +2353,7 @@ static int ram_save_target_page_legacy(RAMState *rs, =
PageSearchStatus *pss)
         return 1;
     }
=20
-    res =3D save_zero_page(pss, block, offset);
+    res =3D save_zero_page(pss, pss->pss_channel, block, offset);
     if (res > 0) {
         /* Must let xbzrle know, otherwise a previous (now 0'd) cached
          * page would be stale
--=20
2.30.2

--Sig_/z/gE0F3EOf5TXEjYcoT9w9j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpv/YACgkQNasLKJxd
slgVTg//bpFQ/xGrW9BFA/hUMFhEZ5/vGolKnIsC0qJ03pP1vNF/VfnzYwOycpER
3UyMIYL/RrVwsChEWK2B8YRE2VVTspANiC7Cf4FkGSeltIDJQrst12RVsVWFp0NC
rN+mE+n8hEOTZ5rH7PYwoAvEph0CM2ZiL1ALILUVoEJJCuJkKn1IyBPhdtFo+TxH
mmTJylx7a+rVN49InalOfzDNtvl+kJyS2Y0elq5ATpOVzFLEDGAW+vtvra7Kya9h
3Ephym0uxguxTZWs50hIqLyTnYPtWvJmfh1W9YQpIfuNAfaDQ/spBusJHg0eDCxB
OTFk7eO+zk57T29GpVejmU5Oc3PgWrdYsdwc4CL156ENjncrEYcxMAanYzDVhPsL
KLZ4MaOlm/n0tZ296pGUjQJGX0Sgaei9wA/LTnMfOkMuKxj/Umgx2/58jLngT01/
k5aJKbpCOQ0goN6jGHc3mphRGt17qbiGRBMSysl+T8jUlw+4LrhGYSqWy+32PiO0
Au3f6l7TvAWS7AmUjRqDBT/8MSCHqKlFit7gjVx29DJWTLiCVlJ1PG3ab+TbB5S8
FhMsdQd0J/V1FLi201XDa8TmIaBOzm6TRdZ+amU9CrvHBjeQ0TNA7kC+GibbEzPo
DchONxfmaOjJvPjyWLLOw0PFbtlJXjphwmz7jG5xF7i+P97yHlQ=
=CK67
-----END PGP SIGNATURE-----

--Sig_/z/gE0F3EOf5TXEjYcoT9w9j--

