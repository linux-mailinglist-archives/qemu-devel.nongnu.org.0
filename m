Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12F2D3BB6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 10:56:33 +0200 (CEST)
Received: from localhost ([::1]:47404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIqio-0001hK-VG
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 04:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46516)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iIqd8-0003NN-S7
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:50:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iIqd7-0005jQ-JS
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:50:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57772)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iIqd7-0005iv-Du
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:50:33 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AD41A10CC1EE
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 08:50:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADF255D6C8;
 Fri, 11 Oct 2019 08:50:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 25DA11132A05; Fri, 11 Oct 2019 10:50:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/4] qapi: Allow introspecting fix for savevm's cooperation
 with blockdev
Date: Fri, 11 Oct 2019 10:50:27 +0200
Message-Id: <20191011085027.28606-5-armbru@redhat.com>
In-Reply-To: <20191011085027.28606-1-armbru@redhat.com>
References: <20191011085027.28606-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Fri, 11 Oct 2019 08:50:32 +0000 (UTC)
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
Cc: kwolf@redhat.com, pkrempa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Krempa <pkrempa@redhat.com>

'savevm' was buggy as it considered all monitor-owned block device
nodes for snapshot. With the introduction of -blockdev, the common
usage made all nodes including protocol and backing file nodes be
monitor-owned and thus considered for snapshot.

This is a problem since the 'file' protocol nodes can't have internal
snapshots and it does not make sense to take snapshot of nodes
representing backing files.

This was fixed by commit 05f4aced658a02b02. Clients need to be able to
detect whether this fix is present.

Since savevm does not have an QMP alternative, add the feature for the
'human-monitor-command' backdoor which is used to call this command in
modern use.

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/misc.json | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 6bd11f50e6..35dca86ce7 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -1020,6 +1020,13 @@
 #
 # @cpu-index: The CPU to use for commands that require an implicit CPU
 #
+# Features:
+
+# @savevm-monitor-nodes: If present, HMP command savevm only snapshots
+#                        monitor-owned nodes if they have no parents.
+#                        This allows the use of 'savevm' with
+#                        -blockdev. (since 4.2)
+#
 # Returns: the output of the command as a string
 #
 # Since: 0.14.0
@@ -1047,7 +1054,8 @@
 ##
 { 'command': 'human-monitor-command',
   'data': {'command-line': 'str', '*cpu-index': 'int'},
-  'returns': 'str' }
+  'returns': 'str',
+  'features': [ 'savevm-monitor-nodes' ] }
=20
 ##
 # @change:
--=20
2.21.0


