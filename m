Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B2C2DE2AC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 13:19:49 +0100 (CET)
Received: from localhost ([::1]:35412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqEjc-0002R0-9d
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 07:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEb9-0001n4-Pr
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEb5-0001ee-Q4
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608293458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7tOIEeirGXlxkGsf9Qlnd3pkP40MD7zbMOvzjGi6Nc=;
 b=MIQgXE5PECRcr8wGj1TcKp2/S+52UeVuPcd7MSzjQqEx3Vp/8IYYc7f2tIsej1zU6q7eub
 qyxIjLVhhkvK1k+E5jsJ/maDyhkMlKL8BMjS9/S2Vr7M2iUyCdpXDr96k9dUHoFJP/XzHr
 6ClUehvy3KzMzwkFyoEA1ohGp4Y5/xU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-L0vZoJkMMAi6hu0zrTHA4w-1; Fri, 18 Dec 2020 07:10:56 -0500
X-MC-Unique: L0vZoJkMMAi6hu0zrTHA4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 976C5CE646;
 Fri, 18 Dec 2020 12:10:55 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8332260C15;
 Fri, 18 Dec 2020 12:10:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/17] iotests: make _filter_qom_path more strict
Date: Fri, 18 Dec 2020 13:10:31 +0100
Message-Id: <20201218121041.299788-8-kwolf@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

According to original commit, that added this filter (627f607e3dddb2),
the problematic thing in qom path is device[NUMBER], not the whole
path. Seems that tracking the other parts of the path in iotest output
is not bad. Let's make _filter_qom_path stricter.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201216095205.526235-2-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/186.out       | 56 ++++++++++++++++----------------
 tests/qemu-iotests/common.filter |  2 +-
 2 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/tests/qemu-iotests/186.out b/tests/qemu-iotests/186.out
index 5b3504042a..01530040e5 100644
--- a/tests/qemu-iotests/186.out
+++ b/tests/qemu-iotests/186.out
@@ -7,7 +7,7 @@ Testing: -device floppy
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 /machine/peripheral-anon/device[1]: [not inserted]
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
 (qemu) quit
 
@@ -23,7 +23,7 @@ Testing: -device ide-cd
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 /machine/peripheral-anon/device[1]: [not inserted]
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
 (qemu) quit
 
@@ -39,7 +39,7 @@ Testing: -device scsi-cd
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 /machine/peripheral-anon/device[1]: [not inserted]
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
 (qemu) quit
 
@@ -58,7 +58,7 @@ Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device ide-hd,d
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Cache mode:       writeback
 (qemu) quit
 
@@ -74,7 +74,7 @@ Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device scsi-hd,
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Cache mode:       writeback
 (qemu) quit
 
@@ -90,7 +90,7 @@ Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device virtio-b
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]/virtio-backend
     Cache mode:       writeback
 (qemu) quit
 
@@ -98,7 +98,7 @@ Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device virtio-b
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral/qdev_id/virtio-backend
     Cache mode:       writeback
 (qemu) quit
 
@@ -106,7 +106,7 @@ Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device floppy,d
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 (qemu) quit
@@ -124,7 +124,7 @@ Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device ide-cd,d
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 (qemu) quit
@@ -142,7 +142,7 @@ Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device scsi-cd,
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 (qemu) quit
@@ -191,7 +191,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
     Cache mode:       writeback
 
 null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral/qdev_id/virtio-backend
     Cache mode:       writeback
 (qemu) quit
 
@@ -241,7 +241,7 @@ Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device ide
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Cache mode:       writeback
 (qemu) quit
 
@@ -257,7 +257,7 @@ Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device scs
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Cache mode:       writeback
 (qemu) quit
 
@@ -273,7 +273,7 @@ Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device vir
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]/virtio-backend
     Cache mode:       writeback
 (qemu) quit
 
@@ -281,7 +281,7 @@ Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device vir
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral/qdev_id/virtio-backend
     Cache mode:       writeback
 (qemu) quit
 
@@ -289,7 +289,7 @@ Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device flo
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 (qemu) quit
@@ -307,7 +307,7 @@ Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device ide
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 (qemu) quit
@@ -325,7 +325,7 @@ Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device scs
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 (qemu) quit
@@ -353,7 +353,7 @@ Testing: -drive if=none -device floppy,drive=none0
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0: [not inserted]
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
 (qemu) quit
 
@@ -369,7 +369,7 @@ Testing: -drive if=none -device ide-cd,drive=none0
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0: [not inserted]
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
 (qemu) quit
 
@@ -385,7 +385,7 @@ Testing: -drive if=none -device scsi-cd,drive=none0
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0: [not inserted]
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
 (qemu) quit
 
@@ -404,7 +404,7 @@ Testing: -drive if=floppy
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 floppy0: [not inserted]
-    Attached to:      PATH
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 (qemu) quit
 
@@ -412,7 +412,7 @@ Testing: -drive if=floppy,driver=null-co,read-zeroes=on
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 floppy0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 (qemu) quit
@@ -421,7 +421,7 @@ Testing: -drive if=ide,driver=null-co,read-zeroes=on
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 ide0-hd0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/unattached/device[N]
     Cache mode:       writeback
 (qemu) quit
 
@@ -429,7 +429,7 @@ Testing: -drive if=ide,media=cdrom
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 ide0-cd0: [not inserted]
-    Attached to:      PATH
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 (qemu) quit
 
@@ -437,7 +437,7 @@ Testing: -drive if=ide,driver=null-co,read-zeroes=on,media=cdrom
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 ide0-cd0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co"} (null-co, read-only)
-    Attached to:      PATH
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 (qemu) quit
@@ -446,7 +446,7 @@ Testing: -drive if=virtio,driver=null-co,read-zeroes=on
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 virtio0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]/virtio-backend
     Cache mode:       writeback
 (qemu) quit
 
@@ -454,7 +454,7 @@ Testing: -drive if=pflash,driver=null-co,read-zeroes=on,size=1M
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 pflash0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co", "size": "1M"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/system.flash0
     Cache mode:       writeback
 (qemu) quit
 
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 172ea5752e..268b749e2f 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -37,7 +37,7 @@ _filter_generated_node_ids()
 
 _filter_qom_path()
 {
-    $SED -e 's#\(Attached to: *\) /.*#\1 PATH#'
+    $SED -e '/Attached to:/s/\device[[0-9]\+\]/device[N]/g'
 }
 
 # replace occurrences of the actual TEST_DIR value with TEST_DIR
-- 
2.29.2


