Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3096D76B4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 14:41:27 +0200 (CEST)
Received: from localhost ([::1]:43778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKM8k-0002b3-SW
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 08:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42026)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iKM75-0001dc-TG
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 08:39:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iKM74-0002Gg-UR
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 08:39:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59086)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iKM71-0002EP-3r; Tue, 15 Oct 2019 08:39:39 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A89A8302C096;
 Tue, 15 Oct 2019 12:39:37 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-177.ams2.redhat.com
 [10.36.117.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A9D461F41;
 Tue, 15 Oct 2019 12:39:35 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] blockdev: Use error_report() in hmp_commit()
Date: Tue, 15 Oct 2019 14:39:32 +0200
Message-Id: <20191015123932.12214-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 15 Oct 2019 12:39:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of using monitor_printf() to report errors, hmp_commit() should
use error_report() like other places do.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 blockdev.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index f89e48fc79..e2358966c3 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1088,11 +1088,11 @@ void hmp_commit(Monitor *mon, const QDict *qdict)
=20
         blk =3D blk_by_name(device);
         if (!blk) {
-            monitor_printf(mon, "Device '%s' not found\n", device);
+            error_report("Device '%s' not found", device);
             return;
         }
         if (!blk_is_available(blk)) {
-            monitor_printf(mon, "Device '%s' has no medium\n", device);
+            error_report("Device '%s' has no medium", device);
             return;
         }
=20
@@ -1105,8 +1105,7 @@ void hmp_commit(Monitor *mon, const QDict *qdict)
         aio_context_release(aio_context);
     }
     if (ret < 0) {
-        monitor_printf(mon, "'commit' error for '%s': %s\n", device,
-                       strerror(-ret));
+        error_report("'commit' error for '%s': %s", device, strerror(-re=
t));
     }
 }
=20
--=20
2.20.1


