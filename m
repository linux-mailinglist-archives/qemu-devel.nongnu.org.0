Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E03E725F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 14:07:12 +0100 (CET)
Received: from localhost ([::1]:53546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP4jm-0000Lb-KA
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 09:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50943)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iP3xH-0003IA-S2
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:17:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iP3xB-00028w-V4
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:17:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35096
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iP3xB-00024r-Ok
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:16:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572265011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bJM2+9gNPSmHQaqUcxmZtG8O2VsIhH9fUg2cSb1GHbA=;
 b=bhZXFBGYoHpbmwADeTH9BcoyIYwCPc2LhKIZ8LagTD3R+K11fRYkaGna2JMZNDBW4W+3W3
 ISZ637wu1PlJYHbeuwgOnLAJUPLvaGBDn4A5zkGnuzJz35Rqdl5I7bXdCsmz9E6/7K0lvl
 53rViySIFsegP8YVwCzmwDkiZgdjp84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-59498fmLPfio9I5MUyqozw-1; Mon, 28 Oct 2019 08:16:47 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC669476;
 Mon, 28 Oct 2019 12:16:46 +0000 (UTC)
Received: from localhost (ovpn-117-83.ams2.redhat.com [10.36.117.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7ED965D6BB;
 Mon, 28 Oct 2019 12:16:46 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 50/69] qcow2: Put qcow2_upgrade() into its own function
Date: Mon, 28 Oct 2019 13:14:42 +0100
Message-Id: <20191028121501.15279-51-mreitz@redhat.com>
In-Reply-To: <20191028121501.15279-1-mreitz@redhat.com>
References: <20191028121501.15279-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 59498fmLPfio9I5MUyqozw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This does not make sense right now, but it will make sense once we need
to do more than to just update s->qcow_version.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20191011152814.14791-7-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.c | 43 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 60ed084e5c..af08757055 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4912,12 +4912,46 @@ static int qcow2_downgrade(BlockDriverState *bs, in=
t target_version,
     return 0;
 }
=20
+/*
+ * Upgrades an image's version.  While newer versions encompass all
+ * features of older versions, some things may have to be presented
+ * differently.
+ */
+static int qcow2_upgrade(BlockDriverState *bs, int target_version,
+                         BlockDriverAmendStatusCB *status_cb, void *cb_opa=
que,
+                         Error **errp)
+{
+    BDRVQcow2State *s =3D bs->opaque;
+    int current_version =3D s->qcow_version;
+    int ret;
+
+    /* This is qcow2_upgrade(), not qcow2_downgrade() */
+    assert(target_version > current_version);
+
+    /* There are no other versions (yet) that you can upgrade to */
+    assert(target_version =3D=3D 3);
+
+    status_cb(bs, 0, 1, cb_opaque);
+
+    s->qcow_version =3D target_version;
+    ret =3D qcow2_update_header(bs);
+    if (ret < 0) {
+        s->qcow_version =3D current_version;
+        error_setg_errno(errp, -ret, "Failed to update the image header");
+        return ret;
+    }
+    status_cb(bs, 1, 1, cb_opaque);
+
+    return 0;
+}
+
 typedef enum Qcow2AmendOperation {
     /* This is the value Qcow2AmendHelperCBInfo::last_operation will be
      * statically initialized to so that the helper CB can discern the fir=
st
      * invocation from an operation change */
     QCOW2_NO_OPERATION =3D 0,
=20
+    QCOW2_UPGRADING,
     QCOW2_CHANGING_REFCOUNT_ORDER,
     QCOW2_DOWNGRADING,
 } Qcow2AmendOperation;
@@ -5100,17 +5134,16 @@ static int qcow2_amend_options(BlockDriverState *bs=
, QemuOpts *opts,
     helper_cb_info =3D (Qcow2AmendHelperCBInfo){
         .original_status_cb =3D status_cb,
         .original_cb_opaque =3D cb_opaque,
-        .total_operations =3D (new_version < old_version)
+        .total_operations =3D (new_version !=3D old_version)
                           + (s->refcount_bits !=3D refcount_bits)
     };
=20
     /* Upgrade first (some features may require compat=3D1.1) */
     if (new_version > old_version) {
-        s->qcow_version =3D new_version;
-        ret =3D qcow2_update_header(bs);
+        helper_cb_info.current_operation =3D QCOW2_UPGRADING;
+        ret =3D qcow2_upgrade(bs, new_version, &qcow2_amend_helper_cb,
+                            &helper_cb_info, errp);
         if (ret < 0) {
-            s->qcow_version =3D old_version;
-            error_setg_errno(errp, -ret, "Failed to update the image heade=
r");
             return ret;
         }
     }
--=20
2.21.0


