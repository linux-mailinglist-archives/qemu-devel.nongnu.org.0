Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E856D657F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:36:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhli-0007aP-7U; Tue, 04 Apr 2023 10:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pjhlf-0007Z9-CQ
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:36:15 -0400
Received: from mout.web.de ([212.227.15.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pjhlb-0005WR-U6
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680618965; i=lukasstraub2@web.de;
 bh=1Uc1GejUrfx0MLB/D7QKtrjGVaAz2I225ybeOKSqUKk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=o4x3alFQhsTW4Ne4b7o2pC0b+P2LklHNFYYoLd8/hSbDGgrHH/8h0JNzcvRUyo56Q
 p/QBKisknw3cyrYcpVx9lyIaL32cVn7sCACQk6cSPnvOx3q7sjHtYQSzlbYGudL4ox
 FiRdBhZvvE6yfT5q68Y2KC75yMfG6GUtjgBRerlfdKApKHcoJXY5nxkePDoTHgifVu
 SCqLJ1uGRJ3vnksinyyq9xteWMrLNBnz+E7i3t1Ws/3F1zGP5X22uC87EFyS8pmetC
 a32c8BqWFjfle7vGGw3JMdewutIR4va8p4wkmbZYbqYP+EYcdid5A045F16UdKC2ob
 g4BVCYLCwpOew==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.102]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MwR05-1qZsPY08RR-00rzq1; Tue, 04
 Apr 2023 16:36:05 +0200
Date: Tue, 4 Apr 2023 14:36:03 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: [PATCH for-8.0 v2 2/2] migration/ram.c: Fix migration with compress
 enabled
Message-ID: <2c4cac0ca620ea0304d88b8f5110fe290400c8c8.1680618040.git.lukasstraub2@web.de>
In-Reply-To: <2f4abb67cf5f3e1591b2666676462a93bdd20bbc.1680618040.git.lukasstraub2@web.de>
References: <2f4abb67cf5f3e1591b2666676462a93bdd20bbc.1680618040.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HdGoBVXvrWZ+p4=S22CN9Ws";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:UYABQygXjINGT2Dy7+IcjheoyY2Gf+UnfkYiQcYIil7eNZxVIXZ
 QRLI9ZVCWIal+1mi4FiEB0fuuBl9bvgQRPnbbHOJowJPXEzduKs9ZWAFElPINuuHUUa4FXO
 9Gq3x5lSpwrQJjWvXUokZwrG5Ff6HS3FTW5RQQ6gT287ZTbEbTKmdbV+BXT0ou6xlaa3Ryo
 5EdR2+OGW3hMaTJccWY3A==
UI-OutboundReport: notjunk:1;M01:P0:hBwdjc8rav8=;da8v6kiUAdf3fLgUV8Zxh6I87Dt
 HvlAIN0T1StLZfR4q1e0e0mw5vSb75GfHUmDpL9uAdqXqN3jJL0zRXcSSCcamQe0VxWbAEWud
 ZKtGfIEG7bngBFDRZWr7caQx/o78FVl1SOzSVSzCj0k8Qs1UZKus0fAJBaHvLWXIp2Sar9J3h
 Yg4+MNZcauoswhobozrHcGZAxSJrZjW7Vt1Nx8hmHxGjyJHKfc5CW4KTMpgGyZaPfn8BjRm0/
 qtueeYjg3gXjuwT9gxt3zoxUyRdCugBRdCznsxAOgf8yDxE+GRskCMxjWXk9tGWcHDhvMHhje
 Vc7bixtBxLCewr9by4cxDuavTz8yOuc07F7k/hOATPaTS/XT0UqTlUe0u2hL27E9M/2yDqmOo
 F0XraMRah6+EiWIbJlXRjwvCx9TYxKOoRUuubODjTINmGB8CF1SRMUUxqXbRQwf3Gg5Q5oseK
 EsFAaXilMsZB0yqQUr8hedB/8zBuMHf//Xw66jJ2URpsuQFgHRh74gKVQnv8AP0HchAAfQ18W
 yNMkH/VZE2IKaOApAUbtJL7nqHPSqzPVXGIp6jnfmPgbRImnzllpk0wXN1zMdUMgIsFvtZF8i
 4j/R/KWxGfHuQpheS4TaZVy2qKY6BObWUgwU8UfqkDhDh2NdTqP+WFoPnhfcwox1VVQccdpNY
 rM/qHuzJT+RFjeVzKyRI3D07qRJkfIt0LeLrQNfLdlPAcZvqdcm54LaRVk3SZeVRtEoGf7IfU
 eOYYOaCnz1prU7g6vDspw/4w+IRjg4B9aZUKNYiXpgABdeLTIz0+FUl+KkG8+K79IAcZWsVm4
 eAJp8XFgx02nrXk0uQQvJ2mYT2d43ZaRvSqh78F1qTb78YtBSjOGPMY1e+alM39PLvLptxbbJ
 phIYxvssrHEzvYPK5V/yEwKVmveAS+pGth+jTg7M180+6/K0mBzChRXTj3Kj4Qaf2t7BhJSfR
 kxWHOA==
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

--Sig_/HdGoBVXvrWZ+p4=S22CN9Ws
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Since ec6f3ab9, migration with compress enabled was broken, because
the compress threads use a dummy QEMUFile which just acts as a
buffer and that commit accidentally changed it to use the outgoing
migration channel instead.

Fix this by using the dummy file again in the compress threads.

Fixes: ec6f3ab9f4 ("migration: Move last_sent_block into PageSearchStatus")
Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
v2:
 - Add Fixed: and Reviewed-by: tags

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
2.40.0

--Sig_/HdGoBVXvrWZ+p4=S22CN9Ws
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQsNdMACgkQNasLKJxd
slgd8A//U+a2Iolafr2SqHC4+Ghy5mgmSwCxEhk5FnRDaT2GqHAaZTbSJQuX93mA
8oFs7CqnHfV/u/zmR8JvwaydUGx1oLDkjJZxYp7plCOvpx1+Vgl8r0EGZtbNOGhM
Jogy1JgtNSAzYemLZFz31GnZ43N157pK9rWTTWpCbc18NzcdTLeyILdEzzuDDyey
o2BUcriwkC6s8HQSHTo2f+x3QldYoSdy4H++9boQpHXpVnz7ja/WQG2JgEKrpmqZ
TWrKBcHxI54mJMNu8NgspHNQCo21noCsJlJKs1RFA/sW+DQfOq/3ZT2g+QLKdUts
bsAEaihBGtcc/biaL74iolyjqPh24LPD5JL9jkERfardCzLrUJrw9ogKLDlhv/OF
flzf6c+U+NEWjGxh53Gmp886QPZ59jv6bTio2NDGAI9b6Wj1CrmhmSzrMzD4jRx5
8gLqQhvRSUnq1vKkUp1TCaOwBh8rm6DNi4yDYyPDMZy5dzI4U7uNzqUGGQKdsfh6
9lDSS9IOxRkLwxm6Fb24qp+Zc/ua8UHUvcRZiNsik204d1o9pVWANnzxm0NTKopl
oz271ZcIWVQwAP22KyS2HInsMMOKb2h8sJdkMnS9ldSTEj10xvOmUFhKLPfaErM0
APjbAKYBoyTYofEkrGq7oVtyWLqEEPv8WK+d8r8k1MQI/GaeZMM=
=o3Ab
-----END PGP SIGNATURE-----

--Sig_/HdGoBVXvrWZ+p4=S22CN9Ws--

