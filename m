Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A116D3377FE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:39:03 +0100 (CET)
Received: from localhost ([::1]:35932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNOw-0003Bb-ML
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:39:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcV-0005Rn-Rj
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcK-0002zj-JE
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZhOb3Q2T0Fkbtx6XRQumGJd54yKpuGrtOOvBk1OSvgs=;
 b=StYvodxaHjDYQmriLk2Y6BxwcYzuYPqSsHpneLupWRWNzG9cnqB+McLBtjJ/SPWAKUHD/l
 ux0k8vrYyXof9nRxQpVM9HXQwy7p4o5il1rgUzQ7VwH+YZ/CNkHo3p3E1ntG6I6JFQ5A2s
 IaS66ytb02PZ5baxd6GSHKZLEBuJNjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-bXOGKm6ZNF6xQLX4dYD7iw-1; Thu, 11 Mar 2021 09:48:44 -0500
X-MC-Unique: bXOGKm6ZNF6xQLX4dYD7iw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31EC0801817;
 Thu, 11 Mar 2021 14:48:43 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29B935DAA5;
 Thu, 11 Mar 2021 14:48:42 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 17/38] qapi/qom: Add ObjectOptions for rng-*, deprecate 'opened'
Date: Thu, 11 Mar 2021 15:47:50 +0100
Message-Id: <20210311144811.313451-18-kwolf@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a QAPI schema for the properties of the rng-* objects.

The 'opened' property doesn't seem to make sense as an external
interface: It is automatically set to true in ucc->complete, and
explicitly setting it to true earlier just means that trying to set
additional options will result in an error. After the property has once
been set to true (i.e. when the object construction has completed), it
can never be reset to false. In other words, the 'opened' property is
useless. Mark it as deprecated in the schema from the start.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/qom.json              | 56 ++++++++++++++++++++++++++++++++++++--
 docs/system/deprecated.rst |  9 ++++++
 2 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 79525f64a1..7fb243c3ab 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -382,6 +382,52 @@
             '*hugetlbsize': 'size',
             '*seal': 'bool' } }
 
+##
+# @RngProperties:
+#
+# Properties for objects of classes derived from rng.
+#
+# @opened: if true, the device is opened immediately when applying this option
+#          and will probably fail when processing the next option. Don't use;
+#          only provided for compatibility. (default: false)
+#
+# Features:
+# @deprecated: Member @opened is deprecated.  Setting true doesn't make sense,
+#              and false is already the default.
+#
+# Since: 1.3
+##
+{ 'struct': 'RngProperties',
+  'data': { '*opened': { 'type': 'bool', 'features': ['deprecated'] } } }
+
+##
+# @RngEgdProperties:
+#
+# Properties for rng-egd objects.
+#
+# @chardev: the name of a character device backend that provides the connection
+#           to the RNG daemon
+#
+# Since: 1.3
+##
+{ 'struct': 'RngEgdProperties',
+  'base': 'RngProperties',
+  'data': { 'chardev': 'str' } }
+
+##
+# @RngRandomProperties:
+#
+# Properties for rng-random objects.
+#
+# @filename: the filename of the device on the host to obtain entropy from
+#            (default: "/dev/urandom")
+#
+# Since: 1.3
+##
+{ 'struct': 'RngRandomProperties',
+  'base': 'RngProperties',
+  'data': { '*filename': 'str' } }
+
 ##
 # @ObjectType:
 #
@@ -402,7 +448,10 @@
     'memory-backend-file',
     { 'name': 'memory-backend-memfd',
       'if': 'defined(CONFIG_LINUX)' },
-    'memory-backend-ram'
+    'memory-backend-ram',
+    'rng-builtin',
+    'rng-egd',
+    'rng-random'
   ] }
 
 ##
@@ -434,7 +483,10 @@
       'memory-backend-file':        'MemoryBackendFileProperties',
       'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
                                       'if': 'defined(CONFIG_LINUX)' },
-      'memory-backend-ram':         'MemoryBackendProperties'
+      'memory-backend-ram':         'MemoryBackendProperties',
+      'rng-builtin':                'RngProperties',
+      'rng-egd':                    'RngEgdProperties',
+      'rng-random':                 'RngRandomProperties'
   } }
 
 ##
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index e6c2ba2d4d..3ce4fe7581 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -166,6 +166,15 @@ Using ``-M kernel-irqchip=off`` with x86 machine types that include a local
 APIC is deprecated.  The ``split`` setting is supported, as is using
 ``-M kernel-irqchip=off`` with the ISA PC machine type.
 
+``opened`` property of ``rng-*`` objects (since 6.0.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The only effect of specifying ``opened=on`` in the command line or QMP
+``object-add`` is that the device is opened immediately, possibly before all
+other options have been processed.  This will either have no effect (if
+``opened`` was the last option) or cause errors.  The property is therefore
+useless and should not be specified.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
-- 
2.29.2


