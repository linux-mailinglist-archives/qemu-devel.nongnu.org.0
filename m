Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947F46E8E87
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:48:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQtr-00079f-Tq; Thu, 20 Apr 2023 05:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQte-0006kI-4i
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:12 -0400
Received: from mout.web.de ([212.227.15.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQta-00081e-7d
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681984081; i=lukasstraub2@web.de;
 bh=eLFJoHY7peL+SKZF2sPs8aKtSRtjxyC6z9ykmJRSQxE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=db9iMjuURlMO8odNKtIdvRW5sUsr0xwGvhjeeNaNBiBAsPp67NqscWTXqNXv6CEzx
 5n+U/wm54HWqFE9xP7daemXqiDVlIRw3Gu5Yb39C1Z9kE9E+f80qRvC6yvWxfy3zSP
 7/96zk5fk/JbHFEPeFS6b0xG/OjfWKd28hdP0AVeo2JIv+ZK+UvVbNZ5mXlVeEV79C
 W40wm7N/SKiHtRQOK+qyjj6x7Fz5FqQwE3KXruZ0R3W65ZOKDhfE0HQ6lF78qUygDQ
 zld/t6ucsU0yZFErpoxg781zMz2YtXBbhqdnmhouxxPEUceisI9379z06LN8mYbcQh
 immhmCREMWbtw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWzD3-1pn4R607Dt-00XJrY; Thu, 20
 Apr 2023 11:48:01 +0200
Date: Thu, 20 Apr 2023 11:47:59 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 03/13] ram.c: Dont change param->block in the compress
 thread
Message-ID: <e77d30005c480b79e4bb17ce67d651b621112299.1681983401.git.lukasstraub2@web.de>
In-Reply-To: <cover.1681983401.git.lukasstraub2@web.de>
References: <cover.1681983401.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C+TqE/eBD7dTk8zQL+MYLgv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:VTtd6cfmwvXWYVQeM0Ep7/hvo8QQzRQK6TZtavl+2j1E3kpwmNm
 3Tksjcbupkd/jPEctp46Sh+icdea2wvSc32r4qlImv0zXkE1AXnVklnZ3NNpemV95GKtL3E
 g/iLj1l/mpEAzQw7f30y+NYAflSJax6lXkl+XYrwcLuFk40vngNEuEoakb+VeJOMslnSlZy
 q/fvmK2ZXqlq3uOMOWX7A==
UI-OutboundReport: notjunk:1;M01:P0:FVzsHSdw788=;HidTxsaqgeSiNQysgXZdqwOvLdV
 yKYjygK+fdRa0f8Bi39rAuWYW3ABlq1WEXJQbCLf1SchpRyUiidR/g2RsgYFdeOjQjPlbyiI5
 VzJU/VU//Ea8Nxkhnh0a5k37/EGLGfRmQ2gZGgMaDnhBcwXeVsKNIoSuMG8GM5CF/Xa1/II0Y
 TpzR8pvmF4VNOqp+HLzxOmCieW6K5u+pg3pqOhdXfv8I33rxKfYJehAt4KuUoF7Ivqu8SBRMJ
 6FjGxLiuZoa7+GZ8aS3kVTHYHzc5Qm8yyiqMRaM+B/tV6InwAS4AGj8Rvq9CHAFVlr63aRqXr
 MPJKe8CMa/AxlERlxw9UO+C1CL5zAhUzNlmw+dEZxa0liDcJG8uaPYmFlgLWAcCLRgP8sIFMA
 Nfq0AiJCIrLtyAYd3d0WdNx0r0DVmdUQBGeQ+Nzwiarh1xGOPEOvQsoCgO+Ux0b68aEBagkW0
 /3T7ncrjKrRUkcvcUXN0r6YjJB6qfS61lTyss5LrvsoCiT2QexQE3ZXKiKVSexlGvg9zX6eDc
 /oMYvImBWS0KPVl005MQhANoiLHb1LMqztYTIbjMEPlHUedfq2Jc+VKvldB4V6Evb5OWMjCdr
 S1q0oQU4RaJxkB1cNmg9yJg5nmrN+fh38JqV5Tcm49b551wlTNuNTSM+vV9VbqooI2idfWmui
 7gAq/2AsFZ7du6Awwvi7uqEvfEfFa2DCj+tkkw3hZfutctKVMxnoE4/+/4Vxc/5stYDUqOUCq
 sJNgNSxPAf7OdOSrpnfetnQgJ2RVTImfL6Dw/pKV+egSXt7kw8drFmiOYb4TDmY1H+uPYVjR3
 QzCkjjqMsmBIgTUf956fY+U28olHKRaLrBBbrulje6Vm7/eFVP/76B6QPj+gxzdnk8QOGprlP
 6l9oOELo+o3onVtNuPi+P9OfznstFcva8tA+MbFZjyni/8rKTaKSyUQDXq4I1qh9jFxlkNfKo
 PS1BmJdRWAiAtzT/h++6LNInOJk=
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

--Sig_/C+TqE/eBD7dTk8zQL+MYLgv
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
index ade6638a96..820b4ebaeb 100644
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
2.40.0


--Sig_/C+TqE/eBD7dTk8zQL+MYLgv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRBCk8ACgkQNasLKJxd
slg5Qw/+NROUst2+fDV8s+qGPSqqkppVntNhiTkqXG3YOmAIgrobVgeu/rgk/1aC
Y30wgaO2vL0JVBBY0nzs0FL/Mj3iERpS/OIkeHBDBMRBX1WjnIUblEI/m6ZpNS1/
NIeGYi4uCAzo4UtCXHLwFawwiT1bYjKXIukhm+kITje9x5mPTfZBU8cA3YFSCV9Y
oQ0rSi4b18aX9AK4pq+10PhPNhX4OALsygJ8Wi4S4OKnoKCDty77JRvAcU/R6Tjy
fXc5KqI6dUq336RTnDRnJtzeOk0K4F+CllNNVS2MB3wu7KJ56a/P1PdKppaJiZ9c
Y4m1XhAGkfedeW3oC7mmWKdjftRq7BGjykXrPDWRoLbTKXOSiKtvtTioulbRHFaq
50XxO86pLIWDKuz2BGHP80YQweB/7YimakYExp6t912gcXhMSdtHe0wzR7aRnevN
BKRu7cSsTLHyB6g9EazLHVu0BxEa3Ay4Dd3owRHOGcDcqvrMDtoOqfs5Xxd3n9fL
I+YkFtFb93PQ5/nZ4KhFkS0sxUF5gdkq/YGChpRPaZ2l3pXYdbzzX/LHqdX8v1bA
fc8FAcyAlpLsHq5cHdhm62/AOZeiad+++IM6cFnPHM3wlv9g2Sf9tqeeLw8YjqNp
HuekaCuTwQZ6AJs8wwVyeemOpgPIyu24ouokxjCmuIYSCVaFLoA=
=owzv
-----END PGP SIGNATURE-----

--Sig_/C+TqE/eBD7dTk8zQL+MYLgv--

