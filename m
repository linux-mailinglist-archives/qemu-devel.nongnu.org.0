Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEC831FCB8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 17:04:55 +0100 (CET)
Received: from localhost ([::1]:59962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD8H0-0002gf-KH
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 11:04:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lD7nC-0000Tf-Bz
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 10:34:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lD7n9-00060E-SD
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 10:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613748842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hIvuFSRFrWaR1FxrpC6M0vrFiav01eM5D765IvhF2r8=;
 b=ceWspYEPJwdkO9LzUh5Sw0X00oDenvmoAq7M1uenOgUq7dBzmw7eImCG2j9jOJDjWJVOW7
 ogTSVPYbvXPQh/rGcCKMd4zdwx7n7wgt7u/1W13/KiytHCajbJzk0ICrEI1Gnmv+LeQXXe
 M5+I1eNFYdPvmxo8d9OXW/3eRacmhfs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-Ys8CpWioMeyViZ3gk2t8-Q-1; Fri, 19 Feb 2021 10:33:58 -0500
X-MC-Unique: Ys8CpWioMeyViZ3gk2t8-Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 316E11936B60;
 Fri, 19 Feb 2021 15:33:57 +0000 (UTC)
Received: from localhost (ovpn-112-191.ams2.redhat.com [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C40FE5D734;
 Fri, 19 Feb 2021 15:33:56 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/3] iotests/283: Check that finalize drops backup-top
Date: Fri, 19 Feb 2021 16:33:48 +0100
Message-Id: <20210219153348.41861-4-mreitz@redhat.com>
In-Reply-To: <20210219153348.41861-1-mreitz@redhat.com>
References: <20210219153348.41861-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without any of HEAD^ or HEAD^^ applied, qemu will most likely crash on
the qemu-io invocation, for a variety of immediate reasons.  The
underlying problem is generally a use-after-free access into
backup-top's BlockCopyState.

With only HEAD^ applied, qemu-io will run into an EIO (which is not
capture by the output, but you can see that the qemu-io invocation will
be accepted (i.e., qemu-io will run) in contrast to the reference
output, where the node name cannot be found), and qemu will then crash
in query-named-block-nodes: bdrv_get_allocated_file_size() detects
backup-top to be a filter and passes the request through to its child.
However, after bdrv_backup_top_drop(), that child is NULL, so the
recursive call crashes.

With HEAD^^ applied, this test should pass.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/283     | 55 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/283.out | 15 +++++++++++
 2 files changed, 70 insertions(+)

diff --git a/tests/qemu-iotests/283 b/tests/qemu-iotests/283
index 79643e375b..509dcbbcf4 100755
--- a/tests/qemu-iotests/283
+++ b/tests/qemu-iotests/283
@@ -97,3 +97,58 @@ vm.qmp_log('blockdev-add', **{
 vm.qmp_log('blockdev-backup', sync='full', device='source', target='target')
 
 vm.shutdown()
+
+
+"""
+Check that the backup-top node is gone after job-finalize.
+
+During finalization, the node becomes inactive and can no longer
+function.  If it is still present, new parents might be attached, and
+there would be no meaningful way to handle their I/O requests.
+"""
+
+print('\n=== backup-top should be gone after job-finalize ===\n')
+
+vm = iotests.VM()
+vm.launch()
+
+vm.qmp_log('blockdev-add', **{
+    'node-name': 'source',
+    'driver': 'null-co',
+})
+
+vm.qmp_log('blockdev-add', **{
+    'node-name': 'target',
+    'driver': 'null-co',
+})
+
+vm.qmp_log('blockdev-backup',
+           job_id='backup',
+           device='source',
+           target='target',
+           sync='full',
+           filter_node_name='backup-filter',
+           auto_finalize=False,
+           auto_dismiss=False)
+
+vm.event_wait('BLOCK_JOB_PENDING', 5.0)
+
+# The backup-top filter should still be present prior to finalization
+assert vm.node_info('backup-filter') is not None
+
+vm.qmp_log('job-finalize', id='backup')
+vm.event_wait('BLOCK_JOB_COMPLETED', 5.0)
+
+# The filter should be gone now.  Check that by trying to access it
+# with qemu-io (which will most likely crash qemu if it is still
+# there.).
+vm.qmp_log('human-monitor-command',
+           command_line='qemu-io backup-filter "write 0 1M"')
+
+# (Also, do an explicit check.)
+assert vm.node_info('backup-filter') is None
+
+vm.qmp_log('job-dismiss', id='backup')
+vm.event_wait('JOB_STATUS_CHANGE', 5.0, {'data': {'status': 'null'}})
+
+vm.shutdown()
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index d8cff22cc1..7e9cd9a7d4 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -6,3 +6,18 @@
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
 {"error": {"class": "GenericError", "desc": "Cannot set permissions for backup-top filter: Conflicts with use by other as 'image', which uses 'write' on base"}}
+
+=== backup-top should be gone after job-finalize ===
+
+{"execute": "blockdev-add", "arguments": {"driver": "null-co", "node-name": "source"}}
+{"return": {}}
+{"execute": "blockdev-add", "arguments": {"driver": "null-co", "node-name": "target"}}
+{"return": {}}
+{"execute": "blockdev-backup", "arguments": {"auto-dismiss": false, "auto-finalize": false, "device": "source", "filter-node-name": "backup-filter", "job-id": "backup", "sync": "full", "target": "target"}}
+{"return": {}}
+{"execute": "job-finalize", "arguments": {"id": "backup"}}
+{"return": {}}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io backup-filter \"write 0 1M\""}}
+{"return": "Error: Cannot find device= nor node_name=backup-filter\r\n"}
+{"execute": "job-dismiss", "arguments": {"id": "backup"}}
+{"return": {}}
-- 
2.29.2


