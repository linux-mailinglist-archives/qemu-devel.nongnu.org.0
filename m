Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1E46EEDE6
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 08:00:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prYAI-0006AN-2A; Wed, 26 Apr 2023 01:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA5-00065Z-M1
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA1-0002lE-WA
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682488669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ZP0gwr8BfrslPu6vxIFua5vdD1mL2kgjqf89nE5odg=;
 b=VuSoQ9BxzuFMbXNe+VDnuv7Q1mmE6qt4R7iLVyOUscs6R6C/BK1DmrjoFZYa3q5VkOrRu2
 Ds2sqBnTofMWNudBGFkHqwJZ6AbF0sOLAQN5waFdIEYMNyn39N99q5NcLFtcCfk21DsWpS
 Fjkc9sZZenPflLXFD9N+SZDmGVitlmQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-83EWB18PNIK57gEMEubsbg-1; Wed, 26 Apr 2023 01:57:47 -0400
X-MC-Unique: 83EWB18PNIK57gEMEubsbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76AC329AA39C;
 Wed, 26 Apr 2023 05:57:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55FA11121314;
 Wed, 26 Apr 2023 05:57:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4185221F9836; Wed, 26 Apr 2023 07:57:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 16/17] qapi: Improve specificity of type/member descriptions
Date: Wed, 26 Apr 2023 07:57:43 +0200
Message-Id: <20230426055744.1041930-17-armbru@redhat.com>
In-Reply-To: <20230426055744.1041930-1-armbru@redhat.com>
References: <20230426055744.1041930-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Error messages describe object members, enumeration values, features,
and variants like ROLE 'NAME', where ROLE is "member", "value",
"feature", or "branch", respectively.  When the member is defined in
another type, e.g. inherited from a base type, we add "of type
'TYPE'".  Example: test case struct-base-clash-deep reports a member
of type 'Sub' clashing with a member of its base type 'Base' as

    struct-base-clash-deep.json: In struct 'Sub':
    struct-base-clash-deep.json:10: member 'name' collides with member 'name' of type 'Base'

Members of implicitly defined types need special treatment.  We don't
want to add "of type 'TYPE'" for them, because their named are made up
and mean nothing to the user.  Instead, we describe members of an
implicitly defined base type as "base member 'NAME'", and command and
event parameters as "parameter 'NAME'".  Example: test case
union-bad-base reports member of a variant's type clashing with a
member of its implicitly defined base type as

    union-bad-base.json: In union 'TestUnion':
    union-bad-base.json:8: member 'string' of type 'TestTypeA' collides with base member 'string'

The next commit will permit unions as variant types.  "base member
'NAME' would then be ambigious: is it the union's base, or is it the
union's variant's base?  One of its test cases would report a clash
between two such bases as "base member 'type' collides with base
member 'type'".  Confusing.

Refine the special treatment: add "of TYPE" even for implicitly
defined types, but massage TYPE and ROLE so they make sense for the
user.

Message-Id: <20230420102619.348173-3-berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/schema.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 8f31f8832f..27e336577f 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -701,6 +701,7 @@ def connect_doc(self, doc):
 
     def describe(self, info):
         role = self.role
+        meta = 'type'
         defined_in = self.defined_in
         assert defined_in
 
@@ -712,13 +713,17 @@ def describe(self, info):
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
2.39.2


