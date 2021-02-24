Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB08323F4C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 15:57:16 +0100 (CET)
Received: from localhost ([::1]:34200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvbH-00085y-Ik
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 09:57:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvQU-0001qq-1X
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvQK-0003RZ-AG
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614177952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dlOzn8xjPIuRTgy9kvqoi3SITZFMJXbkV6/9K7HjVKE=;
 b=IsBLPrIq2zasz6rZ4OgakihgydYy6Nu2H/UOpLftemOPcf/lWp8VXaIhPQguXWwgWmerhi
 jGWGQSc7E0OIuNEXdkG9vNb8BRwvvZAn/smCCX4GS9qbNAHlhv8lSrr94bYqURLcgQfUHr
 7mGvv32de92jnJjKRY8OwJA4T+YWQ20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-bOAbRg7WP0uNUTEiictsHQ-1; Wed, 24 Feb 2021 09:45:50 -0500
X-MC-Unique: bOAbRg7WP0uNUTEiictsHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0478195724B;
 Wed, 24 Feb 2021 13:54:29 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0989D5D6D3;
 Wed, 24 Feb 2021 13:54:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/31] qapi/qom: Add ObjectOptions for colo-compare
Date: Wed, 24 Feb 2021 14:52:37 +0100
Message-Id: <20210224135255.253837-14-kwolf@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

This adds a QAPI schema for the properties of the colo-compare object.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qom.json | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index 4b1cd4b8dc..8e4414f843 100644
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
@@ -456,6 +503,7 @@
     'authz-simple',
     'can-bus',
     'can-host-socketcan',
+    'colo-compare',
     'cryptodev-backend',
     'cryptodev-backend-builtin',
     'cryptodev-vhost-user',
@@ -497,6 +545,7 @@
       'authz-pam':                  'AuthZPAMProperties',
       'authz-simple':               'AuthZSimpleProperties',
       'can-host-socketcan':         'CanHostSocketcanProperties',
+      'colo-compare':               'ColoCompareProperties',
       'cryptodev-backend':          'CryptodevBackendProperties',
       'cryptodev-backend-builtin':  'CryptodevBackendProperties',
       'cryptodev-vhost-user':       'CryptodevVhostUserProperties',
-- 
2.29.2


