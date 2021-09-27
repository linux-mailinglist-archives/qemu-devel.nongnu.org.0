Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725494194F3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:19:08 +0200 (CEST)
Received: from localhost ([::1]:43856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUqXD-0004K9-AS
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLQ-0003CM-T0
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:06:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLO-0003gf-0x
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632748013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=apm8qE1ZnC1jfJixNsUjrXUi/YcW2qK5M+S67X2Nsqo=;
 b=QNPVYKMzm97UqcttyBks2884ibMbb4rD+rh2vnGvtHWZmjlHjMxM/UfRCxj7BSZnR96XMA
 OrY1n8/K3tCy5qI5X52wnAplpr8RRQ4eYd4AyG+S9A3cxgOiPJxcDuLNJWqF9mUw738FEv
 znhx1Sdx2iwIiauI1yDWtcAoG5qpkqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-u1TXRbUvMbWEoed94vqxqQ-1; Mon, 27 Sep 2021 09:06:51 -0400
X-MC-Unique: u1TXRbUvMbWEoed94vqxqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEABB83DBCC;
 Mon, 27 Sep 2021 13:06:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9011026E40;
 Mon, 27 Sep 2021 13:06:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 942891138461; Mon, 27 Sep 2021 15:06:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 09/25] qapi: Convert simple union ImageInfoSpecific to flat
 one
Date: Mon, 27 Sep 2021 15:06:31 +0200
Message-Id: <20210927130647.1271533-10-armbru@redhat.com>
In-Reply-To: <20210927130647.1271533-1-armbru@redhat.com>
References: <20210927130647.1271533-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simple unions predate flat unions.  Having both complicates the QAPI
schema language and the QAPI generator.  We haven't been using simple
unions in new code for a long time, because they are less flexible and
somewhat awkward on the wire.

To prepare for their removal, convert simple union ImageInfoSpecific
to an equivalent flat one.  Adds some boilerplate to the schema, which
is a bit ugly, but a lot easier to maintain than the simple union
feature.

Implicit enum ImageInfoSpecificKind becomes explicit.  It duplicates
part of enum BlockdevDriver.  We could reuse BlockdevDriver instead.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Acked-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20210917143134.412106-10-armbru@redhat.com>
---
 qapi/block-core.json | 59 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 52 insertions(+), 7 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index c8ce1d9d5d..623a4f4a3f 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -139,6 +139,52 @@
       '*encryption-format': 'RbdImageEncryptionFormat'
   } }
 
+##
+# @ImageInfoSpecificKind:
+#
+# @luks: Since 2.7
+# @rbd: Since 6.1
+#
+# Since: 1.7
+##
+{ 'enum': 'ImageInfoSpecificKind',
+  'data': [ 'qcow2', 'vmdk', 'luks', 'rbd' ] }
+
+##
+# @ImageInfoSpecificQCow2Wrapper:
+#
+# Since: 1.7
+##
+{ 'struct': 'ImageInfoSpecificQCow2Wrapper',
+  'data': { 'data': 'ImageInfoSpecificQCow2' } }
+
+##
+# @ImageInfoSpecificVmdkWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'ImageInfoSpecificVmdkWrapper',
+  'data': { 'data': 'ImageInfoSpecificVmdk' } }
+
+##
+# @ImageInfoSpecificLUKSWrapper:
+#
+# Since: 2.7
+##
+{ 'struct': 'ImageInfoSpecificLUKSWrapper',
+  'data': { 'data': 'QCryptoBlockInfoLUKS' } }
+# If we need to add block driver specific parameters for
+# LUKS in future, then we'll subclass QCryptoBlockInfoLUKS
+# to define a ImageInfoSpecificLUKS
+
+##
+# @ImageInfoSpecificRbdWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'ImageInfoSpecificRbdWrapper',
+  'data': { 'data': 'ImageInfoSpecificRbd' } }
+
 ##
 # @ImageInfoSpecific:
 #
@@ -147,14 +193,13 @@
 # Since: 1.7
 ##
 { 'union': 'ImageInfoSpecific',
+  'base': { 'type': 'ImageInfoSpecificKind' },
+  'discriminator': 'type',
   'data': {
-      'qcow2': 'ImageInfoSpecificQCow2',
-      'vmdk': 'ImageInfoSpecificVmdk',
-      # If we need to add block driver specific parameters for
-      # LUKS in future, then we'll subclass QCryptoBlockInfoLUKS
-      # to define a ImageInfoSpecificLUKS
-      'luks': 'QCryptoBlockInfoLUKS',
-      'rbd': 'ImageInfoSpecificRbd'
+      'qcow2': 'ImageInfoSpecificQCow2Wrapper',
+      'vmdk': 'ImageInfoSpecificVmdkWrapper',
+      'luks': 'ImageInfoSpecificLUKSWrapper',
+      'rbd': 'ImageInfoSpecificRbdWrapper'
   } }
 
 ##
-- 
2.31.1


