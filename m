Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8228A3A242A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:00:12 +0200 (CEST)
Received: from localhost ([::1]:48746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrDjf-0004W0-GF
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDiA-0002CK-AO
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:58:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDi8-0001PU-Mm
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623304716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gF6+0SztsY4QwUwrEmME1bGc0f4ssDoBylC20Xy4lT4=;
 b=Cka1spV+theIoWVZ/nnRJMVddhDTocKYz3t1Sut8CmJgwfOKizNgljccPdMOkkO9SPCtxn
 OLnUfDWTbZEIsSa3SFjCkxMiZuSP5pE1gM8Jir75LVHIrQVUJKns2hnB2FfmquYwpv1Y2W
 of1mZsYIqWddSL/5Zop+XR11AEduDnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-X5jTkqYxMveB2D7SuurP-Q-1; Thu, 10 Jun 2021 01:58:32 -0400
X-MC-Unique: X5jTkqYxMveB2D7SuurP-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D27E100C668;
 Thu, 10 Jun 2021 05:58:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 328B35D9E2;
 Thu, 10 Jun 2021 05:58:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 55BAD1800937; Thu, 10 Jun 2021 07:57:55 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/18] qapi: add ModuleInfo schema
Date: Thu, 10 Jun 2021 07:57:39 +0200
Message-Id: <20210610055755.538119-3-kraxel@redhat.com>
In-Reply-To: <20210610055755.538119-1-kraxel@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add QAPI schema for the module info database.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qapi/meson.build      |  1 +
 qapi/modules.json     | 36 ++++++++++++++++++++++++++++++++++++
 qapi/qapi-schema.json |  1 +
 3 files changed, 38 insertions(+)
 create mode 100644 qapi/modules.json

diff --git a/qapi/meson.build b/qapi/meson.build
index 376f4ceafe74..596aa5d71168 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -36,6 +36,7 @@ qapi_all_modules = [
   'migration',
   'misc',
   'misc-target',
+  'modules',
   'net',
   'pragma',
   'qom',
diff --git a/qapi/modules.json b/qapi/modules.json
new file mode 100644
index 000000000000..5420977d8765
--- /dev/null
+++ b/qapi/modules.json
@@ -0,0 +1,36 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+
+##
+# @ModuleInfo:
+#
+# qemu module metadata
+#
+# @name: module name
+#
+# @objs: list of qom objects implemented by the module.
+#
+# @deps: list of other modules this module depends on.
+#
+# @arch: module architecture.
+#
+# @opts: qemu opts implemented by module.
+#
+# Since: 6.1
+##
+{ 'struct': 'ModuleInfo',
+  'data': { 'name'  : 'str',
+            '*objs' : ['str'],
+            '*deps' : ['str'],
+            '*arch' : 'str',
+            '*opts' : 'str'}}
+
+##
+# @Modules:
+#
+# qemu module list
+#
+# Since: 6.1
+##
+{ 'struct': 'Modules',
+  'data': { 'list' : ['ModuleInfo']}}
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b9744e69..5baa511c2ff5 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -93,3 +93,4 @@
 { 'include': 'audio.json' }
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
+{ 'include': 'modules.json' }
-- 
2.31.1


