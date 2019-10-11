Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3863AD3E69
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 13:25:56 +0200 (CEST)
Received: from localhost ([::1]:48640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIt3T-0003o2-0F
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 07:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43469)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1iIsym-0006eX-08
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 07:21:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1iIsyk-0001o1-W1
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 07:21:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43422)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1iIsyk-0001nI-Qk
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 07:21:02 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 138B518C4265;
 Fri, 11 Oct 2019 11:21:01 +0000 (UTC)
Received: from localhost (dhcp-192-238.str.redhat.com [10.33.192.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2CA61001B09;
 Fri, 11 Oct 2019 11:20:53 +0000 (UTC)
From: Jens Freimann <jfreimann@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/10] qapi: add unplug primary event
Date: Fri, 11 Oct 2019 13:20:09 +0200
Message-Id: <20191011112015.11785-5-jfreimann@redhat.com>
In-Reply-To: <20191011112015.11785-1-jfreimann@redhat.com>
References: <20191011112015.11785-1-jfreimann@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Fri, 11 Oct 2019 11:21:01 +0000 (UTC)
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
Cc: parav@mellanox.com, mst@redhat.com, aadam@redhat.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, laine@redhat.com, ailan@redhat.com,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This event is emitted when we sent a request to unplug a
failover primary device from the Guest OS and it includes the
device id of the primary device.

Signed-off-by: Jens Freimann <jfreimann@redhat.com>
---
 qapi/migration.json | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/qapi/migration.json b/qapi/migration.json
index 82feb5bd39..52e69e2868 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1448,3 +1448,22 @@
 # Since: 3.0
 ##
 { 'command': 'migrate-pause', 'allow-oob': true }
+
+##
+# @UNPLUG_PRIMARY:
+#
+# Emitted from source side of a migration when migration state is
+# WAIT_UNPLUG. Device was unplugged by guest operating system.
+# Device resources in QEMU are kept on standby to be able to re-plug it =
in case
+# of migration failure.
+#
+# @device_id: QEMU device id of the unplugged device
+#
+# Since: 4.2
+#
+# Example:
+#   {"event": "UNPLUG_PRIMARY", "data": {"device_id": "hostdev0"} }
+#
+##
+{ 'event': 'UNPLUG_PRIMARY',
+  'data': { 'device_id': 'str' } }
--=20
2.21.0


