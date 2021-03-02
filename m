Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B7532A8A4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:57:55 +0100 (CET)
Received: from localhost ([::1]:51542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9HO-0001JN-4J
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH9FH-00084w-HZ
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:55:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH9FE-0007Ir-Vl
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614707740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mkyA6PfUKQ6UmH8hWO5zQVnWleHEh3yaKVrpMsl/pEE=;
 b=HA77FEXDXD/0d064AeT+8LETk34GxVKXoqE9IMC9wNnGoUGDmikuE9QdFV9mSKUS8YuECp
 VCCbE7x6DGvFrDYcVHWJOHOvPs49cESA09g9vZ3oPb8pNqiJiQv8YWeVB8iNP4cE8trRny
 IVXyRRy188Y0DhqzaBuEPcgsvrkYK7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-RUfV0iDgOkm5xpSrsgrtsw-1; Tue, 02 Mar 2021 12:55:38 -0500
X-MC-Unique: RUfV0iDgOkm5xpSrsgrtsw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D46B804036;
 Tue,  2 Mar 2021 17:55:37 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-132.ams2.redhat.com
 [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70B0961F20;
 Tue,  2 Mar 2021 17:55:35 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] qapi: provide a friendly string representation of QAPI
 classes
Date: Tue,  2 Mar 2021 17:55:24 +0000
Message-Id: <20210302175524.1290840-4-berrange@redhat.com>
In-Reply-To: <20210302175524.1290840-1-berrange@redhat.com>
References: <20210302175524.1290840-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If printing a QAPI schema object for debugging we get the classname and
a hex value for the instance. With this change we instead get the
classname and the human friendly name of the QAPI type instance.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 scripts/qapi/schema.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index ff16578f6d..800bc5994b 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -46,6 +46,9 @@ def __init__(self, name: str, info, doc, ifcond=None, features=None):
         self.features = features or []
         self._checked = False
 
+    def __repr__(self):
+        return "%s<%s>" % (type(self).__name__, self.name)
+
     def c_name(self):
         return c_name(self.name)
 
-- 
2.29.2


