Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911702C842E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:35:00 +0100 (CET)
Received: from localhost ([::1]:56904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiOR-0000SB-HE
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiGd-0000tG-U8
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:26:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiGa-0002Yk-IV
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606739210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NqKKvsugwS8xqoy4hEBm3RUjFJokfgLO4Tbgy6+WFcs=;
 b=aw4HUBgiFea2m5tUPQQRrQB5sR5/+i+G4/pjijcyisIrsoE+EUnw5U0LsfFR0I6TqCf8XZ
 3feIVD8HfkQncn+dp3TAyVdtQT06jnnJqZVFzJZXY+3b22EBJwBv94CyjCPpRqOoIWnKi/
 cWJVYoimfNNeu9YkxQUbewRfkK3D5XA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-ZMazsIz9PKuTs-qH-HA25Q-1; Mon, 30 Nov 2020 07:26:48 -0500
X-MC-Unique: ZMazsIz9PKuTs-qH-HA25Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3CBC9CC09;
 Mon, 30 Nov 2020 12:26:47 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3903E19C71;
 Mon, 30 Nov 2020 12:26:30 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/18] qapi/qom: Add ObjectOptions for throttle-group
Date: Mon, 30 Nov 2020 13:25:27 +0100
Message-Id: <20201130122538.27674-8-kwolf@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This adds a QAPI schema for the properties of the throttle-group object.

The x-* properties are not represented in the schema. Their only purpose
is to make the nested options in 'limits' available for a command line
parser that doesn't support structs. Any parser that will use the QAPI
schema will supports structs, though, so they will not be needed in the
schema.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-core.json | 12 ++++++++++++
 qapi/qom.json        |  7 +++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 04ad80bc1e..d7a4cdc11c 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2478,6 +2478,18 @@
             '*bps-write-max' : 'int', '*bps-write-max-length' : 'int',
             '*iops-size' : 'int' } }
 
+##
+# @ThrottleGroupProperties:
+#
+# Properties for throttle-group objects.
+#
+# @limits: limits to apply for this throttle group
+#
+# Since: 6.0
+##
+{ 'struct': 'ThrottleGroupProperties',
+  'data': { '*limits': 'ThrottleLimits' } }
+
 ##
 # @block-stream:
 #
diff --git a/qapi/qom.json b/qapi/qom.json
index f3d1a55cb8..8c9785d2dd 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -5,6 +5,7 @@
 # See the COPYING file in the top-level directory.
 
 { 'include': 'authz.json' }
+{ 'include': 'block-core.json' }
 { 'include': 'common.json' }
 
 ##
@@ -435,7 +436,8 @@
     'memory-backend-ram',
     'rng-builtin',
     'rng-egd',
-    'rng-random'
+    'rng-random',
+    'throttle-group'
   ] }
 
 ##
@@ -468,7 +470,8 @@
       'memory-backend-ram':         'MemoryBackendProperties',
       'rng-builtin':                'RngProperties',
       'rng-egd':                    'RngEgdProperties',
-      'rng-random':                 'RngRandomProperties'
+      'rng-random':                 'RngRandomProperties',
+      'throttle-group':             'ThrottleGroupProperties'
   } }
 
 ##
-- 
2.28.0


