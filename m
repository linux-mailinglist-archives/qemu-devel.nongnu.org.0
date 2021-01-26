Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C303040F3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:53:21 +0100 (CET)
Received: from localhost ([::1]:59862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Pia-0002Ya-6u
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEF-0001AW-BN
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEA-0006VO-V1
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1+SCsqWrq8Ah0b8QSxeCCvBE8ZkHhxyRujSsLIGIMCo=;
 b=fWrVtcW227Dta4Gjh5YQ52SVOD8x9COAjeIDG9q87uiLAvW07Ro4OcZiXiN0/G4zs7INXd
 6IGE25qVaxIFZHpioqH873aPIkRmAwosnVViS6NwlvD3WhRPcbiqXxaqmOLmDIjNNqLjF9
 TLEAb99Xbd5WFY7n3/SFhO/CzsYJ+e8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-wQnTNMPINQGB9A8eNaOQHw-1; Tue, 26 Jan 2021 09:21:51 -0500
X-MC-Unique: wQnTNMPINQGB9A8eNaOQHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 565A28017FB;
 Tue, 26 Jan 2021 14:21:50 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A27F60C47;
 Tue, 26 Jan 2021 14:21:48 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 40/53] iotests: 257: prepare for backup over block-copy
Date: Tue, 26 Jan 2021 15:20:03 +0100
Message-Id: <20210126142016.806073-41-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Iotest 257 dumps a lot of in-progress information of backup job, such
as offset and bitmap dirtiness. Further commit will move backup to be
one block-copy call, which will introduce async parallel requests
instead of plain cluster-by-cluster copying. To keep things
deterministic, allow only one worker (only one copy request at a time)
for this test.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-15-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/257     |   1 +
 tests/qemu-iotests/257.out | 306 ++++++++++++++++++-------------------
 2 files changed, 154 insertions(+), 153 deletions(-)

diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257
index a2f4b5afe6..7cd2520829 100755
--- a/tests/qemu-iotests/257
+++ b/tests/qemu-iotests/257
@@ -192,6 +192,7 @@ def blockdev_backup(vm, device, target, sync, **kwargs):
                         target=target,
                         sync=sync,
                         filter_node_name='backup-top',
+                        x_perf={'max-workers': 1},
                         **kwargs)
     return result
 
diff --git a/tests/qemu-iotests/257.out b/tests/qemu-iotests/257.out
index 64dd460055..a7ba512f4c 100644
--- a/tests/qemu-iotests/257.out
+++ b/tests/qemu-iotests/257.out
@@ -30,7 +30,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -78,7 +78,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -92,7 +92,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 
 --- Write #2 ---
@@ -205,7 +205,7 @@ expecting 15 dirty sectors; have 15. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -219,7 +219,7 @@ expecting 15 dirty sectors; have 15. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -290,7 +290,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -338,7 +338,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -354,7 +354,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"action": "report", "device": "backup_1", "operation": "read"}, "event": "BLOCK_JOB_ERROR", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "backup_1", "error": "Input/output error", "len": 393216, "offset": 65536, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
@@ -416,7 +416,7 @@ expecting 14 dirty sectors; have 14. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -430,7 +430,7 @@ expecting 14 dirty sectors; have 14. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -501,7 +501,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -549,7 +549,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -563,7 +563,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 
 --- Write #2 ---
@@ -676,7 +676,7 @@ expecting 15 dirty sectors; have 15. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -690,7 +690,7 @@ expecting 15 dirty sectors; have 15. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -761,7 +761,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -809,7 +809,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -823,7 +823,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 
 --- Write #2 ---
@@ -936,7 +936,7 @@ expecting 15 dirty sectors; have 15. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -950,7 +950,7 @@ expecting 15 dirty sectors; have 15. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -1021,7 +1021,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -1069,7 +1069,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -1085,7 +1085,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"action": "report", "device": "backup_1", "operation": "read"}, "event": "BLOCK_JOB_ERROR", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "backup_1", "error": "Input/output error", "len": 393216, "offset": 65536, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
@@ -1147,7 +1147,7 @@ expecting 14 dirty sectors; have 14. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -1161,7 +1161,7 @@ expecting 14 dirty sectors; have 14. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -1232,7 +1232,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -1280,7 +1280,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -1294,7 +1294,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 
 --- Write #2 ---
@@ -1407,7 +1407,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -1421,7 +1421,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -1492,7 +1492,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -1540,7 +1540,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -1554,7 +1554,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 
 --- Write #2 ---
@@ -1667,7 +1667,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -1681,7 +1681,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -1752,7 +1752,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -1800,7 +1800,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -1816,7 +1816,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"action": "report", "device": "backup_1", "operation": "read"}, "event": "BLOCK_JOB_ERROR", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "backup_1", "error": "Input/output error", "len": 393216, "offset": 65536, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
@@ -1878,7 +1878,7 @@ expecting 13 dirty sectors; have 13. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -1892,7 +1892,7 @@ expecting 13 dirty sectors; have 13. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -1963,7 +1963,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -2011,7 +2011,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -2025,7 +2025,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "bitmap", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 
 --- Write #2 ---
@@ -2138,7 +2138,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -2152,7 +2152,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -2223,7 +2223,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -2271,7 +2271,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -2285,7 +2285,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "full", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "full", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 
 --- Write #2 ---
@@ -2398,7 +2398,7 @@ expecting 15 dirty sectors; have 15. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -2412,7 +2412,7 @@ expecting 15 dirty sectors; have 15. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -2483,7 +2483,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -2531,7 +2531,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -2547,7 +2547,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "full", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "full", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"action": "report", "device": "backup_1", "operation": "read"}, "event": "BLOCK_JOB_ERROR", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "backup_1", "error": "Input/output error", "len": 67108864, "offset": 983040, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
@@ -2609,7 +2609,7 @@ expecting 14 dirty sectors; have 14. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -2623,7 +2623,7 @@ expecting 14 dirty sectors; have 14. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -2694,7 +2694,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -2742,7 +2742,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -2756,7 +2756,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "full", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "full", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 
 --- Write #2 ---
@@ -2869,7 +2869,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -2883,7 +2883,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -2954,7 +2954,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -3002,7 +3002,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -3016,7 +3016,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "full", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "full", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 
 --- Write #2 ---
@@ -3129,7 +3129,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -3143,7 +3143,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -3214,7 +3214,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -3262,7 +3262,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -3278,7 +3278,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "full", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "full", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"action": "report", "device": "backup_1", "operation": "read"}, "event": "BLOCK_JOB_ERROR", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "backup_1", "error": "Input/output error", "len": 67108864, "offset": 983040, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
@@ -3340,7 +3340,7 @@ expecting 1014 dirty sectors; have 1014. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -3354,7 +3354,7 @@ expecting 1014 dirty sectors; have 1014. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -3425,7 +3425,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -3473,7 +3473,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -3487,7 +3487,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "full", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "full", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 
 --- Write #2 ---
@@ -3600,7 +3600,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -3614,7 +3614,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -3685,7 +3685,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -3733,7 +3733,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -3747,7 +3747,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "top", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "top", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 
 --- Write #2 ---
@@ -3860,7 +3860,7 @@ expecting 15 dirty sectors; have 15. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -3874,7 +3874,7 @@ expecting 15 dirty sectors; have 15. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -3945,7 +3945,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -3993,7 +3993,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -4009,7 +4009,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "top", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "top", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"action": "report", "device": "backup_1", "operation": "read"}, "event": "BLOCK_JOB_ERROR", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "backup_1", "error": "Input/output error", "len": 458752, "offset": 65536, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
@@ -4071,7 +4071,7 @@ expecting 14 dirty sectors; have 14. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -4085,7 +4085,7 @@ expecting 14 dirty sectors; have 14. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -4156,7 +4156,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -4204,7 +4204,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -4218,7 +4218,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "top", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "top", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 
 --- Write #2 ---
@@ -4331,7 +4331,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -4345,7 +4345,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -4416,7 +4416,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -4464,7 +4464,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -4478,7 +4478,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "top", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "top", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 
 --- Write #2 ---
@@ -4591,7 +4591,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -4605,7 +4605,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -4676,7 +4676,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -4724,7 +4724,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -4740,7 +4740,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "top", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "top", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"action": "report", "device": "backup_1", "operation": "read"}, "event": "BLOCK_JOB_ERROR", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "backup_1", "error": "Input/output error", "len": 458752, "offset": 65536, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
@@ -4802,7 +4802,7 @@ expecting 14 dirty sectors; have 14. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -4816,7 +4816,7 @@ expecting 14 dirty sectors; have 14. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -4887,7 +4887,7 @@ write -P0x76 0x3ff0000 0x10000
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_0", "sync": "full", "target": "ref_target_0", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -4935,7 +4935,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_1", "sync": "full", "target": "ref_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_1", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -4949,7 +4949,7 @@ expecting 6 dirty sectors; have 6. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "top", "target": "backup_target_1"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_1", "sync": "top", "target": "backup_target_1", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 
 --- Write #2 ---
@@ -5062,7 +5062,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "ref_backup_2", "sync": "full", "target": "ref_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"data": {"device": "ref_backup_2", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 
@@ -5076,7 +5076,7 @@ expecting 12 dirty sectors; have 12. OK!
 {"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
 {"return": {}}
 {}
-{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2"}}
+{"execute": "blockdev-backup", "arguments": {"auto-finalize": false, "bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "backup_2", "sync": "bitmap", "target": "backup_target_2", "x-perf": {"max-workers": 1}}}
 {"return": {}}
 {"execute": "job-finalize", "arguments": {"id": "backup_2"}}
 {"return": {}}
@@ -5139,155 +5139,155 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 -- Sync mode incremental tests --
 
-{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "must provide a valid bitmap name for 'incremental' sync mode"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "must provide a valid bitmap name for 'incremental' sync mode"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "must provide a valid bitmap name for 'incremental' sync mode"}}
 
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "must provide a valid bitmap name for 'incremental' sync mode"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap sync mode must be 'on-success' when using sync mode 'incremental'"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap sync mode must be 'on-success' when using sync mode 'incremental'"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap sync mode must be 'on-success' when using sync mode 'incremental'"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "incremental", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap sync mode must be 'on-success' when using sync mode 'incremental'"}}
 
 -- Sync mode bitmap tests --
 
-{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "must provide a valid bitmap name for 'bitmap' sync mode"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "must provide a valid bitmap name for 'bitmap' sync mode"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "must provide a valid bitmap name for 'bitmap' sync mode"}}
 
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "must provide a valid bitmap name for 'bitmap' sync mode"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "bitmap", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap sync mode must be given when providing a bitmap"}}
 
 -- Sync mode full tests --
 
-{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Cannot specify bitmap sync mode without a bitmap"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Cannot specify bitmap sync mode without a bitmap"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Cannot specify bitmap sync mode without a bitmap"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap sync mode 'never' has no meaningful effect when combined with sync mode 'full'"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "full", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap sync mode must be given when providing a bitmap"}}
 
 -- Sync mode top tests --
 
-{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Cannot specify bitmap sync mode without a bitmap"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Cannot specify bitmap sync mode without a bitmap"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Cannot specify bitmap sync mode without a bitmap"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap sync mode 'never' has no meaningful effect when combined with sync mode 'top'"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "top", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap sync mode must be given when providing a bitmap"}}
 
 -- Sync mode none tests --
 
-{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Cannot specify bitmap sync mode without a bitmap"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Cannot specify bitmap sync mode without a bitmap"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Cannot specify bitmap sync mode without a bitmap"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could not be found"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "bitmap-mode": "on-success", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "sync mode 'none' does not produce meaningful bitmap outputs"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "bitmap-mode": "always", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "sync mode 'none' does not produce meaningful bitmap outputs"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "bitmap-mode": "never", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "sync mode 'none' does not produce meaningful bitmap outputs"}}
 
-{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target"}}
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "device": "drive0", "filter-node-name": "backup-top", "job-id": "api_job", "sync": "none", "target": "backup_target", "x-perf": {"max-workers": 1}}}
 {"error": {"class": "GenericError", "desc": "Bitmap sync mode must be given when providing a bitmap"}}
 
-- 
2.29.2


