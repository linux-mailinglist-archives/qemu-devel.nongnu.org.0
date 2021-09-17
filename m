Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC6E40FA69
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:39:48 +0200 (CEST)
Received: from localhost ([::1]:44766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRF1n-0001Px-A6
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mREu5-00049w-0m
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:31:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mREtz-0000FS-Kk
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631889102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d6y9OmEtTBnlRiYpWfvrlHFufeuqZWo+NYTTiVHqXYA=;
 b=SGy9bCPOjbCiFgE3E3nV5aEZNIRl2cVaJWgtiO8APTj96oBz8NLje7Ch6EKGguzBiVEY2g
 UyYc/Uoks7n0Xki1rjtZVvJtFDXCelQnhNgNgsYpDIXHZtmZI9c2auK8x545JBZsyFeIef
 AT+1Z9kL0i1gcHMD/sWTlO+DCF1n1+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-xi03HjhGPpKkrOSIPsa92A-1; Fri, 17 Sep 2021 10:31:41 -0400
X-MC-Unique: xi03HjhGPpKkrOSIPsa92A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 902048145E6;
 Fri, 17 Sep 2021 14:31:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CF745D9FC;
 Fri, 17 Sep 2021 14:31:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6D11711384A2; Fri, 17 Sep 2021 16:31:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/23] qapi: Convert simple union ChardevBackend to flat one
Date: Fri, 17 Sep 2021 16:31:18 +0200
Message-Id: <20210917143134.412106-8-armbru@redhat.com>
In-Reply-To: <20210917143134.412106-1-armbru@redhat.com>
References: <20210917143134.412106-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: jsnow@redhat.com, michael.roth@amd.com, Paolo Bonzini <pbonzini@redhat.com>,
 eblake@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simple unions predate flat unions.  Having both complicates the QAPI
schema language and the QAPI generator.  We haven't been using simple
unions in new code for a long time, because they are less flexible and
somewhat awkward on the wire.

To prepare for their removal, convert simple union ChardevBackend to
an equivalent flat one.  Adds some boilerplate to the schema, which is
a bit ugly, but a lot easier to maintain than the simple union
feature.

Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/char.json | 187 +++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 165 insertions(+), 22 deletions(-)

diff --git a/qapi/char.json b/qapi/char.json
index 9b18ee3305..cc1e455c87 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -407,39 +407,182 @@
   'base': 'ChardevCommon',
   'if': 'CONFIG_SPICE_PROTOCOL' }
 
+##
+# @ChardevBackendKind:
+#
+# @pipe: Since 1.5
+# @udp: Since 1.5
+# @mux: Since 1.5
+# @msmouse: Since 1.5
+# @wctablet: Since 2.9
+# @braille: Since 1.5
+# @testdev: Since 2.2
+# @stdio: Since 1.5
+# @console: Since 1.5
+# @spicevmc: Since 1.5
+# @spiceport: Since 1.5
+# @qemu-vdagent: Since 6.1
+# @vc: v1.5
+# @ringbuf: Since 1.6
+# @memory: Since 1.5
+#
+# Since: 1.4
+##
+{ 'enum': 'ChardevBackendKind',
+  'data': [ 'file',
+            'serial',
+            'parallel',
+            'pipe',
+            'socket',
+            'udp',
+            'pty',
+            'null',
+            'mux',
+            'msmouse',
+            'wctablet',
+            'braille',
+            'testdev',
+            'stdio',
+            'console',
+            { 'name': 'spicevmc', 'if': 'CONFIG_SPICE' },
+            { 'name': 'spiceport', 'if': 'CONFIG_SPICE' },
+            { 'name': 'qemu-vdagent', 'if': 'CONFIG_SPICE_PROTOCOL' },
+            'vc',
+            'ringbuf',
+            # next one is just for compatibility
+            'memory' ] }
+
+##
+# @ChardevFileWrapper:
+#
+# Since: 1.4
+##
+{ 'struct': 'ChardevFileWrapper',
+  'data': { 'data': 'ChardevFile' } }
+
+##
+# @ChardevHostdevWrapper:
+#
+# Since: 1.4
+##
+{ 'struct': 'ChardevHostdevWrapper',
+  'data': { 'data': 'ChardevHostdev' } }
+
+##
+# @ChardevSocketWrapper:
+#
+# Since: 1.4
+##
+{ 'struct': 'ChardevSocketWrapper',
+  'data': { 'data': 'ChardevSocket' } }
+
+##
+# @ChardevUdpWrapper:
+#
+# Since: 1.5
+##
+{ 'struct': 'ChardevUdpWrapper',
+  'data': { 'data': 'ChardevUdp' } }
+
+##
+# @ChardevCommonWrapper:
+#
+# Since: 2.6
+##
+{ 'struct': 'ChardevCommonWrapper',
+  'data': { 'data': 'ChardevCommon' } }
+
+##
+# @ChardevMuxWrapper:
+#
+# Since: 1.5
+##
+{ 'struct': 'ChardevMuxWrapper',
+  'data': { 'data': 'ChardevMux' } }
+
+##
+# @ChardevStdioWrapper:
+#
+# Since: 1.5
+##
+{ 'struct': 'ChardevStdioWrapper',
+  'data': { 'data': 'ChardevStdio' } }
+
+##
+# @ChardevSpiceChannelWrapper:
+#
+# Since: 1.5
+##
+{ 'struct': 'ChardevSpiceChannelWrapper',
+  'data': { 'data': 'ChardevSpiceChannel' } }
+
+##
+# @ChardevSpicePortWrapper:
+#
+# Since: 1.5
+##
+{ 'struct': 'ChardevSpicePortWrapper',
+  'data': { 'data': 'ChardevSpicePort' } }
+
+##
+# @ChardevQemuVDAgentWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'ChardevQemuVDAgentWrapper',
+  'data': { 'data': 'ChardevQemuVDAgent' } }
+
+##
+# @ChardevVCWrapper:
+#
+# Since: 1.5
+##
+{ 'struct': 'ChardevVCWrapper',
+  'data': { 'data': 'ChardevVC' } }
+
+##
+# @ChardevRingbufWrapper:
+#
+# Since: 1.5
+##
+{ 'struct': 'ChardevRingbufWrapper',
+  'data': { 'data': 'ChardevRingbuf' } }
+
 ##
 # @ChardevBackend:
 #
 # Configuration info for the new chardev backend.
 #
-# Since: 1.4 (testdev since 2.2, wctablet since 2.9, vdagent since 6.1)
+# Since: 1.4
 ##
 { 'union': 'ChardevBackend',
-  'data': { 'file': 'ChardevFile',
-            'serial': 'ChardevHostdev',
-            'parallel': 'ChardevHostdev',
-            'pipe': 'ChardevHostdev',
-            'socket': 'ChardevSocket',
-            'udp': 'ChardevUdp',
-            'pty': 'ChardevCommon',
-            'null': 'ChardevCommon',
-            'mux': 'ChardevMux',
-            'msmouse': 'ChardevCommon',
-            'wctablet': 'ChardevCommon',
-            'braille': 'ChardevCommon',
-            'testdev': 'ChardevCommon',
-            'stdio': 'ChardevStdio',
-            'console': 'ChardevCommon',
-            'spicevmc': { 'type': 'ChardevSpiceChannel',
+  'base': { 'type': 'ChardevBackendKind' },
+  'discriminator': 'type',
+  'data': { 'file': 'ChardevFileWrapper',
+            'serial': 'ChardevHostdevWrapper',
+            'parallel': 'ChardevHostdevWrapper',
+            'pipe': 'ChardevHostdevWrapper',
+            'socket': 'ChardevSocketWrapper',
+            'udp': 'ChardevUdpWrapper',
+            'pty': 'ChardevCommonWrapper',
+            'null': 'ChardevCommonWrapper',
+            'mux': 'ChardevMuxWrapper',
+            'msmouse': 'ChardevCommonWrapper',
+            'wctablet': 'ChardevCommonWrapper',
+            'braille': 'ChardevCommonWrapper',
+            'testdev': 'ChardevCommonWrapper',
+            'stdio': 'ChardevStdioWrapper',
+            'console': 'ChardevCommonWrapper',
+            'spicevmc': { 'type': 'ChardevSpiceChannelWrapper',
                           'if': 'CONFIG_SPICE' },
-            'spiceport': { 'type': 'ChardevSpicePort',
+            'spiceport': { 'type': 'ChardevSpicePortWrapper',
                            'if': 'CONFIG_SPICE' },
-            'qemu-vdagent': { 'type': 'ChardevQemuVDAgent',
+            'qemu-vdagent': { 'type': 'ChardevQemuVDAgentWrapper',
                               'if': 'CONFIG_SPICE_PROTOCOL' },
-            'vc': 'ChardevVC',
-            'ringbuf': 'ChardevRingbuf',
+            'vc': 'ChardevVCWrapper',
+            'ringbuf': 'ChardevRingbufWrapper',
             # next one is just for compatibility
-            'memory': 'ChardevRingbuf' } }
+            'memory': 'ChardevRingbufWrapper' } }
 
 ##
 # @ChardevReturn:
-- 
2.31.1


