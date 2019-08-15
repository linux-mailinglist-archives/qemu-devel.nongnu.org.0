Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620DC8F141
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 18:52:23 +0200 (CEST)
Received: from localhost ([::1]:44464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyIz7-0004Cs-U2
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 12:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47300)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1hyIjI-0001yV-0F
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:36:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hyIjE-0002h1-2I
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:35:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44268)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hyIjD-0002fk-Rf
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:35:56 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2FBEE2A09B2;
 Thu, 15 Aug 2019 16:35:55 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-19.ams2.redhat.com
 [10.36.117.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A4BCBAAC;
 Thu, 15 Aug 2019 16:35:49 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Aug 2019 17:34:44 +0100
Message-Id: <20190815163504.18937-14-dgilbert@redhat.com>
In-Reply-To: <20190815163504.18937-1-dgilbert@redhat.com>
References: <20190815163504.18937-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 15 Aug 2019 16:35:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 13/33] migration/postcopy: start_postcopy could
 be true only when migrate_postcopy() return true
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

There is only one place to set start_postcopy to true,
qmp_migrate_start_postcopy(), which make sure start_postcopy could be
set to true when migrate_postcopy() return true.

So start_postcopy is true implies the other one.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190718083747.5859-1-richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 7c66da3a83..8331e62831 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3103,8 +3103,7 @@ static MigIterateState migration_iteration_run(Migr=
ationState *s)
=20
     if (pending_size && pending_size >=3D s->threshold_size) {
         /* Still a significant amount to transfer */
-        if (migrate_postcopy() && !in_postcopy &&
-            pend_pre <=3D s->threshold_size &&
+        if (!in_postcopy && pend_pre <=3D s->threshold_size &&
             atomic_read(&s->start_postcopy)) {
             if (postcopy_start(s)) {
                 error_report("%s: postcopy failed to start", __func__);
--=20
2.21.0


