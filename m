Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E8C408B5C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:52:42 +0200 (CEST)
Received: from localhost ([::1]:45714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlRw-0001ET-Ln
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFT-0000Em-Ei
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFP-0000g8-MG
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631536782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHLYav7WarZ13M6UwpgoWPQQS93llwmNuhFuc94ryMA=;
 b=Lcu+xMW5IRNHd4nwsBkpEpm+esQb9bDoNqko+AaG6g1Nc06+G35NO/60lu0Cjgp1+Z0h1Z
 vHYEOfCkrAMGEGIk0iRbcyQUNe0bR+hqaJcKvqlAvojsxn9ISv7q6glOvuEIMrFtdPkgDi
 3L2rV2cycQfuigp3/pEXQJmM6QqbmeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-vrZaKja9NeyY73FerrmZ2A-1; Mon, 13 Sep 2021 08:39:41 -0400
X-MC-Unique: vrZaKja9NeyY73FerrmZ2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E46F81084688;
 Mon, 13 Sep 2021 12:39:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0261369A;
 Mon, 13 Sep 2021 12:39:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1F25A113853B; Mon, 13 Sep 2021 14:39:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/22] qapi: Convert simple union MemoryDeviceInfo to flat one
Date: Mon, 13 Sep 2021 14:39:16 +0200
Message-Id: <20210913123932.3306639-7-armbru@redhat.com>
In-Reply-To: <20210913123932.3306639-1-armbru@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: jsnow@redhat.com, eblake@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simple unions predate flat unions.  Having both complicates the QAPI
schema language and the QAPI generator.  We haven't been using simple
unions in new code for a long time, because they are less flexible and
somewhat awkward on the wire.

To prepare for their removal, convert simple union MemoryDeviceInfo to
an equivalent flat one.  Adds some boilerplate to the schema, which is
a bit ugly, but a lot easier to maintain than the simple union
feature.

Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/machine.json | 42 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 157712f006..b3bdcccb72 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1194,6 +1194,38 @@
           }
 }
 
+##
+# @MemoryDeviceInfoKind:
+#
+# Since: 6.1
+##
+{ 'enum': 'MemoryDeviceInfoKind',
+  'data': [ 'dimm', 'nvdimm', 'virtio-pmem', 'virtio-mem' ] }
+
+##
+# @PCDIMMDeviceInfoWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'PCDIMMDeviceInfoWrapper',
+  'data': { 'data': 'PCDIMMDeviceInfo' } }
+
+##
+# @VirtioPMEMDeviceInfoWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'VirtioPMEMDeviceInfoWrapper',
+  'data': { 'data': 'VirtioPMEMDeviceInfo' } }
+
+##
+# @VirtioMEMDeviceInfoWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'VirtioMEMDeviceInfoWrapper',
+  'data': { 'data': 'VirtioMEMDeviceInfo' } }
+
 ##
 # @MemoryDeviceInfo:
 #
@@ -1205,10 +1237,12 @@
 # Since: 2.1
 ##
 { 'union': 'MemoryDeviceInfo',
-  'data': { 'dimm': 'PCDIMMDeviceInfo',
-            'nvdimm': 'PCDIMMDeviceInfo',
-            'virtio-pmem': 'VirtioPMEMDeviceInfo',
-            'virtio-mem': 'VirtioMEMDeviceInfo'
+  'base': { 'type': 'MemoryDeviceInfoKind' },
+  'discriminator': 'type',
+  'data': { 'dimm': 'PCDIMMDeviceInfoWrapper',
+            'nvdimm': 'PCDIMMDeviceInfoWrapper',
+            'virtio-pmem': 'VirtioPMEMDeviceInfoWrapper',
+            'virtio-mem': 'VirtioMEMDeviceInfoWrapper'
           }
 }
 
-- 
2.31.1


