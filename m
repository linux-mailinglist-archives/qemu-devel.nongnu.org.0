Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7252033DD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 11:45:32 +0200 (CEST)
Received: from localhost ([::1]:49418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnJ19-0007ET-OK
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 05:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnIyM-0001Ym-Ie
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 05:42:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38830
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnIyH-0003um-Pk
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 05:42:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592818952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r3ziOl0TQtuN8Hk5VE8mKCHKuPJz/7ZXzmfJOEGhKDY=;
 b=ejfR3EiYA4qBw6v54AHgcOkAjhlVn/eutP0fVVuYTP0NKqeC0FZgj9Z2yNKZTBKSCXKaY2
 B0M2yEtPx7JMWP0yRYOYapcHobWXDF7ENbFhhlq962yWCDpfC5N3A3NowBgfqtssqYFxOi
 slmWwkqF0v9igoqVb/j6nvk6/o80WzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-wYf7G-ebOvSiyrtzUfWR9w-1; Mon, 22 Jun 2020 05:42:30 -0400
X-MC-Unique: wYf7G-ebOvSiyrtzUfWR9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E62C6107ACF3;
 Mon, 22 Jun 2020 09:42:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D3155BACF;
 Mon, 22 Jun 2020 09:42:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BCB18113846F; Mon, 22 Jun 2020 11:42:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/16] iotests/172: Include "info block" in test output
Date: Mon, 22 Jun 2020 11:42:12 +0200
Message-Id: <20200622094227.1271650-2-armbru@redhat.com>
In-Reply-To: <20200622094227.1271650-1-armbru@redhat.com>
References: <20200622094227.1271650-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 01:27:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, mreitz@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The additional output demonstrates we screw up when -global isa-fdc
clashes with -drive if=floppy or its sugared forms: according to "info
qtree", only the latter backend is attached, but according to "info
block", both are.  For instance:

    Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveA=none0

	      dev: isa-fdc, id ""
	        [...]
		driveA = ""
		driveB = ""
                [...]
                bus: floppy-bus.0
                  type floppy-bus
                  dev: floppy, id ""
                    unit = 0 (0x0)
--->                drive = "floppy0"
    [...]
    floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
--->    Attached to:      /machine/unattached/device[15]
        Removable device: not locked, tray closed
        Cache mode:       writeback

    none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
--->    Attached to:      /machine/unattached/device[14]
        Cache mode:       writeback

/machine/unattached/device[15] is floppy, and
/machine/unattached/device[14] is isa-fdc.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qemu-iotests/172     |   5 +-
 tests/qemu-iotests/172.out | 486 +++++++++++++++++++++++++++++++++++++
 2 files changed, 489 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/172 b/tests/qemu-iotests/172
index 7195fb895a..19c2516cf8 100755
--- a/tests/qemu-iotests/172
+++ b/tests/qemu-iotests/172
@@ -69,9 +69,10 @@ check_floppy_qtree()
     #
     # Apply the sed filter to stdout only, but keep the stderr output and
     # filter the qemu program name in it.
-    echo "info qtree" |
+    printf "info qtree\ninfo block\n" |
     (QEMU_OPTIONS="" do_run_qemu "$@" |
-        sed -ne '/^          dev: isa-fdc/,/^          dev:/{x;p}' ) 2>&1 |
+	_filter_testdir |_filter_generated_node_ids | _filter_hmp |
+        sed -ne '/^          dev: isa-fdc/,/^          dev:/{x;p};/^[a-z][^ ]* (NODE_NAME):* /,/^(qemu)$/{p}') 2>&1 |
     _filter_win32 | _filter_qemu
 }
 
diff --git a/tests/qemu-iotests/172.out b/tests/qemu-iotests/172.out
index e782c5957e..a315866e17 100644
--- a/tests/qemu-iotests/172.out
+++ b/tests/qemu-iotests/172.out
@@ -62,6 +62,19 @@ Testing: -fda TEST_DIR/t.qcow2
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[22]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -fdb TEST_DIR/t.qcow2
 
@@ -100,6 +113,23 @@ Testing: -fdb TEST_DIR/t.qcow2
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "288"
+floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[16]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[23]
+    Removable device: not locked, tray closed
+
+floppy0: [not inserted]
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -fda TEST_DIR/t.qcow2 -fdb TEST_DIR/t.qcow2.2
 
@@ -138,6 +168,24 @@ Testing: -fda TEST_DIR/t.qcow2 -fdb TEST_DIR/t.qcow2.2
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+floppy1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/unattached/device[16]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[23]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 
 === Using -drive options ===
@@ -168,6 +216,19 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[22]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -drive if=floppy,file=TEST_DIR/t.qcow2,index=1
 
@@ -206,6 +267,23 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2,index=1
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "288"
+floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[16]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[23]
+    Removable device: not locked, tray closed
+
+floppy0: [not inserted]
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=floppy,file=TEST_DIR/t.qcow2.2,index=1
 
@@ -244,6 +322,24 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=floppy,file=TEST_DIR/t
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+floppy1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/unattached/device[16]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[23]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 
 === Using -drive if=none and -global ===
@@ -274,6 +370,19 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -global isa-fdc.driveA=none0
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[22]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -global isa-fdc.driveB=none0
 
@@ -301,6 +410,19 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -global isa-fdc.driveB=none0
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[22]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveA=none0 -global isa-fdc.driveB=none1
 
@@ -339,6 +461,24 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/unattached/device[16]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[23]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 
 === Using -drive if=none and -device ===
@@ -369,6 +509,19 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[21]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,unit=1
 
@@ -396,6 +549,19 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,unit=1
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[21]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device floppy,drive=none0 -device floppy,drive=none1,unit=1
 
@@ -434,6 +600,24 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[1]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[21]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 
 === Mixing -fdX and -global ===
@@ -475,6 +659,24 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global is
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/unattached/device[16]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[23]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveA=none0
 
@@ -513,6 +715,24 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global is
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[16]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[23]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveA=none0
 
@@ -540,6 +760,23 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global is
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/unattached/device[14]
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[22]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveB=none0
 
@@ -567,6 +804,23 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global is
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/unattached/device[14]
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[22]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 
 === Mixing -fdX and -device ===
@@ -608,6 +862,24 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[22]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device floppy,drive=none0,unit=1
 
@@ -646,6 +918,24 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[22]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device floppy,drive=none0
 
@@ -684,6 +974,24 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[22]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device floppy,drive=none0,unit=0
 
@@ -722,6 +1030,24 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[22]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device floppy,drive=none0,unit=0
 QEMU_PROG: -device floppy,drive=none0,unit=0: Floppy unit 0 is in use
@@ -769,6 +1095,24 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[22]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device floppy,drive=none0,unit=1
 
@@ -807,6 +1151,24 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[22]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device floppy,drive=none0,unit=0
 QEMU_PROG: -device floppy,drive=none0,unit=0: Floppy unit 0 is in use
@@ -851,6 +1213,24 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[22]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveA=none0 -device floppy,drive=none1,unit=1
 
@@ -889,6 +1269,24 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[22]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveB=none0 -device floppy,drive=none1
 
@@ -927,6 +1325,24 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[22]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveB=none0 -device floppy,drive=none1,unit=0
 
@@ -965,6 +1381,24 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[22]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveA=none0 -device floppy,drive=none1,unit=0
 QEMU_PROG: -device floppy,drive=none1,unit=0: Floppy unit 0 is in use
@@ -1118,6 +1552,19 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "120"
+none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[21]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-type=288
 
@@ -1145,6 +1592,19 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "288"
+none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[21]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 
 === Try passing different block sizes ===
@@ -1175,6 +1635,19 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,logical
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[21]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,physical_block_size=512
 
@@ -1202,6 +1675,19 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,physica
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
+none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[21]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
 
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,logical_block_size=4096
 QEMU_PROG: -device floppy,drive=none0,logical_block_size=4096: logical_block_size > physical_block_size not supported
-- 
2.26.2


