Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857D114C97D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 12:21:14 +0100 (CET)
Received: from localhost ([::1]:44494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwlPF-0000jy-Hu
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 06:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60184)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iwlKm-00029r-MZ
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:16:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iwlKl-0006bF-LS
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:16:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57286
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iwlKe-0006Zc-NM
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580296588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=enGUFnRPobJ+1MN+5bPrV1oCnqAGdbN2s5gD7Q8nBkY=;
 b=KYN8UABKz5CCvwPlJLPQwnaEB97Z1pICfxd7miGRgEdAVbFnp7U0LuBsdlk7Ua8c6FUFSG
 gLTl3/ByPUn52RKzaO45pXbAE8mQv0ac+s1eCMfLOliZAiQnlO9dO15DmGpOUacqaMKSUo
 167qCys+20SEeglVgSolylmIm/Ef5C8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-5c13bItQNr-q4gQsj2HPTA-1; Wed, 29 Jan 2020 06:16:26 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94ED28017CC
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 11:16:25 +0000 (UTC)
Received: from secure.mitica (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 180458E9F4;
 Wed, 29 Jan 2020 11:16:23 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/18] multifd: Make multifd_save_setup() get an Error parameter
Date: Wed, 29 Jan 2020 12:15:32 +0100
Message-Id: <20200129111536.9497-15-quintela@redhat.com>
In-Reply-To: <20200129111536.9497-1-quintela@redhat.com>
References: <20200129111536.9497-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 5c13bItQNr-q4gQsj2HPTA-1
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 4 +++-
 migration/ram.c       | 2 +-
 migration/ram.h       | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 77768fb2c7..d478f832ea 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3367,6 +3367,7 @@ static void *migration_thread(void *opaque)
=20
 void migrate_fd_connect(MigrationState *s, Error *error_in)
 {
+    Error *local_err =3D NULL;
     int64_t rate_limit;
     bool resume =3D s->state =3D=3D MIGRATION_STATUS_POSTCOPY_PAUSED;
=20
@@ -3415,7 +3416,8 @@ void migrate_fd_connect(MigrationState *s, Error *err=
or_in)
         return;
     }
=20
-    if (multifd_save_setup() !=3D 0) {
+    if (multifd_save_setup(&local_err) !=3D 0) {
+        error_report_err(local_err);
         migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
                           MIGRATION_STATUS_FAILED);
         migrate_fd_cleanup(s);
diff --git a/migration/ram.c b/migration/ram.c
index 12b76b7841..78483247ad 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1252,7 +1252,7 @@ static void multifd_new_send_channel_async(QIOTask *t=
ask, gpointer opaque)
     }
 }
=20
-int multifd_save_setup(void)
+int multifd_save_setup(Error **errp)
 {
     int thread_count;
     uint32_t page_count =3D MULTIFD_PACKET_SIZE / qemu_target_page_size();
diff --git a/migration/ram.h b/migration/ram.h
index bd0eee79b6..da22a417ea 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -41,7 +41,7 @@ int xbzrle_cache_resize(int64_t new_size, Error **errp);
 uint64_t ram_bytes_remaining(void);
 uint64_t ram_bytes_total(void);
=20
-int multifd_save_setup(void);
+int multifd_save_setup(Error **errp);
 void multifd_save_cleanup(void);
 int multifd_load_setup(void);
 int multifd_load_cleanup(Error **errp);
--=20
2.24.1


