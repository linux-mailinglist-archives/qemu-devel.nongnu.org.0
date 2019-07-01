Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEE01CF59
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 20:48:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52565 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQcTK-00017v-VQ
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 14:48:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQcHO-0007Dx-7t
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:35:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQcHN-0001kZ-Bt
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:35:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10755)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hQcHN-0001jp-6e
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:35:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8092E19D05D;
	Tue, 14 May 2019 18:35:56 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-232.ams2.redhat.com
	[10.36.117.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03EC2608A6;
	Tue, 14 May 2019 18:35:54 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
	ehabkost@redhat.com, richardw.yang@linux.intel.com,
	yury-kotov@yandex-team.ru, chen.zhang@intel.com
Date: Tue, 14 May 2019 19:34:49 +0100
Message-Id: <20190514183454.12758-12-dgilbert@redhat.com>
In-Reply-To: <20190514183454.12758-1-dgilbert@redhat.com>
References: <20190514183454.12758-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 14 May 2019 18:35:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 11/16] migration/savevm: remove duplicate check
 of migration_is_blocked
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

Current call flow of save_snapshot is:

  save_snapshot
    migration_is_blocked
      qemu_savevm_state
        migration_is_blocked

Since qemu_savevm_state is only called in save_snapshot, this means
migration_is_blocked has been already checked.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190424004700.12766-2-richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/savevm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 81a9a2ef30..6e8912af49 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1418,10 +1418,6 @@ static int qemu_savevm_state(QEMUFile *f, Error **=
errp)
         return -EINVAL;
     }
=20
-    if (migration_is_blocked(errp)) {
-        return -EINVAL;
-    }
-
     if (migrate_use_block()) {
         error_setg(errp, "Block migration and snapshots are incompatible=
");
         return -EINVAL;
--=20
2.21.0


