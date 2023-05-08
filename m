Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430856F9D18
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 02:53:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvp7Q-00071w-Gz; Sun, 07 May 2023 20:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pvp7O-00071K-8e
 for qemu-devel@nongnu.org; Sun, 07 May 2023 20:52:46 -0400
Received: from mout.web.de ([212.227.15.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pvp7M-0004bK-M9
 for qemu-devel@nongnu.org; Sun, 07 May 2023 20:52:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683507160; i=lukasstraub2@web.de;
 bh=IF2rLFsIMJ/UTQ+z/EK3wC/8lHx5BXBAM9BnhOAPBLc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=QOFxp/jLKXQ70fvwP1f7Mqwo3CewyWVEVH6NWmhOU5CIYoMIUJbhJGPHVhZ4OXHuU
 C/hITLhwFU0C8P9XQ9ii/0KGYZzTaIREzWQLaj1Mq8c9x8x9LEQwLGKEQzkXeVRHHl
 seHtjgEymIjkctjtpJZPQD/9CVRSrQvxdzrejY48I/sdbhIg/RIp0uowt+b0UkBgnp
 WAh5Ogcu5gxYjOJkZKmiBtw29Wdwp9MP51UVLYR0F9QtcIY296HVS5QW2+euYjnHgj
 m2PZpa1qELE7XqLzUsKGT0Ucwq465oQSxUrqmxzwZ3I/jJVfrQxSz2qawGqaBitN+K
 AJSccUR5WJFow==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.115]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N8Vsr-1qIDQP1wKv-014VGZ; Mon, 08
 May 2023 02:52:40 +0200
Date: Mon, 8 May 2023 02:52:39 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 2/5] ram: Let colo_flush_ram_cache take the bitmap_mutex
Message-ID: <eff0d3dec168e9e32678a4a5f2d24fcd25645fde.1683506133.git.lukasstraub2@web.de>
In-Reply-To: <cover.1683506133.git.lukasstraub2@web.de>
References: <cover.1683506133.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8gpWrRVMZCwlNjXxelYuQUI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:43EvQ0cPrAbJ+gxTI9+sZuUeDDpjymSecUhermJzPgkIKIzIzRm
 UaqbM7q0sNjQfsf2N1kISlHseVEE2Kiqd3S934jZVgewkTTk3Diy9jR1tTXJlc4GoB0uN/d
 bfZg0/MBvc0UBPefSkzPeQuPbh0oEtp6V2SAFuujDU+Uuaec63uX86PKc5gGCBHA/HnJgNY
 veyvPT+hCex2YueUnYwxA==
UI-OutboundReport: notjunk:1;M01:P0:lY0/pg5DNNo=;Cla8xEX0M58NcwASk6YT7OaEkCr
 6YMaKmeWfqwTEuhbfwYIpXGmqQ6etMhs1HfHVYhn15ZWqpPENLmChOxHhLiWfoG1+uKmFhr5V
 xB6bTsEjFtEwRgj1B6aFCG3Q9BTrGveWIT0LwizujsCI42+tJ6fPDjiHoQDEXVraTL8JQyC3p
 DwuXZnNqFg2HqY9GusFjwQqVItqS+DxwEI3AF0wHYGy3DM/RvKok+vvLFrGeIxN3pzUD20iqt
 cM5CJeD4yKLTjcIqyO8ixAq8/+wq8Qmn3GLS3NhafUa0WXZYs+Dz/hkbgooSfz8bitTLrPddE
 2XxGY2NtZ4zmgp+mguLa70pOAsEZub/JhPOds4nPUGXQZ8d+Pzo/h5oFrx2wwCkKzabn+F7bN
 NZCAiW8yUftuCRDbrTXeomurSzMOtFeOH7aU6DJU/cueF7IljyxoaBzCTIXNycGenLCIZRsDi
 2tANBMtKlLzLpSE5OLvCfOhHomsk1soW976gBcD6xfV/nPqvyZnYcOZjkI76giitJ0LZHhfY4
 s9iNT0ChRQ6uQJ5xj5Wk5JbsMH7TkmhnNVCXt+JWLy0Ms1yYMLyhfxsIt7J7W394/upn1a33i
 fF3EIXQTP1xkL58Hl9EPXESaNwMu7l0yKzqnWnGmAt43sQz8KeHhTCx0xuuB81vcyyolppA3O
 jP36/MAQRy/YcacjPOHI7pwVffmu1q6ZBvCyQ+nQ/Ukk61X2oW+B2ZYcUhy32yxYmPSrjVsdw
 ZkLjzB1DGtIlWXuwurkeViGtxjk9Szqjbw4wQRxNVF2jjXldAOcm7436vs+bjKzGjDvqX+AAm
 QYD75DPARTYfImsgnUPJL1pT8bBy8YiMRc+IxYIyNMYk7kC8VKfyLYG2M5rIVps4USjg+xhuZ
 cQso2Fg+dDRgplaRHFhmJD9lzE1Dl4Cz33vg4hb9cYFFpL0jMFvr/MlhDOjeWPawdH3XJL/Lt
 mtDCpFkd69NG3tSylllJXS/AMVA=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

--Sig_/8gpWrRVMZCwlNjXxelYuQUI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This will be used in the next commits to add colo support to multifd.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 2d3fd2112a..f9e7aeda12 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4230,6 +4230,7 @@ void colo_flush_ram_cache(void)
     unsigned long offset =3D 0;
=20
     memory_global_dirty_log_sync();
+    qemu_mutex_lock(&ram_state->bitmap_mutex);
     WITH_RCU_READ_LOCK_GUARD() {
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             ramblock_sync_dirty_bitmap(ram_state, block);
@@ -4264,6 +4265,7 @@ void colo_flush_ram_cache(void)
             }
         }
     }
+    qemu_mutex_unlock(&ram_state->bitmap_mutex);
     trace_colo_flush_ram_cache_end();
 }
=20
--=20
2.39.2


--Sig_/8gpWrRVMZCwlNjXxelYuQUI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRYR9cACgkQNasLKJxd
slhLeQ/+OzrlEXqJcIImE6nYh3fbEURQMnsr5+YK6XYZljfSwess6od0P36K5WhW
nR58S8TCxMCe5KsRM7gZZz/OS0zVJCS7FogE0uIVrUGrBQEnKDn77q525cvkg0Ag
DuvQ3SXhQmk5HJWTvQOFWmpLJWLmk38VI5NC7P5fXA96+59EGbQeFOGFMvRo609p
izrENiItvkLj7NoLbk9/nY2ICVTm4Ut12DtDjD71Z9Wi5fdK5PshqLwEIi8/iPf7
+9AHV1rJHnqOi6Cf5R63ykQ7CI+RNhvHlMdb0PHmf8vD+Sdr6NOatwbvr4FzPy8w
MdnnTA5tYlgMO3J8bTaNzerZgEF0q4NPm1dNd0engQV8LNKUGXLRMI1ilqEh57o7
hCJ6SNUjSiOfaRDu8HJC1EzJ8lXvbzUs3xuF5MFRdgcaZa9sLkQCkl+oztzrudiC
NdKyYisvMxxl4cSFRK1Rw7tYyBPkfDZZB1JSyoUDQW1C2LAWNtU7SS6u77W0WN8n
9u8GjSLKe0+/3odd1S/dyh/0QlZtsS3FtEeHQB3RJ2soa7oahpctGXpkGtVf+Ja8
VcdCjrmsTi8u0bEvPqC8+o81Ak+Y7Y1AJxyy8a4PImypHOVmYqiGZptnwR509TL6
Jh3Rb8ZYvlMnv+0p7nYH9+21FU1UBpI76Bu4r5TDCRTQxTGkxEk=
=5OqQ
-----END PGP SIGNATURE-----

--Sig_/8gpWrRVMZCwlNjXxelYuQUI--

