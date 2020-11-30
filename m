Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141F42C8437
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:39:51 +0100 (CET)
Received: from localhost ([::1]:38316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiT8-0004ew-1Z
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:39:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiGX-0000nq-PI
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:26:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiGG-0002Tz-O7
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606739189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zxz3tbj4yWIPuKDCUk+1BFCxV7BVjXHXHL2s6dvvowI=;
 b=Y+dddNe4SvPVS+uGUD3QGMphnaJJ4COSkuqFTn86GRIwJb3Vrbc0b7kk5KJKOVuYtQEHkN
 CetTG/WWXdGdlwlUVai5IFw5A+oz+6vNCajTIGGhhoI1Z8NiMjiLLpjMGPH/iI3J/dJZw4
 RE2qyTy1/sKYTH7+70GKQHxNCYqh7IE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-U3A1G7naPa-cK_pS4tfGpA-1; Mon, 30 Nov 2020 07:26:27 -0500
X-MC-Unique: U3A1G7naPa-cK_pS4tfGpA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3927107ACFA;
 Mon, 30 Nov 2020 12:26:26 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AD2D19C71;
 Mon, 30 Nov 2020 12:26:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/18] qapi/qom: Add ObjectOptions for memory-backend-*
Date: Mon, 30 Nov 2020 13:25:25 +0100
Message-Id: <20201130122538.27674-6-kwolf@redhat.com>
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
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a QAPI schema for the properties of the memory-backend-*
objects.

HostMemPolicy has to be moved to an include file that can be used by the
storage daemon, too, because ObjectOptions must be the same in all
binaries if we don't want to compile the whole code multiple times.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/common.json  |  20 +++++++++
 qapi/machine.json |  22 +---------
 qapi/qom.json     | 106 +++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 126 insertions(+), 22 deletions(-)

diff --git a/qapi/common.json b/qapi/common.json
index 716712d4b3..2dad4fadc3 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -145,3 +145,23 @@
 ##
 { 'enum': 'PCIELinkWidth',
   'data': [ '1', '2', '4', '8', '12', '16', '32' ] }
+
+##
+# @HostMemPolicy:
+#
+# Host memory policy types
+#
+# @default: restore default policy, remove any nondefault policy
+#
+# @preferred: set the preferred host nodes for allocation
+#
+# @bind: a strict policy that restricts memory allocation to the
+#        host nodes specified
+#
+# @interleave: memory allocations are interleaved across the set
+#              of host nodes specified
+#
+# Since: 2.1
+##
+{ 'enum': 'HostMemPolicy',
+  'data': [ 'default', 'preferred', 'bind', 'interleave' ] }
diff --git a/qapi/machine.json b/qapi/machine.json
index 7c9a263778..75b9737213 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -8,6 +8,8 @@
 # = Machines
 ##
 
+{ 'include': 'common.json' }
+
 ##
 # @SysEmuTarget:
 #
@@ -897,26 +899,6 @@
    'policy': 'HmatCacheWritePolicy',
    'line': 'uint16' }}
 
-##
-# @HostMemPolicy:
-#
-# Host memory policy types
-#
-# @default: restore default policy, remove any nondefault policy
-#
-# @preferred: set the preferred host nodes for allocation
-#
-# @bind: a strict policy that restricts memory allocation to the
-#        host nodes specified
-#
-# @interleave: memory allocations are interleaved across the set
-#              of host nodes specified
-#
-# Since: 2.1
-##
-{ 'enum': 'HostMemPolicy',
-  'data': [ 'default', 'preferred', 'bind', 'interleave' ] }
-
 ##
 # @memsave:
 #
diff --git a/qapi/qom.json b/qapi/qom.json
index 2319c9bad6..f8a1da43ad 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -5,6 +5,7 @@
 # See the COPYING file in the top-level directory.
 
 { 'include': 'authz.json' }
+{ 'include': 'common.json' }
 
 ##
 # = QEMU Object Model (QOM)
@@ -272,6 +273,101 @@
             '*poll-grow': 'int',
             '*poll-shrink': 'int' } }
 
+##
+# @MemoryBackendProperties:
+#
+# Properties for objects of classes derived from memory-backend.
+#
+# @merge: if true, mark the memory as mergeable (default depends on the machine
+#         type)
+#
+# @dump: if true, include the memory in core dumps (default depends on the
+#        machine type)
+#
+# @host-nodes: the list of NUMA host nodes to bind the memory to
+#
+# @policy: the NUMA policy (default: 'default')
+#
+# @prealloc: if true, preallocate memory (default: false)
+#
+# @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
+#
+# @share: if false, the memory is private to QEMU; if true, it is shared
+#         (default: false)
+#
+# @size: size of the memory region in bytes
+#
+# Since: 6.0
+##
+{ 'struct': 'MemoryBackendProperties',
+  'data': { '*dump': 'bool',
+            '*host-nodes': ['uint16'],
+            '*merge': 'bool',
+            '*policy': 'HostMemPolicy',
+            '*prealloc': 'bool',
+            '*prealloc-threads': 'uint32',
+            '*share': 'bool',
+            'size': 'size' } }
+
+##
+# @MemoryBackendFileProperties:
+#
+# Properties for memory-backend-file objects.
+#
+# @align: the base address alignment when QEMU mmap(2) @mem-path. Some
+#         backend store specified by @mem-path requires an alignment different
+#         than the default one used by QEMU, e.g. the device DAX /dev/dax0.0
+#         requires 2M alignment rather than 4K. In such cases, users can
+#         specify the required alignment via this option.
+#         0 selects a default alignment (currently the page size). (default: 0)
+#
+# @discard-data: if true, the file contents can be destroyed when QEMU exits,
+#                to avoid unnecessarily flushing data to the backing file. Note
+#                that ``discard-data`` is only an optimization, and QEMU might
+#                not discard file contents if it aborts unexpectedly or is
+#                terminated using SIGKILL. (default: false)
+#
+# @mem-path: the path to either a shared memory or huge page filesystem mount
+#
+# @pmem: specifies whether the backing file specified by @mem-path is in
+#        host persistent memory that can be accessed using the SNIA NVM
+#        programming model (e.g. Intel NVDIMM).
+#
+# Since: 6.0
+##
+{ 'struct': 'MemoryBackendFileProperties',
+  'base': 'MemoryBackendProperties',
+  'data': { '*align': 'size',
+            '*discard-data': 'bool',
+            'mem-path': 'str',
+            '*pmem': 'bool' } }
+
+##
+# @MemoryBackendMemfdProperties:
+#
+# Properties for memory-backend-memfd objects.
+#
+# The @share boolean option is true by default with memfd.
+#
+# @hugetlb: if true, the file to be created resides in the hugetlbfs filesystem
+#           (default: false)
+#
+# @hugetlbsize: the hugetlb page size on systems that support multiple hugetlb
+#               page sizes (it must be a power of 2 value supported by the
+#               system). 0 selects a default page size. This option is ignored
+#               if @hugetlb is false. (default: 0)
+#
+# @seal: if true, create a sealed-file, which will block further resizing of
+#        the memory (default: true)
+#
+# Since: 6.0
+##
+{ 'struct': 'MemoryBackendMemfdProperties',
+  'base': 'MemoryBackendProperties',
+  'data': { '*hugetlb': 'bool',
+            '*hugetlbsize': 'size',
+            '*seal': 'bool' } }
+
 ##
 # @ObjectType:
 #
@@ -287,7 +383,10 @@
     'cryptodev-backend-builtin',
     'cryptodev-vhost-user',
     'dbus-vmstate',
-    'iothread'
+    'iothread',
+    'memory-backend-file',
+    'memory-backend-memfd',
+    'memory-backend-ram'
   ] }
 
 ##
@@ -314,7 +413,10 @@
       'cryptodev-backend-builtin':  'CryptodevBackendProperties',
       'cryptodev-vhost-user':       'CryptodevVhostUserProperties',
       'dbus-vmstate':               'DBusVMStateProperties',
-      'iothread':                   'IothreadProperties'
+      'iothread':                   'IothreadProperties',
+      'memory-backend-file':        'MemoryBackendFileProperties',
+      'memory-backend-memfd':       'MemoryBackendMemfdProperties',
+      'memory-backend-ram':         'MemoryBackendProperties'
   } }
 
 ##
-- 
2.28.0


