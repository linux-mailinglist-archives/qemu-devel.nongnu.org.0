Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1884A33144F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:14:17 +0100 (CET)
Received: from localhost ([::1]:42868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJSQ-00078y-SF
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:14:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJBH-0003yg-Rv
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:56:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJB5-0008L7-Vd
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:56:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WZhUdeQbA7PLw5tRHiipoeFCA0GoRvKjnCl2aUPKtQE=;
 b=brUKRy1DMPGcsiIhdlcdUVcvZyQ5c+gK9+8JBfyrxmPUUskrI7oCNDmoJHKsOMG9i1DYJh
 zDZjegso2yAOTxsbFaRE8CCFCcEaXsbDNafBsKuWDx41OgjtsYilJzNRqcG48n3Tqj+10C
 y9qdYSFKWwniJO8fWFUCZBdDu6YHx4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-Ud02nQIQNa2LWjlwG9vi1Q-1; Mon, 08 Mar 2021 11:56:13 -0500
X-MC-Unique: Ud02nQIQNa2LWjlwG9vi1Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D346FE5760;
 Mon,  8 Mar 2021 16:56:12 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0048F5D9DB;
 Mon,  8 Mar 2021 16:56:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/30] qapi/qom: Add ObjectOptions for colo-compare
Date: Mon,  8 Mar 2021 17:54:22 +0100
Message-Id: <20210308165440.386489-13-kwolf@redhat.com>
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

This adds a QAPI schema for the properties of the colo-compare object.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/qom.json | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index fd87896bca..a34ae43cb9 100644
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
+# Since: 2.8
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
@@ -458,6 +505,7 @@
     'authz-simple',
     'can-bus',
     'can-host-socketcan',
+    'colo-compare',
     'cryptodev-backend',
     'cryptodev-backend-builtin',
     'cryptodev-vhost-user',
@@ -499,6 +547,7 @@
       'authz-pam':                  'AuthZPAMProperties',
       'authz-simple':               'AuthZSimpleProperties',
       'can-host-socketcan':         'CanHostSocketcanProperties',
+      'colo-compare':               'ColoCompareProperties',
       'cryptodev-backend':          'CryptodevBackendProperties',
       'cryptodev-backend-builtin':  'CryptodevBackendProperties',
       'cryptodev-vhost-user':       { 'type': 'CryptodevVhostUserProperties',
-- 
2.29.2


