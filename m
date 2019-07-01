Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AD11CF2C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 20:37:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52397 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQcIu-00085B-88
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 14:37:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQcGV-0006PV-PR
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:35:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQcGU-0000VR-Ru
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:35:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47598)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hQcGU-0000UT-MU
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:35:02 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 01CD730018E9;
	Tue, 14 May 2019 18:35:02 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-232.ams2.redhat.com
	[10.36.117.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 70E80608AB;
	Tue, 14 May 2019 18:35:00 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
	ehabkost@redhat.com, richardw.yang@linux.intel.com,
	yury-kotov@yandex-team.ru, chen.zhang@intel.com
Date: Tue, 14 May 2019 19:34:40 +0100
Message-Id: <20190514183454.12758-3-dgilbert@redhat.com>
In-Reply-To: <20190514183454.12758-1-dgilbert@redhat.com>
References: <20190514183454.12758-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 14 May 2019 18:35:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 02/16] migration: not necessary to check ops
 again
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

During each iteration, se->ops is checked before each loop. So it is not
necessary to check it again and simplify the following check a little.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190327013130.26259-1-richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/savevm.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 34bcad3807..587fec8ce2 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1157,15 +1157,13 @@ int qemu_savevm_state_iterate(QEMUFile *f, bool p=
ostcopy)
         if (!se->ops || !se->ops->save_live_iterate) {
             continue;
         }
-        if (se->ops && se->ops->is_active) {
-            if (!se->ops->is_active(se->opaque)) {
-                continue;
-            }
+        if (se->ops->is_active &&
+            !se->ops->is_active(se->opaque)) {
+            continue;
         }
-        if (se->ops && se->ops->is_active_iterate) {
-            if (!se->ops->is_active_iterate(se->opaque)) {
-                continue;
-            }
+        if (se->ops->is_active_iterate &&
+            !se->ops->is_active_iterate(se->opaque)) {
+            continue;
         }
         /*
          * In the postcopy phase, any device that doesn't know how to
--=20
2.21.0


