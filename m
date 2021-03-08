Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592CA331418
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:06:13 +0100 (CET)
Received: from localhost ([::1]:45872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJKe-0004VW-BF
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJAl-0003eB-4H
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:55:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJAf-0008GY-WE
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zplTMilwm4Oqd/sBVhFB4AOzdaT1SOWzGDYsM/FrPfk=;
 b=RPSnoRIGwefbeDIQks4AppURM6T6YvadktMbXRkW/mkMe1giovLUKNVo1/VfpcHtLM7XhV
 SwJNW0mv+Whuq6wByzpoENyEf8rO51iPsmNzWhjlzpng5sjdM2cj7zFdsS/pmjMnw2iIbS
 c8jH1pcAlNi3MLLDlpr86mcl2pysmb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-Tl5VpfwTPRaKoy4cNY12Zg-1; Mon, 08 Mar 2021 11:55:49 -0500
X-MC-Unique: Tl5VpfwTPRaKoy4cNY12Zg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A1FC57;
 Mon,  8 Mar 2021 16:55:48 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9F7E5D9D3;
 Mon,  8 Mar 2021 16:55:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/30] qapi/qom: Add ObjectOptions for rng-*,
 deprecate 'opened'
Date: Mon,  8 Mar 2021 17:54:17 +0100
Message-Id: <20210308165440.386489-8-kwolf@redhat.com>
In-Reply-To: <20210308165440.386489-1-kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
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
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/qom.json              | 56 ++++++++++++++++++++++++++++++++++++--
 docs/system/deprecated.rst |  9 ++++++
 2 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 8c0e06c198..6d3b8c4fe0 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -382,6 +382,52 @@
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
+# Since: 1.3
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
+# Since: 1.3
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
+# Since: 1.3
+##
+{ 'struct': 'RngRandomProperties',
+  'base': 'RngProperties',
+  'data': { '*filename': 'str' } }
+
 ##
 # @ObjectType:
 #
@@ -400,7 +446,10 @@
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
@@ -432,7 +481,10 @@
       'memory-backend-file':        'MemoryBackendFileProperties',
       'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
                                       'if': 'defined(CONFIG_LINUX)' },
-      'memory-backend-ram':         'MemoryBackendProperties'
+      'memory-backend-ram':         'MemoryBackendProperties',
+      'rng-builtin':                'RngProperties',
+      'rng-egd':                    'RngEgdProperties',
+      'rng-random':                 'RngRandomProperties'
   } }
 
 ##
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 893f3e8579..3dac79f600 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -153,6 +153,15 @@ The ``-writeconfig`` option is not able to serialize the entire contents
 of the QEMU command line.  It is thus considered a failed experiment
 and deprecated, with no current replacement.
 
+``opened`` property of ``rng-*`` objects (since 6.0.0)
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
2.29.2


