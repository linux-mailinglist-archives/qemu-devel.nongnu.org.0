Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8982B3495
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 12:20:46 +0100 (CET)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keG5N-0008VE-UF
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 06:20:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keG3w-0007JR-S2
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 06:19:16 -0500
Received: from mout.web.de ([212.227.15.4]:43265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keG3v-0002I9-4a
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 06:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1605439144;
 bh=DWWz3RQJAiKf+bWo3KoTKX1phBYkYcwBFKWPtTGuopw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=NqLuj3CkJabIqs4QBsGDMBCt3A4Z+5Yi+OaLau8vpusB0u9NO1uCPIZRZci00nqHb
 yTSRXAcSgoca5NNZWZT6Bf5+9AbwktY0s757JnFyhyKFeuu7LOOZiaeEyDGAaS+HDe
 F1pJzq6LnEF6ppSEO6smUBYh9RCZKXcqbTjdr170=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([87.123.206.172]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Meler-1k61Er1fWf-00aePw; Sun, 15
 Nov 2020 12:19:04 +0100
Date: Sun, 15 Nov 2020 12:19:02 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH 1/2] net/colo-compare.c: Fix memory leak for non-tcp packet
Message-ID: <af6051bf9a72151cfc5e7ec8c72dedd30ef6b332.1605438886.git.lukasstraub2@web.de>
In-Reply-To: <cover.1605438886.git.lukasstraub2@web.de>
References: <cover.1605438886.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tKfYi5H=/0NzxtYsrXhxoYn";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:QpbuwVIbQ6Lw53/UnQUPsurCn+zp23kMKkhkk0jMlfOLP9L6VQt
 HQZv1LT5D6YVa2zG7Q5ia5g4aL+omkRf+RJAejBftkFcyyZ98IbQp19FXKwxyd0DaeaC9WS
 twsoLfEEeYh4TJrCUSPkCGyxTyL2KCYpZpuqReWf/odFnGZ6Tuo6ufIF5ojG0Va9pAFJKed
 CiUkj5Bhlsqo6tqcfN9Mg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dm5oMXAPeO0=:/C6SqKXbdMUDR/d0aJvY01
 mHpIiRamIqyJ5HCqY9IuI3CKNhBfwZiMwxKVFHtOI/MZv9/s7uHSLTOObRdJJTtCa99f2w2kd
 NMTEQvrCvnTcszk8iuO6gtWx/dN7TLJVrfdVVzheOJ3USPn/LiIlm43tb5tfxs5dx4uhMx4Np
 xVOwJYlVv+umJlxy52hlWI7aRwkqV8MMeABcBqfNOrDjobjqsy5tOXkTNQqNRf4ctBPnaMb6B
 LqGm1pThWTzO7vJnGXeRW6PQ3msr+tjclPoEZoq8cQxkjYFn0WytAwlogGszcE2izA1HpFEK+
 Z9KG3RbulOW97buSEAugLJp7+AtCF+0dprBv2ZTp5co0iI3V6YI63Pjh1CtJcxXCGB+SlPtP2
 E7ygsb41Q2pDdqB4hbj8dnzEMNORYDM8UT//xMo68IDDvym92W/J5QAGvD8MUvdYFNVMCXz8w
 lHJowBe4LmebqnZpoI7iIMPlglWrL99uZMkFa4hHwo45R8wr3YPoGEz/K9vUxHo+rUUgNBP/L
 3rRkF0D1NwgOuGTEpdEtEcDHem76UTDvwJ/WfOAB6CD0Suyl2Cj1P0PZ6EMfn1DGwaE6ECUbX
 2LvQN8AyHEBd3knZAh6jSJsIxIjCyiRnqpFyVgx/q76EjJEfZ0wM1LbrcyGU4ZQnOg0BfKIjJ
 FPY5F+GbCQC/rhwQcJpglD1kjagVti3vF60lVJ8JFkXDUyeIPIJGHB3QCM6TUQzULKFdUxiI8
 0TcIdziPKe/OTJ/k6HxhtfBrByXW+XuhXxRE+DmsUgXhIrkaQ8jjS2PV+1tEldZW+mKgCQkil
 kmmVSQUfzKHxRPgf3PyPny7mU31eyq0un78mn6ddAHRgYSrT3SD6VAKxVJHPtzP/BXatBrj3/
 1P+R+AmmXwdyjYd2h6Ig==
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 06:19:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/tKfYi5H=/0NzxtYsrXhxoYn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Additional to removing the packet from the secondary queue,
we also need to free it.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 net/colo-compare.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 337025b44f..eed0fbb27b 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -690,6 +690,7 @@ static void colo_compare_packet(CompareState *s, Connec=
tion *conn,

         if (result) {
             colo_release_primary_pkt(s, pkt);
+            packet_destroy(result->data, NULL);
             g_queue_remove(&conn->secondary_list, result->data);
         } else {
             /*
--
2.20.1


--Sig_/tKfYi5H=/0NzxtYsrXhxoYn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl+xDqYACgkQNasLKJxd
slgTPQ/+LG4mrN/zqhrTbW2jhrE/mEGbge/xnZ8tHVITrkmqiW8mP363av7PQyjM
XijOmnB7Tr5STe1VdcnqEP5bHKAhyy8n8GBK4iNkc48x3Jn38/C0HyEx5WX7TDZe
ld7RfBUP+6Us72jd/pDiP+usv/UZRZ1MD752lnjbmh8rBU0Z+DTNwgkNLjGs39Zh
VuKw4FpeATs/M9+FGAtfFzWCY+hwqcm01Lw5khlTdGga4w1ViQYdhxCN7xkKAUw2
aoJIJRU/7rnJwJQtg4FphTGsW7CDKT/Tbe4qZ/cjUJgPF53sdrNZs8jiBfXrfFxi
QtOPVjvi+1QdeJuYmIi7afnrFYXGwaD6w9b/+M+7NnRan+6UifzjbIXUkZjwUsuA
74lRLBa4Nh+raFoOauC7i8WAsHMrNnFK4yRLsV42avqzXfi6LrPopKk1D6N/3ie0
nV6vhvzdXrwLUpYcFmaBkB75nZu0nNCOcjjQ1loLv5tsiky9sDCEEQ37OM41NBN4
UyRbGQ0eS79EIo+HQdJvCTHQp4rBORgEip8EG9GffRqw7Trksdt5P1N84YeCCqnK
oTNj8YYW0z4xQfzmQUzJRMV4bE76rDTIqsASsFZhhtjKv2ku0X/QLrilfNo/uBYq
r3SRrn4dQ4SU+J3qdz5qWhm3FdI3EjNBUlCH4QgYC7gA3MLJWNQ=
=iG7z
-----END PGP SIGNATURE-----

--Sig_/tKfYi5H=/0NzxtYsrXhxoYn--

