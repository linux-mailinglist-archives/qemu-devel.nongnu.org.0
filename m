Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383D82073A2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 14:44:35 +0200 (CEST)
Received: from localhost ([::1]:45508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo4lW-0005hP-7L
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 08:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jo4kJ-0004Qb-Hh
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 08:43:19 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50967
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jo4kH-0008UB-U4
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 08:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593002596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sy2E6fDFrrUa0s58uBcE20HeImA76gOFOqgx7UfR2yc=;
 b=Hr+g/3ZPaRva3Nnl3W7nCGyB8/6yeVONh09JNEbbVXOEbSF+NbA6SPn74CZvXjFStxaALQ
 tsDPGiywpG9iJMN8xMQOUgK+o24UdA28p/OVRw0NtQpXVTzOOAES6wOaOGxlbl8+Dvcvqy
 klOF/O8lr31gL6a4+wU0/pq/cGoOtms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-0gBaSDxsPyy-XyMoMNo79Q-1; Wed, 24 Jun 2020 08:43:15 -0400
X-MC-Unique: 0gBaSDxsPyy-XyMoMNo79Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9953D8015F7;
 Wed, 24 Jun 2020 12:43:14 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E77022B4AC;
 Wed, 24 Jun 2020 12:43:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com
Subject: [PATCH v2 2/2] tests/qmp-cmd-test: Add qmp/object-add-duplicate-id
Date: Wed, 24 Jun 2020 14:43:01 +0200
Message-Id: <20200624124301.7112-3-eric.auger@redhat.com>
In-Reply-To: <20200624124301.7112-1-eric.auger@redhat.com>
References: <20200624124301.7112-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 01:59:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This new test checks that attempting to create an object
with an existing ID gracefully fails.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/qmp-cmd-test.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 9f5228cd99..9510051c35 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -213,6 +213,22 @@ static void test_object_add_without_props(void)
     qtest_quit(qts);
 }
 
+static void test_object_add_with_duplicate_id(void)
+{
+    QTestState *qts;
+    QDict *resp;
+
+    qts = qtest_init(common_args);
+    resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
+                    " {'qom-type': 'memory-backend-ram', 'id': 'ram1', 'props': {'size': 4294967296 } } }");
+    g_assert_nonnull(resp);
+    g_assert(qdict_haskey(resp, "return"));
+    resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
+                    " {'qom-type': 'memory-backend-ram', 'id': 'ram1', 'props': {'size': 4294967296 } } }");
+    qmp_assert_error_class(resp, "GenericError");
+    qtest_quit(qts);
+}
+
 int main(int argc, char *argv[])
 {
     QmpSchema schema;
@@ -225,6 +241,8 @@ int main(int argc, char *argv[])
 
     qtest_add_func("qmp/object-add-without-props",
                    test_object_add_without_props);
+    qtest_add_func("qmp/object-add-duplicate-id",
+                   test_object_add_with_duplicate_id);
     /* TODO: add coverage of generic object-add failure modes */
 
     ret = g_test_run();
-- 
2.20.1


