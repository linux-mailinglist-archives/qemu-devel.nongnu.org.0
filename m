Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B59331401
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:03:17 +0100 (CET)
Received: from localhost ([::1]:37542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJHo-0000vR-Lb
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:03:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJAR-0003YY-Ps
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:55:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJAM-00086O-RG
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rWTkUt8ItFufZC3kNth50Mpg8TcvjFChMjF/N1Af4dE=;
 b=APVYZd1qzgG1l2571zBL6Ht6OPEOuAHPiBiX4m58ASSDySeLzHpn3V4KcSCeze1XiFcQvT
 skz5ZeurJb71V/dQMY4GTuIhwz3ay740ACrVnOlYCSFPxQVkBuMpHn3zD4phW8ctmB9PBG
 YfcptftGx7hGC0o6POTWDLnlO+H1ehQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-RhF5uzNZMgKirfxsvwg5UQ-1; Mon, 08 Mar 2021 11:55:32 -0500
X-MC-Unique: RhF5uzNZMgKirfxsvwg5UQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20CC48042C3;
 Mon,  8 Mar 2021 16:55:31 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 487B25D9D3;
 Mon,  8 Mar 2021 16:55:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/30] qapi/qom: Add ObjectOptions for cryptodev-*
Date: Mon,  8 Mar 2021 17:54:14 +0100
Message-Id: <20210308165440.386489-5-kwolf@redhat.com>
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

This adds a QAPI schema for the properties of the cryptodev-* objects.

These interfaces have some questionable aspects (cryptodev-backend is
really an abstract base class without function, and the queues option
only makes sense for cryptodev-vhost-user), but as the goal is to
represent the existing interface in QAPI, leave these things in place.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
---
 qapi/qom.json | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index 30ed179bc1..46c2cdc6cf 100644
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
+# Since: 2.8
+##
+{ 'struct': 'CryptodevBackendProperties',
+  'data': { '*queues': 'uint32' } }
+
+##
+# @CryptodevVhostUserProperties:
+#
+# Properties for cryptodev-vhost-user objects.
+#
+# @chardev: the name of a Unix domain socket character device that connects to
+#           the vhost-user server
+#
+# Since: 2.12
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
 
@@ -262,6 +293,10 @@
       'authz-listfile':             'AuthZListFileProperties',
       'authz-pam':                  'AuthZPAMProperties',
       'authz-simple':               'AuthZSimpleProperties',
+      'cryptodev-backend':          'CryptodevBackendProperties',
+      'cryptodev-backend-builtin':  'CryptodevBackendProperties',
+      'cryptodev-vhost-user':       { 'type': 'CryptodevVhostUserProperties',
+                                      'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },
       'iothread':                   'IothreadProperties'
   } }
 
-- 
2.29.2


