Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0A9408E86
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:35:04 +0200 (CEST)
Received: from localhost ([::1]:51230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPm6x-00051v-4n
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFa-0000QU-2d
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFU-0000iX-VB
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631536784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uq705tZczjhon/0fpzP0cXD1902/1rvfuivOrwz0SUk=;
 b=WrGqUd+hyK9ubRTfC7jD77E3jMGB39hPHE0c8lZSbZovwYpR8InQ7bNcafvFu+kmKz3yis
 szoDtaLC01frkUFrKG5zYr4UAzs5LzIUPHFeOTieMi+LQqAcps3KZ5GZrim5qkT5xdMUr2
 NZKxqVKcQbeucTm1SwwtSzW7xyP/z/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-4CQVA0WDOxW5Vy7hHv5y3w-1; Mon, 13 Sep 2021 08:39:43 -0400
X-MC-Unique: 4CQVA0WDOxW5Vy7hHv5y3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA05A7BC
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 12:39:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12BD55D9D3;
 Mon, 13 Sep 2021 12:39:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 296561138461; Mon, 13 Sep 2021 14:39:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/22] qapi: Convert simple union ImageInfoSpecific to flat one
Date: Mon, 13 Sep 2021 14:39:19 +0200
Message-Id: <20210913123932.3306639-10-armbru@redhat.com>
In-Reply-To: <20210913123932.3306639-1-armbru@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: Kevin Wolf <kwolf@redhat.com>, jsnow@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, eblake@redhat.com,
 marcandre.lureau@redhat.com
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
---
 qapi/block-core.json | 56 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 7 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index c8ce1d9d5d..b2858b144f 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -139,6 +139,49 @@
       '*encryption-format': 'RbdImageEncryptionFormat'
   } }
 
+##
+# @ImageInfoSpecificKind:
+#
+# Since: 6.1
+##
+{ 'enum': 'ImageInfoSpecificKind',
+  'data': [ 'qcow2', 'vmdk', 'luks', 'rbd' ] }
+
+##
+# @ImageInfoSpecificQCow2Wrapper:
+#
+# Since: 6.1
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
+# Since: 6.1
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
@@ -147,14 +190,13 @@
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


