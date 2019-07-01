Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141284C4FC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 03:34:26 +0200 (CEST)
Received: from localhost ([::1]:43054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdly4-0000fF-B8
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 21:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40761)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jsnow@redhat.com>) id 1hdleI-0002HM-PH
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 21:14:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hdlUk-0004kv-LJ
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 21:04:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54564)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hdlUj-0004ij-BD; Wed, 19 Jun 2019 21:04:05 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7F78585543;
 Thu, 20 Jun 2019 01:04:04 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-164.bos.redhat.com [10.18.17.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 649E71001E67;
 Thu, 20 Jun 2019 01:04:03 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed, 19 Jun 2019 21:03:45 -0400
Message-Id: <20190620010356.19164-2-jsnow@redhat.com>
In-Reply-To: <20190620010356.19164-1-jsnow@redhat.com>
References: <20190620010356.19164-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 20 Jun 2019 01:04:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 01/12] qapi: add BitmapSyncMode enum
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 vsementsov@virtuozzo.com, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Depending on what a user is trying to accomplish, there might be a few
bitmap cleanup actions that occur when an operation is finished that
could be useful.

I am proposing three:
- NEVER: The bitmap is never synchronized against what was copied.
- ALWAYS: The bitmap is always synchronized, even on failures.
- CONDITIONAL: The bitmap is synchronized only on success.

The existing incremental backup modes use 'conditional' semantics,
so add just that one for right now.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qapi/block-core.json | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 0d43d4f37c..caf28a71a0 100644
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
+# @conditional: The bitmap is only synchronized when the operation is su=
ccessul.
+#               This is useful for Incremental semantics.
+#
+# Since: 4.1
+##
+{ 'enum': 'BitmapSyncMode',
+  'data': ['conditional'] }
+
 ##
 # @MirrorCopyMode:
 #
--=20
2.21.0


