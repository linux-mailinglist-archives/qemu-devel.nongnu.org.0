Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD0D2D61E1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:32:37 +0100 (CET)
Received: from localhost ([::1]:60918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOrs-00079p-FE
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOb8-0004y1-Py
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:15:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOaq-00015a-Ej
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607616898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d5yGaRHo8Efv0w/Etw49cvrwWeYThttFtKlRLIfXd0k=;
 b=gDNxcfaYztdv8MsNgazriLPn2nBq4uYHagIhE98fVRpFqxxjhPM71ufK0cfpP3UBs2VStS
 3uO+tmylLNBzlOdRXkn72FDEwq83/Zl5BGhpkLAwb+J7yAwHsJngkRpq6ui4/Y7n2qmwGA
 EesTF7bukLXSZ/5HYL9qEDaiNVVzTGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-QHx4zanIObexcPH5V4ofhQ-1; Thu, 10 Dec 2020 11:14:56 -0500
X-MC-Unique: QHx4zanIObexcPH5V4ofhQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C212B180A092;
 Thu, 10 Dec 2020 16:14:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9222B60C5F;
 Thu, 10 Dec 2020 16:14:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8E9E010FA0AB; Thu, 10 Dec 2020 17:14:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/10] test-visitor-serialization: Drop insufficient precision
 workaround
Date: Thu, 10 Dec 2020 17:14:51 +0100
Message-Id: <20201210161452.2813491-10-armbru@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/test-visitor-serialization.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/tests/test-visitor-serialization.c b/tests/test-visitor-serialization.c
index 1c5a8b94ea..19b72571bb 100644
--- a/tests/test-visitor-serialization.c
+++ b/tests/test-visitor-serialization.c
@@ -311,17 +311,7 @@ static void test_primitives(gconstpointer opaque)
         g_assert_cmpstr(pt->value.string, ==, pt_copy->value.string);
         g_free((char *)pt_copy->value.string);
     } else if (pt->type == PTYPE_NUMBER) {
-        GString *double_expected = g_string_new("");
-        GString *double_actual = g_string_new("");
-        /* we serialize with %f for our reference visitors, so rather than fuzzy
-         * floating math to test "equality", just compare the formatted values
-         */
-        g_string_printf(double_expected, "%.6f", pt->value.number);
-        g_string_printf(double_actual, "%.6f", pt_copy->value.number);
-        g_assert_cmpstr(double_actual->str, ==, double_expected->str);
-
-        g_string_free(double_expected, true);
-        g_string_free(double_actual, true);
+        g_assert_cmpfloat(pt->value.number, ==, pt_copy->value.number);
     } else if (pt->type == PTYPE_BOOLEAN) {
         g_assert_cmpint(!!pt->value.max, ==, !!pt->value.max);
     } else {
@@ -790,10 +780,6 @@ static PrimitiveType pt_values[] = {
         .value.boolean = 0,
     },
     /* number tests (double) */
-    /* note: we format these to %.6f before comparing, since that's how
-     * we serialize them and it doesn't make sense to check precision
-     * beyond that.
-     */
     {
         .description = "number_sanity1",
         .type = PTYPE_NUMBER,
@@ -802,7 +788,7 @@ static PrimitiveType pt_values[] = {
     {
         .description = "number_sanity2",
         .type = PTYPE_NUMBER,
-        .value.number = 3.14159265,
+        .value.number = 3.141593,
     },
     {
         .description = "number_min",
-- 
2.26.2


