Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01EC20CE34
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 13:26:13 +0200 (CEST)
Received: from localhost ([::1]:43544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jprvQ-0005EH-V4
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 07:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jprt7-0001g9-KW
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 07:23:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23884
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jprt6-0002J0-3l
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 07:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593429827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UwQAVbpdFQI9b+XgK7I1zmB6hXm3BXJdj4GzBydNeng=;
 b=ZaBzCLiHmWt3wKAuHMKUjaS5jSdY83N1NVh/VotTHzbiSPkF9z93nWjtX1xuFsaFZ2r5Bd
 thWGzj3XpW2HZvsisK71maCKrFakZwx2PAe41a7UaH8/S1aapkOC9Spn5NUMYQi9Ym2fhf
 IBOPEvtZDzDRQVT6KqSEIY0RZHECRDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-AKDAIkf5PoW3N27tsy5mpQ-1; Mon, 29 Jun 2020 07:23:45 -0400
X-MC-Unique: AKDAIkf5PoW3N27tsy5mpQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07FEC3640A;
 Mon, 29 Jun 2020 11:23:45 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 571325D9DA;
 Mon, 29 Jun 2020 11:23:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com
Subject: [PATCH v4 2/3] tests/qmp-cmd-test: Add qmp/object-add-duplicate-id
Date: Mon, 29 Jun 2020 13:23:28 +0200
Message-Id: <20200629112329.27611-3-eric.auger@redhat.com>
In-Reply-To: <20200629112329.27611-1-eric.auger@redhat.com>
References: <20200629112329.27611-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:37:37
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
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qtest/qmp-cmd-test.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 9f5228cd99..ceb3296691 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -213,6 +213,23 @@ static void test_object_add_without_props(void)
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
+    g_assert_nonnull(resp);
+    qmp_assert_error_class(resp, "GenericError");
+    qtest_quit(qts);
+}
+
 int main(int argc, char *argv[])
 {
     QmpSchema schema;
@@ -225,6 +242,8 @@ int main(int argc, char *argv[])
 
     qtest_add_func("qmp/object-add-without-props",
                    test_object_add_without_props);
+    qtest_add_func("qmp/object-add-duplicate-id",
+                   test_object_add_with_duplicate_id);
     /* TODO: add coverage of generic object-add failure modes */
 
     ret = g_test_run();
-- 
2.20.1


