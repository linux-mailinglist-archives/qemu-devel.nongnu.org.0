Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4612C842B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:33:27 +0100 (CET)
Received: from localhost ([::1]:52922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiMv-0006sD-Ue
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiGN-0000kH-5V
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:26:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiGB-0002TK-LB
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:26:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606739186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z4j7dZawXCuJoJMOPWXGMCFOagUWPw06ceZx2I/W1F4=;
 b=ezYv/6MEfcDl/DqD0RZT4LBRKbDK87EkcoTjRAS25WshUPP1xcpk6sgx5aelgipnJi4TLp
 fckdPqlqKaSSACtZOlC2oBc6D+3abj1F2vvynToRb9qz/cDVTEeeQRnsEwJwWEcFhFJPej
 csu+QgMuhDW7jNg6pH5n/v0E2agg9Ow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-WQiLQbA5Pg-O4NHqUJYzSw-1; Mon, 30 Nov 2020 07:26:24 -0500
X-MC-Unique: WQiLQbA5Pg-O4NHqUJYzSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C87C2180A0B0;
 Mon, 30 Nov 2020 12:26:23 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 087A519C71;
 Mon, 30 Nov 2020 12:26:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/18] qapi/qom: Add ObjectOptions for dbus-vmstate
Date: Mon, 30 Nov 2020 13:25:24 +0100
Message-Id: <20201130122538.27674-5-kwolf@redhat.com>
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

This adds a QAPI schema for the properties of the dbus-vmstate object.

A list represented as a comma separated string is clearly not very
QAPI-like, but for now just describe the existing interface.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qom.json | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index 7cbc0a3c54..2319c9bad6 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -232,6 +232,22 @@
   'base': 'CryptodevBackendProperties',
   'data': { 'chardev': 'str' } }
 
+##
+# @DBusVMStateProperties:
+#
+# Properties for dbus-vmstate objects.
+#
+# @addr: the name of the DBus bus to connect to
+#
+# @id-list: a comma separated list of DBus IDs of helpers whose data should be
+#           included in the VM state on migration
+#
+# Since: 6.0
+##
+{ 'struct': 'DBusVMStateProperties',
+  'data': { 'addr': 'str' ,
+            '*id-list': 'str' } }
+
 ##
 # @IothreadProperties:
 #
@@ -270,6 +286,7 @@
     'cryptodev-backend',
     'cryptodev-backend-builtin',
     'cryptodev-vhost-user',
+    'dbus-vmstate',
     'iothread'
   ] }
 
@@ -296,6 +313,7 @@
       'cryptodev-backend':          'CryptodevBackendProperties',
       'cryptodev-backend-builtin':  'CryptodevBackendProperties',
       'cryptodev-vhost-user':       'CryptodevVhostUserProperties',
+      'dbus-vmstate':               'DBusVMStateProperties',
       'iothread':                   'IothreadProperties'
   } }
 
-- 
2.28.0


