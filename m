Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9F96E9023
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:27:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRUo-0008Lo-0R; Thu, 20 Apr 2023 06:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppRUk-0008Jp-HZ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:26:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppRUi-00046e-2p
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:26:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681986387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TmgFt0KlWbJEaFsZiFBWOrAX9ldU5Rh1wE0MyAsLQOI=;
 b=Mcu69mT3lK9a9vY/4akEuvrsVPssNFQDVU6LWkDRN/hH7bYvsaZKPJPJ6BgSfftnuPVblT
 if3Zd7Z2k/CewjfgKgcQHLWWLRDvjoie+k/09QuM3bKD0YfdZKJgmNn3RivVuze24CPRL/
 R79zsTO6yW/0Z255tne0C73T5GqtbaU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-NyoxslOnOvqKy-CgScaH3A-1; Thu, 20 Apr 2023 06:26:24 -0400
X-MC-Unique: NyoxslOnOvqKy-CgScaH3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC43F101A531;
 Thu, 20 Apr 2023 10:26:23 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.42.28.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3F752166B33;
 Thu, 20 Apr 2023 10:26:22 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Het Gala <het.gala@nutanix.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 2/3] qapi: improve specificity of type/member descriptions
Date: Thu, 20 Apr 2023 11:26:18 +0100
Message-Id: <20230420102619.348173-3-berrange@redhat.com>
In-Reply-To: <20230420102619.348173-1-berrange@redhat.com>
References: <20230420102619.348173-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When describing member types always include the context of the
containing type. Although this is often redundant, in some cases
it will help to reduce ambiguity.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 scripts/qapi/schema.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 207e4d71f3..da04b97ded 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -697,6 +697,7 @@ def connect_doc(self, doc):
 
     def describe(self, info):
         role = self.role
+        meta = 'type'
         defined_in = self.defined_in
         assert defined_in
 
@@ -708,13 +709,17 @@ def describe(self, info):
                 # Implicit type created for a command's dict 'data'
                 assert role == 'member'
                 role = 'parameter'
+                meta = 'command'
+                defined_in = defined_in[:-4]
             elif defined_in.endswith('-base'):
                 # Implicit type created for a union's dict 'base'
                 role = 'base ' + role
+                defined_in = defined_in[:-5]
             else:
                 assert False
-        elif defined_in != info.defn_name:
-            return "%s '%s' of type '%s'" % (role, self.name, defined_in)
+
+        if defined_in != info.defn_name:
+            return "%s '%s' of %s '%s'" % (role, self.name, meta, defined_in)
         return "%s '%s'" % (role, self.name)
 
 
-- 
2.40.0


