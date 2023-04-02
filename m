Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE116D3990
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:57:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1wP-0006l0-Hh; Sun, 02 Apr 2023 13:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1w8-0006jP-JT
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:20 -0400
Received: from mout.web.de ([217.72.192.78])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1w4-00041X-Kh
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680458168; i=lukasstraub2@web.de;
 bh=SghmMtF+k67qN3g6avmGYkcYWDV7UwGxn9JjAkaB19Q=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=I/qF6dw+//FyS/W4DnLtCUua3KYzzQHheTMq7uul+rD5Y4KfchNf4PeyBxr28V9GS
 WzOiLEAE83x0rh6qtts08RKszh9tKL/P+oS7ZE7KeymM91FuwbyQ1YWe5ie2mht5i2
 Hv/zX73Vod+Xxn7fNz4w1ElaxJh+IiBPZr88pJbVgypcsQCJtgSKT3JEr4Q7DOt8ih
 uhSTF1wRSyu36yC7n8yWL8lsymywHgRNNFBub4kuavDahgWAYwNuFbWxtHLfXMLnFg
 VWZKwr7zmc2V42L4nIZk8mHDI/WrLPMWfNv1YBDQpUH6Dd0z3bzh9qpTy9NoTqmgfD
 p3n3DQO1B5Kww==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MPrPV-1q5FmN2Ifj-00MoWy; Sun, 02
 Apr 2023 19:56:08 +0200
Date: Sun, 2 Apr 2023 17:56:07 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 02/14] ram.c: Dont change param->block in the compress thread
Message-ID: <ba18bf4e6e143a83b588c26b83136168c8657a33.1680457764.git.lukasstraub2@web.de>
In-Reply-To: <cover.1680457764.git.lukasstraub2@web.de>
References: <cover.1680457764.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PbmHjqu+Uf/NnPxncBOgyUn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:GZSaNbf0FvnGQL74srCUl7otgBc1ZtCfWT2x5ZaHx6aP45xQh/S
 MW9p18/ZDQq2PqoScqW2lYMk0h0sauHiIoIXWJUe+QhnenzGQNeUunWTGpbPvrbzM1DicS4
 p5eKfg4DeH2+HxaQPDuDEIb+E54S3T+MslNgCjMgu1CLXg0Jlm8Ddvmh0NxqpyAHTL95gdO
 9TY7qJ3GY35733v/ucL8Q==
UI-OutboundReport: notjunk:1;M01:P0:KGX0jphtKmY=;A4NhxOeqBuOKfqKXHueMJ8KD2v2
 67maMttj1hu8yLtQhRoDisXmn3CLXJtvlvSQlUdLshbSLC+Sb1XGnI+d2iIlYsTnXMPx7LJuF
 qBuDDb13ZZff/tLNIYuKj83M9n7NTpendsM6HisKdaShM5LbEsOf+OlSOSPpm88nZWjUeF2fy
 YgYG6t/TiDvPqzZW8ljh3mpRla8HQ+uw0NoKCEXDdHm22GWbCx2ykL+/6kjwuqZgMq0kNOwbP
 s3DiE3mVbBsNlcMqK6ay2aTbRoZnqUgOrnxGwzcG14TCw1EtYzhUyBofEi4IkZGNaIc0n5Tdf
 +YopDOLaLGyi6qqcZAyqKfM70+PJGbRHOODHENbWPj0wgTasMkxcoVQGNYhklm8GfnWDg18f7
 a+UFAjlWnQyCSsDvnhHEF5BsX+hccjed7diPYNNjLkWqXw/UfvckeW6Yj8GDDJIs1NlMVbeWx
 l2b+q/7pZm/u3OxDD+wonxAJRoixbSK3hXczynqmu/7exPvoqc6RUUSRCn7LbbzvTlHb4nGi7
 ++zztpkFOLyS7+7ooop8Tl8NJO6ncYwIHtqRdQGHLav4sFnUa9ujSNN3wQPS8rhl1TdIWCugb
 N3ThifCh8rRRlPKYhPMuMW+0Qxr8W+zyH3dSS2JIhhmZ4zOtAr+YJqtIUzrs7kKuQ3f4uo/D7
 k3srvEGEN1+2NsxAZc+EsZCGedm+fgkEaWc2YcAMmoV0n8g/PhU7DepUVgJcvtJlvdcc1sk5K
 IklYw3OSThOD+QiHZWu+cfLvWKlvqHB3HUQ76xU3mINy4NI1MyTLfgkYDIJnOzfV+gGvlZxow
 rUqPY5ZrxriGCXg8Wacvey1qt7tpsnJRWK8vNBq8RYhrBv5FOffBfZUEwsledhs9B0dqnT/60
 6PMiciLRFCGt+w7csdyA5kQPCHIgE+U3gSgwMXQt/IFAFwmnHvcIAjKOHeoRoDrXzWg3ftRcD
 b4rnLOFB+oB09PuwoC+o/FwGUus=
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

--Sig_/PbmHjqu+Uf/NnPxncBOgyUn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Instead introduce a extra parameter to trigger the compress thread.
Now, when the compress thread is done, we know what RAMBlock and
offset it did compress.

This will be used in the next commits to move save_page_header()
out of compress code.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index ca561e62bd..3c9fac086d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -503,6 +503,7 @@ typedef enum CompressResult CompressResult;
 struct CompressParam {
     bool done;
     bool quit;
+    bool trigger;
     CompressResult result;
     QEMUFile *file;
     QemuMutex mutex;
@@ -576,10 +577,10 @@ static void *do_data_compress(void *opaque)

     qemu_mutex_lock(&param->mutex);
     while (!param->quit) {
-        if (param->block) {
+        if (param->trigger) {
             block =3D param->block;
             offset =3D param->offset;
-            param->block =3D NULL;
+            param->trigger =3D false;
             qemu_mutex_unlock(&param->mutex);

             result =3D do_compress_ram_page(param->file, &param->stream,
@@ -1556,6 +1557,7 @@ static inline void set_compress_params(CompressParam =
*param, RAMBlock *block,
 {
     param->block =3D block;
     param->offset =3D offset;
+    param->trigger =3D true;
 }

 static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t off=
set)
--
2.30.2


--Sig_/PbmHjqu+Uf/NnPxncBOgyUn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpwbcACgkQNasLKJxd
sliJVBAAqFeRAurBC/UQEIgu4mHvxem8apUwRhXFqGFJyIulnMfbgONBTBVU/jKg
GYWfpWcbHzNDzGSQVDfkEuTryottudeP7/JlfKo3fUJAV23fDP/xtMfciLDGASz3
MBRkPofkrHKNrWDa28TopHt1HLym8gBJHQQ8ZAjvEiqWQiTiae40gOiMxsrpOIfp
XQ9+Ia7X/lZFEX5Is3PhmR1Nz1gMnVyoEAZ3yRsBW0+XT17WVCWcXUwNZ1rGOjH+
gHIeh+qWbpQ0qW6uh+89Id22s/iwcnYO5Ve2BQGCCAi3l9guRvPOFXD3rjJz8Vo8
Nr4lnmMwn8vJdiACa+KADedh0syGNV5g6s3MluSRWXWuCTv5FH9edgDnhLOtifIf
2fcgaiej0YY+K4sR1TF8vWw8X+Pc4xkKXNYLI9S1HtTucPKZ5A5QRnLeEobyVFKv
78lPVPth2PvuH5K9NJt7W5ZgJe+T9ox0QIA9zDvhChhP2TXhZQ9CEOvAF2lS5kgf
pqAX1nRXQnDxSJI9MD0RLcJqcv849dRfCIkvpRRaNIuP6774xjQluEa0g1aLertk
KW9ZexRBjESJA+ncc5RskdnEw4rDS9J55LoC5hQVLDvgeDKLHjnWVAZ4JiubOkre
VVKmXt0rDyQiPvXGpAIkzK1vETJPa6DNeRZsqbLHJVvxXGSAExM=
=6OBY
-----END PGP SIGNATURE-----

--Sig_/PbmHjqu+Uf/NnPxncBOgyUn--

