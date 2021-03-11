Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A215733787B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:52:57 +0100 (CET)
Received: from localhost ([::1]:45448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNcO-0003tv-LM
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcm-0005lA-4q
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcV-0003Bl-Iz
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vfUUG2EwR11usfAfizVHZ3xS9DQkiLchQzF2M8McAu8=;
 b=HHaaJoVoa7GxzvrIL8vH40tneDh7dS62hwx5dJf4EWhY2XltI5k4xzo0h566PI1J0GqTyl
 M+njoveBbnUV2r+lUigEYxuZzvYOuLsjB88noRbbm8RrJJYulFcGLgAASdcu8tmb891F6Z
 NFbB3r1Fy6bBOg0HCA0yeRur35j1AJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-bnlGe4qGPkmgWFFTV9mL7w-1; Thu, 11 Mar 2021 09:48:56 -0500
X-MC-Unique: bnlGe4qGPkmgWFFTV9mL7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB579100C619;
 Thu, 11 Mar 2021 14:48:55 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAA185D9F2;
 Thu, 11 Mar 2021 14:48:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 26/38] qapi/qom: Add ObjectOptions for input-*
Date: Thu, 11 Mar 2021 15:47:59 +0100
Message-Id: <20210311144811.313451-27-kwolf@redhat.com>
In-Reply-To: <20210311144811.313451-1-kwolf@redhat.com>
References: <20210311144811.313451-1-kwolf@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a QAPI schema for the properties of the input-* objects.

ui.json cannot be included in qom.json because the storage daemon can't
use it, so move GrabToggleKeys to common.json.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/common.json | 12 ++++++++++
 qapi/qom.json    | 59 ++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/ui.json     | 13 +----------
 3 files changed, 72 insertions(+), 12 deletions(-)

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
index 8022367269..d96c243b56 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -444,6 +444,61 @@
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
+# @y-origin: y coordinate of the topmost pixel on the guest screen
+#            (default: "0")
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
@@ -692,6 +747,8 @@
     'filter-redirector',
     'filter-replay',
     'filter-rewriter',
+    'input-barrier',
+    'input-linux',
     'iothread',
     'memory-backend-file',
     { 'name': 'memory-backend-memfd',
@@ -746,6 +803,8 @@
       'filter-redirector':          'FilterRedirectorProperties',
       'filter-replay':              'NetfilterProperties',
       'filter-rewriter':            'FilterRewriterProperties',
+      'input-barrier':              'InputBarrierProperties',
+      'input-linux':                'InputLinuxProperties',
       'iothread':                   'IothreadProperties',
       'memory-backend-file':        'MemoryBackendFileProperties',
       'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
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


