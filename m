Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE409147209
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:46:32 +0100 (CET)
Received: from localhost ([::1]:60502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuiQx-0003IU-LW
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33522)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iugcw-0006HZ-UG
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 12:50:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iugcv-0005TR-Tl
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 12:50:46 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44328
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iugcv-0005Sr-Q9
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 12:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579801845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qo1ZkVbRynTPIlcmydpaFOrpJCPVtxvUI3et2u7L1cU=;
 b=XoMFEUeTJQZbS9G17kkLnB0VHxgTEu7JM5IMWPE33hZ4tzjxOMKf+AqjsY/ykvMnS5D2ry
 6ENkXTbtdOsa2Be2FeXk9TrCA89V9bkm3Q4IVF+u5bUdABC6YAzbLkxy6zBK+sNCHjBJyp
 tMGAZRm4CZaYvY/H0NopDM6OJH+IM1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-hlqPjAZwPwKAwlT5HZ5mUw-1; Thu, 23 Jan 2020 12:05:50 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE5BB107ACC5;
 Thu, 23 Jan 2020 17:05:48 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-109.ams2.redhat.com
 [10.36.117.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0874960BF3;
 Thu, 23 Jan 2020 17:05:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iscsi: Don't access non-existent scsi_lba_status_descriptor
Date: Thu, 23 Jan 2020 18:05:44 +0100
Message-Id: <20200123170544.30117-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: hlqPjAZwPwKAwlT5HZ5mUw-1
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
Cc: kwolf@redhat.com, pl@kamp.de, qemu-devel@nongnu.org, mreitz@redhat.com,
 ronniesahlberg@gmail.com, felipe@nutanix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In iscsi_co_block_status(), we may have received num_descriptors =3D=3D 0
from the iscsi server. Therefore, we can't unconditionally access
lbas->descriptors[0]. Add the missing check.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/iscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index cbd57294ab..c8feaa2f0e 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -753,7 +753,7 @@ retry:
     }
=20
     lbas =3D scsi_datain_unmarshall(iTask.task);
-    if (lbas =3D=3D NULL) {
+    if (lbas =3D=3D NULL || lbas->num_descriptors =3D=3D 0) {
         ret =3D -EIO;
         goto out_unlock;
     }
--=20
2.20.1


