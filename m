Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5C82D61B6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:25:41 +0100 (CET)
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOlA-0002rF-0e
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOb7-0004wS-CW
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:15:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOaq-00015W-9t
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:15:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607616898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5kvxsjmxdPlNQ0G01lVznn3FclXEGWV9MQ+CnN9xZA4=;
 b=V2RQuWYlnwIyuueRZBAENRhkNnDy8bl+KXwZngvJm7qWggd2o8X7TodHPbiYlb7UVx7Hzr
 GOaNRc1g0r2qi2Eh/pCMF1xUZ7tbMorydIoxgL8Bh1ZlOdEV8+HChz210IK/GiCPlBA2ud
 Fpqar+Z1EwuxWSbjakXbMbpcWMdTi2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-Lh2H0NwcOre8a1YIDCCDxQ-1; Thu, 10 Dec 2020 11:14:56 -0500
X-MC-Unique: Lh2H0NwcOre8a1YIDCCDxQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0A40802B4A;
 Thu, 10 Dec 2020 16:14:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 913BC60C43;
 Thu, 10 Dec 2020 16:14:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8B82310FA0AA; Thu, 10 Dec 2020 17:14:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/10] string-output-visitor: Fix to use sufficient precision
Date: Thu, 10 Dec 2020 17:14:50 +0100
Message-Id: <20201210161452.2813491-9-armbru@redhat.com>
In-Reply-To: <20201210161452.2813491-1-armbru@redhat.com>
References: <20201210161452.2813491-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The string output visitor should serialize numbers so that the string
input visitor deserializes them back to the same number.  It fails to
do so.

print_type_number() uses format %f.  This is prone to nasty rounding
errors.  For instance, numbers between 0 and 0.0000005 get flushed to
zero.

We currently use this visitor only for HMP info migrate, info network,
info qtree, and info memdev.  No double values occur there as far as I
can tell.

Fix anyway by formatting with %.17g.  17 decimal digits always suffice
for IEEE double.

See also recent commit "qobject: Fix qnum_to_string() to use
sufficient precision".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/string-output-visitor.c       | 2 +-
 tests/test-string-output-visitor.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/string-output-visitor.c b/qapi/string-output-visitor.c
index b74aa4d44c..5506c933de 100644
--- a/qapi/string-output-visitor.c
+++ b/qapi/string-output-visitor.c
@@ -258,7 +258,7 @@ static bool print_type_number(Visitor *v, const char *name, double *obj,
                               Error **errp)
 {
     StringOutputVisitor *sov = to_sov(v);
-    string_output_set(sov, g_strdup_printf("%f", *obj));
+    string_output_set(sov, g_strdup_printf("%.17g", *obj));
     return true;
 }
 
diff --git a/tests/test-string-output-visitor.c b/tests/test-string-output-visitor.c
index cec20848ea..0dae04b960 100644
--- a/tests/test-string-output-visitor.c
+++ b/tests/test-string-output-visitor.c
@@ -136,7 +136,7 @@ static void test_visitor_out_number(TestOutputVisitorData *data,
     visit_type_number(data->ov, NULL, &value, &error_abort);
 
     str = visitor_get(data);
-    g_assert_cmpstr(str, ==, "3.141593");
+    g_assert_cmpstr(str, ==, "3.1415926535897931");
 }
 
 static void test_visitor_out_string(TestOutputVisitorData *data,
-- 
2.26.2


