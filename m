Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F6F8F145
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 18:53:03 +0200 (CEST)
Received: from localhost ([::1]:44472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyIzl-0005IY-IQ
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 12:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1hyIjv-0002yb-SA
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:36:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hyIjq-0003Ls-84
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:36:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36422)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hyIjq-0003KI-2U
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:36:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 60F02309BF09;
 Thu, 15 Aug 2019 16:36:33 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-19.ams2.redhat.com
 [10.36.117.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD4523737;
 Thu, 15 Aug 2019 16:36:31 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Aug 2019 17:34:54 +0100
Message-Id: <20190815163504.18937-24-dgilbert@redhat.com>
In-Reply-To: <20190815163504.18937-1-dgilbert@redhat.com>
References: <20190815163504.18937-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 15 Aug 2019 16:36:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 23/33] migration: remove unused field bytes_xfer
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
Cc: quintela@redhat.com, yury-kotov@yandex-team.ru,
 richardw.yang@linux.intel.com, marcandre.lureau@redhat.com,
 ivanren@tencent.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

MigrationState->bytes_xfer is only set to 0 in migrate_init().

Remove this unnecessary field.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190402003106.17614-1-richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 1 -
 migration/migration.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 8331e62831..12b8e5dbe5 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1699,7 +1699,6 @@ void migrate_init(MigrationState *s)
      * parameters/capabilities that the user set, and
      * locks.
      */
-    s->bytes_xfer =3D 0;
     s->cleanup_bh =3D 0;
     s->to_dst_file =3D NULL;
     s->state =3D MIGRATION_STATUS_NONE;
diff --git a/migration/migration.h b/migration/migration.h
index 1fdd7b21fd..5bc60709db 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -132,7 +132,6 @@ struct MigrationState
     DeviceState parent_obj;
=20
     /*< public >*/
-    size_t bytes_xfer;
     QemuThread thread;
     QEMUBH *cleanup_bh;
     QEMUFile *to_dst_file;
--=20
2.21.0


