Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8ED3377C4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:32:05 +0100 (CET)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNIC-0001bZ-8V
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:32:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcO-0005ML-SB
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:48:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcK-0002zX-D0
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJCpcCfupCNh4sqyYU04AyDS7Rp+4ua4nQRd569CmYw=;
 b=fwJ9UgoMWOq2iV8OoBUndftYShL1KQZTa/N66f1Gk8gozX/bNW9PG586JzoR7bYDiMSjx2
 SqdS/VoZB5JlYLMYGConiylB4Yu5KZPrZ4TLWH/E5SV6bp68phlfoHM7S6cX1AI0SB1QcS
 8eKyPAH9busDaJ+TbB/H1u41XzUlGCw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-tAzDbAzpMWmrRRC3Hl2mxw-1; Thu, 11 Mar 2021 09:48:45 -0500
X-MC-Unique: tAzDbAzpMWmrRRC3Hl2mxw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C9FD100C61B;
 Thu, 11 Mar 2021 14:48:44 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 807405D9F2;
 Thu, 11 Mar 2021 14:48:43 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 18/38] qapi/qom: Add ObjectOptions for throttle-group
Date: Thu, 11 Mar 2021 15:47:51 +0100
Message-Id: <20210311144811.313451-19-kwolf@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a QAPI schema for the properties of the throttle-group object.

The only purpose of the x-* properties is to make the nested options in
'limits' available for a command line parser that doesn't support
structs. Any parser that will use the QAPI schema will supports structs,
though, so they will not be needed in the schema in the future.

To keep the conversion straightforward, add them to the schema anyway.
We can then remove the options and adjust documentation, test cases etc.
in a separate patch.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/block-core.json | 27 +++++++++++++++++++++++++++
 qapi/qom.json        |  7 +++++--
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9f555d5c1d..a67fa0cc59 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2504,6 +2504,33 @@
             '*bps-write-max' : 'int', '*bps-write-max-length' : 'int',
             '*iops-size' : 'int' } }
 
+##
+# @ThrottleGroupProperties:
+#
+# Properties for throttle-group objects.
+#
+# The options starting with x- are aliases for the same key without x- in
+# the @limits object. As indicated by the x- prefix, this is not a stable
+# interface and may be removed or changed incompatibly in the future. Use
+# @limits for a supported stable interface.
+#
+# @limits: limits to apply for this throttle group
+#
+# Since: 2.11
+##
+{ 'struct': 'ThrottleGroupProperties',
+  'data': { '*limits': 'ThrottleLimits',
+            '*x-iops-total' : 'int', '*x-iops-total-max' : 'int',
+            '*x-iops-total-max-length' : 'int', '*x-iops-read' : 'int',
+            '*x-iops-read-max' : 'int', '*x-iops-read-max-length' : 'int',
+            '*x-iops-write' : 'int', '*x-iops-write-max' : 'int',
+            '*x-iops-write-max-length' : 'int', '*x-bps-total' : 'int',
+            '*x-bps-total-max' : 'int', '*x-bps-total-max-length' : 'int',
+            '*x-bps-read' : 'int', '*x-bps-read-max' : 'int',
+            '*x-bps-read-max-length' : 'int', '*x-bps-write' : 'int',
+            '*x-bps-write-max' : 'int', '*x-bps-write-max-length' : 'int',
+            '*x-iops-size' : 'int' } }
+
 ##
 # @block-stream:
 #
diff --git a/qapi/qom.json b/qapi/qom.json
index 7fb243c3ab..fa56083a0b 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -5,6 +5,7 @@
 # See the COPYING file in the top-level directory.
 
 { 'include': 'authz.json' }
+{ 'include': 'block-core.json' }
 { 'include': 'common.json' }
 
 ##
@@ -451,7 +452,8 @@
     'memory-backend-ram',
     'rng-builtin',
     'rng-egd',
-    'rng-random'
+    'rng-random',
+    'throttle-group'
   ] }
 
 ##
@@ -486,7 +488,8 @@
       'memory-backend-ram':         'MemoryBackendProperties',
       'rng-builtin':                'RngProperties',
       'rng-egd':                    'RngEgdProperties',
-      'rng-random':                 'RngRandomProperties'
+      'rng-random':                 'RngRandomProperties',
+      'throttle-group':             'ThrottleGroupProperties'
   } }
 
 ##
-- 
2.29.2


