Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F588B441
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 11:35:22 +0200 (CEST)
Received: from localhost ([::1]:50626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxTD7-0004bz-5q
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 05:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53551)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <thuth@redhat.com>) id 1hxT9R-0006lv-3u
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 05:31:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hxT9Q-0005Lp-8a
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 05:31:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37860)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hxT9M-0005HN-3x; Tue, 13 Aug 2019 05:31:28 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 61F9C308218D;
 Tue, 13 Aug 2019 09:31:27 +0000 (UTC)
Received: from thuth.com (ovpn-116-154.ams2.redhat.com [10.36.116.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A711891A1;
 Tue, 13 Aug 2019 09:31:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Aug 2019 11:30:45 +0200
Message-Id: <20190813093047.27948-5-thuth@redhat.com>
In-Reply-To: <20190813093047.27948-1-thuth@redhat.com>
References: <20190813093047.27948-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 13 Aug 2019 09:31:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 4/6] tests/libqtest: Clean up
 qtest_cb_for_every_machine() wrt global_qtest
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Amit Shah <amit@kernel.org>, John Snow <jsnow@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The generic libqtest library functions should not use functions that
require the global_qtest variable.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/libqtest.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/libqtest.c b/tests/libqtest.c
index 3e9245d4c9..d1aead30ed 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -1189,9 +1189,10 @@ void qtest_cb_for_every_machine(void (*cb)(const char *machine),
     QObject *qobj;
     QString *qstr;
     const char *mname;
+    QTestState *qts;
 
-    qtest_start("-machine none");
-    response = qmp("{ 'execute': 'query-machines' }");
+    qts = qtest_init("-machine none");
+    response = qtest_qmp(qts, "{ 'execute': 'query-machines' }");
     g_assert(response);
     list = qdict_get_qlist(response, "return");
     g_assert(list);
@@ -1209,7 +1210,7 @@ void qtest_cb_for_every_machine(void (*cb)(const char *machine),
         }
     }
 
-    qtest_end();
+    qtest_quit(qts);
     qobject_unref(response);
 }
 
-- 
2.18.1


