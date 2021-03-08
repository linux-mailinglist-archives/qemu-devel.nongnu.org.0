Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2FE331457
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:15:39 +0100 (CET)
Received: from localhost ([::1]:45852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJTm-0008MS-AO
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:15:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJBt-0004ji-FB
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:57:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJBp-0000AO-Pa
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:57:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ajounDvxokTFzoB9wvZR6L7evSaIXZBUIm+T+oqS00o=;
 b=HSilAPd08WSN57OSTv0L4C7lwBj8nqPCV7b9191eOPQXOdoVXPQ6zdg2COflTnZBIW3wjg
 FgtgfjwYwxPPSrtKfiqRqL3OBSiHTtrXbfLKqX51X5UKvNRpQcqxstInCSmEi4u5b0p585
 RjrcfF7Enya1uxZDyh7zzQkOJyI+kgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-IyrtgwomOdivoN7DGvX4dA-1; Mon, 08 Mar 2021 11:55:52 -0500
X-MC-Unique: IyrtgwomOdivoN7DGvX4dA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DC5284BA40;
 Mon,  8 Mar 2021 16:55:51 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2AED5D9D3;
 Mon,  8 Mar 2021 16:55:48 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/30] qapi/qom: Add ObjectOptions for throttle-group
Date: Mon,  8 Mar 2021 17:54:18 +0100
Message-Id: <20210308165440.386489-9-kwolf@redhat.com>
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

This adds a QAPI schema for the properties of the throttle-group object.

The only purpose of the x-* properties is to make the nested options in
'limits' available for a command line parser that doesn't support
structs. Any parser that will use the QAPI schema will supports structs,
though, so they will not be needed in the schema in the future.

To keep the conversion straightforward, add them to the schema anyway.
We can then remove the options and adjust documentation, test cases etc.
in a separate patch.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
index 6d3b8c4fe0..0721a636f9 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -5,6 +5,7 @@
 # See the COPYING file in the top-level directory.
 
 { 'include': 'authz.json' }
+{ 'include': 'block-core.json' }
 { 'include': 'common.json' }
 
 ##
@@ -449,7 +450,8 @@
     'memory-backend-ram',
     'rng-builtin',
     'rng-egd',
-    'rng-random'
+    'rng-random',
+    'throttle-group'
   ] }
 
 ##
@@ -484,7 +486,8 @@
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


