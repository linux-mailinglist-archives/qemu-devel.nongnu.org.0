Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CC419298C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 14:24:08 +0100 (CET)
Received: from localhost ([::1]:36284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH60t-0001sg-Mh
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 09:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53094)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jH5u3-00078E-Tm
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 09:17:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1jH5u2-0006P3-Uf
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 09:17:03 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:48666)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1jH5u2-0006Oh-R6
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 09:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585142222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zz0Ct3y11qKGgf70xqYznROrobSz7/NPUeqRaoI2Y84=;
 b=aItFvmQHfM5di0AyscNCgtO+T7AWap2f3HLtoSuXFzLfJzdFtxgf4JVO8H0JaqX8SSN2cu
 cR8gWizSC0xILuIiYENbutKOmFvNWt4hr9xB7pFORNiGZUXZPZJ3rvmLQ0mnJMBdBxs/De
 s3qJPRBYQGfRXwPvCjPispLMoZe1HBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-qsXLFQfNP1C02B-g3i3fSg-1; Wed, 25 Mar 2020 09:17:00 -0400
X-MC-Unique: qsXLFQfNP1C02B-g3i3fSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C415619251C0;
 Wed, 25 Mar 2020 13:16:55 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-213.ams2.redhat.com
 [10.36.114.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 680A95C3F8;
 Wed, 25 Mar 2020 13:16:53 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, pannengyuan@huawei.com,
 maozhongyi@cmss.chinamobile.com, vsementsov@virtuozzo.com,
 imammedo@redhat.com, philmd@redhat.com
Subject: [PULL 8/9] migration/ram: fix use after free of local_err
Date: Wed, 25 Mar 2020 13:16:31 +0000
Message-Id: <20200325131632.311034-9-dgilbert@redhat.com>
In-Reply-To: <20200325131632.311034-1-dgilbert@redhat.com>
References: <20200325131632.311034-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

local_err is used again in migration_bitmap_sync_precopy() after
precopy_notify(), so we must zero it. Otherwise try to set
non-NULL local_err will crash.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20200324153630.11882-6-vsementsov@virtuozzo.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/migration/ram.c b/migration/ram.c
index c12cfdbe26..04f13feb2e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -980,6 +980,7 @@ static void migration_bitmap_sync_precopy(RAMState *rs)
      */
     if (precopy_notify(PRECOPY_NOTIFY_BEFORE_BITMAP_SYNC, &local_err)) {
         error_report_err(local_err);
+        local_err =3D NULL;
     }
=20
     migration_bitmap_sync(rs);
--=20
2.25.1


