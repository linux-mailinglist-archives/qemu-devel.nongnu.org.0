Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890E02DE29E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 13:17:26 +0100 (CET)
Received: from localhost ([::1]:56356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqEhJ-0007eS-4x
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 07:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEbF-0001z3-CH
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEb6-0001g3-SZ
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608293460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Muf0TDRCzmdZoE/3AMBHwfHe2irMWfqcsEU5yXnhwx8=;
 b=bPyc5ys0Bz8Y/dbGHRpI1xqbpYDi4kr6X9NWG+CtRkwbQACCzzq2GxWxoFEk2FZNJAdIXL
 uAATNb19stCHYavUUHYgRg5I1zgPVy1fF2fpiCNxr4W/tShjmK8pPFEshmHd2PVulfxDLY
 QvGVN+smKHd1cag86/hi1P5KsvF26l8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-NhG8FTRJMCKQYyN1BIXdYA-1; Fri, 18 Dec 2020 07:10:58 -0500
X-MC-Unique: NhG8FTRJMCKQYyN1BIXdYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 130E6107ACE4;
 Fri, 18 Dec 2020 12:10:57 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E206A60C15;
 Fri, 18 Dec 2020 12:10:55 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/17] iotests:172: use _filter_qom_path
Date: Fri, 18 Dec 2020 13:10:32 +0100
Message-Id: <20201218121041.299788-9-kwolf@redhat.com>
In-Reply-To: <20201218121041.299788-1-kwolf@redhat.com>
References: <20201218121041.299788-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

device[NUMBER] thing in QOM path is not stable and tracking it during
code modifications is not fun. Let's filter it like it's already done
in iotest 186.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201216095205.526235-3-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/172     |   2 +-
 tests/qemu-iotests/172.out | 152 ++++++++++++++++++-------------------
 2 files changed, 77 insertions(+), 77 deletions(-)

diff --git a/tests/qemu-iotests/172 b/tests/qemu-iotests/172
index 3abfa72948..b45782e8db 100755
--- a/tests/qemu-iotests/172
+++ b/tests/qemu-iotests/172
@@ -73,7 +73,7 @@ check_floppy_qtree()
     (QEMU_OPTIONS="" do_run_qemu "$@" |
 	_filter_testdir |_filter_generated_node_ids | _filter_hmp |
         sed -ne '/^          dev: isa-fdc/,/^          dev:/{x;p};/^[a-z][^ ]* (NODE_NAME):* /,/^(qemu)$/{p}') 2>&1 |
-    _filter_win32 | _filter_qemu
+    _filter_win32 | _filter_qemu | _filter_qom_path
 }
 
 check_cache_mode()
diff --git a/tests/qemu-iotests/172.out b/tests/qemu-iotests/172.out
index cca2894af0..2cd4a8fd83 100644
--- a/tests/qemu-iotests/172.out
+++ b/tests/qemu-iotests/172.out
@@ -63,12 +63,12 @@ Testing: -fda TEST_DIR/t.qcow2
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -114,16 +114,16 @@ Testing: -fdb TEST_DIR/t.qcow2
                 share-rw = false
                 drive-type = "288"
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[16]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[23]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 floppy0: [not inserted]
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -169,17 +169,17 @@ Testing: -fda TEST_DIR/t.qcow2 -fdb TEST_DIR/t.qcow2.2
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/unattached/device[16]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[23]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -255,12 +255,12 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -306,16 +306,16 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2,index=1
                 share-rw = false
                 drive-type = "288"
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[16]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[23]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 floppy0: [not inserted]
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -361,17 +361,17 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=floppy,file=TEST_DIR/t
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/unattached/device[16]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[23]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -411,12 +411,12 @@ Use -device floppy,unit=0,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -453,12 +453,12 @@ Use -device floppy,unit=1,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -508,17 +508,17 @@ Use -device floppy,unit=1,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/unattached/device[16]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[23]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -556,12 +556,12 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[21]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -596,12 +596,12 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,unit=1
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[21]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -647,17 +647,17 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[1]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[21]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -708,17 +708,17 @@ Use -device floppy,unit=1,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[16]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[23]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -766,17 +766,17 @@ Use -device floppy,unit=0,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[16]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[23]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -838,17 +838,17 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -894,17 +894,17 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -950,17 +950,17 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 share-rw = false
                 drive-type = "144"
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1006,17 +1006,17 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 share-rw = false
                 drive-type = "144"
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1071,17 +1071,17 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1127,17 +1127,17 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1191,17 +1191,17 @@ Use -device floppy,unit=0,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1249,17 +1249,17 @@ Use -device floppy,unit=0,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1307,17 +1307,17 @@ Use -device floppy,unit=1,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1365,17 +1365,17 @@ Use -device floppy,unit=1,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1410,12 +1410,12 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -global floppy.drive=none0 -device
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[21]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1603,12 +1603,12 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
                 share-rw = false
                 drive-type = "120"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[21]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1643,12 +1643,12 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
                 share-rw = false
                 drive-type = "288"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[21]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1686,12 +1686,12 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,logical
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[21]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1726,12 +1726,12 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,physica
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[21]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
-- 
2.29.2


