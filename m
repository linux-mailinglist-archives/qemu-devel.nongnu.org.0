Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0611835A6B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 12:27:31 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38779 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYT8j-0005Pe-RV
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 06:27:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hYT7N-0004uB-KG
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 06:26:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hYT7M-0001g1-CN
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 06:26:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54855)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hYT7L-0001bK-LU
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 06:26:03 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F15D5308338F
	for <qemu-devel@nongnu.org>; Wed,  5 Jun 2019 10:26:01 +0000 (UTC)
Received: from xz-x1.nay.redhat.com (dhcp-15-205.nay.redhat.com [10.66.15.205])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86CEA1001E73;
	Wed,  5 Jun 2019 10:25:57 +0000 (UTC)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 18:25:55 +0800
Message-Id: <20190605102555.23050-1-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 05 Jun 2019 10:26:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] tests: Add proper newlines for qmp_fd_receive
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	peterx@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It changes QTEST_LOG=1 results a bit more lovely, from:

{"return": ... }{"execute": "query-migrate"}

{"return": ... }{"execute": "query-migrate"}

Into:

{"execute": "query-migrate"}

{"return": ... }

{"execute": "query-migrate"}

{"return": ... }

CC: Thomas Huth <thuth@redhat.com>
CC: Laurent Vivier <lvivier@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/libqtest.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/libqtest.c b/tests/libqtest.c
index 546a875913..d7301d773e 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -532,6 +532,10 @@ QDict *qmp_fd_receive(int fd)
     }
     json_message_parser_destroy(&qmp.parser);
 
+    if (log) {
+        fprintf(stderr, "\n\n");
+    }
+
     return qmp.response;
 }
 
-- 
2.17.1


