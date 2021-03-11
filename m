Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFE5337855
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:44:34 +0100 (CET)
Received: from localhost ([::1]:50362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNUH-0001Rz-Ek
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMci-0005f6-M6
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcW-0003CC-EC
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJybzS1XU6P9dF2KGV/QasUBp8BQsobnYpQ9nBq/HdI=;
 b=Qn9TubTGlHwm/tqr/PTA9HnEWjPWXm6aJ1U5kRB7CHlksEvuIMWSPk9Gw5r6VgdeVpilW6
 xlFPsN0gA72KHz37cl94QOeSs2hKDZNPvsiM81EU7ATnlvcLotVSn+AdRs9HC3QtKQcsYz
 CtCQCuq5U+cuXIQMCWPU87S8D2ywTtQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-mxgk83YrM3u1fdT3Shl-nw-1; Thu, 11 Mar 2021 09:48:58 -0500
X-MC-Unique: mxgk83YrM3u1fdT3Shl-nw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FF9C92500;
 Thu, 11 Mar 2021 14:48:57 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1431A5D9F2;
 Thu, 11 Mar 2021 14:48:55 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 27/38] qapi/qom: Add ObjectOptions for x-remote-object
Date: Thu, 11 Mar 2021 15:48:00 +0100
Message-Id: <20210311144811.313451-28-kwolf@redhat.com>
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

This adds a QAPI schema for the properties of the x-remote-object
object.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/qom.json | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index d96c243b56..192a582b07 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -644,6 +644,20 @@
 { 'struct': 'PrManagerHelperProperties',
   'data': { 'path': 'str' } }
 
+##
+# @RemoteObjectProperties:
+#
+# Properties for x-remote-object objects.
+#
+# @fd: file descriptor name previously passed via 'getfd' command
+#
+# @devid: the id of the device to be associated with the file descriptor
+#
+# Since: 6.0
+##
+{ 'struct': 'RemoteObjectProperties',
+  'data': { 'fd': 'str', 'devid': 'str' } }
+
 ##
 # @RngProperties:
 #
@@ -767,7 +781,8 @@
     'tls-creds-anon',
     'tls-creds-psk',
     'tls-creds-x509',
-    'tls-cipher-suites'
+    'tls-cipher-suites',
+    'x-remote-object'
   ] }
 
 ##
@@ -822,7 +837,8 @@
       'tls-creds-anon':             'TlsCredsAnonProperties',
       'tls-creds-psk':              'TlsCredsPskProperties',
       'tls-creds-x509':             'TlsCredsX509Properties',
-      'tls-cipher-suites':          'TlsCredsProperties'
+      'tls-cipher-suites':          'TlsCredsProperties',
+      'x-remote-object':            'RemoteObjectProperties'
   } }
 
 ##
-- 
2.29.2


