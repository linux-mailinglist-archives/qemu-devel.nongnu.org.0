Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132FB331446
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:11:23 +0100 (CET)
Received: from localhost ([::1]:33046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJPe-0002Yb-1d
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:11:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJAc-0003av-F2
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:55:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJAP-00088I-Ir
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:55:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abW4ev/LsJ17tNltHEjcxsI6MjqEQ6uvryWZxwBLKUg=;
 b=Qlv0c+THFPZ3bYc9qzvgKPg5IzbJA5WgxOsPeCA6fCiwH10kBKNrszgVbutaEKfVr6dh37
 UMXTmjwCVh04uFhoDefE0L1HsCczjRShCeukw0Li54Xpa0HP26K5+08F0mpqQlgmDGinW5
 VkTH50ZvGJlI4+1Z2omBNfFjs1JahdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-MIFRyNA9PSeIBry2LlePvA-1; Mon, 08 Mar 2021 11:55:35 -0500
X-MC-Unique: MIFRyNA9PSeIBry2LlePvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D890804022;
 Mon,  8 Mar 2021 16:55:34 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 682705D9D3;
 Mon,  8 Mar 2021 16:55:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/30] qapi/qom: Add ObjectOptions for dbus-vmstate
Date: Mon,  8 Mar 2021 17:54:15 +0100
Message-Id: <20210308165440.386489-6-kwolf@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This adds a QAPI schema for the properties of the dbus-vmstate object.

A list represented as a comma separated string is clearly not very
QAPI-like, but for now just describe the existing interface.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/qom.json | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index 46c2cdc6cf..942654e05c 100644
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
+# Since: 5.0
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
 
@@ -297,6 +314,7 @@
       'cryptodev-backend-builtin':  'CryptodevBackendProperties',
       'cryptodev-vhost-user':       { 'type': 'CryptodevVhostUserProperties',
                                       'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },
+      'dbus-vmstate':               'DBusVMStateProperties',
       'iothread':                   'IothreadProperties'
   } }
 
-- 
2.29.2


