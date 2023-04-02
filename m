Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E1A6D3996
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:57:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1wQ-0006le-6n; Sun, 02 Apr 2023 13:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wC-0006ja-Al
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:20 -0400
Received: from mout.web.de ([212.227.17.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1w8-00041x-JG
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680458172; i=lukasstraub2@web.de;
 bh=Zl43xFvhmrHL02KVD0T64DTHYdt1e2LpEi37q1WQFJE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=HqUjGos8bNIatz1hZR0vYld93WB7QmlZAHHGhia+6csJt5yDuF2PLhE9Ay+D+9Olc
 ZFvexuKogXbSiM0hKZXmUUlE9plWieeGegM+3f5SoOUssDyukgeXQUMJvb9DEwf0DQ
 mK6w9m+QAhBK1kHdC58x+5O9IeP9bgVyl9PGLP06HD8W7ZxVUaV4xKajLqCxTGUCEY
 WX2Zufy9G7ljmXyB3gTWZSutDBSUW/KiAOj3jvfS8kOzfn4ZZ6N5d+/5fRQ/Fr2xan
 +iLMSvp75EjKY1o8uZjQ+fXQvMVbtedCYkkoxtkrzkUfBdn8S3V/RPUeQv/BmMVs0m
 AHQnMuC/0O+Ww==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlLE7-1q7xgH0EEH-00lIiG; Sun, 02
 Apr 2023 19:56:12 +0200
Date: Sun, 2 Apr 2023 17:56:10 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 03/14] ram.c: Reset result after sending queued data
Message-ID: <dc6817992c76d4dc797fdc8ba552b19ed1cb12c0.1680457764.git.lukasstraub2@web.de>
In-Reply-To: <cover.1680457764.git.lukasstraub2@web.de>
References: <cover.1680457764.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y5ekuWsyL3aIQ/YbGDsY34q";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:auJw3zuiq/zuUpAOTlg6tp3Jm04DEHGN7dGXULIYk1PkFl3rVKv
 o0LR5xo+ex3QGWVCOpasGyCAEd61q+3/8jMz8Hjx2v/xJOiTJb13odiAjLjuoE/rUBReoo6
 0zXoK846dh9DAxjlFs+xBoGopg/yvdwp9tG6mcfTOBEJzeaFagITD0VZ9HKldzjj7HLwoIW
 7lyjVM6gpYaKhKNvMEuIw==
UI-OutboundReport: notjunk:1;M01:P0:ds5IlzkpFRU=;OBTzctP5QEZspK8e2+PRMiH2Sc3
 0ZspVyeafGwNVSIzBPr6Qe4udSNto9TpUkYoMaatR6Ig5RoJr/lZvkxIIWeDLSLx6Ohq/0moC
 cbliX951mx+AcTahJFxOOH6pVhemTciDp49HYRB5DPnliib1SzqCTXAagzkCgCUJckQTBKCP/
 nl3YiIPjl9W9fOLSLKIots3fb87EnKOQH8PX7EvgfuiIURw/S24ja95iKV38veEl500IOs+/4
 h878MjVaT1qoRgJ2LLFQrqjSTznDWrcyMZIP9EShyhW0LpQXJFU0unD4PbetI+7B7h1+CZNNW
 Vg8GVJYTgYlgulxnh141/V8RUaIojVs9LZLB4I8n4nI+ICxK4qbL0kiZ6Br5wIniHnk7n9I9Q
 /N0RiJAMxb4RZhfNCj5AEhaiqpLVgbS2rjCwMJhcCfLQaCoKQMlk3uIVVHkVziFEk8TwhPM+/
 W/VcBmJj272uC8DguJzl7ThZqMshjSv1CVD22BGBq1yBus+d692d1I7zO9eQBodIuxUZUrHBk
 S9S4N0hCFypijrj0RlSzdkPNxDfDkP+IfrHvTVld1st1FsR7HX/1OhTTJREVm2kvKhZEfCLHA
 4zKbr0I5aLRwLsFJmww5+774+lOARMNYPcQwHuthqB7dKAPZEoLnU9DirwDmR6mbVmG/GjN85
 ijKle7Qj0JQ9loHUgktmXkgLLU03lcKs/von3FIxCcwiPcSTnGUV9D3r6GCXGYljnGBtbLQbs
 dRgGGPHOFdOvx6TUksjGDR5sG5U6m+yNZAsWetp9L0x9NIiaYBOvvYQAHXukEWC9ntTandsPU
 pmIotvreCDsUXrLUhWvU12xTT0XxhWEdQYExj6/f3yySOO4+Egb947xY31tUWz9lVDZXJQImx
 nKkoIm88R8uJ8MS6SrXtCn4b3zK31Rd4U3WkbjIAEIksVl1l8VFfTb16zo13F4ZnrK1oA1dd1
 5vjRGkHHELNqnMYOU8W3b5Ajaz8=
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

--Sig_/y5ekuWsyL3aIQ/YbGDsY34q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

And take the param->mutex lock for the whole section to ensure
thread-safety.
Now, it is explicitly clear if there is no queued data to send.
Before, this was handled by param->file stream being empty and thus
qemu_put_qemu_file() not sending anything.

This will be used in the next commits to move save_page_header()
out of compress code.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 3c9fac086d..bef6292ef7 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1519,6 +1519,13 @@ update_compress_thread_counts(const CompressParam *p=
aram, int bytes_xmit)

 static bool save_page_use_compression(RAMState *rs);

+static inline void compress_reset_result(CompressParam *param)
+{
+    param->result =3D RES_NONE;
+    param->block =3D NULL;
+    param->offset =3D 0;
+}
+
 static void flush_compressed_data(RAMState *rs)
 {
     MigrationState *ms =3D migrate_get_current();
@@ -1540,13 +1547,16 @@ static void flush_compressed_data(RAMState *rs)
     for (idx =3D 0; idx < thread_count; idx++) {
         qemu_mutex_lock(&comp_param[idx].mutex);
         if (!comp_param[idx].quit) {
-            len =3D qemu_put_qemu_file(ms->to_dst_file, comp_param[idx].fi=
le);
+            CompressParam *param =3D &comp_param[idx];
+            len =3D qemu_put_qemu_file(ms->to_dst_file, param->file);
+            compress_reset_result(param);
+
             /*
              * it's safe to fetch zero_page without holding comp_done_lock
              * as there is no further request submitted to the thread,
              * i.e, the thread should be waiting for a request at this poi=
nt.
              */
-            update_compress_thread_counts(&comp_param[idx], len);
+            update_compress_thread_counts(param, len);
         }
         qemu_mutex_unlock(&comp_param[idx].mutex);
     }
@@ -1571,15 +1581,17 @@ static int compress_page_with_multi_thread(RAMBlock=
 *block, ram_addr_t offset)
 retry:
     for (idx =3D 0; idx < thread_count; idx++) {
         if (comp_param[idx].done) {
-            comp_param[idx].done =3D false;
-            bytes_xmit =3D qemu_put_qemu_file(ms->to_dst_file,
-                                            comp_param[idx].file);
-            qemu_mutex_lock(&comp_param[idx].mutex);
-            set_compress_params(&comp_param[idx], block, offset);
-            qemu_cond_signal(&comp_param[idx].cond);
-            qemu_mutex_unlock(&comp_param[idx].mutex);
+            CompressParam *param =3D &comp_param[idx];
+            qemu_mutex_lock(&param->mutex);
+            param->done =3D false;
+            bytes_xmit =3D qemu_put_qemu_file(ms->to_dst_file, param->file=
);
+            compress_reset_result(param);
+            set_compress_params(param, block, offset);
+
+            update_compress_thread_counts(param, bytes_xmit);
+            qemu_cond_signal(&param->cond);
+            qemu_mutex_unlock(&param->mutex);
             pages =3D 1;
-            update_compress_thread_counts(&comp_param[idx], bytes_xmit);
             break;
         }
     }
--
2.30.2


--Sig_/y5ekuWsyL3aIQ/YbGDsY34q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpwbsACgkQNasLKJxd
sliQMQ//WnagVPkldHyl2fT1SttbWkSU9cRsXKhI0uAfSXc3wod9yIncfQkiqHFT
8BHT5EB7dJBkOQ8LhDe8RkAns5n0CbAtiu8q0+XA+nb52KXTrCToEMwfBWYpLekC
sOHA+F1KQs4hWU9+HHSD5XrQJ1Af+u2MklA+R30D0wYKQzrib6jqZXkQbDQGxZtV
L3lySECv5YrMPilOzWtpjNXKhHn2WaSSSJxv4ACsuQMD9/oypzX93BkkVRQBpBdU
ngqDfGCD4+Zi+NB/hREQwHvFmThiyWK0VVOha3OG4MxywZ+dgIYi0JsHfGRbpQgT
kOnMgwg8uONbNPgCt+CEwNS59TcicphesGIN32ZA8rDU/usTc/zx4FyJu9kHVbc7
CU8Q7245fhGJka88obJ9VFZGXYEIrrY+NNjbVphsnW8TGsgoVLDXGvWCIKj+yVCR
pjV5IGqUt5RNS2IYM1W+vSx90FVK8VJYnpXDUJUQ5CtAWLmAI83ISZy3bFFF+9Zc
19P2fewol6StyQmHXCf5VfCo3y/RmecFddGed6XcLNqeunI6z6kAQTjyKCM00vdj
+akRm8+/KcgmN1q3PDrJmx3nc4965QO3HQuV7CLI2xMTAOGCoxQLLdS8Aqf7SDUS
7OSOYmr3zMhsE4CmFLoewncVfJVDHGu51eNPSK5OWnOD8122KHI=
=B+m+
-----END PGP SIGNATURE-----

--Sig_/y5ekuWsyL3aIQ/YbGDsY34q--

