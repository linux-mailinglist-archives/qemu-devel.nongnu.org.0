Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD0E33141D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:06:45 +0100 (CET)
Received: from localhost ([::1]:48848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJLA-0005m3-Fc
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJA9-00033O-Sa
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:55:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJA7-0007vd-5H
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SEjAru+LWL/KmRb7csSucQINEMDf7VfKnetd0CGWEx4=;
 b=h1YOw4BpwDCLyhZEHZtrmw21ahEcKwGPSAywApNi7bOxV0GCssvpKxF6bAWVv34HvP0I63
 tiNYmnO4revcDdaXI0wM89MYcWES5mFEhSKLlv1WliwnW3h2dTmpCSC5KpLSGV73JRZ4OW
 yMFbhuqmIFrUOTCU/dgXF/6414CtnoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-LfRk7GesOf-WMRL24Pg_ng-1; Mon, 08 Mar 2021 11:55:16 -0500
X-MC-Unique: LfRk7GesOf-WMRL24Pg_ng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0EA88189D2;
 Mon,  8 Mar 2021 16:55:14 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F17105D9E3;
 Mon,  8 Mar 2021 16:55:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/30] qapi/qom: Add ObjectOptions for iothread
Date: Mon,  8 Mar 2021 17:54:12 +0100
Message-Id: <20210308165440.386489-3-kwolf@redhat.com>
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
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an ObjectOptions union that will eventually describe the options of
all user creatable object types. As unions can't exist without any
branches, also add the first object type.

This adds a QAPI schema for the properties of the iothread object.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/qom.json | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index 96c91c1faf..bf2ecb34be 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -202,6 +202,59 @@
   'returns': [ 'ObjectPropertyInfo' ],
   'allow-preconfig': true }
 
+##
+# @IothreadProperties:
+#
+# Properties for iothread objects.
+#
+# @poll-max-ns: the maximum number of nanoseconds to busy wait for events.
+#               0 means polling is disabled (default: 32768 on POSIX hosts,
+#               0 otherwise)
+#
+# @poll-grow: the multiplier used to increase the polling time when the
+#             algorithm detects it is missing events due to not polling long
+#             enough. 0 selects a default behaviour (default: 0)
+#
+# @poll-shrink: the divisor used to decrease the polling time when the
+#               algorithm detects it is spending too long polling without
+#               encountering events. 0 selects a default behaviour (default: 0)
+#
+# Since: 2.0
+##
+{ 'struct': 'IothreadProperties',
+  'data': { '*poll-max-ns': 'int',
+            '*poll-grow': 'int',
+            '*poll-shrink': 'int' } }
+
+##
+# @ObjectType:
+#
+# Since: 6.0
+##
+{ 'enum': 'ObjectType',
+  'data': [
+    'iothread'
+  ] }
+
+##
+# @ObjectOptions:
+#
+# Describes the options of a user creatable QOM object.
+#
+# @qom-type: the class name for the object to be created
+#
+# @id: the name of the new object
+#
+# Since: 6.0
+##
+{ 'union': 'ObjectOptions',
+  'base': { 'qom-type': 'ObjectType',
+            'id': 'str' },
+  'discriminator': 'qom-type',
+  'data': {
+      'iothread':                   'IothreadProperties'
+  } }
+
 ##
 # @object-add:
 #
-- 
2.29.2


