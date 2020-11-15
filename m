Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EABE2B3496
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 12:21:13 +0100 (CET)
Received: from localhost ([::1]:40474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keG5o-0000H4-H6
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 06:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keG41-0007Qq-BK
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 06:19:21 -0500
Received: from mout.web.de ([212.227.17.11]:37853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keG3z-0002Jx-MG
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 06:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1605439148;
 bh=2m6KLdz+PYWruXNprCZ4fZAwrpa1VYxIyz6mC92iSzU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=gNDt65CLUuBsJ1S1w+BYiHjEG1EEnF2I+8iuINeX8rQf603V659CH8UsrvzKpkjt6
 6kGC1pgokQ1854/8WRnorSoXcOu92pr/SA4IT886C2FG+f57lq5TAZR1YKNgFLgaRV
 Z4EZ+a7Xm08yQYC3UdN5uDDcBucEiG3aFrnBYQUc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([87.123.206.172]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LzK61-1k9RYz26nB-014S8l; Sun, 15
 Nov 2020 12:19:08 +0100
Date: Sun, 15 Nov 2020 12:19:06 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH 2/2] net/colo-compare.c: Optimize removal of secondary packet
Message-ID: <fa4d5eb0bb2ea3f247af5bb7792499cf9cd56a14.1605438886.git.lukasstraub2@web.de>
In-Reply-To: <cover.1605438886.git.lukasstraub2@web.de>
References: <cover.1605438886.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nXZRJHh0H4.xT0z7A.TSjk6";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:CRXYGbgtRGVUABxcV2dt8ggRkt22pFWJZxtYEItfzDOqgn/rGLX
 eKaAmx5eRtxFYzQX4nszp/wr0GuB2N/LNPppyayhKECk42HJ8MrRXicdr5ntCkUcon1ElyT
 ECB6ckC5Smt75QGxMNpzC0YR8XFab3U1E2AEtwz1UseQqVS08WbWbRZ/04W2NFlIA/CCnXN
 bf0/ZUVMXqkYZBJkqLK4Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/UEWZMsvk+c=:DhOHJKVrbXKBbd6khonrC1
 K3NR82v/2JAeaw6+wOQOa8K6RaavU2tKY9J58ggEhrgyIiAwNcJIZJmPT400fRjN2M/5EsOUx
 Wq2Qdxyo6yfsAvNktHTwV2VMnuBtxLSBiua67MbIF6O3+szFDwSOBb9MU4ScJS861IWGMxao8
 hFL1AW7l2ul3tecHIKOV1a1s6nudoTRhhvNiLbvt3FJeh4y0kSVlMS4cXDrUa4TezDZ0Qq8yh
 IPLQ/EIJvvOH5Cgsff0HT5/i4AHKcCorL5zaUIcaNMfgEjaYvAnvUhr2FHwjk3BOh034y/2o/
 oiEaUjb7gX8SRAEKql4HkBs6pDZswMU/ufkHEvb12Av908IUj+icnaFnqIPp2uGlHiO67npCB
 q2ZpRxi75wQUG0RcVcn5E/4VetrPAnm1XLCfTQwloTpsmi5HPDL9Gzb1qEztTrHQnFpbTZXib
 ISHpljTjf7ySFvMDBa5jc2ppJzlUyVfwaqTAGCDOFZO1HI2G7yhwD5pt7w8ZDcD58sNEibGZb
 QvVuxqjToMUVc0uxUOIiTxPPYC5MuFc3Hdd87j65jDp8hYuWtUjQxNKpXNKHQVTj/prAC43/Z
 IpXaHf/gH9n4Ngl1YRCuiz8q79evjU+b0CA3NnoBWVVowi2vg9DDw0WKv/GaQZKSFXMYvPyVG
 7BmaJyiTHLj2NtFwSYNMuUxAjfOeO86CslhaNdEGU/f98YgmI96S0Ve3ryoC4gWkdEzhUjgFX
 Kwn2brVnCv0+duBFQgdOmAef93aajpvlBWoqqY1mFl22e2zrEKULbQvO8UFLhMJNsRAb/HvJB
 uolSHcAac+VY5znrw4Qf6Q0J8CaEKhn7aFtRVHTsgDGAG+I+9pQxh6cqpdvFXriAPCI2sLRVx
 XiiMGjHrSDEJKBWmF4OQ==
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 06:19:18
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

--Sig_/nXZRJHh0H4.xT0z7A.TSjk6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

g_queue_remove needs to look up the list entry first, but we
already have it as result and can remove it directly with
g_queue_delete_link.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 net/colo-compare.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index eed0fbb27b..4e2af8ff00 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -691,7 +691,7 @@ static void colo_compare_packet(CompareState *s, Connec=
tion *conn,
         if (result) {
             colo_release_primary_pkt(s, pkt);
             packet_destroy(result->data, NULL);
-            g_queue_remove(&conn->secondary_list, result->data);
+            g_queue_delete_link(&conn->secondary_list, result);
         } else {
             /*
              * If one packet arrive late, the secondary_list or
--
2.20.1

--Sig_/nXZRJHh0H4.xT0z7A.TSjk6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl+xDqoACgkQNasLKJxd
slgT3g/9G4x5Zg0QMCo6nOOMCA5zY3r3c0yJKqzl2sta1JFm2Eq6JFHM6MvT+eRv
pK+9E/rgh14L8fJ5FBthENt02FkHqcaJIBsapwTIJT2611UNsO2C4DnNOujjSgqs
xVtEvL5VPnIXnFLJXHTpe6gBPxiGeI2dezc+A4kRGx102g3KwywmqczQW2JPWlUU
kvE6f9MQjGkNx1pIrDE4/6AFAJD35WnpQS1mjdh9fPubXd1ZzA6oAqk4Su6WYS/L
NcIdjV6mBtZCwKR1hKmz/5OPo6TptuxeCkMZqCSHUGgj+Igk1w7CgEG1/3sJJ5Yl
rKn7tvxqngVMN+6hKDueDTKtDe8GfG/xsI449zl1Iukqa4c3fqAhPHYouABikau/
Kwb1AEhunua4lmQP7faOKjeqJX1g8GSTLzKG/g04CsLVAL0d5gzg/V89nOamYtSf
9vInP5vLBh0Q5pbeqXWbCYwYW5Nscc5ilI9q3udhWMom1z0/lbbvfm5DQwu0oT2B
eoSEQJSMsYl2cELk+Syf1RrstW5BC4/84qU3lg53ldXvjvsk/tkpbds/X7YcTFmh
2LXyUiFJqxXQfGwxvIIjMMLrfTRZBw9iT6WknWIBcfK8fYPrpQL7ZLNQsVDJ20u9
hC2t0MMkq2HAp0XU0/ulqHTLTCJA784q692eX+QGZ2f2lv5XMVw=
=j05B
-----END PGP SIGNATURE-----

--Sig_/nXZRJHh0H4.xT0z7A.TSjk6--

