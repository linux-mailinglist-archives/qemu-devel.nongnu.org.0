Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B47C2C842F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:35:17 +0100 (CET)
Received: from localhost ([::1]:57090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiOi-0000Wu-GF
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:35:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiGB-0000it-WE
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:26:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiG8-0002S4-Od
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606739183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4e64kvVkcFLM0BZyD9sIS9fezuP5XCLVVG0JupI9TPg=;
 b=dyDdb6oVVfJWVbBtkz548YXr6vV4e2ke0IOp+DjKF6qAV3zGRmy8bobqurpIJr4L2ZVxYZ
 RkvGab6iCfk22+iUAkVuaGMvFq1HG/AYHnsZRyCF5U+3JfuVAleuzc2z+PHivfuGATEOmJ
 6TXbG7wun8CRBoQMpo0eaiRB4h3DFeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-x5Kguy7sPMGMWPi-A5XZ8Q-1; Mon, 30 Nov 2020 07:26:21 -0500
X-MC-Unique: x5Kguy7sPMGMWPi-A5XZ8Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B99EF9CC03;
 Mon, 30 Nov 2020 12:26:20 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5556919C71;
 Mon, 30 Nov 2020 12:26:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/18] qapi/qom: Add ObjectOptions for cryptodev-*
Date: Mon, 30 Nov 2020 13:25:23 +0100
Message-Id: <20201130122538.27674-4-kwolf@redhat.com>
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

This adds a QAPI schema for the properties of the cryptodev-* objects.

These interfaces have some questionable aspects (cryptodev-backend is
really an abstract base class without function, and the queues option
only makes sense for cryptodev-vhost-user), but as the goal is to
represent the existing interface in QAPI, leave these things in place.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qom.json | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index 0ac4b1c9fb..7cbc0a3c54 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -204,6 +204,34 @@
   'returns': [ 'ObjectPropertyInfo' ],
   'allow-preconfig': true }
 
+##
+# @CryptodevBackendProperties:
+#
+# Properties for cryptodev-backend and cryptodev-backend-builtin objects.
+#
+# @queues: the number of queues for the cryptodev backend. Ignored for
+#          cryptodev-backend and must be 1 for cryptodev-backend-builtin.
+#          (default: 1)
+#
+# Since: 6.0
+##
+{ 'struct': 'CryptodevBackendProperties',
+  'data': { '*queues': 'uint32' } }
+
+##
+# @CryptodevVhostUserProperties:
+#
+# Properties for cryptodev-vhost-user objects.
+#
+# @chardev: the name of a unix domain socket character device that connects to
+#           the vhost-user server
+#
+# Since: 6.0
+##
+{ 'struct': 'CryptodevVhostUserProperties',
+  'base': 'CryptodevBackendProperties',
+  'data': { 'chardev': 'str' } }
+
 ##
 # @IothreadProperties:
 #
@@ -239,6 +267,9 @@
     'authz-listfile',
     'authz-pam',
     'authz-simple',
+    'cryptodev-backend',
+    'cryptodev-backend-builtin',
+    'cryptodev-vhost-user',
     'iothread'
   ] }
 
@@ -262,6 +293,9 @@
       'authz-listfile':             'AuthZListFileProperties',
       'authz-pam':                  'AuthZPAMProperties',
       'authz-simple':               'AuthZSimpleProperties',
+      'cryptodev-backend':          'CryptodevBackendProperties',
+      'cryptodev-backend-builtin':  'CryptodevBackendProperties',
+      'cryptodev-vhost-user':       'CryptodevVhostUserProperties',
       'iothread':                   'IothreadProperties'
   } }
 
-- 
2.28.0


