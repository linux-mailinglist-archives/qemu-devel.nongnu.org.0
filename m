Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E3E14A96B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 19:07:22 +0100 (CET)
Received: from localhost ([::1]:49214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw8nB-0007LC-2p
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 13:07:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55099)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iw8cc-0002NK-0e
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 12:56:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iw8ca-0002ww-DA
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 12:56:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21882
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iw8ca-0002w7-82
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 12:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580147783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rugvYEwoIwoelRTUu2JWXYPrO6eTvHjrQ7lHwwQIxQI=;
 b=V9Rg+hD5DlaafQud+VzG9vt60BhsWSu8VQeI9B2RipaSZGIlBblk3BPqo4MYyZqokpsbcU
 e0o4qAGUpMf5Qcw+0OWb4nY3Im3ydVrQ8mYEVCkJ5R+AaJg3byTa6lVyDwDIX1MQ/ePKH5
 Do6TkLm0lzU+7K2wQ3RzJsAdy8d0Ed8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-_V8-615YPPS927rbjt8SBg-1; Mon, 27 Jan 2020 12:56:21 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4BDC1137840;
 Mon, 27 Jan 2020 17:56:20 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-108.ams2.redhat.com
 [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE2DC863C0;
 Mon, 27 Jan 2020 17:56:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/13] iscsi: Cap block count from GET LBA STATUS
 (CVE-2020-1711)
Date: Mon, 27 Jan 2020 18:55:58 +0100
Message-Id: <20200127175559.18173-13-kwolf@redhat.com>
In-Reply-To: <20200127175559.18173-1-kwolf@redhat.com>
References: <20200127175559.18173-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: _V8-615YPPS927rbjt8SBg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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

From: Felipe Franciosi <felipe@nutanix.com>

When querying an iSCSI server for the provisioning status of blocks (via
GET LBA STATUS), Qemu only validates that the response descriptor zero's
LBA matches the one requested. Given the SCSI spec allows servers to
respond with the status of blocks beyond the end of the LUN, Qemu may
have its heap corrupted by clearing/setting too many bits at the end of
its allocmap for the LUN.

A malicious guest in control of the iSCSI server could carefully program
Qemu's heap (by selectively setting the bitmap) and then smash it.

This limits the number of bits that iscsi_co_block_status() will try to
update in the allocmap so it can't overflow the bitmap.

Fixes: CVE-2020-1711
Cc: qemu-stable@nongnu.org
Signed-off-by: Felipe Franciosi <felipe@nutanix.com>
Signed-off-by: Peter Turschmid <peter.turschm@nutanix.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/iscsi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index 2aea7e3f13..cbd57294ab 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -701,7 +701,7 @@ static int coroutine_fn iscsi_co_block_status(BlockDriv=
erState *bs,
     struct scsi_get_lba_status *lbas =3D NULL;
     struct scsi_lba_status_descriptor *lbasd =3D NULL;
     struct IscsiTask iTask;
-    uint64_t lba;
+    uint64_t lba, max_bytes;
     int ret;
=20
     iscsi_co_init_iscsitask(iscsilun, &iTask);
@@ -721,6 +721,7 @@ static int coroutine_fn iscsi_co_block_status(BlockDriv=
erState *bs,
     }
=20
     lba =3D offset / iscsilun->block_size;
+    max_bytes =3D (iscsilun->num_blocks - lba) * iscsilun->block_size;
=20
     qemu_mutex_lock(&iscsilun->mutex);
 retry:
@@ -764,7 +765,7 @@ retry:
         goto out_unlock;
     }
=20
-    *pnum =3D (int64_t) lbasd->num_blocks * iscsilun->block_size;
+    *pnum =3D MIN((int64_t) lbasd->num_blocks * iscsilun->block_size, max_=
bytes);
=20
     if (lbasd->provisioning =3D=3D SCSI_PROVISIONING_TYPE_DEALLOCATED ||
         lbasd->provisioning =3D=3D SCSI_PROVISIONING_TYPE_ANCHORED) {
--=20
2.20.1


