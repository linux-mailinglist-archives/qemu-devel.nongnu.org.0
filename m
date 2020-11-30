Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED7B2C843E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:43:34 +0100 (CET)
Received: from localhost ([::1]:42376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiWj-0006T0-9O
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiHO-0001nb-HB
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:27:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiHL-0002nx-7q
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:27:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606739258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aq91dvdBDZV8U0QFNHvLenYrUwP7Yz+24S7HitTEIMU=;
 b=bvXpZeSPf2xKTj8Lpuuug3sdUo+qK1HxUNfmKm7MxVqIaDg67xbRGNKBEgAen5L5/KPrbO
 zTfa9aq8MtzIqkD+a/uX1QIkdC1qG13x8oh9xXV7afuK/mAMqWDYTg7392QWXfk2rPSbIq
 ahtLoXb74araPoKOqGSwst15GsQoxbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-WNijp6yTMc27tKguqdvfSg-1; Mon, 30 Nov 2020 07:27:36 -0500
X-MC-Unique: WNijp6yTMc27tKguqdvfSg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CBB1425F6;
 Mon, 30 Nov 2020 12:27:35 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE4D719C71;
 Mon, 30 Nov 2020 12:27:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/18] qapi/qom: Add ObjectOptions for colo-compare
Date: Mon, 30 Nov 2020 13:25:31 +0100
Message-Id: <20201130122538.27674-12-kwolf@redhat.com>
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

This adds a QAPI schema for the properties of the colo-compare object.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qom.json | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index ff9e51ee19..4c4f2841c3 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -222,6 +222,53 @@
   'data': { 'if': 'str',
             'canbus': 'str' } }
 
+##
+# @ColoCompareProperties:
+#
+# Properties for colo-compare objects.
+#
+# @primary_in: name of the character device backend to use for the primary
+#              input (incoming packets are redirected to @outdev)
+#
+# @secondary_in: name of the character device backend to use for secondary
+#                input (incoming packets are only compared to the input on
+#                @primary_in and then dropped)
+#
+# @outdev: name of the character device backend to use for output
+#
+# @iothread: name of the iothread to run in
+#
+# @notify_dev: name of the character device backend to be used to communicate
+#              with the remote colo-frame (only for Xen COLO)
+#
+# @compare_timeout: the maximum time to hold a packet from @primary_in for
+#                   comparison with an incoming packet on @secondary_in in
+#                   milliseconds (default: 3000)
+#
+# @expired_scan_cycle: the interval at which colo-compare checks whether
+#                      packets from @primary have timed out, in milliseconds
+#                      (default: 3000)
+#
+# @max_queue_size: the maximum number of packets to keep in the queue for
+#                  comparing with incoming packets from @secondary_in.  If the
+#                  queue is full and addtional packets are received, the
+#                  addtional packets are dropped. (default: 1024)
+#
+# @vnet_hdr_support: if true, vnet header support is enabled (default: false)
+#
+# Since: 6.0
+##
+{ 'struct': 'ColoCompareProperties',
+  'data': { 'primary_in': 'str',
+            'secondary_in': 'str',
+            'outdev': 'str',
+            'iothread': 'str',
+            '*notify_dev': 'str',
+            '*compare_timeout': 'uint64',
+            '*expired_scan_cycle': 'uint32',
+            '*max_queue_size': 'uint32',
+            '*vnet_hdr_support': 'bool' } }
+
 ##
 # @CryptodevBackendProperties:
 #
@@ -444,6 +491,7 @@
     'authz-simple',
     'can-bus',
     'can-host-socketcan',
+    'colo-compare',
     'cryptodev-backend',
     'cryptodev-backend-builtin',
     'cryptodev-vhost-user',
@@ -485,6 +533,7 @@
       'authz-pam':                  'AuthZPAMProperties',
       'authz-simple':               'AuthZSimpleProperties',
       'can-host-socketcan':         'CanHostSocketcanProperties',
+      'colo-compare':               'ColoCompareProperties',
       'cryptodev-backend':          'CryptodevBackendProperties',
       'cryptodev-backend-builtin':  'CryptodevBackendProperties',
       'cryptodev-vhost-user':       'CryptodevVhostUserProperties',
-- 
2.28.0


