Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1AA323F3D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 15:48:29 +0100 (CET)
Received: from localhost ([::1]:60016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvSm-0003uK-5j
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 09:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvPq-0001V4-Pa
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:45:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvPl-0003Af-QP
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:45:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614177921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=teIP6UK7tb3CgBR43k6ucAI+H8cZsuyVHJp2kTC8T0U=;
 b=OtS9aTLVxj4oBmpGip0sxRI1IxB76FNyw2w1IOoN/Hkbrwr5dfKA1JoPSS8A0AvKEjU8GL
 +DolfHGQy2kZNBzzYMPWEmmR9hzDobJtjF5m9kWWsZudj/aa4LFYC2s7tL6pTwUvY1HZeh
 PsshiMwzqJuaedTqKtJqxn7N9TERNtY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-d3z_aVmVP0aaTlvidWChMw-1; Wed, 24 Feb 2021 09:45:19 -0500
X-MC-Unique: d3z_aVmVP0aaTlvidWChMw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F6FA18E74D4;
 Wed, 24 Feb 2021 13:53:21 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82D2A5D6D3;
 Wed, 24 Feb 2021 13:53:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/31] qapi/qom: Add ObjectOptions for iothread
Date: Wed, 24 Feb 2021 14:52:27 +0100
Message-Id: <20210224135255.253837-4-kwolf@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
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

Add an ObjectOptions union that will eventually describe the options of
all user creatable object types. As unions can't exist without any
branches, also add the first object type.

This adds a QAPI schema for the properties of the iothread object.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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


