Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E90E2C841C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:29:52 +0100 (CET)
Received: from localhost ([::1]:43928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiJT-0002Xp-C5
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiGW-0000mb-LZ
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:26:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiGN-0002V5-09
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:26:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606739194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s0Uy5/1f4C49TQVmm8sp4mz7aoS2Jrv2VPoIjaQcSGU=;
 b=Xz1du/Jn3IglxMC8oAGnt49/BrU1ZdBJLuW1zq8nfmod1Pk3OBnGJNto89KAc3EjBcbnRd
 Sq4Y3Vu5haFbjctIVq+fdbHouX22usGaIXY7Qf7EA9FrZGqnlmNNXC+85hunmWeLFdKsyn
 coGZVDE7/PEWYP+ZaNHsxgzcHqqnI6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-iSzx0t3TPfmeR-x97ZWq6g-1; Mon, 30 Nov 2020 07:26:30 -0500
X-MC-Unique: iSzx0t3TPfmeR-x97ZWq6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E63D5107ACFA;
 Mon, 30 Nov 2020 12:26:29 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2875419C71;
 Mon, 30 Nov 2020 12:26:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/18] qapi/qom: Add ObjectOptions for rng-*,
 deprecate 'opened'
Date: Mon, 30 Nov 2020 13:25:26 +0100
Message-Id: <20201130122538.27674-7-kwolf@redhat.com>
In-Reply-To: <20201130122538.27674-1-kwolf@redhat.com>
References: <20201130122538.27674-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a QAPI schema for the properties of the rng-* objects.

The 'opened' property doesn't seem to make sense as an external
interface: It is automatically set to true in ucc->complete, and
explicitly setting it to true earlier just means that trying to set
additional options will result in an error. After the property has once
been set to true (i.e. when the object construction has completed), it
can never be reset to false. In other words, the 'opened' property is
useless. Mark it as deprecated in the schema from the start.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qom.json              | 56 ++++++++++++++++++++++++++++++++++++--
 docs/system/deprecated.rst |  9 ++++++
 2 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index f8a1da43ad..f3d1a55cb8 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -368,6 +368,52 @@
             '*hugetlbsize': 'size',
             '*seal': 'bool' } }
 
+##
+# @RngProperties:
+#
+# Properties for objects of classes derived from rng.
+#
+# @opened: if true, the device is opened immediately when applying this option
+#          and will probably fail when processing the next option. Don't use;
+#          only provided for compatibility. (default: false)
+#
+# Features:
+# @deprecated: Member @opened is deprecated.  Setting true doesn't make sense,
+#              and false is already the default.
+#
+# Since: 6.0
+##
+{ 'struct': 'RngProperties',
+  'data': { '*opened': { 'type': 'bool', 'features': ['deprecated'] } } }
+
+##
+# @RngEgdProperties:
+#
+# Properties for rng-egd objects.
+#
+# @chardev: the name of a character device backend that provides the connection
+#           to the RNG daemon
+#
+# Since: 6.0
+##
+{ 'struct': 'RngEgdProperties',
+  'base': 'RngProperties',
+  'data': { 'chardev': 'str' } }
+
+##
+# @RngRandomProperties:
+#
+# Properties for rng-random objects.
+#
+# @filename: the filename of the device on the host to obtain entropy from
+#            (default: "/dev/urandom")
+#
+# Since: 6.0
+##
+{ 'struct': 'RngRandomProperties',
+  'base': 'RngProperties',
+  'data': { '*filename': 'str' } }
+
 ##
 # @ObjectType:
 #
@@ -386,7 +432,10 @@
     'iothread',
     'memory-backend-file',
     'memory-backend-memfd',
-    'memory-backend-ram'
+    'memory-backend-ram',
+    'rng-builtin',
+    'rng-egd',
+    'rng-random'
   ] }
 
 ##
@@ -416,7 +465,10 @@
       'iothread':                   'IothreadProperties',
       'memory-backend-file':        'MemoryBackendFileProperties',
       'memory-backend-memfd':       'MemoryBackendMemfdProperties',
-      'memory-backend-ram':         'MemoryBackendProperties'
+      'memory-backend-ram':         'MemoryBackendProperties',
+      'rng-builtin':                'RngProperties',
+      'rng-egd':                    'RngEgdProperties',
+      'rng-random':                 'RngRandomProperties'
   } }
 
 ##
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 565389697e..30a694a39a 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -146,6 +146,15 @@ Drives with interface types other than ``if=none`` are for onboard
 devices.  It is possible to use drives the board doesn't pick up with
 -device.  This usage is now deprecated.  Use ``if=none`` instead.
 
+``opened```property of ``rng-*```objects (since 6.0.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The only effect of specifying ``opened=on`` in the command line or QMP
+``object-add`` is that the device is opened immediately, possibly before all
+other options have been processed.  This will either have no effect (if
+``opened`` was the last option) or cause errors.  The property is therefore
+useless and should not be specified.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
-- 
2.28.0


