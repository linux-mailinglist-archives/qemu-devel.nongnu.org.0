Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C82260476
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 20:23:51 +0200 (CEST)
Received: from localhost ([::1]:44152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFLny-0001tO-3U
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 14:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLl0-0004yc-20
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:20:46 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25448
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLkr-0004Rz-T3
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599502833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SVNpvfWyufjUxDfLNdiOZAp9NC+ld2t9E1cXUnO2rqc=;
 b=gkDIdmVT5JtQCH8u2ip4jzF5hkoLagZn7NK+07D9jMnn5H6zq1wTxJP0+M3yZlRfXKIWcR
 sbSBwcgZMyudisiM/C3I5hyUIAuiPJnAp+KPR4kXmPmWC8ArYf5YU6bs/fc268LeFHhHeW
 ERRjq2GKTIHiRGPvHiBe9ApJ0Xn0AGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-eccZfd95OCquOHTGEPUhiA-1; Mon, 07 Sep 2020 14:20:28 -0400
X-MC-Unique: eccZfd95OCquOHTGEPUhiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37FD18015A8;
 Mon,  7 Sep 2020 18:20:27 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED2DD60BF3;
 Mon,  7 Sep 2020 18:20:25 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 02/29] qapi: Create block-export module
Date: Mon,  7 Sep 2020 20:19:44 +0200
Message-Id: <20200907182011.521007-3-kwolf@redhat.com>
In-Reply-To: <20200907182011.521007-1-kwolf@redhat.com>
References: <20200907182011.521007-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/06 22:29:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move all block export related types and commands from block-core to the
new QAPI module block-export.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/block-core.json                 | 166 -------------------------
 qapi/block-export.json               | 175 +++++++++++++++++++++++++++
 qapi/qapi-schema.json                |   1 +
 include/block/nbd.h                  |   2 +-
 block/monitor/block-hmp-cmds.c       |   1 +
 blockdev-nbd.c                       |   2 +-
 storage-daemon/qemu-storage-daemon.c |   2 +-
 qapi/meson.build                     |   4 +-
 storage-daemon/qapi/qapi-schema.json |   1 +
 9 files changed, 184 insertions(+), 170 deletions(-)
 create mode 100644 qapi/block-export.json

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 0345f6f2d2..41afd89a43 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5192,172 +5192,6 @@
              'iothread': 'StrOrNull',
              '*force': 'bool' } }
 
-##
-# @NbdServerOptions:
-#
-# @addr: Address on which to listen.
-# @tls-creds: ID of the TLS credentials object (since 2.6).
-# @tls-authz: ID of the QAuthZ authorization object used to validate
-#             the client's x509 distinguished name. This object is
-#             is only resolved at time of use, so can be deleted and
-#             recreated on the fly while the NBD server is active.
-#             If missing, it will default to denying access (since 4.0).
-#
-# Keep this type consistent with the nbd-server-start arguments. The only
-# intended difference is using SocketAddress instead of SocketAddressLegacy.
-#
-# Since: 4.2
-##
-{ 'struct': 'NbdServerOptions',
-  'data': { 'addr': 'SocketAddress',
-            '*tls-creds': 'str',
-            '*tls-authz': 'str'} }
-
-##
-# @nbd-server-start:
-#
-# Start an NBD server listening on the given host and port.  Block
-# devices can then be exported using @nbd-server-add.  The NBD
-# server will present them as named exports; for example, another
-# QEMU instance could refer to them as "nbd:HOST:PORT:exportname=NAME".
-#
-# @addr: Address on which to listen.
-# @tls-creds: ID of the TLS credentials object (since 2.6).
-# @tls-authz: ID of the QAuthZ authorization object used to validate
-#             the client's x509 distinguished name. This object is
-#             is only resolved at time of use, so can be deleted and
-#             recreated on the fly while the NBD server is active.
-#             If missing, it will default to denying access (since 4.0).
-#
-# Returns: error if the server is already running.
-#
-# Keep this type consistent with the NbdServerOptions type. The only intended
-# difference is using SocketAddressLegacy instead of SocketAddress.
-#
-# Since: 1.3.0
-##
-{ 'command': 'nbd-server-start',
-  'data': { 'addr': 'SocketAddressLegacy',
-            '*tls-creds': 'str',
-            '*tls-authz': 'str'} }
-
-##
-# @BlockExportNbd:
-#
-# An NBD block export.
-#
-# @device: The device name or node name of the node to be exported
-#
-# @name: Export name. If unspecified, the @device parameter is used as the
-#        export name. (Since 2.12)
-#
-# @description: Free-form description of the export, up to 4096 bytes.
-#               (Since 5.0)
-#
-# @writable: Whether clients should be able to write to the device via the
-#            NBD connection (default false).
-#
-# @bitmap: Also export the dirty bitmap reachable from @device, so the
-#          NBD client can use NBD_OPT_SET_META_CONTEXT with
-#          "qemu:dirty-bitmap:NAME" to inspect the bitmap. (since 4.0)
-#
-# Since: 5.0
-##
-{ 'struct': 'BlockExportNbd',
-  'data': {'device': 'str', '*name': 'str', '*description': 'str',
-           '*writable': 'bool', '*bitmap': 'str' } }
-
-##
-# @nbd-server-add:
-#
-# Export a block node to QEMU's embedded NBD server.
-#
-# Returns: error if the server is not running, or export with the same name
-#          already exists.
-#
-# Since: 1.3.0
-##
-{ 'command': 'nbd-server-add',
-  'data': 'BlockExportNbd', 'boxed': true }
-
-##
-# @NbdServerRemoveMode:
-#
-# Mode for removing an NBD export.
-#
-# @safe: Remove export if there are no existing connections, fail otherwise.
-#
-# @hard: Drop all connections immediately and remove export.
-#
-# Potential additional modes to be added in the future:
-#
-# hide: Just hide export from new clients, leave existing connections as is.
-# Remove export after all clients are disconnected.
-#
-# soft: Hide export from new clients, answer with ESHUTDOWN for all further
-# requests from existing clients.
-#
-# Since: 2.12
-##
-{'enum': 'NbdServerRemoveMode', 'data': ['safe', 'hard']}
-
-##
-# @nbd-server-remove:
-#
-# Remove NBD export by name.
-#
-# @name: Export name.
-#
-# @mode: Mode of command operation. See @NbdServerRemoveMode description.
-#        Default is 'safe'.
-#
-# Returns: error if
-#            - the server is not running
-#            - export is not found
-#            - mode is 'safe' and there are existing connections
-#
-# Since: 2.12
-##
-{ 'command': 'nbd-server-remove',
-  'data': {'name': 'str', '*mode': 'NbdServerRemoveMode'} }
-
-##
-# @nbd-server-stop:
-#
-# Stop QEMU's embedded NBD server, and unregister all devices previously
-# added via @nbd-server-add.
-#
-# Since: 1.3.0
-##
-{ 'command': 'nbd-server-stop' }
-
-##
-# @BlockExportType:
-#
-# An enumeration of block export types
-#
-# @nbd: NBD export
-#
-# Since: 4.2
-##
-{ 'enum': 'BlockExportType',
-  'data': [ 'nbd' ] }
-
-##
-# @BlockExport:
-#
-# Describes a block export, i.e. how single node should be exported on an
-# external interface.
-#
-# Since: 4.2
-##
-{ 'union': 'BlockExport',
-  'base': { 'type': 'BlockExportType' },
-  'discriminator': 'type',
-  'data': {
-      'nbd': 'BlockExportNbd'
-   } }
-
 ##
 # @QuorumOpType:
 #
diff --git a/qapi/block-export.json b/qapi/block-export.json
new file mode 100644
index 0000000000..f038eb47aa
--- /dev/null
+++ b/qapi/block-export.json
@@ -0,0 +1,175 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+
+##
+# == Block device exports
+##
+
+{ 'include': 'sockets.json' }
+
+##
+# @NbdServerOptions:
+#
+# @addr: Address on which to listen.
+# @tls-creds: ID of the TLS credentials object (since 2.6).
+# @tls-authz: ID of the QAuthZ authorization object used to validate
+#             the client's x509 distinguished name. This object is
+#             is only resolved at time of use, so can be deleted and
+#             recreated on the fly while the NBD server is active.
+#             If missing, it will default to denying access (since 4.0).
+#
+# Keep this type consistent with the nbd-server-start arguments. The only
+# intended difference is using SocketAddress instead of SocketAddressLegacy.
+#
+# Since: 4.2
+##
+{ 'struct': 'NbdServerOptions',
+  'data': { 'addr': 'SocketAddress',
+            '*tls-creds': 'str',
+            '*tls-authz': 'str'} }
+
+##
+# @nbd-server-start:
+#
+# Start an NBD server listening on the given host and port.  Block
+# devices can then be exported using @nbd-server-add.  The NBD
+# server will present them as named exports; for example, another
+# QEMU instance could refer to them as "nbd:HOST:PORT:exportname=NAME".
+#
+# @addr: Address on which to listen.
+# @tls-creds: ID of the TLS credentials object (since 2.6).
+# @tls-authz: ID of the QAuthZ authorization object used to validate
+#             the client's x509 distinguished name. This object is
+#             is only resolved at time of use, so can be deleted and
+#             recreated on the fly while the NBD server is active.
+#             If missing, it will default to denying access (since 4.0).
+#
+# Returns: error if the server is already running.
+#
+# Keep this type consistent with the NbdServerOptions type. The only intended
+# difference is using SocketAddressLegacy instead of SocketAddress.
+#
+# Since: 1.3.0
+##
+{ 'command': 'nbd-server-start',
+  'data': { 'addr': 'SocketAddressLegacy',
+            '*tls-creds': 'str',
+            '*tls-authz': 'str'} }
+
+##
+# @BlockExportNbd:
+#
+# An NBD block export.
+#
+# @device: The device name or node name of the node to be exported
+#
+# @name: Export name. If unspecified, the @device parameter is used as the
+#        export name. (Since 2.12)
+#
+# @description: Free-form description of the export, up to 4096 bytes.
+#               (Since 5.0)
+#
+# @writable: Whether clients should be able to write to the device via the
+#            NBD connection (default false).
+#
+# @bitmap: Also export the dirty bitmap reachable from @device, so the
+#          NBD client can use NBD_OPT_SET_META_CONTEXT with
+#          "qemu:dirty-bitmap:NAME" to inspect the bitmap. (since 4.0)
+#
+# Since: 5.0
+##
+{ 'struct': 'BlockExportNbd',
+  'data': {'device': 'str', '*name': 'str', '*description': 'str',
+           '*writable': 'bool', '*bitmap': 'str' } }
+
+##
+# @nbd-server-add:
+#
+# Export a block node to QEMU's embedded NBD server.
+#
+# Returns: error if the server is not running, or export with the same name
+#          already exists.
+#
+# Since: 1.3.0
+##
+{ 'command': 'nbd-server-add',
+  'data': 'BlockExportNbd', 'boxed': true }
+
+##
+# @NbdServerRemoveMode:
+#
+# Mode for removing an NBD export.
+#
+# @safe: Remove export if there are no existing connections, fail otherwise.
+#
+# @hard: Drop all connections immediately and remove export.
+#
+# Potential additional modes to be added in the future:
+#
+# hide: Just hide export from new clients, leave existing connections as is.
+# Remove export after all clients are disconnected.
+#
+# soft: Hide export from new clients, answer with ESHUTDOWN for all further
+# requests from existing clients.
+#
+# Since: 2.12
+##
+{'enum': 'NbdServerRemoveMode', 'data': ['safe', 'hard']}
+
+##
+# @nbd-server-remove:
+#
+# Remove NBD export by name.
+#
+# @name: Export name.
+#
+# @mode: Mode of command operation. See @NbdServerRemoveMode description.
+#        Default is 'safe'.
+#
+# Returns: error if
+#            - the server is not running
+#            - export is not found
+#            - mode is 'safe' and there are existing connections
+#
+# Since: 2.12
+##
+{ 'command': 'nbd-server-remove',
+  'data': {'name': 'str', '*mode': 'NbdServerRemoveMode'} }
+
+##
+# @nbd-server-stop:
+#
+# Stop QEMU's embedded NBD server, and unregister all devices previously
+# added via @nbd-server-add.
+#
+# Since: 1.3.0
+##
+{ 'command': 'nbd-server-stop' }
+
+##
+# @BlockExportType:
+#
+# An enumeration of block export types
+#
+# @nbd: NBD export
+#
+# Since: 4.2
+##
+{ 'enum': 'BlockExportType',
+  'data': [ 'nbd' ] }
+
+##
+# @BlockExport:
+#
+# Describes a block export, i.e. how single node should be exported on an
+# external interface.
+#
+# Since: 4.2
+##
+{ 'union': 'BlockExport',
+  'base': { 'type': 'BlockExportType' },
+  'discriminator': 'type',
+  'data': {
+      'nbd': 'BlockExportNbd'
+   } }
+
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index f03ff91ceb..b78fc399a4 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -64,6 +64,7 @@
 { 'include': 'run-state.json' }
 { 'include': 'crypto.json' }
 { 'include': 'block.json' }
+{ 'include': 'block-export.json' }
 { 'include': 'char.json' }
 { 'include': 'dump.json' }
 { 'include': 'job.json' }
diff --git a/include/block/nbd.h b/include/block/nbd.h
index 0451683d03..262f6da2ce 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -20,7 +20,7 @@
 #ifndef NBD_H
 #define NBD_H
 
-#include "qapi/qapi-types-block.h"
+#include "qapi/qapi-types-block-export.h"
 #include "io/channel-socket.h"
 #include "crypto/tlscreds.h"
 #include "qapi/error.h"
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 4d3db5ed3c..6ce0f8f87c 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -40,6 +40,7 @@
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "qapi/qapi-commands-block.h"
+#include "qapi/qapi-commands-block-export.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 1a95d89f00..0f6b80c58f 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -14,7 +14,7 @@
 #include "sysemu/block-backend.h"
 #include "hw/block/block.h"
 #include "qapi/error.h"
-#include "qapi/qapi-commands-block.h"
+#include "qapi/qapi-commands-block-export.h"
 #include "block/nbd.h"
 #include "io/channel-socket.h"
 #include "io/net-listener.h"
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 7e9b0e0d3f..ed9d2afcf3 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -35,8 +35,8 @@
 #include "monitor/monitor-internal.h"
 
 #include "qapi/error.h"
-#include "qapi/qapi-visit-block.h"
 #include "qapi/qapi-visit-block-core.h"
+#include "qapi/qapi-visit-block-export.h"
 #include "qapi/qapi-visit-control.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qstring.h"
diff --git a/qapi/meson.build b/qapi/meson.build
index 2b2872a41d..1ee19a07de 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -16,8 +16,9 @@ util_ss.add(files(
 qapi_all_modules = [
   'audio',
   'authz',
-  'block-core',
   'block',
+  'block-core',
+  'block-export',
   'char',
   'common',
   'control',
@@ -47,6 +48,7 @@ qapi_all_modules = [
 
 qapi_storage_daemon_modules = [
   'block-core',
+  'block-export',
   'char',
   'common',
   'control',
diff --git a/storage-daemon/qapi/qapi-schema.json b/storage-daemon/qapi/qapi-schema.json
index 6100d1f0c9..c6ad5ae1e3 100644
--- a/storage-daemon/qapi/qapi-schema.json
+++ b/storage-daemon/qapi/qapi-schema.json
@@ -16,6 +16,7 @@
 { 'include': '../../qapi/pragma.json' }
 
 { 'include': '../../qapi/block-core.json' }
+{ 'include': '../../qapi/block-export.json' }
 { 'include': '../../qapi/char.json' }
 { 'include': '../../qapi/common.json' }
 { 'include': '../../qapi/control.json' }
-- 
2.25.4


