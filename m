Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15E71B761A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 15:01:40 +0200 (CEST)
Received: from localhost ([::1]:36096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRxxb-0002V3-T1
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 09:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42528)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jRxrW-0007DS-Dc
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 08:55:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jRxrK-0003Mp-74
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 08:55:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50708
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jRxrJ-0003Hm-NM
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 08:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587732908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3M8gFD7q8+zUQWZdLRN5ey4Zf9++3rM48FFVh4uyw7A=;
 b=e0ho5mlaQC60R9D7MAg4fgq0AcRJoH5bVSlesOPyopjUjVvSI6Jax41Ff312ysJIayAlHN
 ZmNuH+S6mhF6lkpU5y/Ha+dJ85/G/vfat4J7X61xHoM2KRL8vruQKtalB0ILS8UX80q4Pr
 p/4lNLzhcoYog++5CEHvhRcGnuNTHyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-y1JdbNWQMbeY4P63w0Wpow-1; Fri, 24 Apr 2020 08:55:07 -0400
X-MC-Unique: y1JdbNWQMbeY4P63w0Wpow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9E048005BA;
 Fri, 24 Apr 2020 12:55:05 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-114.ams2.redhat.com
 [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7554660606;
 Fri, 24 Apr 2020 12:55:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 06/10] file-posix: Support BDRV_REQ_ZERO_WRITE for truncate
Date: Fri, 24 Apr 2020 14:54:44 +0200
Message-Id: <20200424125448.63318-7-kwolf@redhat.com>
In-Reply-To: <20200424125448.63318-1-kwolf@redhat.com>
References: <20200424125448.63318-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 03:54:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For regular files, we always get BDRV_REQ_ZERO_WRITE behaviour from the
OS, so we can advertise the flag and just ignore it.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/file-posix.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index 53f475ed61..1dca220a81 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -702,6 +702,10 @@ static int raw_open_common(BlockDriverState *bs, QDict=
 *options,
 #endif
=20
     bs->supported_zero_flags =3D BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK=
;
+    if (S_ISREG(st.st_mode)) {
+        /* When extending regular files, we get zeros from the OS */
+        bs->supported_truncate_flags =3D BDRV_REQ_ZERO_WRITE;
+    }
     ret =3D 0;
 fail:
     if (filename && (bdrv_flags & BDRV_O_TEMPORARY)) {
--=20
2.25.3


