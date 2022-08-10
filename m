Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAA458EBE6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 14:20:46 +0200 (CEST)
Received: from localhost ([::1]:36656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLkhY-00033m-NP
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 08:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLkcY-00083h-5H
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:15:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLkcQ-0000bM-7V
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:15:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660133721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kyKowcGBl3oLP1HJlsQ1dss7fCPJLqogLlqFaLGgDMg=;
 b=fylRVWixucTerhAK/aKbibYqIYp1qV30NU8ca09UpHI0LfUs8lz2H/NdLmeTFY+ROEHY85
 XId2Mfm7NlYpJjCmGTjtvpTNrcuRgxyLqdmHARI0sK0p/3AsvA8VglcWqgSebxf8aAVtSf
 +2AA5ONLjuekIhm31qo2PwCe04Xpkko=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-pFve0XSBPiWVNjbohcn2-g-1; Wed, 10 Aug 2022 08:15:18 -0400
X-MC-Unique: pFve0XSBPiWVNjbohcn2-g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3DEB1C06903;
 Wed, 10 Aug 2022 12:15:17 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BEAB492CA4;
 Wed, 10 Aug 2022 12:15:16 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH] tests/unit: fix a -Wformat-trunction warning
Date: Wed, 10 Aug 2022 16:15:13 +0400
Message-Id: <20220810121513.1356081-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

../tests/test-qobject-input-visitor.c: In function ‘test_visitor_in_list’:
../tests/test-qobject-input-visitor.c:454:49: warning: ‘%d’ directive output may be truncated writing between 1 and 10 bytes into a region of size 6 [-Wformat-truncation=]
  454 |         snprintf(string, sizeof(string), "string%d", i);
      |                                                 ^~
../tests/test-qobject-input-visitor.c:454:42: note: directive argument in the range [0, 2147483606]
  454 |         snprintf(string, sizeof(string), "string%d", i);
      |                                          ^~~~~~~~~~
../tests/test-qobject-input-visitor.c:454:9: note: ‘snprintf’ output between 8 and 17 bytes into a destination of size 12
  454 |         snprintf(string, sizeof(string), "string%d", i);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Not trying to be clever, this is called 3 times during tests,
let simply use g_strdup_printf().

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/unit/test-qobject-input-visitor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/unit/test-qobject-input-visitor.c b/tests/unit/test-qobject-input-visitor.c
index 14329dabcf..5f614afdbf 100644
--- a/tests/unit/test-qobject-input-visitor.c
+++ b/tests/unit/test-qobject-input-visitor.c
@@ -447,9 +447,8 @@ static void test_visitor_in_list(TestInputVisitorData *data,
     g_assert(head != NULL);
 
     for (i = 0, item = head; item; item = item->next, i++) {
-        char string[12];
+        g_autofree char *string = g_strdup_printf("string%d", i);
 
-        snprintf(string, sizeof(string), "string%d", i);
         g_assert_cmpstr(item->value->string, ==, string);
         g_assert_cmpint(item->value->integer, ==, 42 + i);
     }
-- 
2.37.1


