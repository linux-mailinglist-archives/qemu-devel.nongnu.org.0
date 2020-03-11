Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC71181CBF
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:47:57 +0100 (CET)
Received: from localhost ([::1]:54566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3aO-0001VJ-Q5
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59901)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jC3VQ-0003B2-QD
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jC3VP-0003eX-GG
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20534
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jC3VP-0003cI-BA
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583941367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tKC+fGb4Qp8widUD3WBtl9IBM3etB5pxspJJQN3QxP8=;
 b=Tzccep2LbSG3vvzgX4v2h8xhHCoDNSNa7kKap0Jfkhz1CLSxs9yPknKvQqLBfvkMa2znvV
 ih1fOb7ASNdi6vz8BXzKpZF9sfxBKr09CHF4cGjBsJHjx8V1AxGNTJgLmiQbfdfOfrDYsK
 ggIzuqKkucyh1L7rxrk+ZKbFmSWhqvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-T11-4Y34PCKMAsNBHlxzow-1; Wed, 11 Mar 2020 11:42:45 -0400
X-MC-Unique: T11-4Y34PCKMAsNBHlxzow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F140B8010EB;
 Wed, 11 Mar 2020 15:42:43 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56AEB92D2C;
 Wed, 11 Mar 2020 15:42:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/13] crypto.c: cleanup created file when
 block_crypto_co_create_opts_luks fails
Date: Wed, 11 Mar 2020 16:42:17 +0100
Message-Id: <20200311154218.15532-13-kwolf@redhat.com>
In-Reply-To: <20200311154218.15532-1-kwolf@redhat.com>
References: <20200311154218.15532-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

When using a non-UTF8 secret to create a volume using qemu-img, the
following error happens:

$ qemu-img create -f luks --object secret,id=3Dvol_1_encrypt0,file=3Dvol_re=
size_pool.vol_1.secret.qzVQrI -o key-secret=3Dvol_1_encrypt0 /var/tmp/pool_=
target/vol_1 10240K

Formatting '/var/tmp/pool_target/vol_1', fmt=3Dluks size=3D10485760 key-sec=
ret=3Dvol_1_encrypt0
qemu-img: /var/tmp/pool_target/vol_1: Data from secret vol_1_encrypt0 is no=
t valid UTF-8

However, the created file '/var/tmp/pool_target/vol_1' is left behind in th=
e
file system after the failure. This behavior can be observed when creating
the volume using Libvirt, via 'virsh vol-create', and then getting "volume
target path already exist" errors when trying to re-create the volume.

The volume file is created inside block_crypto_co_create_opts_luks(), in
block/crypto.c. If the bdrv_create_file() call is successful but any
succeeding step fails*, the existing 'fail' label does not take into
account the created file, leaving it behind.

This patch changes block_crypto_co_create_opts_luks() to delete
'filename' in case of failure. A failure in this point means that
the volume is now truncated/corrupted, so even if 'filename' was an
existing volume before calling qemu-img, it is now unusable. Deleting
the file it is not much worse than leaving it in the filesystem in
this scenario, and we don't have to deal with checking the file
pre-existence in the code.

* in our case, block_crypto_co_create_generic calls qcrypto_block_create,
which calls qcrypto_block_luks_create, and this function fails when
calling qcrypto_secret_lookup_as_utf8.

Reported-by: Srikanth Aithal <bssrikanth@in.ibm.com>
Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20200130213907.2830642-4-danielhb413@gmail.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/crypto.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/block/crypto.c b/block/crypto.c
index 24823835c1..00e8ec537d 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -30,6 +30,7 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qemu/cutils.h"
 #include "crypto.h"
=20
 typedef struct BlockCrypto BlockCrypto;
@@ -596,6 +597,23 @@ static int coroutine_fn block_crypto_co_create_opts_lu=
ks(const char *filename,
=20
     ret =3D 0;
 fail:
+    /*
+     * If an error occurred, delete 'filename'. Even if the file existed
+     * beforehand, it has been truncated and corrupted in the process.
+     */
+    if (ret && bs) {
+        Error *local_delete_err =3D NULL;
+        int r_del =3D bdrv_co_delete_file(bs, &local_delete_err);
+        /*
+         * ENOTSUP will happen if the block driver doesn't support
+         * the 'bdrv_co_delete_file' interface. This is a predictable
+         * scenario and shouldn't be reported back to the user.
+         */
+        if ((r_del < 0) && (r_del !=3D -ENOTSUP)) {
+            error_report_err(local_delete_err);
+        }
+    }
+
     bdrv_unref(bs);
     qapi_free_QCryptoBlockCreateOptions(create_opts);
     qobject_unref(cryptoopts);
--=20
2.20.1


