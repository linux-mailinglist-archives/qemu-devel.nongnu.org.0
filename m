Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3537813DF2A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 16:49:40 +0100 (CET)
Received: from localhost ([::1]:44092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is7Os-0005LZ-JF
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 10:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35616)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1is7Lt-0003Ld-BF
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:46:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1is7Ls-0004NO-82
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:46:33 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54628
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1is7Ls-0004N8-4v
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579189591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=200X3mlNa/rGv52gHPrniHK4ytjGFbbPjb77rNZMFPs=;
 b=JQ9tJe9mQpj9/08Tt3HafSzoeJToTVcNEmkNqMJYLp6z0f1MDjD+HTfcxJ2B1NM4P6+SaQ
 Y+AumaQj964vNFNNl3y3dBuPvdh+E53O+F/eDLzBNx5uqYdcA2/01RwhRUxj8LqcHMeAyc
 TZwOG4nVw1GPlCU8p5AFtmC1N5doZME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-oDXngIpTP5eVr7twbmnmpA-1; Thu, 16 Jan 2020 10:46:29 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF4298010DE
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 15:46:28 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3479263148;
 Thu, 16 Jan 2020 15:46:24 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] multifd: Make sure that we don't do any IO after an
 error
Date: Thu, 16 Jan 2020 16:46:12 +0100
Message-Id: <20200116154616.11569-2-quintela@redhat.com>
In-Reply-To: <20200116154616.11569-1-quintela@redhat.com>
References: <20200116154616.11569-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: oDXngIpTP5eVr7twbmnmpA-1
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index ba6e0eea15..8f9f3bba5b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3442,7 +3442,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque=
)
 {
     RAMState **temp =3D opaque;
     RAMState *rs =3D *temp;
-    int ret;
+    int ret =3D 0;
     int i;
     int64_t t0;
     int done =3D 0;
@@ -3521,12 +3521,14 @@ static int ram_save_iterate(QEMUFile *f, void *opaq=
ue)
     ram_control_after_iterate(f, RAM_CONTROL_ROUND);
=20
 out:
-    multifd_send_sync_main(rs);
-    qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
-    qemu_fflush(f);
-    ram_counters.transferred +=3D 8;
+    if (ret >=3D 0) {
+        multifd_send_sync_main(rs);
+        qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
+        qemu_fflush(f);
+        ram_counters.transferred +=3D 8;
=20
-    ret =3D qemu_file_get_error(f);
+        ret =3D qemu_file_get_error(f);
+    }
     if (ret < 0) {
         return ret;
     }
@@ -3578,9 +3580,11 @@ static int ram_save_complete(QEMUFile *f, void *opaq=
ue)
         ram_control_after_iterate(f, RAM_CONTROL_FINISH);
     }
=20
-    multifd_send_sync_main(rs);
-    qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
-    qemu_fflush(f);
+    if (ret >=3D 0) {
+        multifd_send_sync_main(rs);
+        qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
+        qemu_fflush(f);
+    }
=20
     return ret;
 }
--=20
2.24.1


