Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8052B1624B6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 11:38:25 +0100 (CET)
Received: from localhost ([::1]:60592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j40Gm-00076C-Fj
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 05:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51993)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j40De-00010I-G9
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j40Dd-0007KA-B5
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:10 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43528
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j40Dd-0007K1-7m
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582022108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RAzEvMdOaOBLUZB8+8SgwVF8nHkQ8p1euy5J91x21UA=;
 b=dKmIDU9wZTCtnrdnMw2kheoLY3tUsQB0dIBgc1ajJVq2VtS9THh4/1wE8D+l5lERuwVHtz
 ELdNBpP52j02cygqQBS+YjbeizUoTHnGK6rLYx4psOldqw1vIrrW6y1CeO+zJOxqGdfXUi
 YVUn7ZxNXxDneaA5FXHxa1NmzwNRNzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-IUb4n4BpPUaxkZ8fDhXflQ-1; Tue, 18 Feb 2020 05:35:05 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B7E613F8;
 Tue, 18 Feb 2020 10:35:04 +0000 (UTC)
Received: from localhost (unknown [10.36.118.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9EC790F6E;
 Tue, 18 Feb 2020 10:35:02 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 02/19] blockdev: Allow resizing everywhere
Date: Tue, 18 Feb 2020 11:34:37 +0100
Message-Id: <20200218103454.296704-3-mreitz@redhat.com>
In-Reply-To: <20200218103454.296704-1-mreitz@redhat.com>
References: <20200218103454.296704-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: IUb4n4BpPUaxkZ8fDhXflQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Block nodes that do not allow resizing should not share BLK_PERM_RESIZE.
It does not matter whether they are the first non-filter in their chain
or not.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 blockdev.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 1745d740ec..011dcfec27 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3331,11 +3331,6 @@ void qmp_block_resize(bool has_device, const char *d=
evice,
     aio_context =3D bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
=20
-    if (!bdrv_is_first_non_filter(bs)) {
-        error_setg(errp, QERR_FEATURE_DISABLED, "resize");
-        goto out;
-    }
-
     if (size < 0) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "size", "a >0 size"=
);
         goto out;
--=20
2.24.1


