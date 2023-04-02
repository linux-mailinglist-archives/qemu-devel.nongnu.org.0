Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E2F6D3992
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:57:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1wU-0006mI-52; Sun, 02 Apr 2023 13:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wD-0006kE-RW
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:21 -0400
Received: from mout.web.de ([212.227.17.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wC-00042H-6C
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680458175; i=lukasstraub2@web.de;
 bh=slryEM/KfdNssQs2kFX/9l5ju/cyu0e1bXrkTCTexkA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=m3DgZ+zCjg007FFQxWtlhh1FAx0QLF+6WoSmpq1jFvVrENQAbdT8haF8yu5a0lgDN
 T8eNC+W/452pLAdGG/b6KsfGpLexgTsfsYpu2cqElq90wuuISctd1CO66iU34FXPOp
 s2C9yHL/x0d3PPiUbSl6rjgupIOxvo5Cue9XIOHT0Tk+Bv6Doy4IF51HgGYYJVJm3B
 JkOHTychZMaDjKqa/4xNmRIWVAPP8jDJjToB9YQh26O84D3ywfU46Sk733hUmlUBb7
 Z53zc9GM1oqWzGwyfO15+2TguAMMLveWTwUJ15NgUDtqSZZd1RFsRHdcDwx6najBOy
 EgmR8VymzQM3g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MjgX3-1q7PS01SPr-00kkMJ; Sun, 02
 Apr 2023 19:56:15 +0200
Date: Sun, 2 Apr 2023 17:56:14 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 04/14] ram.c: Do not call save_page_header() from compress
 threads
Message-ID: <a56e373205a5a0f135b5d97c14c64b0d56fa80e9.1680457764.git.lukasstraub2@web.de>
In-Reply-To: <cover.1680457764.git.lukasstraub2@web.de>
References: <cover.1680457764.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TH+olvsLxY6JI5vtKbz0emb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:68JzcP+JH1RVqCHvoPAnTMK0tLao+wxzIAFdoQ9Jm2G8a0iC0ua
 t27gszZbu8+rVnykrb9QvNnOg5QSA7bAPQmxtik/ZVwSgCVRLHYswzWzOTR1SGbc+ZNrMZw
 0cwB1idB69nanS5vurggGEGo7A33GaMbNEDDnE/rV8JmNKghiPto1Ovw/N7kpb4obe1coM9
 7agmYCgpOKmTa9j15a9CA==
UI-OutboundReport: notjunk:1;M01:P0:a/RB3+C6GZI=;KHom+0Yf6AjCu+9jSCnR8QxJlNp
 r8j6Piy7Ro4gtlQXX2kw+t3QBArRc9WWeK89oMokayeWz0bYW9TjFo50bR6BS+MvET2B06oM5
 zO2LP4Ue9pZSlF0LVb+G7siW3ivb8IFSOP7meTDjC/VjiqD/jEKvXnOg84fmDyFcBNnJyrLNG
 voq4u/am+psvdFLYwPXmlkPWb+1556ytatGI0/p52pFWKse8rdkQq+Z2+I8+MliuBf3Spt9T6
 LQSkmcGoK5CQUk+prhE5P6QBmkPFKnERqQmc98rsHHssM1QaP0Pu6mfGO4YXywsH8EUlZoHNB
 ydAZpOYXg/ct5sIOf7yZrPxfAIr+NU9x68dlLmz+5MP+cBbb13kqjXzrrtZCNfsC2oYeed3qJ
 nXCWTCjwu7zvya8rUA4OHuO6x0hMql50ToO0gRFNIOvDIvZmFHg3apAWjjR2ZjjvTpDA98FcJ
 ryiNSN7/rAC3Sp4RBJzJzRRNg5FFI7KToeyhlT4f1q7bEzDK6ZvQrGff4yvGICETEYg0uCnUY
 qWJrSg4H9OP2XDspw1+27tsvaE7Oosnx9xpKepAgzi6YRzdwd1vtz80IPOh8DTJPz+oET3l49
 KsTyAErA/S0YABCSD/bdpkASy1OPWxl5B1tgNMkJzTJ3N/z2dwWW+pOmm4Y4GJS7b53WqT01B
 7i4wahs3M+MqOwdlemkjzB9lZpDo5HCwk92NdPHuDWjNNLhuviYKic99QT24YIZQokq6ZkGBy
 gnviu1Ct95v607K8ZFSPhMhQnTYcQl0nG+8sy4ak09r0ckElPxYYZOvuEd9XgJmeo0PhHsesc
 XlGjzStFUTryXZEOnRxVUv33bAJ10Q2ii56wXuuRTGVIFxRxYmof5HUEni8gjMx/OxRHygMVv
 lBkd+2V6shF6cWgzZFuBJvwANFwIioR9ESjSUrlj3BJlcI6K9azwxGnRWSk/LPH2b/4u4W8Q+
 aHSYMWJUUUYQ2Lv14Q96dg57igI=
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

--Sig_/TH+olvsLxY6JI5vtKbz0emb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

save_page_header() accesses several global variables, so calling it
from multiple threads is pretty ugly.

Instead, call save_page_header() before writing out the compressed
data from the compress buffer to the migration stream.

This also makes the core compress code more independend from ram.c.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 44 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index bef6292ef7..7ab008145b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1476,17 +1476,13 @@ static CompressResult do_compress_ram_page(QEMUFile=
 *f, z_stream *stream,
                                            RAMBlock *block, ram_addr_t off=
set,
                                            uint8_t *source_buf)
 {
-    RAMState *rs =3D ram_state;
-    PageSearchStatus *pss =3D &rs->pss[RAM_CHANNEL_PRECOPY];
     uint8_t *p =3D block->host + offset;
     int ret;

-    if (save_zero_page_to_file(pss, f, block, offset)) {
+    if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
         return RES_ZEROPAGE;
     }

-    save_page_header(pss, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
-
     /*
      * copy it to a internal buffer to avoid it being modified by VM
      * so that we can catch up the error during compression and
@@ -1526,9 +1522,40 @@ static inline void compress_reset_result(CompressPar=
am *param)
     param->offset =3D 0;
 }

-static void flush_compressed_data(RAMState *rs)
+static int send_queued_data(CompressParam *param)
 {
+    PageSearchStatus *pss =3D &ram_state->pss[RAM_CHANNEL_PRECOPY];
     MigrationState *ms =3D migrate_get_current();
+    QEMUFile *file =3D ms->to_dst_file;
+    int len =3D 0;
+
+    RAMBlock *block =3D param->block;
+    ram_addr_t offset =3D param->offset;
+
+    if (param->result =3D=3D RES_NONE) {
+        return 0;
+    }
+
+    assert(block =3D=3D pss->last_sent_block);
+
+    if (param->result =3D=3D RES_ZEROPAGE) {
+        len +=3D save_page_header(pss, file, block, offset | RAM_SAVE_FLAG=
_ZERO);
+        qemu_put_byte(file, 0);
+        len +=3D 1;
+        ram_release_page(block->idstr, offset);
+    } else if (param->result =3D=3D RES_COMPRESS) {
+        len +=3D save_page_header(pss, file, block,
+                                offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
+        len +=3D qemu_put_qemu_file(file, param->file);
+    } else {
+        abort();
+    }
+
+    return len;
+}
+
+static void flush_compressed_data(RAMState *rs)
+{
     int idx, len, thread_count;

     if (!save_page_use_compression(rs)) {
@@ -1548,7 +1575,7 @@ static void flush_compressed_data(RAMState *rs)
         qemu_mutex_lock(&comp_param[idx].mutex);
         if (!comp_param[idx].quit) {
             CompressParam *param =3D &comp_param[idx];
-            len =3D qemu_put_qemu_file(ms->to_dst_file, param->file);
+            len =3D send_queued_data(param);
             compress_reset_result(param);

             /*
@@ -1574,7 +1601,6 @@ static int compress_page_with_multi_thread(RAMBlock *=
block, ram_addr_t offset)
 {
     int idx, thread_count, bytes_xmit =3D -1, pages =3D -1;
     bool wait =3D migrate_compress_wait_thread();
-    MigrationState *ms =3D migrate_get_current();

     thread_count =3D migrate_compress_threads();
     qemu_mutex_lock(&comp_done_lock);
@@ -1584,7 +1610,7 @@ retry:
             CompressParam *param =3D &comp_param[idx];
             qemu_mutex_lock(&param->mutex);
             param->done =3D false;
-            bytes_xmit =3D qemu_put_qemu_file(ms->to_dst_file, param->file=
);
+            bytes_xmit =3D send_queued_data(param);
             compress_reset_result(param);
             set_compress_params(param, block, offset);

--
2.30.2


--Sig_/TH+olvsLxY6JI5vtKbz0emb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpwb4ACgkQNasLKJxd
slhBWg/+KAPTLyNUtjxt1XgIxYc76GHb56c2a+fCXJdbGkGmOf4yYKwLKUYscl3w
FSQxQd9DN0qwLG3kHP5KT8OQM/HnA7ZJu8xyxYS5FvaxtP4nG3AmrsNBYWYresDg
97dkz2au822JNWu64NoheT4DqSp9j6yb1ZixDL52kzGu3X3nstzL/4zixvOazbMb
tqShulfWyd5+drkjiAnJXKilJzQ3AwWGAn209lV03LZscMjSYs3Qa1ie2MQvAX8D
ti/+8tCtJqju6Vv6ZE8ij31MppFVW/ahi1S0lhd66o7AdXmYzHDVIXhFcQkF7ISK
634Csj0YwMxTtau1pvUiPJ0bxF0fVS3e/OxK24IHzyVAZVxshT0ULvqyWyPq/v8+
s82BRAaRUgB6LEONcUlD2sg+t8QGuDJYkCacGkpYvQlLiTjOPNB1wpuAqiCCXy/3
q0UeCqcNuifYCSxA++A3Nnr4XHEvpucEUsISivTjJQtUjG9iLJZK8Ang9e8toWC8
mWZwABe40Vpirv4D0Tif5vlZbHTXFPyhCAvOTQzhyNchdhynkbGgdSsIE2jmiZG6
bppIJxbbjeDYrHJl9MCIDpmerPUn+ra5wtIQ1cN2glA1WX8FfJGuS8Y55/Fpfd5g
OJ3KwtYKXjY+vTeYD81g9Vl9GO5dYobjV/Hot0i/XTCQIGlAeec=
=39Z0
-----END PGP SIGNATURE-----

--Sig_/TH+olvsLxY6JI5vtKbz0emb--

