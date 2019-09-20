Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E69B9347
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 16:39:56 +0200 (CEST)
Received: from localhost ([::1]:60320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBK4g-0003bm-VC
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 10:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33850)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pkrempa@redhat.com>) id 1iBJs7-0002PN-On
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 10:26:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pkrempa@redhat.com>) id 1iBJs6-00034I-HK
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 10:26:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46532)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pkrempa@redhat.com>) id 1iBJs6-000346-Cf
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 10:26:54 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B72BE59449;
 Fri, 20 Sep 2019 14:26:53 +0000 (UTC)
Received: from angien.brq.redhat.com (unknown [10.43.2.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC57319D7A;
 Fri, 20 Sep 2019 14:26:49 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] qapi: Allow introspecting fix for savevm's cooperation
 with blockdev
Date: Fri, 20 Sep 2019 16:26:45 +0200
Message-Id: <992ea9ca130b4fb6dbf82726aa3b1d8040c16944.1568989362.git.pkrempa@redhat.com>
In-Reply-To: <cover.1568989362.git.pkrempa@redhat.com>
References: <cover.1568989362.git.pkrempa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 20 Sep 2019 14:26:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

savevm was buggy as it considered all monitor owned block device nodes
for snapshot. With introduction of -blockdev the common usage made all
nodes including protocol nodes monitor owned and thus considered for
snapshot. This was fixed but clients need to be able to detect whether
this fix is present.

Since savevm does not have an QMP alternative add the feature for the
'human-monitor-command' backdoor which is used to call this command in
modern use.

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
---
 qapi/misc.json | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 6bd11f50e6..673445dfa9 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -1020,6 +1020,12 @@
 #
 # @cpu-index: The CPU to use for commands that require an implicit CPU
 #
+# Features:
+# @savevm-blockdev-monitor-nodes: If present, the savevm monitor command=
 only
+#                                 snapshots monitor owned nodes if they =
have no
+#                                 parents. This allows to use 'savevm' w=
ith
+#                                 -blockdev. (since 4.2)
+#
 # Returns: the output of the command as a string
 #
 # Since: 0.14.0
@@ -1047,7 +1053,8 @@
 ##
 { 'command': 'human-monitor-command',
   'data': {'command-line': 'str', '*cpu-index': 'int'},
-  'returns': 'str' }
+  'returns': 'str',
+  'features' : [ { 'name': 'savevm-blockdev-monitor-nodes' } ] }

 ##
 # @change:
--=20
2.21.0


