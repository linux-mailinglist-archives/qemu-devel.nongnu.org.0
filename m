Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843636E8E8B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:49:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQu9-0008K6-Qw; Thu, 20 Apr 2023 05:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQu8-0008J7-KF
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:40 -0400
Received: from mout.web.de ([212.227.15.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQu5-00087A-4L
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681984112; i=lukasstraub2@web.de;
 bh=7h79kP+bT+k+N43aX2DF0RGfUeiCf5v/5+k+1WZ+DXA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=FKppr4bs3g09xAzhuFIfcCFvZbuybGqTgDhN/rULjKuFDpCDYoNR7yAtj0mKKtR9E
 1lSD8cM/LD7jCSvDyOPYLhr8PCPMmYe/rQrCkbU+JPhn3yT2hwnXjAJe+zG7aKY+GP
 b4F3SG7SNnyT1v26W4xNynoQf8TdeI6yleTNohOEfquyaHU0PerLV2/ydNS7BMP/F3
 wAUrBy31SK7aOaW+ibrOLruMvi7kbmdsZNIhSelPni9hhZ6GCZ8rnCUQryU0hs0KZQ
 cczlR8lSQGr+312EkkP8nFf7TaXEB12GJZzfLtBzh7VOIhb9ghC4Q0sf5S7cRZwcb6
 hS8JZBZ8SADjw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MIyeU-1padqM3JL0-00KqcE; Thu, 20
 Apr 2023 11:48:32 +0200
Date: Thu, 20 Apr 2023 11:48:31 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 12/13] ram compress: Assert that the file buffer matches
 the result
Message-ID: <a21bc7fdd9b2cd6ab99cdd7ae3390713085bf1a0.1681983401.git.lukasstraub2@web.de>
In-Reply-To: <cover.1681983401.git.lukasstraub2@web.de>
References: <cover.1681983401.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/REPNuIYz/TrBygJ._t_sDNN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:KOEZwfREKrCZj+lAWIhp9tBF0GlL/wWrCoxWiMksGtU8IZG45NH
 YnnqtqUs8XggFL10cHOO/Lp7mFhtqvS6GClJ6U7RpParl1zCIiX/JabgIu3tJe4p4DUPCw+
 DGxOoGgZySFgfJXAgKm3kbBXm6XmMBCVSCOYzNDmH7DmKA2KGwlknJvlOOhstuWdTH8LfE2
 9j/fuwWaxeLbUGnFa3K0Q==
UI-OutboundReport: notjunk:1;M01:P0:MFmT6NGFs4s=;f3VTh7wZBY0bPA1oDZ2Z4XqA4Mv
 GeI8TsUKiG5VJvNiUleOyLn/8trZfhmNBThlbQBKLw0lrkmXhr8NRtjOLw5B4FVvnI81aGhO3
 TahqUaY2i+PNVo7JPSodx3GBrv7bRDbwHZ5vfrIy48EEXlDKCgGbYbWzjafiNArQ8EuJ5c2qv
 vkD/BAJisRI+pRoy82y/vaFBzgukf6IEaJh8lK5bwNnSGngW1A5m7aEtSGoge8/4M+RiBBquB
 llyhK1Vrgxv86xsFsC+hnKzAl7lB+m5qXaSf4A7lReTi/zGmv3M6uYHTFbJbJHbA0ZRA2VQ+F
 bA5FjvNb+7MOES6yg3xuXWhtVqPsf+oi9hHpLUcdoWj9aPlTyim6PchgXoeXDGckzh+QmR5Pa
 LGBjDnP2lzSbzl96q8VRS/MMKKi/4jRJL1lVvBsiLziZ1/j3iCHB6uT4e/Wh2qsdxyFVSI+1Z
 AtarBRzgyr6P7JI6Bwmb/EOLAoSq2OcgIbUG0lC27yqYPW1LJ02Fl91jxnrLJpSifWIMz1Wzw
 mJcoAoJF6iOzPHROgyxpAWUSnSCcYIONXaoqkYP2qxhnpgGmVjZAHw5W2gBJlC2834cawCDP5
 MQmnHk+hsLNBVE3KgcjJ5K25ROBmkxpF1WS8hBPRZUvbIoG0JbjR/STXttYE8F09FcYCPM4gS
 un2vKpI/yoxV6qPfsgdAkR7tg3mddO62/3wZpWeXp7cJ2jwbff9jXpN/jiMublHnqT4QIY61H
 dp39XRoh/c0WET9GrKIzDeQX2gx9/HeDacMB18dUwVpIZMCMziCQUkG+TCoyvKYcsRn/MoDdA
 1YAK6Q4kvns5DlyXKt+I/8f77KBgy8NzzidLjHW7GdoIrhjDDroqKZPk/9pKfmQ8Rq0f1XZ7r
 ZZ3sfTUKK2piRTxfQuMt3kzn8Ax8DioBLTmEFKVT/hi0KoT48xjBV7OOC8jgTGasOBqn9UJS3
 QPtA399JKaJXpyLxSx0s0X8HA4E=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
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

--Sig_/REPNuIYz/TrBygJ._t_sDNN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this series, "nothing to send" was handled by the file buffer
being empty. Now it is tracked via param->result.

Assert that the file buffer state matches the result.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/qemu-file.c    | 11 +++++++++++
 migration/qemu-file.h    |  1 +
 migration/ram-compress.c |  5 +++++
 migration/ram.c          |  2 ++
 4 files changed, 19 insertions(+)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 102ab3b439..2b3f3f8549 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -887,6 +887,17 @@ int qemu_put_qemu_file(QEMUFile *f_des, QEMUFile *f_sr=
c)
     return len;
 }

+/*
+ * Check if the writable buffer is empty
+ */
+
+bool qemu_file_buffer_empty(QEMUFile *file)
+{
+    assert(qemu_file_is_writable(file));
+
+    return !file->iovcnt;
+}
+
 /*
  * Get a string whose length is determined by a single preceding byte
  * A preallocated 256 byte buffer must be passed in.
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 9d0155a2a1..15e5f189f0 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -113,6 +113,7 @@ size_t qemu_get_buffer_in_place(QEMUFile *f, uint8_t **=
buf, size_t size);
 ssize_t qemu_put_compression_data(QEMUFile *f, z_stream *stream,
                                   const uint8_t *p, size_t size);
 int qemu_put_qemu_file(QEMUFile *f_des, QEMUFile *f_src);
+bool qemu_file_buffer_empty(QEMUFile *file);

 /*
  * Note that you can only peek continuous bytes from where the current poi=
nter
diff --git a/migration/ram-compress.c b/migration/ram-compress.c
index f75b8c3079..b75a9d2b9a 100644
--- a/migration/ram-compress.c
+++ b/migration/ram-compress.c
@@ -193,6 +193,8 @@ static CompressResult do_compress_ram_page(QEMUFile *f,=
 z_stream *stream,
     uint8_t *p =3D block->host + offset;
     int ret;

+    assert(qemu_file_buffer_empty(f));
+
     if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
         return RES_ZEROPAGE;
     }
@@ -207,6 +209,7 @@ static CompressResult do_compress_ram_page(QEMUFile *f,=
 z_stream *stream,
     if (ret < 0) {
         qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
         error_report("compressed data failed!");
+        qemu_fflush(f);
         return RES_NONE;
     }
     return RES_COMPRESS;
@@ -238,6 +241,7 @@ void flush_compressed_data(int (send_queued_data(Compre=
ssParam *)))
         if (!comp_param[idx].quit) {
             CompressParam *param =3D &comp_param[idx];
             send_queued_data(param);
+            assert(qemu_file_buffer_empty(param->file));
             compress_reset_result(param);
         }
         qemu_mutex_unlock(&comp_param[idx].mutex);
@@ -267,6 +271,7 @@ retry:
             qemu_mutex_lock(&param->mutex);
             param->done =3D false;
             send_queued_data(param);
+            assert(qemu_file_buffer_empty(param->file));
             compress_reset_result(param);
             set_compress_params(param, block, offset);

diff --git a/migration/ram.c b/migration/ram.c
index 1e5dede6f0..ccfedf4fb5 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1332,11 +1332,13 @@ static int send_queued_data(CompressParam *param)
     assert(block =3D=3D pss->last_sent_block);

     if (param->result =3D=3D RES_ZEROPAGE) {
+        assert(qemu_file_buffer_empty(param->file));
         len +=3D save_page_header(pss, file, block, offset | RAM_SAVE_FLAG=
_ZERO);
         qemu_put_byte(file, 0);
         len +=3D 1;
         ram_release_page(block->idstr, offset);
     } else if (param->result =3D=3D RES_COMPRESS) {
+        assert(!qemu_file_buffer_empty(param->file));
         len +=3D save_page_header(pss, file, block,
                                 offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
         len +=3D qemu_put_qemu_file(file, param->file);
--
2.40.0


--Sig_/REPNuIYz/TrBygJ._t_sDNN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRBCm8ACgkQNasLKJxd
sljJFhAAmgdOmZIBnb95ZwPFmy1pcfwh1hUrJZ3Tlgiy4XDGnSAeHSwdcsfi/VM6
di2NnHQPnx5L6ka2NLjmNvbPQPAAS68/HxBN9QdfC3EVqN+rhkRbKt/XRyei855z
e9Hzx524ooVL+eVianaF1kdsGAty/j53fbwgDz5AD1aY4RA8ZFJPEkLo3bHWc/Cu
LtI8PJFdBn94WNX5xnTa05LGLhvT2tusVH/FxkH/8lxhHB7inVwp/PQ7YKuWobXz
mpoVTJYtN5u6Hcm9L5nSLjg8BlKO+idJb0UOEU6AM4a+/X4Rbwuc88nIViEB9L3l
Ea+cPTUrjXjeXzo7ue8LGQggnp8nF7NKH02Zj45w/aKItVgwOMOD7u+ZaSYC2bIf
XhuOxp6LbPmfU5tI1aEiI1HMgtxhm8u8dx6vTltTZV2kSm3cW9pWglaUwbc3E+0r
+6tdy1bJ5d245s8meei5uQ6Ri9j3VsuUfw6IHj9T2qtc66K+ZNSX9gHC13eDvgMd
E76g3VQthkbCtqEHGJArhFfgLf/EzgcrECNj9cEu+7Wl9Up6Ek8we9f2qAaWZQXm
4IrRQFJ5+kUNYYsfrcrsx/DSjZmXZOtFDhfEwr4hGzUx5eSBYu8YL4HsxxyZNGtE
/K9aufjPyzKzJ8cU/SZ2///ZOxnspGH+4CtiP+J6v2WHYZ51/sM=
=d9yD
-----END PGP SIGNATURE-----

--Sig_/REPNuIYz/TrBygJ._t_sDNN--

