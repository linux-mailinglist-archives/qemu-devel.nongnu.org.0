Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8B43377EF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:36:51 +0100 (CET)
Received: from localhost ([::1]:58918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNMo-0000xj-6v
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcY-0005Ya-Nh
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcQ-00037N-Fg
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qZIW4/wLaZKB59Ele6a7ReSFkaavF3TY6ugYHy3g6X0=;
 b=Nm3ES6E4duZtWptROQF+/zpDRf+e27XCUONJ7KChl42mwbqdodEZ/LeKPvkDHoAPJksos1
 E2IxL6cQ1KK5e3w8alP3jtsajk543SlFSjVuJvXyLXwJvgF0Shx/EsyYpWr0wudz0mLOJd
 fwoaMD8ltHTt8N21Cj3ZVgoRPejsmm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-35gzoGgMMTywOnAjzVd6Cw-1; Thu, 11 Mar 2021 09:48:49 -0500
X-MC-Unique: 35gzoGgMMTywOnAjzVd6Cw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9F1A100C61A;
 Thu, 11 Mar 2021 14:48:48 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA9E25D9F2;
 Thu, 11 Mar 2021 14:48:47 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 21/38] qapi/qom: Add ObjectOptions for can-*
Date: Thu, 11 Mar 2021 15:47:54 +0100
Message-Id: <20210311144811.313451-22-kwolf@redhat.com>
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a QAPI schema for the properties of the can-* objects.

can-bus doesn't have any properties, so it only needs to be added to the
ObjectType enum without adding a new branch to ObjectOptions.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/qom.json | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index 5f397d197a..b600b1b7a7 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -207,6 +207,21 @@
   'returns': [ 'ObjectPropertyInfo' ],
   'allow-preconfig': true }
 
+##
+# @CanHostSocketcanProperties:
+#
+# Properties for can-host-socketcan objects.
+#
+# @if: interface name of the host system CAN bus to connect to
+#
+# @canbus: object ID of the can-bus object to connect to the host interface
+#
+# Since: 2.12
+##
+{ 'struct': 'CanHostSocketcanProperties',
+  'data': { 'if': 'str',
+            'canbus': 'str' } }
+
 ##
 # @CryptodevBackendProperties:
 #
@@ -441,6 +456,8 @@
     'authz-listfile',
     'authz-pam',
     'authz-simple',
+    'can-bus',
+    'can-host-socketcan',
     'cryptodev-backend',
     'cryptodev-backend-builtin',
     { 'name': 'cryptodev-vhost-user',
@@ -483,6 +500,7 @@
       'authz-listfile':             'AuthZListFileProperties',
       'authz-pam':                  'AuthZPAMProperties',
       'authz-simple':               'AuthZSimpleProperties',
+      'can-host-socketcan':         'CanHostSocketcanProperties',
       'cryptodev-backend':          'CryptodevBackendProperties',
       'cryptodev-backend-builtin':  'CryptodevBackendProperties',
       'cryptodev-vhost-user':       { 'type': 'CryptodevVhostUserProperties',
-- 
2.29.2


