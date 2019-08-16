Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA9690B58
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Aug 2019 01:20:05 +0200 (CEST)
Received: from localhost ([::1]:33124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hylVs-0004Xd-Km
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 19:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46066)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1hylPZ-0006By-1I
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:13:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hylPX-0005hn-HB
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:13:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51440)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hylPU-0005cz-EO; Fri, 16 Aug 2019 19:13:28 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 34C721089042;
 Fri, 16 Aug 2019 23:13:26 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-187.bos.redhat.com [10.18.17.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C3BE19C6A;
 Fri, 16 Aug 2019 23:13:25 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 19:12:46 -0400
Message-Id: <20190816231318.8650-5-jsnow@redhat.com>
In-Reply-To: <20190816231318.8650-1-jsnow@redhat.com>
References: <20190816231318.8650-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Fri, 16 Aug 2019 23:13:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 04/36] qapi: add BitmapSyncMode enum
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
Cc: peter.maydell@linaro.org, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-stable@nongnu.org,
 Max Reitz <mreitz@redhat.com>, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Depending on what a user is trying to accomplish, there might be a few
bitmap cleanup actions that occur when an operation is finished that
could be useful.

I am proposing three:
- NEVER: The bitmap is never synchronized against what was copied.
- ALWAYS: The bitmap is always synchronized, even on failures.
- ON-SUCCESS: The bitmap is synchronized only on success.

The existing incremental backup modes use 'on-success' semantics,
so add just that one for right now.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-id: 20190709232550.10724-5-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 qapi/block-core.json | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 8ca12004ae9..06eb3bb3d78 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1134,6 +1134,20 @@
 { 'enum': 'MirrorSyncMode',
   'data': ['top', 'full', 'none', 'incremental'] }
=20
+##
+# @BitmapSyncMode:
+#
+# An enumeration of possible behaviors for the synchronization of a bitm=
ap
+# when used for data copy operations.
+#
+# @on-success: The bitmap is only synced when the operation is successfu=
l.
+#              This is the behavior always used for 'INCREMENTAL' backup=
s.
+#
+# Since: 4.2
+##
+{ 'enum': 'BitmapSyncMode',
+  'data': ['on-success'] }
+
 ##
 # @MirrorCopyMode:
 #
--=20
2.21.0


