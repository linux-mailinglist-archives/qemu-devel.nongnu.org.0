Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DB5162652
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 13:44:18 +0100 (CET)
Received: from localhost ([::1]:33798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j42Eb-0005Tw-QM
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 07:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38677)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j42DI-0003lx-DR
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:42:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j42DG-0000s8-V5
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:42:56 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:21152
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j42DG-0000rl-Ry
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582029774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W6nUHkAqLbGE//sHpHWbkDZ9SsI0P2veHNCGFDv8d/w=;
 b=TSsVHok6sbIoSDzgojlSDBZdcNBcQRL32qSM2dQrFuOpV0jlDYJYq3p1QnqbH+VJS9SMby
 NdqdV+7eon9bNqIyDw0vo13KlmCrZnXBu8hsfxNbl2PxiTa+FPRqeLtFE+wMj7uHX8mQoB
 XvYEeF0uXRMbhCJgr67PceMU9F3EvSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-_-JDPgsHNz27K0jmfhd0Ew-1; Tue, 18 Feb 2020 07:42:50 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5697518A5508;
 Tue, 18 Feb 2020 12:42:49 +0000 (UTC)
Received: from localhost (unknown [10.36.118.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99A8417DC8;
 Tue, 18 Feb 2020 12:42:48 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 01/33] block: Add BlockDriver.is_format
Date: Tue, 18 Feb 2020 13:42:10 +0100
Message-Id: <20200218124242.584644-2-mreitz@redhat.com>
In-Reply-To: <20200218124242.584644-1-mreitz@redhat.com>
References: <20200218124242.584644-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: _-JDPgsHNz27K0jmfhd0Ew-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to unify child_format and child_file at some point.  One of the
important things that set format drivers apart from other drivers is
that they do not expect other format nodes under them (except in the
backing chain), i.e. we must not probe formats inside of formats.  That
means we need something on which to distinguish format drivers from
others, and hence this flag.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/bochs.c             | 1 +
 block/cloop.c             | 1 +
 block/crypto.c            | 2 ++
 block/dmg.c               | 1 +
 block/parallels.c         | 1 +
 block/qcow.c              | 1 +
 block/qcow2.c             | 1 +
 block/qed.c               | 1 +
 block/raw-format.c        | 1 +
 block/vdi.c               | 1 +
 block/vhdx.c              | 1 +
 block/vmdk.c              | 1 +
 block/vpc.c               | 1 +
 include/block/block_int.h | 7 +++++++
 14 files changed, 21 insertions(+)

diff --git a/block/bochs.c b/block/bochs.c
index 32bb83b268..e7bbeaa1c4 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -301,6 +301,7 @@ static BlockDriver bdrv_bochs =3D {
     .bdrv_refresh_limits =3D bochs_refresh_limits,
     .bdrv_co_preadv =3D bochs_co_preadv,
     .bdrv_close=09=09=3D bochs_close,
+    .is_format          =3D true,
 };
=20
 static void bdrv_bochs_init(void)
diff --git a/block/cloop.c b/block/cloop.c
index 4de94876d4..f90f1a4b4c 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -297,6 +297,7 @@ static BlockDriver bdrv_cloop =3D {
     .bdrv_refresh_limits =3D cloop_refresh_limits,
     .bdrv_co_preadv =3D cloop_co_preadv,
     .bdrv_close     =3D cloop_close,
+    .is_format      =3D true,
 };
=20
 static void bdrv_cloop_init(void)
diff --git a/block/crypto.c b/block/crypto.c
index 24823835c1..b81f673a51 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -673,6 +673,8 @@ static BlockDriver bdrv_crypto_luks =3D {
     .bdrv_get_info      =3D block_crypto_get_info_luks,
     .bdrv_get_specific_info =3D block_crypto_get_specific_info_luks,
=20
+    .is_format          =3D true,
+
     .strong_runtime_opts =3D block_crypto_strong_runtime_opts,
 };
=20
diff --git a/block/dmg.c b/block/dmg.c
index 4a045f2b3e..ef3c6e771d 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -753,6 +753,7 @@ static BlockDriver bdrv_dmg =3D {
     .bdrv_child_perm     =3D bdrv_format_default_perms,
     .bdrv_co_preadv =3D dmg_co_preadv,
     .bdrv_close     =3D dmg_close,
+    .is_format      =3D true,
 };
=20
 static void bdrv_dmg_init(void)
diff --git a/block/parallels.c b/block/parallels.c
index 7a01997659..30eda982bd 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -910,6 +910,7 @@ static BlockDriver bdrv_parallels =3D {
     .bdrv_co_flush_to_os      =3D parallels_co_flush_to_os,
     .bdrv_co_readv  =3D parallels_co_readv,
     .bdrv_co_writev =3D parallels_co_writev,
+    .is_format      =3D true,
     .supports_backing =3D true,
     .bdrv_co_create      =3D parallels_co_create,
     .bdrv_co_create_opts =3D parallels_co_create_opts,
diff --git a/block/qcow.c b/block/qcow.c
index fce8989868..0e4f09934c 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -1184,6 +1184,7 @@ static BlockDriver bdrv_qcow =3D {
     .bdrv_co_create         =3D qcow_co_create,
     .bdrv_co_create_opts    =3D qcow_co_create_opts,
     .bdrv_has_zero_init     =3D bdrv_has_zero_init_1,
+    .is_format              =3D true,
     .supports_backing       =3D true,
     .bdrv_refresh_limits    =3D qcow_refresh_limits,
=20
diff --git a/block/qcow2.c b/block/qcow2.c
index 3c754f616b..875eb7d5d9 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5567,6 +5567,7 @@ BlockDriver bdrv_qcow2 =3D {
     .bdrv_save_vmstate    =3D qcow2_save_vmstate,
     .bdrv_load_vmstate    =3D qcow2_load_vmstate,
=20
+    .is_format                  =3D true,
     .supports_backing           =3D true,
     .bdrv_change_backing_file   =3D qcow2_change_backing_file,
=20
diff --git a/block/qed.c b/block/qed.c
index d8c4e5fb1e..eb6139acbc 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -1663,6 +1663,7 @@ static BlockDriver bdrv_qed =3D {
     .format_name              =3D "qed",
     .instance_size            =3D sizeof(BDRVQEDState),
     .create_opts              =3D &qed_create_opts,
+    .is_format                =3D true,
     .supports_backing         =3D true,
=20
     .bdrv_probe               =3D bdrv_qed_probe,
diff --git a/block/raw-format.c b/block/raw-format.c
index 3a76ec7dd2..2429ff0d23 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -567,6 +567,7 @@ BlockDriver bdrv_raw =3D {
     .bdrv_co_copy_range_to  =3D &raw_co_copy_range_to,
     .bdrv_co_truncate     =3D &raw_co_truncate,
     .bdrv_getlength       =3D &raw_getlength,
+    .is_format            =3D true,
     .has_variable_length  =3D true,
     .bdrv_measure         =3D &raw_measure,
     .bdrv_get_info        =3D &raw_get_info,
diff --git a/block/vdi.c b/block/vdi.c
index 0142da7233..7e87b205b5 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -1051,6 +1051,7 @@ static BlockDriver bdrv_vdi =3D {
=20
     .bdrv_get_info =3D vdi_get_info,
=20
+    .is_format =3D true,
     .create_opts =3D &vdi_create_opts,
     .bdrv_co_check =3D vdi_co_check,
 };
diff --git a/block/vhdx.c b/block/vhdx.c
index f02d2611be..d3c1619026 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -2241,6 +2241,7 @@ static BlockDriver bdrv_vhdx =3D {
     .bdrv_co_check          =3D vhdx_co_check,
     .bdrv_has_zero_init     =3D vhdx_has_zero_init,
=20
+    .is_format              =3D true,
     .create_opts            =3D &vhdx_create_opts,
 };
=20
diff --git a/block/vmdk.c b/block/vmdk.c
index 20e909d997..631fcd15ab 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -3058,6 +3058,7 @@ static BlockDriver bdrv_vmdk =3D {
     .bdrv_get_info                =3D vmdk_get_info,
     .bdrv_gather_child_options    =3D vmdk_gather_child_options,
=20
+    .is_format                    =3D true,
     .supports_backing             =3D true,
     .create_opts                  =3D &vmdk_create_opts,
 };
diff --git a/block/vpc.c b/block/vpc.c
index a65550298e..7cf0f87a16 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -1248,6 +1248,7 @@ static BlockDriver bdrv_vpc =3D {
=20
     .bdrv_get_info          =3D vpc_get_info,
=20
+    .is_format              =3D true,
     .create_opts            =3D &vpc_create_opts,
     .bdrv_has_zero_init     =3D vpc_has_zero_init,
     .strong_runtime_opts    =3D vpc_strong_runtime_opts,
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 6f9fd5e20e..8d10c94213 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -94,6 +94,13 @@ struct BlockDriver {
      * must implement them and return -ENOTSUP.
      */
     bool is_filter;
+    /*
+     * Set to true if the BlockDriver is a format driver.  Format nodes
+     * generally do not expect their children to be other format nodes
+     * (except for backing files), and so format probing is disabled
+     * on those children.
+     */
+    bool is_format;
     /*
      * Return true if @to_replace can be replaced by a BDS with the
      * same data as @bs without it affecting @bs's behavior (that is,
--=20
2.24.1


