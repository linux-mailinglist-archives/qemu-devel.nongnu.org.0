Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A47F17C40D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 18:17:53 +0100 (CET)
Received: from localhost ([::1]:39746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAGbg-0007Yp-86
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 12:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48330)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jAGZD-0004h2-68
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 12:15:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jAGZC-0007I2-6I
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 12:15:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26418
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jAGZC-0007Fa-30
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 12:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583514917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ufqkwBBJxhlrM4CdXSrri08cBhDgmuBGZ+/JGrVUiPE=;
 b=OFxM2mlTlmwTp4lVNrzDM74KsLrESYZpExmFFVqcu1QRF5ul1oVCWNoEqJyaepLtYHidZh
 r8ZUMOfXmio+1z05xCOkVAOpLezcDoTXk7CxLwWXSgETZB9IhgKgXFusEfbWNhAJDMbrfE
 9dmQNpdVu4YKT9CYDzRXx7jfyO63CcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-nMatS8S4Psuy3DzG2B6qvw-1; Fri, 06 Mar 2020 12:15:13 -0500
X-MC-Unique: nMatS8S4Psuy3DzG2B6qvw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48EC9107ACC7;
 Fri,  6 Mar 2020 17:15:12 +0000 (UTC)
Received: from linux.fritz.box.com (unknown [10.36.118.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B9C473892;
 Fri,  6 Mar 2020 17:15:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/29] block: Introduce 'bdrv_reopen_commit_post' step
Date: Fri,  6 Mar 2020 18:14:34 +0100
Message-Id: <20200306171458.1848-6-kwolf@redhat.com>
In-Reply-To: <20200306171458.1848-1-kwolf@redhat.com>
References: <20200306171458.1848-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Krempa <pkrempa@redhat.com>

Add another step in the reopen process where driver can execute code
after permission changes are comitted.

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
Message-Id: <adc02cf591c3cb34e98e33518eb1c540a0f27db1.1582893284.git.pkremp=
a@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int.h | 1 +
 block.c                   | 9 +++++++++
 2 files changed, 10 insertions(+)

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
=20
diff --git a/block.c b/block.c
index 876bd45182..aaa387504e 100644
--- a/block.c
+++ b/block.c
@@ -3695,6 +3695,15 @@ cleanup_perm:
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
--=20
2.20.1


