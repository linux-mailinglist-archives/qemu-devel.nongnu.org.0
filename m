Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 487596BC6D5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:15:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pchnu-0003ii-5D; Thu, 16 Mar 2023 03:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchnq-0003gy-Ml
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchno-0004YE-7Q
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678950810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hga3dak1FpksB7KppTghhWlEjpc6iM+ozQUOoK6T4Wo=;
 b=FiGirW/TjGM+doAOpi5iARtu1IQ3jqA8xwl1pgtrbm/0aOE/rSfb/vfF2PaOg6TGMD6ewl
 HdrgF+FXiQGI5i0kRxeteKmxHE7JG793Tf1U1CuBJjHJ8KvQ/TF3yCOuGc3Qjuj91iZZkD
 BlZ/M+Os8W+oe7WCjcA8ncVzAuazf5c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-9IUMfOEoPz-geboU31xfRw-1; Thu, 16 Mar 2023 03:13:28 -0400
X-MC-Unique: 9IUMfOEoPz-geboU31xfRw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 411463813F3F;
 Thu, 16 Mar 2023 07:13:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21AAAC15BA0;
 Thu, 16 Mar 2023 07:13:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0FE2921F4F7F; Thu, 16 Mar 2023 08:13:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 eblake@redhat.com, jsnow@redhat.com
Subject: [PATCH 13/14] qapi: Fix code generated for optional conditional
 struct member
Date: Thu, 16 Mar 2023 08:13:24 +0100
Message-Id: <20230316071325.492471-14-armbru@redhat.com>
In-Reply-To: <20230316071325.492471-1-armbru@redhat.com>
References: <20230316071325.492471-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The generated member visit neglects to emit #if around a conditional
struct member's has_ variable.  For instance,
tests/qapi-schema/qapi-schema-test.json generates

    #if defined(TEST_IF_STRUCT)
    bool visit_type_TestIfStruct_members(Visitor *v, TestIfStruct *obj, Error **errp)
    {
--->	bool has_baz = !!obj->baz;

	if (!visit_type_int(v, "foo", &obj->foo, errp)) {
	    return false;
	}
    #if defined(TEST_IF_STRUCT_MEMBER)
	if (!visit_type_int(v, "bar", &obj->bar, errp)) {
	    return false;
	}
    #endif /* defined(TEST_IF_STRUCT_MEMBER) */
    #if defined(TEST_IF_STRUCT_MEMBER)
	if (visit_optional(v, "baz", &has_baz)) {
	    if (!visit_type_str(v, "baz", &obj->baz, errp)) {
		return false;
	    }
	}
    #endif /* defined(TEST_IF_STRUCT_MEMBER) */
	return true;
    }
    [...]
    #endif /* defined(TEST_IF_STRUCT) */

Won't compile when TEST_IF_STRUCT is defined and TEST_IF_STRUCT_MEMBER
isn't.

Fix that the obvious way:

    #if defined(TEST_IF_STRUCT_MEMBER)
	bool has_baz = !!obj->baz;
    #endif /* defined(TEST_IF_STRUCT_MEMBER) */

Fixes: 44ea9d9be33c (qapi: Start to elide redundant has_FOO in generated C)
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/visit.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 26a584ee4c..c56ea4d724 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -74,11 +74,13 @@ def gen_visit_object_members(name: str,
     sep = ''
     for memb in members:
         if memb.optional and not memb.need_has():
+            ret += memb.ifcond.gen_if()
             ret += mcgen('''
     bool has_%(c_name)s = !!obj->%(c_name)s;
 ''',
                          c_name=c_name(memb.name))
             sep = '\n'
+            ret += memb.ifcond.gen_endif()
     ret += sep
 
     if base:
-- 
2.39.2


