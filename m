Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C316B50A1FD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:19:12 +0200 (CEST)
Received: from localhost ([::1]:33534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXeJ-0007vG-0W
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXE4-0005So-TA
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:52:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXE3-0006NJ-C3
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m3B8+ynsC+uMs0q+WDo/B4eZyQLcdtVZ2JrMoayAc/s=;
 b=MtFtV1LUG9bEIkT7YPHluM58egjFRSUJzlsd8f08evEWJmI6mPWS2x/oj70hF8drT3eM/t
 mzsy8LBTEqUF3tTWh4BpHyfVmxrEPzcafezg4jpucbUUKrTJpUgnXLkNuGzy5gy2LX6FsU
 S+JNr81fA5Yl11FJowZuOoxFAN7xhyA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-XNaE7ToxPiyOVWr_ZDCzwg-1; Thu, 21 Apr 2022 09:51:56 -0400
X-MC-Unique: XNaE7ToxPiyOVWr_ZDCzwg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94203280534C;
 Thu, 21 Apr 2022 13:51:56 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC1364087D85;
 Thu, 21 Apr 2022 13:51:55 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 23/30] qtest: simplify socket_send()
Date: Thu, 21 Apr 2022 17:49:33 +0400
Message-Id: <20220421134940.2887768-24-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Reuse qemu_write_full().

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220420132624.2439741-33-marcandre.lureau@redhat.com>
---
 tests/qtest/libqtest.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 7b5890dcc487..2b9bdb947d6f 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -414,21 +414,9 @@ void qtest_quit(QTestState *s)
 
 static void socket_send(int fd, const char *buf, size_t size)
 {
-    size_t offset;
-
-    offset = 0;
-    while (offset < size) {
-        ssize_t len;
+    size_t res = qemu_write_full(fd, buf, size);
 
-        len = write(fd, buf + offset, size - offset);
-        if (len == -1 && errno == EINTR) {
-            continue;
-        }
-
-        g_assert_cmpint(len, >, 0);
-
-        offset += len;
-    }
+    assert(res == size);
 }
 
 static void qtest_client_socket_send(QTestState *s, const char *buf)
-- 
2.36.0


