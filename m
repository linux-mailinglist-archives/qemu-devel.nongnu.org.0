Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF5833142C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:08:33 +0100 (CET)
Received: from localhost ([::1]:52674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJMu-0007QR-5U
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:08:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJAd-0003bC-OO
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:55:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJAU-0008Bs-8u
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:55:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rT4foOdK33IkQZC9xQtK7vwA0uT2WYZhLVCSR6IhHl0=;
 b=V2AOMGj+KabyUx/ztqzDT6TNHfFJ24HyXydOonevH1mRoPDMgYoOECv8ToYvLhSZ9NoOPx
 LCbkNAM5kWz+R57aUdUWTxaKmpIGI7ucJnSwNqw6RqnxQl+Pdmq4leIMbF+pXca+eb4853
 kRK146gx8z15MI4qh6RteklZi8qkp+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-yQUOmLYAPo6Op54Pf5P0AA-1; Mon, 08 Mar 2021 11:55:38 -0500
X-MC-Unique: yQUOmLYAPo6Op54Pf5P0AA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 711D11966322;
 Mon,  8 Mar 2021 16:55:37 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 866705D9D3;
 Mon,  8 Mar 2021 16:55:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/30] qapi/qom: Add ObjectOptions for memory-backend-*
Date: Mon,  8 Mar 2021 17:54:16 +0100
Message-Id: <20210308165440.386489-7-kwolf@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a QAPI schema for the properties of the memory-backend-*
objects.

HostMemPolicy has to be moved to an include file that can be used by the
storage daemon, too, because ObjectOptions must be the same in all
binaries if we don't want to compile the whole code multiple times.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
---
 qapi/common.json  |  20 ++++++++
 qapi/machine.json |  22 +--------
 qapi/qom.json     | 121 +++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 141 insertions(+), 22 deletions(-)

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
index 330189efe3..4322aee782 100644
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
index 942654e05c..8c0e06c198 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -5,6 +5,7 @@
 # See the COPYING file in the top-level directory.
 
 { 'include': 'authz.json' }
+{ 'include': 'common.json' }
 
 ##
 # = QEMU Object Model (QOM)
@@ -272,6 +273,115 @@
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
+# @x-use-canonical-path-for-ramblock-id: if true, the canoncial path is used
+#                                        for ramblock-id. Disable this for 4.0
+#                                        machine types or older to allow
+#                                        migration with newer QEMU versions.
+#                                        This option is considered stable
+#                                        despite the x- prefix. (default:
+#                                        false generally, but true for machine
+#                                        types <= 4.0)
+#
+# Since: 2.1
+##
+{ 'struct': 'MemoryBackendProperties',
+  'data': { '*dump': 'bool',
+            '*host-nodes': ['uint16'],
+            '*merge': 'bool',
+            '*policy': 'HostMemPolicy',
+            '*prealloc': 'bool',
+            '*prealloc-threads': 'uint32',
+            '*share': 'bool',
+            'size': 'size',
+            '*x-use-canonical-path-for-ramblock-id': 'bool' } }
+
+##
+# @MemoryBackendFileProperties:
+#
+# Properties for memory-backend-file objects.
+#
+# @align: the base address alignment when QEMU mmap(2)s @mem-path. Some
+#         backend stores specified by @mem-path require an alignment different
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
+# @readonly: if true, the backing file is opened read-only; if false, it is
+#            opened read-write. (default: false)
+#
+# Since: 2.1
+##
+{ 'struct': 'MemoryBackendFileProperties',
+  'base': 'MemoryBackendProperties',
+  'data': { '*align': 'size',
+            '*discard-data': 'bool',
+            'mem-path': 'str',
+            '*pmem': { 'type': 'bool', 'if': 'defined(CONFIG_LIBPMEM)' },
+            '*readonly': 'bool' } }
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
+# Since: 2.12
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
@@ -287,7 +397,10 @@
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
@@ -315,7 +428,11 @@
       'cryptodev-vhost-user':       { 'type': 'CryptodevVhostUserProperties',
                                       'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },
       'dbus-vmstate':               'DBusVMStateProperties',
-      'iothread':                   'IothreadProperties'
+      'iothread':                   'IothreadProperties',
+      'memory-backend-file':        'MemoryBackendFileProperties',
+      'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
+                                      'if': 'defined(CONFIG_LINUX)' },
+      'memory-backend-ram':         'MemoryBackendProperties'
   } }
 
 ##
-- 
2.29.2


