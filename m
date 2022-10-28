Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC056112AB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:27:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPN5-0004HE-OY; Fri, 28 Oct 2022 09:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPL3-0001MY-Qh
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:24:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKw-0005Lp-3q
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TmFZSWiqIQcDRt9hXfNBkgO0Ehe9m4FBkaFZ30je6xw=;
 b=F2XxdZh4xOvgR/hJIaPrKhWv8j9WkaLOB95bgqw5GbF36TgiH6fT6TtG4IWgTaehXBSe9U
 dZd1Y9is4RlEs3/5H4Llch8UfVTSkkM1kxfXoVuV7EIIlx7d36wUfZkTiAhxNq4j1eAs8O
 8Pft63nrXI972CertZ8aycPagiq93cU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-CvCa9NqvMo2wbhSKYFrx_Q-1; Fri, 28 Oct 2022 09:23:42 -0400
X-MC-Unique: CvCa9NqvMo2wbhSKYFrx_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34EC33C0F251;
 Fri, 28 Oct 2022 13:23:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18BD11121319;
 Fri, 28 Oct 2022 13:23:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 21/21] tests/qtest: libqtest: Correct the timeout unit of
 blocking receive calls for win32
Date: Fri, 28 Oct 2022 15:23:04 +0200
Message-Id: <20221028132304.829103-22-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

Some qtest cases don't get response from the QEMU executable under
test in time on Windows. It turns out that the socket receive call
got timeout before it receive the complete response.

The timeout value is supposed to be set to 50 seconds via the
setsockopt() call, but there is a difference among platforms.
The timeout unit of blocking receive calls is measured in
seconds on non-Windows platforms but milliseconds on Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20221028045736.679903-10-bin.meng@windriver.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqtest.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index e1e2d39a6e..2fbc3b88f3 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -36,13 +36,14 @@
 #include "qapi/qmp/qstring.h"
 
 #define MAX_IRQ 256
-#define SOCKET_TIMEOUT 50
 
 #ifndef _WIN32
+# define SOCKET_TIMEOUT 50
 # define CMD_EXEC   "exec "
 # define DEV_STDERR "/dev/fd/2"
 # define DEV_NULL   "/dev/null"
 #else
+# define SOCKET_TIMEOUT 50000
 # define CMD_EXEC   ""
 # define DEV_STDERR "2"
 # define DEV_NULL   "nul"
@@ -106,8 +107,16 @@ static int socket_accept(int sock)
     struct sockaddr_un addr;
     socklen_t addrlen;
     int ret;
+    /*
+     * timeout unit of blocking receive calls is different among platfoms.
+     * It's in seconds on non-Windows platforms but milliseconds on Windows.
+     */
+#ifndef _WIN32
     struct timeval timeout = { .tv_sec = SOCKET_TIMEOUT,
                                .tv_usec = 0 };
+#else
+    DWORD timeout = SOCKET_TIMEOUT;
+#endif
 
     if (setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO,
                    (void *)&timeout, sizeof(timeout))) {
-- 
2.31.1


