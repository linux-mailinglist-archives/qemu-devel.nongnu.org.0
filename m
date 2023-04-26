Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A97E6EEDED
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 08:01:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prYAA-00068Q-SY; Wed, 26 Apr 2023 01:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA5-000657-7A
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA1-0002lB-TF
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682488669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=McAUM5sEvTPlGnUQIPBBdFR/Oxsek/scSFXeyPQ8Mc0=;
 b=XRz/VbJIu2JVk8lY8dhK0IZ+0+sdMf/3eNZavP8HE5BzsbPP5srnZHLg6MfZldyL59xyFL
 j5RJK0eGlaN8IvVwWnEeZ09ntYuhOvqmDOn4EvzH8iZZSfNAciRrfa4Rfa+0Ajl+9W63Km
 7r1UiEqg2hSaYVMf5/nZh1Bh6WS91yY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-TZwypoyKNP6KmEoh1F_h3A-1; Wed, 26 Apr 2023 01:57:46 -0400
X-MC-Unique: TZwypoyKNP6KmEoh1F_h3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81728858F0E;
 Wed, 26 Apr 2023 05:57:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60DF62027046;
 Wed, 26 Apr 2023 05:57:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3AB6621F9829; Wed, 26 Apr 2023 07:57:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PULL 13/17] qapi: Fix code generated for optional conditional struct
 member
Date: Wed, 26 Apr 2023 07:57:40 +0200
Message-Id: <20230426055744.1041930-14-armbru@redhat.com>
In-Reply-To: <20230426055744.1041930-1-armbru@redhat.com>
References: <20230426055744.1041930-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Message-Id: <20230316071325.492471-14-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
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


