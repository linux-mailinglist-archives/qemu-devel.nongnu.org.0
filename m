Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C331043E4
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 20:06:06 +0100 (CET)
Received: from localhost ([::1]:33730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXVIj-0003uj-TU
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 14:06:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42139)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iXVC5-0006nG-Ti
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 13:59:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iXVC2-0002QD-3n
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 13:59:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35661
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1iXVC2-0002Q3-0j
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 13:59:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574276349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WPEICsjsxP4kU6JHDhPzxLx2tR0Z9ZtAWPRBNyw1hg0=;
 b=IJ6KTvFoiBzcFH1vvwhlmlmi681CHbzClQJjG9v/Ef/JV/iUzJxWssbz7LEbXYj9nkilMv
 QXbtOUjDp2Z/rRnKGYAv072Lmw/mvjFfggCLPfaEVj3HkEdkrxuQKXgSnrYRt1bvPYCxB7
 2XwjJK4/syrHmh1isFwZfW3neHkFSlE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-AJaX3AD9Mw-UsvUV4WUmOA-1; Wed, 20 Nov 2019 13:59:06 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B049184CAA1;
 Wed, 20 Nov 2019 18:59:05 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 774BC51C7F;
 Wed, 20 Nov 2019 18:59:03 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] monitor: move hmp_block_job* to blockdev-hmp-cmd.c
Date: Wed, 20 Nov 2019 20:58:46 +0200
Message-Id: <20191120185850.18986-6-mlevitsk@redhat.com>
In-Reply-To: <20191120185850.18986-1-mlevitsk@redhat.com>
References: <20191120185850.18986-1-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: AJaX3AD9Mw-UsvUV4WUmOA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 blockdev-hmp-cmds.c | 52 +++++++++++++++++++++++++++++++++++++++++++++
 monitor/hmp-cmds.c  | 52 ---------------------------------------------
 2 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/blockdev-hmp-cmds.c b/blockdev-hmp-cmds.c
index 5ae899a324..e333de27b1 100644
--- a/blockdev-hmp-cmds.c
+++ b/blockdev-hmp-cmds.c
@@ -238,3 +238,55 @@ void hmp_drive_backup(Monitor *mon, const QDict *qdict=
)
     hmp_handle_error(mon, &err);
 }
=20
+
+void hmp_block_job_set_speed(Monitor *mon, const QDict *qdict)
+{
+    Error *error =3D NULL;
+    const char *device =3D qdict_get_str(qdict, "device");
+    int64_t value =3D qdict_get_int(qdict, "speed");
+
+    qmp_block_job_set_speed(device, value, &error);
+
+    hmp_handle_error(mon, &error);
+}
+
+void hmp_block_job_cancel(Monitor *mon, const QDict *qdict)
+{
+    Error *error =3D NULL;
+    const char *device =3D qdict_get_str(qdict, "device");
+    bool force =3D qdict_get_try_bool(qdict, "force", false);
+
+    qmp_block_job_cancel(device, true, force, &error);
+
+    hmp_handle_error(mon, &error);
+}
+
+void hmp_block_job_pause(Monitor *mon, const QDict *qdict)
+{
+    Error *error =3D NULL;
+    const char *device =3D qdict_get_str(qdict, "device");
+
+    qmp_block_job_pause(device, &error);
+
+    hmp_handle_error(mon, &error);
+}
+
+void hmp_block_job_resume(Monitor *mon, const QDict *qdict)
+{
+    Error *error =3D NULL;
+    const char *device =3D qdict_get_str(qdict, "device");
+
+    qmp_block_job_resume(device, &error);
+
+    hmp_handle_error(mon, &error);
+}
+
+void hmp_block_job_complete(Monitor *mon, const QDict *qdict)
+{
+    Error *error =3D NULL;
+    const char *device =3D qdict_get_str(qdict, "device");
+
+    qmp_block_job_complete(device, &error);
+
+    hmp_handle_error(mon, &error);
+}
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index aa94a15d74..326276cced 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1976,58 +1976,6 @@ void hmp_block_stream(Monitor *mon, const QDict *qdi=
ct)
     hmp_handle_error(mon, &error);
 }
=20
-void hmp_block_job_set_speed(Monitor *mon, const QDict *qdict)
-{
-    Error *error =3D NULL;
-    const char *device =3D qdict_get_str(qdict, "device");
-    int64_t value =3D qdict_get_int(qdict, "speed");
-
-    qmp_block_job_set_speed(device, value, &error);
-
-    hmp_handle_error(mon, &error);
-}
-
-void hmp_block_job_cancel(Monitor *mon, const QDict *qdict)
-{
-    Error *error =3D NULL;
-    const char *device =3D qdict_get_str(qdict, "device");
-    bool force =3D qdict_get_try_bool(qdict, "force", false);
-
-    qmp_block_job_cancel(device, true, force, &error);
-
-    hmp_handle_error(mon, &error);
-}
-
-void hmp_block_job_pause(Monitor *mon, const QDict *qdict)
-{
-    Error *error =3D NULL;
-    const char *device =3D qdict_get_str(qdict, "device");
-
-    qmp_block_job_pause(device, &error);
-
-    hmp_handle_error(mon, &error);
-}
-
-void hmp_block_job_resume(Monitor *mon, const QDict *qdict)
-{
-    Error *error =3D NULL;
-    const char *device =3D qdict_get_str(qdict, "device");
-
-    qmp_block_job_resume(device, &error);
-
-    hmp_handle_error(mon, &error);
-}
-
-void hmp_block_job_complete(Monitor *mon, const QDict *qdict)
-{
-    Error *error =3D NULL;
-    const char *device =3D qdict_get_str(qdict, "device");
-
-    qmp_block_job_complete(device, &error);
-
-    hmp_handle_error(mon, &error);
-}
-
 typedef struct HMPMigrationStatus
 {
     QEMUTimer *timer;
--=20
2.17.2


