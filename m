Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D574F173780
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 13:47:08 +0100 (CET)
Received: from localhost ([::1]:46400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7f2p-0000Zt-UH
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 07:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49069)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pkrempa@redhat.com>) id 1j7f0x-0007Xm-7X
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 07:45:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pkrempa@redhat.com>) id 1j7f0w-0008Un-6I
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 07:45:11 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33605
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pkrempa@redhat.com>) id 1j7f0w-0008Ug-2Y
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 07:45:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582893909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pIhUqnxSTMPajmTRJpfkDS850N2DxKwC5hbVFY3rqk=;
 b=OSMsf7V8KIk4TWe4OThumHIuol/fhR+z5+WRioIBew05vFA+iFuNhWnYgtn5MNgOp/cUXt
 bQKWHEyXwqU4z457owDSDn1CkGRozu9mFqbvDlM8KgRxNHeA/S7wjbsHw3P0v+o7dQTuRU
 ss8SBr6Q2661Hai74mxHIL0g1++y9JM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-896eUneIPheZSqaxtcV_3A-1; Fri, 28 Feb 2020 07:45:08 -0500
X-MC-Unique: 896eUneIPheZSqaxtcV_3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 188AF1005512;
 Fri, 28 Feb 2020 12:45:07 +0000 (UTC)
Received: from angien.redhat.com (unknown [10.43.2.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4645BCFDC;
 Fri, 28 Feb 2020 12:45:05 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] block: Introduce 'bdrv_reopen_commit_post' step
Date: Fri, 28 Feb 2020 13:44:46 +0100
Message-Id: <adc02cf591c3cb34e98e33518eb1c540a0f27db1.1582893284.git.pkrempa@redhat.com>
In-Reply-To: <cover.1582893284.git.pkrempa@redhat.com>
References: <cover.1582893284.git.pkrempa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add another step in the reopen process where driver can execute code
after permission changes are comitted.

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
---
 block.c                   | 9 +++++++++
 include/block/block_int.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/block.c b/block.c
index 1bdb9c679d..a82e53d4cc 100644
--- a/block.c
+++ b/block.c
@@ -3694,6 +3694,15 @@ cleanup_perm:
             }
         }
     }
+
+    if (ret =3D=3D 0) {
+        QTAILQ_FOREACH_REVERSE(bs_entry, bs_queue, entry) {
+            BlockDriverState *bs =3D bs_entry->state.bs;
+
+            if (bs->drv->bdrv_reopen_commit_post)
+                bs->drv->bdrv_reopen_commit_post(&bs_entry->state);
+        }
+    }
 cleanup:
     QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
         if (ret) {
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 6f9fd5e20e..f422c0bff0 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -122,6 +122,7 @@ struct BlockDriver {
     int (*bdrv_reopen_prepare)(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue, Error **errp);
     void (*bdrv_reopen_commit)(BDRVReopenState *reopen_state);
+    void (*bdrv_reopen_commit_post)(BDRVReopenState *reopen_state);
     void (*bdrv_reopen_abort)(BDRVReopenState *reopen_state);
     void (*bdrv_join_options)(QDict *options, QDict *old_options);

--=20
2.24.1


