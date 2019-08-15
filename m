Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC138F0B8
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 18:38:11 +0200 (CEST)
Received: from localhost ([::1]:44298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyIlN-00041X-1c
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 12:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47316)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1hyIjN-00026n-3O
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:36:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hyIjJ-0002lw-2O
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:36:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39340)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hyIjI-0002jk-To
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:36:01 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3924230917AB;
 Thu, 15 Aug 2019 16:36:00 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-19.ams2.redhat.com
 [10.36.117.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79D353737;
 Thu, 15 Aug 2019 16:35:55 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Aug 2019 17:34:45 +0100
Message-Id: <20190815163504.18937-15-dgilbert@redhat.com>
In-Reply-To: <20190815163504.18937-1-dgilbert@redhat.com>
References: <20190815163504.18937-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 15 Aug 2019 16:36:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 14/33] migration: use migration_in_postcopy() to
 check POSTCOPY_ACTIVE
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

Use common helper function to check the state.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190719071129.11880-1-richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/rdma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 3036221ee8..0e73e759ca 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3140,7 +3140,7 @@ static size_t qemu_rdma_save_page(QEMUFile *f, void=
 *opaque,
=20
     CHECK_ERROR_STATE();
=20
-    if (migrate_get_current()->state =3D=3D MIGRATION_STATUS_POSTCOPY_AC=
TIVE) {
+    if (migration_in_postcopy()) {
         rcu_read_unlock();
         return RAM_SAVE_CONTROL_NOT_SUPP;
     }
@@ -3775,7 +3775,7 @@ static int qemu_rdma_registration_start(QEMUFile *f=
, void *opaque,
=20
     CHECK_ERROR_STATE();
=20
-    if (migrate_get_current()->state =3D=3D MIGRATION_STATUS_POSTCOPY_AC=
TIVE) {
+    if (migration_in_postcopy()) {
         rcu_read_unlock();
         return 0;
     }
@@ -3810,7 +3810,7 @@ static int qemu_rdma_registration_stop(QEMUFile *f,=
 void *opaque,
=20
     CHECK_ERROR_STATE();
=20
-    if (migrate_get_current()->state =3D=3D MIGRATION_STATUS_POSTCOPY_AC=
TIVE) {
+    if (migration_in_postcopy()) {
         rcu_read_unlock();
         return 0;
     }
--=20
2.21.0


