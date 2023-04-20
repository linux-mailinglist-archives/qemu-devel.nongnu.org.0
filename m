Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945AB6E8E88
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:48:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQtr-00075v-Iy; Thu, 20 Apr 2023 05:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQti-0006nL-4b
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:14 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQtg-00083A-DQ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681984088; i=lukasstraub2@web.de;
 bh=+fdw9q3h4EKpOAB+Z4itrIGw77JL1zPkXvsYNoHRZyM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=XiUUrDdl9HOzgHAqAyOVwEUQv+nq0lsuCjE5f97PCX6rMfuEQC8cJ8ygcLtQuSWy4
 j6NU7aMS0jcCSbpc1VlmMNjmTCw25J94KccH3pEioy3xLSq3u5nQTavlZU4QOC5UsN
 lkZ814h33Uuhy1TKzSe4d4EnuHwvjZcP2NhECK31vuoGxYXY/zu0xMFh4uR9azZit1
 5GSboTpZQGTVV3kd6YDZsCq0NFAg2RtYpQd6YL1x4Xt8T6rtFtEY5g7QBZDlJXfl6o
 QWfKJ7Y0KBEHTJ4BpYlv0NyZ2tzj6vHm+0Ic9BoeEihkE8mQ7wsZPASR4A8XLjZk8t
 qFK80tJVmnz8g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M604t-1pwJa84C4J-007I00; Thu, 20
 Apr 2023 11:48:08 +0200
Date: Thu, 20 Apr 2023 11:48:06 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 05/13] ram.c: Do not call save_page_header() from
 compress threads
Message-ID: <11f3eccee34665a352dd2917c5a662dab8ad528f.1681983401.git.lukasstraub2@web.de>
In-Reply-To: <cover.1681983401.git.lukasstraub2@web.de>
References: <cover.1681983401.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9TFDw7wf8Ylnou9Au6mArZY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:Jco2ACVW/KFDiJbCeHHxX+KeybfArKxTb4WTcfFhfDqEj0UjZ8u
 xnxIr0QkbCCIqk4HvjQ46TPcuHigd6dQarpJzks3ezmkXun9FsrtXMgACmCLLJIUA+K/M4R
 RY+xB0YHJqZKE/FeitxEdeLTfFdwkdrYUH4iFRpDkfBaw/Nf29oUrn/r6VuiR2sk/SP8PHN
 KdQXw3H8VcSt6G6FaPvGQ==
UI-OutboundReport: notjunk:1;M01:P0:hrLN5Vi/40M=;NbZc95AqKigOq1hufRt+yPtqHZA
 qCJ41xDEnoHej1XCMwSesa4sDSWxZp87RPdLOHYV0H2HBZ3LCnerYYXohAGguGsOq28Y+lDVl
 oIAwdcYHlJSWYHjeEpGFaZjoV+AhCvTInVbyksUfFjaxqv77RkXkkTLIeLWWDS6WkoGffVTs+
 nLdCi40Qr7iprHH7McT4Pm/yMyN6IqEZdIpzq9AWdnYtw1xamiqVsGbxlTqRZNRCUHcboEE4+
 w8fBvCQCPZJhUsyMOkKKzkNTfX1kyu35xfbTVjNqjLF+cF0IzMCS37SF9zhjFECA1q/WQka3E
 YMRAj8AAi62FqRYVCzyqXaQ/GjI778zcpVi+6k1tXIJq6NL3LW1vvgi3jKtupn+ElJ/moekgw
 YndVSqi8JimcEgWOkO99EvQcswf8tJgofAm3ULSbCPPMpKgcYZoF3lkKvb0+Lz4pA3iBz0NcC
 f4quNjIVsH1kAm2dO3iuh3NBFVbu+y8kC/OtOs2y3SXXS8CxdcwgSuWDZgi5iXe/aYksMQXQS
 32TuiWaE1x+xP110M6GnGx5RAIVKiLIVYNUB+HebrdCS/QwT34Vo4gvP6DoHhgW+hncDw7Cax
 /DFJDM86ZpCM8yuJR9tS1KK/hTIqUFF8DUhPl+yYVwDobQYJax9LpOy7QI0q/6KIZJS/dIQMk
 U5MZWxFnP1z0GRGJH3kMxNewkj6HdJgBa+hdryR0thwaUy86Hz2RXprnvGFPKQBMxO0xvLLc+
 cpObjKhQ7kPZ0PGt3Ffe8AC0FXnCgHE8JoKKSHb9ho9RbtBO0RQSLhSSohbKlG6AcT5bpBOxc
 DvT/ud++fUr6b4CR2T451QqZ57FwmSpREs+r3VLNQF+RO5Xl+3gDJV1O/oypRsFYwDH8MT0I0
 Z9Ij9pi1Sj6NBGxJd6yhFD0mRnPxb1jv7SrcT3+HSfARJSPjKINlIZibPd4T8/AE+PO3zPuen
 sVfV8mcHnHH6J44PYtHCWUh+Dfk=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--Sig_/9TFDw7wf8Ylnou9Au6mArZY
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
index 5ca0f115cf..d248e1f062 100644
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
2.40.0


--Sig_/9TFDw7wf8Ylnou9Au6mArZY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRBClYACgkQNasLKJxd
slhXhw//eiO38kZivgoS3QGUz9bFtebu2EJgY1eP6sOUuZqQaprwI0Aq/CCVtI7T
xD80jXPuPlhwz4hJzualuFTChjmd9H8v84tHGatWZoszjJXOJh+ZyKLiVDr0mzAp
mSdh5hPblQzYojQMylZR37h2+LTO9VEb1L6FPT9ZLNc3chW1vPnN5WHjxItNOppo
sJrLVmRdwAoWs1Alh+0Jli7nA6uyJOTOBtvduCXgluw2RxB7F8rj3K6VEn49OFrZ
7VWdRv2yi5AvPl/8g806ZZedSn3YmWHdnWuQbaOj8GEnh+etrNmuIgNGuWoqY9QM
S9IUTQmRxAhf7xISusbtUMgJbWuSDdn30mVXqFVS0dlMzkP9fJy+ue0BylaLO2TE
SNkr4wbzo5Kgn0IuyL0dYdkHYeITlH9LuG7qCmFPmTNvYmxYkSW6B6djnPs4scah
yJBFCNxGbfSo1R/QG1OJDGcCLmJFe4NbTkZ+Qt0GyIYTUHLbGRSuEc/Yf9Qdfmo+
u1V3StLA2gl6hdD0YHhMPuogxtEW9kw+yQJHL5E8f3Ns18H8Z/7J98RQ4XpkVJh/
VdQhIOyIzlWmbrofLeQJzFZLbsAcH5mqZlbMxAotxVKo0bCVocT2/iBm7rlNJ9xR
yji9MNFwzdDz3ZMXdLeEgYS4HCta/1Bph7NYthnCiAtrwXnLj4A=
=QJrG
-----END PGP SIGNATURE-----

--Sig_/9TFDw7wf8Ylnou9Au6mArZY--

