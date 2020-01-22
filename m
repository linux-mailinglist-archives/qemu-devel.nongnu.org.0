Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D1B1453A2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 12:19:33 +0100 (CET)
Received: from localhost ([::1]:40214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuE2m-0007pR-04
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 06:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iuDz0-0004Gh-Sn
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 06:15:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iuDyz-0006jF-UB
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 06:15:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52394
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iuDyy-0006hx-Om
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 06:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579691736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rf2VEYyJOJZjJVikxnQmH9H9nlhYVMDgThLcvQrR3pM=;
 b=bxvjVXWaelxbQOsuuz8209X+cKNAlnrldAhSnM8MDhLnN8Ur8DrNQvDnfsakN0sKdvea0D
 DRCJtVEVSnFdoaPogmcQGcVjuBAQUcM+BfdiHNcgGtxb7i4dFBykO61So+E3tRT6YB3Bem
 yvixlbvbhdBy1ajDnN2V1QPEVG38Zwg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-kQThinsmNgaxpTxJqNol_A-1; Wed, 22 Jan 2020 06:15:34 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D94168017CC
 for <qemu-devel@nongnu.org>; Wed, 22 Jan 2020 11:15:33 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE66D5C1BB;
 Wed, 22 Jan 2020 11:15:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/6] migration: Don't send data if we have stopped
Date: Wed, 22 Jan 2020 12:15:17 +0100
Message-Id: <20200122111517.33223-7-quintela@redhat.com>
In-Reply-To: <20200122111517.33223-1-quintela@redhat.com>
References: <20200122111517.33223-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: kQThinsmNgaxpTxJqNol_A-1
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we do a cancel, we got out without one error, but we can't do the
rest of the output as in a normal situation.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index f95d656c26..3fd7fdffcf 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3524,7 +3524,8 @@ static int ram_save_iterate(QEMUFile *f, void *opaque=
)
     ram_control_after_iterate(f, RAM_CONTROL_ROUND);
=20
 out:
-    if (ret >=3D 0) {
+    if (ret >=3D 0
+        && migration_is_setup_or_active(migrate_get_current()->state)) {
         multifd_send_sync_main(rs);
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
         qemu_fflush(f);
--=20
2.24.1


