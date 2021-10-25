Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10971438ECB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 07:28:38 +0200 (CEST)
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mesXF-0000CY-4p
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 01:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesUe-0005Ip-Ez
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:25:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesUa-0005GL-28
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:25:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635139551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29XoXnpqWdpFuGD0pVGHE5Fo5MHCLhoAAemcCQqnHMA=;
 b=Q96EmUhSqrjeYFdkuUJmUaMswvVmyOnJBkcHH2ZOfynPj+8gOPqgi1cDDZhFgb7LLLrcfD
 EPrTw7hCNCv/ShewFx6uEMR4bJxTaM9Uka8rDy0LIbZIAqw5BhxvtKe9CDQBmRO7AwglAL
 PiL/OMhERbdvpgFaTO24dQOZqFvz02k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-EaVXpc_VPSezRdkDowgLgw-1; Mon, 25 Oct 2021 01:25:48 -0400
X-MC-Unique: EaVXpc_VPSezRdkDowgLgw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BBE71006AA6;
 Mon, 25 Oct 2021 05:25:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4939C5C1CF;
 Mon, 25 Oct 2021 05:25:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D4BE911380B8; Mon, 25 Oct 2021 07:25:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] qapi: Mark unstable QMP parts with feature 'unstable'
Date: Mon, 25 Oct 2021 07:25:25 +0200
Message-Id: <20211025052532.3859634-3-armbru@redhat.com>
In-Reply-To: <20211025052532.3859634-1-armbru@redhat.com>
References: <20211025052532.3859634-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 dgilbert@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add special feature 'unstable' everywhere the name starts with 'x-',
except for InputBarrierProperties member x-origin and
MemoryBackendProperties member x-use-canonical-path-for-ramblock-id,
because these two are actually stable.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json | 123 +++++++++++++++++++++++++++++++------------
 qapi/migration.json  |  35 +++++++++---
 qapi/misc.json       |   6 ++-
 qapi/qom.json        |  11 ++--
 4 files changed, 130 insertions(+), 45 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6d3217abb6..ce2c1352cb 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1438,6 +1438,9 @@
 #
 # @x-perf: Performance options. (Since 6.0)
 #
+# Features:
+# @unstable: Member @x-perf is experimental.
+#
 # Note: @on-source-error and @on-target-error only affect background
 #       I/O.  If an error occurs during a guest write request, the device's
 #       rerror/werror actions will be used.
@@ -1452,7 +1455,9 @@
             '*on-source-error': 'BlockdevOnError',
             '*on-target-error': 'BlockdevOnError',
             '*auto-finalize': 'bool', '*auto-dismiss': 'bool',
-            '*filter-node-name': 'str', '*x-perf': 'BackupPerf'  } }
+            '*filter-node-name': 'str',
+            '*x-perf': { 'type': 'BackupPerf',
+                         'features': [ 'unstable' ] } } }
 
 ##
 # @DriveBackup:
@@ -1916,9 +1921,13 @@
 #
 # Get the block graph.
 #
+# Features:
+# @unstable: This command is meant for debugging.
+#
 # Since: 4.0
 ##
-{ 'command': 'x-debug-query-block-graph', 'returns': 'XDbgBlockGraph' }
+{ 'command': 'x-debug-query-block-graph', 'returns': 'XDbgBlockGraph',
+  'features': [ 'unstable' ] }
 
 ##
 # @drive-mirror:
@@ -2257,6 +2266,9 @@
 #
 # Get bitmap SHA256.
 #
+# Features:
+# @unstable: This command is meant for debugging.
+#
 # Returns: - BlockDirtyBitmapSha256 on success
 #          - If @node is not a valid block device, DeviceNotFound
 #          - If @name is not found or if hashing has failed, GenericError with an
@@ -2265,7 +2277,8 @@
 # Since: 2.10
 ##
 { 'command': 'x-debug-block-dirty-bitmap-sha256',
-  'data': 'BlockDirtyBitmap', 'returns': 'BlockDirtyBitmapSha256' }
+  'data': 'BlockDirtyBitmap', 'returns': 'BlockDirtyBitmapSha256',
+  'features': [ 'unstable' ] }
 
 ##
 # @blockdev-mirror:
@@ -2495,27 +2508,57 @@
 #
 # Properties for throttle-group objects.
 #
-# The options starting with x- are aliases for the same key without x- in
-# the @limits object. As indicated by the x- prefix, this is not a stable
-# interface and may be removed or changed incompatibly in the future. Use
-# @limits for a supported stable interface.
-#
 # @limits: limits to apply for this throttle group
 #
+# Features:
+# @unstable: All members starting with x- are aliases for the same key
+#            without x- in the @limits object.  This is not a stable
+#            interface and may be removed or changed incompatibly in
+#            the future.  Use @limits for a supported stable
+#            interface.
+#
 # Since: 2.11
 ##
 { 'struct': 'ThrottleGroupProperties',
   'data': { '*limits': 'ThrottleLimits',
-            '*x-iops-total' : 'int', '*x-iops-total-max' : 'int',
-            '*x-iops-total-max-length' : 'int', '*x-iops-read' : 'int',
-            '*x-iops-read-max' : 'int', '*x-iops-read-max-length' : 'int',
-            '*x-iops-write' : 'int', '*x-iops-write-max' : 'int',
-            '*x-iops-write-max-length' : 'int', '*x-bps-total' : 'int',
-            '*x-bps-total-max' : 'int', '*x-bps-total-max-length' : 'int',
-            '*x-bps-read' : 'int', '*x-bps-read-max' : 'int',
-            '*x-bps-read-max-length' : 'int', '*x-bps-write' : 'int',
-            '*x-bps-write-max' : 'int', '*x-bps-write-max-length' : 'int',
-            '*x-iops-size' : 'int' } }
+            '*x-iops-total': { 'type': 'int',
+                               'features': [ 'unstable' ] },
+            '*x-iops-total-max': { 'type': 'int',
+                                   'features': [ 'unstable' ] },
+            '*x-iops-total-max-length': { 'type': 'int',
+                                          'features': [ 'unstable' ] },
+            '*x-iops-read': { 'type': 'int',
+                              'features': [ 'unstable' ] },
+            '*x-iops-read-max': { 'type': 'int',
+                                  'features': [ 'unstable' ] },
+            '*x-iops-read-max-length': { 'type': 'int',
+                                         'features': [ 'unstable' ] },
+            '*x-iops-write': { 'type': 'int',
+                               'features': [ 'unstable' ] },
+            '*x-iops-write-max': { 'type': 'int',
+                                   'features': [ 'unstable' ] },
+            '*x-iops-write-max-length': { 'type': 'int',
+                                          'features': [ 'unstable' ] },
+            '*x-bps-total': { 'type': 'int',
+                              'features': [ 'unstable' ] },
+            '*x-bps-total-max': { 'type': 'int',
+                                  'features': [ 'unstable' ] },
+            '*x-bps-total-max-length': { 'type': 'int',
+                                         'features': [ 'unstable' ] },
+            '*x-bps-read': { 'type': 'int',
+                             'features': [ 'unstable' ] },
+            '*x-bps-read-max': { 'type': 'int',
+                                 'features': [ 'unstable' ] },
+            '*x-bps-read-max-length': { 'type': 'int',
+                                        'features': [ 'unstable' ] },
+            '*x-bps-write': { 'type': 'int',
+                              'features': [ 'unstable' ] },
+            '*x-bps-write-max': { 'type': 'int',
+                                  'features': [ 'unstable' ] },
+            '*x-bps-write-max-length': { 'type': 'int',
+                                         'features': [ 'unstable' ] },
+            '*x-iops-size': { 'type': 'int',
+                              'features': [ 'unstable' ] } } }
 
 ##
 # @block-stream:
@@ -2916,6 +2959,7 @@
 #                          read-only when the last writer is detached. This
 #                          allows giving QEMU write permissions only on demand
 #                          when an operation actually needs write access.
+# @unstable: Member x-check-cache-dropped is meant for debugging.
 #
 # Since: 2.9
 ##
@@ -2926,7 +2970,8 @@
             '*aio': 'BlockdevAioOptions',
             '*drop-cache': {'type': 'bool',
                             'if': 'CONFIG_LINUX'},
-            '*x-check-cache-dropped': 'bool' },
+            '*x-check-cache-dropped': { 'type': 'bool',
+                                        'features': [ 'unstable' ] } },
   'features': [ { 'name': 'dynamic-auto-read-only',
                   'if': 'CONFIG_POSIX' } ] }
 
@@ -4041,13 +4086,16 @@
 #                   future requests before a successful reconnect will
 #                   immediately fail. Default 0 (Since 4.2)
 #
+# Features:
+# @unstable: Member @x-dirty-bitmap is experimental.
+#
 # Since: 2.9
 ##
 { 'struct': 'BlockdevOptionsNbd',
   'data': { 'server': 'SocketAddress',
             '*export': 'str',
             '*tls-creds': 'str',
-            '*x-dirty-bitmap': 'str',
+            '*x-dirty-bitmap': { 'type': 'str', 'features': [ 'unstable' ] },
             '*reconnect-delay': 'uint32' } }
 
 ##
@@ -4865,13 +4913,17 @@
 #                   and replacement of an active keyslot
 #                   (possible loss of data if IO error happens)
 #
+# Features:
+# @unstable: This command is experimental.
+#
 # Since: 5.1
 ##
 { 'command': 'x-blockdev-amend',
   'data': { 'job-id': 'str',
             'node-name': 'str',
             'options': 'BlockdevAmendOptions',
-            '*force': 'bool' } }
+            '*force': 'bool' },
+  'features': [ 'unstable' ] }
 
 ##
 # @BlockErrorAction:
@@ -5242,16 +5294,18 @@
 #
 # @node: the name of the node that will be added.
 #
-# Note: this command is experimental, and its API is not stable. It
-#       does not support all kinds of operations, all kinds of children, nor
-#       all block drivers.
+# Features:
+# @unstable: This command is experimental, and its API is not stable.  It
+#            does not support all kinds of operations, all kinds of
+#            children, nor all block drivers.
 #
-#       FIXME Removing children from a quorum node means introducing gaps in the
-#       child indices. This cannot be represented in the 'children' list of
-#       BlockdevOptionsQuorum, as returned by .bdrv_refresh_filename().
+#            FIXME Removing children from a quorum node means introducing
+#            gaps in the child indices. This cannot be represented in the
+#            'children' list of BlockdevOptionsQuorum, as returned by
+#            .bdrv_refresh_filename().
 #
-#       Warning: The data in a new quorum child MUST be consistent with that of
-#       the rest of the array.
+#            Warning: The data in a new quorum child MUST be consistent
+#            with that of the rest of the array.
 #
 # Since: 2.7
 #
@@ -5280,7 +5334,8 @@
 { 'command': 'x-blockdev-change',
   'data' : { 'parent': 'str',
              '*child': 'str',
-             '*node': 'str' } }
+             '*node': 'str' },
+  'features': [ 'unstable' ] }
 
 ##
 # @x-blockdev-set-iothread:
@@ -5297,8 +5352,9 @@
 # @force: true if the node and its children should be moved when a BlockBackend
 #         is already attached
 #
-# Note: this command is experimental and intended for test cases that need
-#       control over IOThreads only.
+# Features:
+# @unstable: This command is experimental and intended for test cases that
+#            need control over IOThreads only.
 #
 # Since: 2.12
 #
@@ -5320,7 +5376,8 @@
 { 'command': 'x-blockdev-set-iothread',
   'data' : { 'node-name': 'str',
              'iothread': 'StrOrNull',
-             '*force': 'bool' } }
+             '*force': 'bool' },
+  'features': [ 'unstable' ] }
 
 ##
 # @QuorumOpType:
diff --git a/qapi/migration.json b/qapi/migration.json
index 88f07baedd..9aa8bc5759 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -452,14 +452,20 @@
 #                       procedure starts. The VM RAM is saved with running VM.
 #                       (since 6.0)
 #
+# Features:
+# @unstable: Members @x-colo and @x-ignore-shared are experimental.
+#
 # Since: 1.2
 ##
 { 'enum': 'MigrationCapability',
   'data': ['xbzrle', 'rdma-pin-all', 'auto-converge', 'zero-blocks',
-           'compress', 'events', 'postcopy-ram', 'x-colo', 'release-ram',
+           'compress', 'events', 'postcopy-ram',
+           { 'name': 'x-colo', 'features': [ 'unstable' ] },
+           'release-ram',
            'block', 'return-path', 'pause-before-switchover', 'multifd',
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
-           'x-ignore-shared', 'validate-uuid', 'background-snapshot'] }
+           { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
+           'validate-uuid', 'background-snapshot'] }
 
 ##
 # @MigrationCapabilityStatus:
@@ -743,6 +749,9 @@
 #                        block device name if there is one, and to their node name
 #                        otherwise. (Since 5.2)
 #
+# Features:
+# @unstable: Member @x-checkpoint-delay is experimental.
+#
 # Since: 2.4
 ##
 { 'enum': 'MigrationParameter',
@@ -753,7 +762,9 @@
            'cpu-throttle-initial', 'cpu-throttle-increment',
            'cpu-throttle-tailslow',
            'tls-creds', 'tls-hostname', 'tls-authz', 'max-bandwidth',
-           'downtime-limit', 'x-checkpoint-delay', 'block-incremental',
+           'downtime-limit',
+           { 'name': 'x-checkpoint-delay', 'features': [ 'unstable' ] },
+           'block-incremental',
            'multifd-channels',
            'xbzrle-cache-size', 'max-postcopy-bandwidth',
            'max-cpu-throttle', 'multifd-compression',
@@ -903,6 +914,9 @@
 #                        block device name if there is one, and to their node name
 #                        otherwise. (Since 5.2)
 #
+# Features:
+# @unstable: Member @x-checkpoint-delay is experimental.
+#
 # Since: 2.4
 ##
 # TODO either fuse back into MigrationParameters, or make
@@ -925,7 +939,8 @@
             '*tls-authz': 'StrOrNull',
             '*max-bandwidth': 'size',
             '*downtime-limit': 'uint64',
-            '*x-checkpoint-delay': 'uint32',
+            '*x-checkpoint-delay': { 'type': 'uint32',
+                                     'features': [ 'unstable' ] },
             '*block-incremental': 'bool',
             '*multifd-channels': 'uint8',
             '*xbzrle-cache-size': 'size',
@@ -1099,6 +1114,9 @@
 #                        block device name if there is one, and to their node name
 #                        otherwise. (Since 5.2)
 #
+# Features:
+# @unstable: Member @x-checkpoint-delay is experimental.
+#
 # Since: 2.4
 ##
 { 'struct': 'MigrationParameters',
@@ -1119,7 +1137,8 @@
             '*tls-authz': 'str',
             '*max-bandwidth': 'size',
             '*downtime-limit': 'uint64',
-            '*x-checkpoint-delay': 'uint32',
+            '*x-checkpoint-delay': { 'type': 'uint32',
+                                     'features': [ 'unstable' ] },
             '*block-incremental': 'bool',
             '*multifd-channels': 'uint8',
             '*xbzrle-cache-size': 'size',
@@ -1351,6 +1370,9 @@
 # If sent to the Secondary, the Secondary side will run failover work,
 # then takes over server operation to become the service VM.
 #
+# Features:
+# @unstable: This command is experimental.
+#
 # Since: 2.8
 #
 # Example:
@@ -1359,7 +1381,8 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'x-colo-lost-heartbeat' }
+{ 'command': 'x-colo-lost-heartbeat',
+  'features': [ 'unstable' ] }
 
 ##
 # @migrate_cancel:
diff --git a/qapi/misc.json b/qapi/misc.json
index 5c2ca3b556..358548abe1 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -185,6 +185,9 @@
 # available during the preconfig state (i.e. when the --preconfig command
 # line option was in use).
 #
+# Features:
+# @unstable: This command is experimental.
+#
 # Since 3.0
 #
 # Returns: nothing
@@ -195,7 +198,8 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'x-exit-preconfig', 'allow-preconfig': true }
+{ 'command': 'x-exit-preconfig', 'allow-preconfig': true,
+  'features': [ 'unstable' ] }
 
 ##
 # @human-monitor-command:
diff --git a/qapi/qom.json b/qapi/qom.json
index 7231ac3f34..ccd1167808 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -559,10 +559,8 @@
 #                                        for ramblock-id. Disable this for 4.0
 #                                        machine types or older to allow
 #                                        migration with newer QEMU versions.
-#                                        This option is considered stable
-#                                        despite the x- prefix. (default:
-#                                        false generally, but true for machine
-#                                        types <= 4.0)
+#                                        (default: false generally,
+#                                        but true for machine types <= 4.0)
 #
 # Note: prealloc=true and reserve=false cannot be set at the same time. With
 #       reserve=true, the behavior depends on the operating system: for example,
@@ -785,6 +783,9 @@
 ##
 # @ObjectType:
 #
+# Features:
+# @unstable: Member @x-remote-object is experimental.
+#
 # Since: 6.0
 ##
 { 'enum': 'ObjectType',
@@ -836,7 +837,7 @@
     'tls-creds-psk',
     'tls-creds-x509',
     'tls-cipher-suites',
-    'x-remote-object'
+    { 'name': 'x-remote-object', 'features': [ 'unstable' ] }
   ] }
 
 ##
-- 
2.31.1


