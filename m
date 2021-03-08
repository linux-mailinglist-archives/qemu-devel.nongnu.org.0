Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F437331450
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:15:10 +0100 (CET)
Received: from localhost ([::1]:44544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJTJ-0007pk-88
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:15:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJBI-00040I-C5
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:56:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJB9-0008Mm-EQ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:56:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EN4QvUbAh4F1RyvXaWITXd7zkhtxEAPwE2nARm9y9T8=;
 b=I3nRTQSQE35AbK7bVaZ5xYdI51xyarKWw3rhflyRtjpxQpeCoSTmc8vuJ8dzqGz62j+Usc
 LoBQtoEkEBZSkgd9Shr8O5yafXNmnevUatAtYJig/ZXxGjoDLjNuPYFWMXnJ4yTPY6Hn4k
 G2irQOWMA8gKm//0jYV14x+vTYgisM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-tdHQSXDiO66LKcWnvh1V7w-1; Mon, 08 Mar 2021 11:56:17 -0500
X-MC-Unique: tdHQSXDiO66LKcWnvh1V7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1585801814;
 Mon,  8 Mar 2021 16:56:15 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 255575D9DB;
 Mon,  8 Mar 2021 16:56:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/30] qapi/qom: Add ObjectOptions for filter-*
Date: Mon,  8 Mar 2021 17:54:23 +0100
Message-Id: <20210308165440.386489-14-kwolf@redhat.com>
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

This adds a QAPI schema for the properties of the filter-* objects.

Some parts of the interface (in particular NetfilterProperties.position)
are very unusual for QAPI, but for now just describe the existing
interface.

net.json can't be included in qom.json because the storage daemon
doesn't have it. NetFilterDirection is still required in the new object
property definitions in qom.json, so move this enum to common.json.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/common.json |  20 +++++++
 qapi/net.json    |  20 -------
 qapi/qom.json    | 143 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 163 insertions(+), 20 deletions(-)

diff --git a/qapi/common.json b/qapi/common.json
index 2dad4fadc3..b87e7f9039 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -165,3 +165,23 @@
 ##
 { 'enum': 'HostMemPolicy',
   'data': [ 'default', 'preferred', 'bind', 'interleave' ] }
+
+##
+# @NetFilterDirection:
+#
+# Indicates whether a netfilter is attached to a netdev's transmit queue or
+# receive queue or both.
+#
+# @all: the filter is attached both to the receive and the transmit
+#       queue of the netdev (default).
+#
+# @rx: the filter is attached to the receive queue of the netdev,
+#      where it will receive packets sent to the netdev.
+#
+# @tx: the filter is attached to the transmit queue of the netdev,
+#      where it will receive packets sent by the netdev.
+#
+# Since: 2.5
+##
+{ 'enum': 'NetFilterDirection',
+  'data': [ 'all', 'rx', 'tx' ] }
diff --git a/qapi/net.json b/qapi/net.json
index c31748c87f..af3f5b0fda 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -492,26 +492,6 @@
     'vhost-user': 'NetdevVhostUserOptions',
     'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
 
-##
-# @NetFilterDirection:
-#
-# Indicates whether a netfilter is attached to a netdev's transmit queue or
-# receive queue or both.
-#
-# @all: the filter is attached both to the receive and the transmit
-#       queue of the netdev (default).
-#
-# @rx: the filter is attached to the receive queue of the netdev,
-#      where it will receive packets sent to the netdev.
-#
-# @tx: the filter is attached to the transmit queue of the netdev,
-#      where it will receive packets sent by the netdev.
-#
-# Since: 2.5
-##
-{ 'enum': 'NetFilterDirection',
-  'data': [ 'all', 'rx', 'tx' ] }
-
 ##
 # @RxState:
 #
diff --git a/qapi/qom.json b/qapi/qom.json
index a34ae43cb9..6fe775bd83 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -313,6 +313,137 @@
   'data': { 'addr': 'str' ,
             '*id-list': 'str' } }
 
+##
+# @NetfilterInsert:
+#
+# Indicates where to insert a netfilter relative to a given other filter.
+#
+# @before: insert before the specified filter
+#
+# @behind: insert behind the specified filter
+#
+# Since: 5.0
+##
+{ 'enum': 'NetfilterInsert',
+  'data': [ 'before', 'behind' ] }
+
+##
+# @NetfilterProperties:
+#
+# Properties for objects of classes derived from netfilter.
+#
+# @netdev: id of the network device backend to filter
+#
+# @queue: indicates which queue(s) to filter (default: all)
+#
+# @status: indicates whether the filter is enabled ("on") or disabled ("off")
+#          (default: "on")
+#
+# @position: specifies where the filter should be inserted in the filter list.
+#            "head" means the filter is inserted at the head of the filter list,
+#            before any existing filters.
+#            "tail" means the filter is inserted at the tail of the filter list,
+#            behind any existing filters (default).
+#            "id=<id>" means the filter is inserted before or behind the filter
+#            specified by <id>, depending on the @insert property.
+#            (default: "tail")
+#
+# @insert: where to insert the filter relative to the filter given in @position.
+#          Ignored if @position is "head" or "tail". (default: behind)
+#
+# Since: 2.5
+##
+{ 'struct': 'NetfilterProperties',
+  'data': { 'netdev': 'str',
+            '*queue': 'NetFilterDirection',
+            '*status': 'str',
+            '*position': 'str',
+            '*insert': 'NetfilterInsert' } }
+
+##
+# @FilterBufferProperties:
+#
+# Properties for filter-buffer objects.
+#
+# @interval: a non-zero interval in microseconds.  All packets arriving in the
+#            given interval are delayed until the end of the interval.
+#
+# Since: 2.5
+##
+{ 'struct': 'FilterBufferProperties',
+  'base': 'NetfilterProperties',
+  'data': { 'interval': 'uint32' } }
+
+##
+# @FilterDumpProperties:
+#
+# Properties for filter-dump objects.
+#
+# @file: the filename where the dumped packets should be stored
+#
+# @maxlen: maximum number of bytes in a packet that are stored (default: 65536)
+#
+# Since: 2.5
+##
+{ 'struct': 'FilterDumpProperties',
+  'base': 'NetfilterProperties',
+  'data': { 'file': 'str',
+            '*maxlen': 'uint32' } }
+
+##
+# @FilterMirrorProperties:
+#
+# Properties for filter-mirror objects.
+#
+# @outdev: the name of a character device backend to which all incoming packets
+#          are mirrored
+#
+# @vnet_hdr_support: if true, vnet header support is enabled (default: false)
+#
+# Since: 2.6
+##
+{ 'struct': 'FilterMirrorProperties',
+  'base': 'NetfilterProperties',
+  'data': { 'outdev': 'str',
+            '*vnet_hdr_support': 'bool' } }
+
+##
+# @FilterRedirectorProperties:
+#
+# Properties for filter-redirector objects.
+#
+# At least one of @indev or @outdev must be present.  If both are present, they
+# must not refer to the same character device backend.
+#
+# @indev: the name of a character device backend from which packets are
+#         received and redirected to the filtered network device
+#
+# @outdev: the name of a character device backend to which all incoming packets
+#          are redirected
+#
+# @vnet_hdr_support: if true, vnet header support is enabled (default: false)
+#
+# Since: 2.6
+##
+{ 'struct': 'FilterRedirectorProperties',
+  'base': 'NetfilterProperties',
+  'data': { '*indev': 'str',
+            '*outdev': 'str',
+            '*vnet_hdr_support': 'bool' } }
+
+##
+# @FilterRewriterProperties:
+#
+# Properties for filter-rewriter objects.
+#
+# @vnet_hdr_support: if true, vnet header support is enabled (default: false)
+#
+# Since: 2.8
+##
+{ 'struct': 'FilterRewriterProperties',
+  'base': 'NetfilterProperties',
+  'data': { '*vnet_hdr_support': 'bool' } }
+
 ##
 # @IothreadProperties:
 #
@@ -510,6 +641,12 @@
     'cryptodev-backend-builtin',
     'cryptodev-vhost-user',
     'dbus-vmstate',
+    'filter-buffer',
+    'filter-dump',
+    'filter-mirror',
+    'filter-redirector',
+    'filter-replay',
+    'filter-rewriter',
     'iothread',
     'memory-backend-file',
     'memory-backend-memfd',
@@ -553,6 +690,12 @@
       'cryptodev-vhost-user':       { 'type': 'CryptodevVhostUserProperties',
                                       'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },
       'dbus-vmstate':               'DBusVMStateProperties',
+      'filter-buffer':              'FilterBufferProperties',
+      'filter-dump':                'FilterDumpProperties',
+      'filter-mirror':              'FilterMirrorProperties',
+      'filter-redirector':          'FilterRedirectorProperties',
+      'filter-replay':              'NetfilterProperties',
+      'filter-rewriter':            'FilterRewriterProperties',
       'iothread':                   'IothreadProperties',
       'memory-backend-file':        'MemoryBackendFileProperties',
       'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
-- 
2.29.2


