Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71B92C8436
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:39:44 +0100 (CET)
Received: from localhost ([::1]:37900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiT1-0004US-Nz
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:39:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiHR-0001t2-3H
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:27:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiHO-0002p2-31
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606739261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1WZzjFd07khNA1Efat2VQKvCULw2KKabkAzd83k4ymU=;
 b=d1QzccaTC24jfLeTC5JfK149a8D4FwpQieWfNVQZVjSaO7Vfa8FcqzmGJGmkE0E1mBzAFQ
 fFJwylQ2Jo12MTIGswEkRBYJRR+4nP8lbWMAhdvcx6d25XFdZsznJr9O24V0HsuAblRRfI
 vUNwwJ16ndygEZnf4+CGCBCMJHkuH7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-OkBMQX3kMfuAt9s3OQnRNA-1; Mon, 30 Nov 2020 07:27:39 -0500
X-MC-Unique: OkBMQX3kMfuAt9s3OQnRNA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95A70427F2;
 Mon, 30 Nov 2020 12:27:38 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4B4119C71;
 Mon, 30 Nov 2020 12:27:35 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/18] qapi/qom: Add ObjectOptions for filter-*
Date: Mon, 30 Nov 2020 13:25:32 +0100
Message-Id: <20201130122538.27674-13-kwolf@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This adds a QAPI schema for the properties of the filter-* objects.

Some parts of the interface (in particular NetfilterProperties.position)
are very unusual for QAPI, but for now just describe the existing
interface.

net.json can't be included in qom.json because the storage daemon
doesn't have it. NetFilterDirection is still required in the new object
property definitions in qom.json, so move this enum to common.json.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
index a3a1336001..e19f6df468 100644
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
index 4c4f2841c3..c8ee02081c 100644
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
+# Since: 6.0
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
+# Since: 6.0
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
+# Since: 6.0
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
+# Since: 6.0
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
+# Since: 6.0
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
+# Since: 6.0
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
+# Since: 6.0
+##
+{ 'struct': 'FilterRewriterProperties',
+  'base': 'NetfilterProperties',
+  'data': { '*vnet_hdr_support': 'bool' } }
+
 ##
 # @IothreadProperties:
 #
@@ -496,6 +627,12 @@
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
@@ -538,6 +675,12 @@
       'cryptodev-backend-builtin':  'CryptodevBackendProperties',
       'cryptodev-vhost-user':       'CryptodevVhostUserProperties',
       'dbus-vmstate':               'DBusVMStateProperties',
+      'filter-buffer':              'FilterBufferProperties',
+      'filter-dump':                'FilterDumpProperties',
+      'filter-mirror':              'FilterMirrorProperties',
+      'filter-redirector':          'FilterRedirectorProperties',
+      'filter-replay':              'NetfilterProperties',
+      'filter-rewriter':            'FilterRewriterProperties',
       'iothread':                   'IothreadProperties',
       'memory-backend-file':        'MemoryBackendFileProperties',
       'memory-backend-memfd':       'MemoryBackendMemfdProperties',
-- 
2.28.0


