Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D788C323F4E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 15:57:24 +0100 (CET)
Received: from localhost ([::1]:34954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvbP-0008OQ-QD
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 09:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvQW-0001wk-MK
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvQT-0003XJ-39
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614177963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zfq4SzXzqUXAiI5xrLZIkrzp4js4GcRp/LiBy7aHsj0=;
 b=VXhU5bOPm1KZxmXBD1++axKlGsceG5Bj4iBGIgBN+5cXJeEzuAKqMk4Lnwvp5MqFt7ifED
 vlVWE31MViaNFdQLMQ+fCo92kAVRn5nBODSSWysGm5uWhN198dksBIvY8/lQKPIsydVXZe
 n2eKY7RFLQz/hbuAmXM/RIIR76t8nkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-hfOXDd7LNwmZItizNRaOiA-1; Wed, 24 Feb 2021 09:46:01 -0500
X-MC-Unique: hfOXDd7LNwmZItizNRaOiA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47520195C9E4;
 Wed, 24 Feb 2021 13:54:52 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 502665D6D3;
 Wed, 24 Feb 2021 13:54:49 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/31] qapi/qom: Add ObjectOptions for input-*
Date: Wed, 24 Feb 2021 14:52:41 +0100
Message-Id: <20210224135255.253837-18-kwolf@redhat.com>
In-Reply-To: <20210224135255.253837-1-kwolf@redhat.com>
References: <20210224135255.253837-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

This adds a QAPI schema for the properties of the input-* objects.

ui.json cannot be included in qom.json because the storage daemon can't
use it, so move GrabToggleKeys to common.json.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/common.json | 12 ++++++++++
 qapi/qom.json    | 58 ++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/ui.json     | 13 +----------
 3 files changed, 71 insertions(+), 12 deletions(-)

diff --git a/qapi/common.json b/qapi/common.json
index b87e7f9039..7c976296f0 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -185,3 +185,15 @@
 ##
 { 'enum': 'NetFilterDirection',
   'data': [ 'all', 'rx', 'tx' ] }
+
+##
+# @GrabToggleKeys:
+#
+# Keys to toggle input-linux between host and guest.
+#
+# Since: 4.0
+#
+##
+{ 'enum': 'GrabToggleKeys',
+  'data': [ 'ctrl-ctrl', 'alt-alt', 'shift-shift','meta-meta', 'scrolllock',
+            'ctrl-scrolllock' ] }
diff --git a/qapi/qom.json b/qapi/qom.json
index d5f68b5c89..f8ff322df0 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -444,6 +444,60 @@
   'base': 'NetfilterProperties',
   'data': { '*vnet_hdr_support': 'bool' } }
 
+##
+# @InputBarrierProperties:
+#
+# Properties for input-barrier objects.
+#
+# @name: the screen name as declared in the screens section of barrier.conf
+#
+# @server: hostname of the Barrier server (default: "localhost")
+#
+# @port: TCP port of the Barrier server (default: "24800")
+#
+# @x-origin: x coordinate of the leftmost pixel on the guest screen
+#            (default: "0")
+#
+# @y-origin: y coordinate of he topmost pixel on the guest screen (default: "0")
+#
+# @width: the width of secondary screen in pixels (default: "1920")
+#
+# @height: the height of secondary screen in pixels (default: "1080")
+#
+# Since: 4.2
+##
+{ 'struct': 'InputBarrierProperties',
+  'data': { 'name': 'str',
+            '*server': 'str',
+            '*port': 'str',
+            '*x-origin': 'str',
+            '*y-origin': 'str',
+            '*width': 'str',
+            '*height': 'str' } }
+
+##
+# @InputLinuxProperties:
+#
+# Properties for input-linux objects.
+#
+# @evdev: the path of the host evdev device to use
+#
+# @grab_all: if true, grab is toggled for all devices (e.g. both keyboard and
+#            mouse) instead of just one device (default: false)
+#
+# @repeat: enables auto-repeat events (default: false)
+#
+# @grab-toggle: the key or key combination that toggles device grab
+#               (default: ctrl-ctrl)
+#
+# Since: 2.6
+##
+{ 'struct': 'InputLinuxProperties',
+  'data': { 'evdev': 'str',
+            '*grab_all': 'bool',
+            '*repeat': 'bool',
+            '*grab-toggle': 'GrabToggleKeys' } }
+
 ##
 # @IothreadProperties:
 #
@@ -689,6 +743,8 @@
     'filter-redirector',
     'filter-replay',
     'filter-rewriter',
+    'input-barrier',
+    'input-linux',
     'iothread',
     'memory-backend-file',
     'memory-backend-memfd',
@@ -741,6 +797,8 @@
       'filter-redirector':          'FilterRedirectorProperties',
       'filter-replay':              'NetfilterProperties',
       'filter-rewriter':            'FilterRewriterProperties',
+      'input-barrier':              'InputBarrierProperties',
+      'input-linux':                'InputLinuxProperties',
       'iothread':                   'IothreadProperties',
       'memory-backend-file':        'MemoryBackendFileProperties',
       'memory-backend-memfd':       'MemoryBackendMemfdProperties',
diff --git a/qapi/ui.json b/qapi/ui.json
index d08d72b439..cc1882108b 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -6,6 +6,7 @@
 # = Remote desktop
 ##
 
+{ 'include': 'common.json' }
 { 'include': 'sockets.json' }
 
 ##
@@ -1021,18 +1022,6 @@
             '*head'  : 'int',
             'events' : [ 'InputEvent' ] } }
 
-##
-# @GrabToggleKeys:
-#
-# Keys to toggle input-linux between host and guest.
-#
-# Since: 4.0
-#
-##
-{ 'enum': 'GrabToggleKeys',
-  'data': [ 'ctrl-ctrl', 'alt-alt', 'shift-shift','meta-meta', 'scrolllock',
-            'ctrl-scrolllock' ] }
-
 ##
 # @DisplayGTK:
 #
-- 
2.29.2


