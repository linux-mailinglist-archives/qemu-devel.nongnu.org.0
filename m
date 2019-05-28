Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE0C2C826
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 15:53:34 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVcXm-0003J6-7P
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 09:53:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVcWl-00031A-A6
	for qemu-devel@nongnu.org; Tue, 28 May 2019 09:52:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVcWi-0000Zz-Vf
	for qemu-devel@nongnu.org; Tue, 28 May 2019 09:52:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:28307)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hVcWh-0000EM-DW
	for qemu-devel@nongnu.org; Tue, 28 May 2019 09:52:27 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31DB088302;
	Tue, 28 May 2019 13:51:54 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AEBE1001943;
	Tue, 28 May 2019 13:51:47 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 28 May 2019 15:51:44 +0200
Message-Id: <20190528135144.24028-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 28 May 2019 13:51:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] tests/migration: Disable
 /migration/postcopy/unix qtest on Travis-CI
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This started to fail 6 months ago [1] and lately occurs too
often on the main Travis CI.

Travis CI set the CONTINUOUS_INTEGRATION variable in the process
environment [2]. Let's use it to disable it when running this test
there.

[1] https://travis-ci.org/philmd/qemu/jobs/466594203#L4430
[2] https://docs.travis-ci.com/user/environment-variables/#default-enviro=
nment-variables

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/migration-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/migration-test.c b/tests/migration-test.c
index bd3f5c3125..c5091e1fb1 100644
--- a/tests/migration-test.c
+++ b/tests/migration-test.c
@@ -764,6 +764,11 @@ static void test_postcopy(void)
 {
     QTestState *from, *to;
=20
+    if (getenv("CONTINUOUS_INTEGRATION")) {
+        /* Test failing on Travis-CI */
+        g_test_skip("Running on Travis-CI");
+    }
+
     if (migrate_postcopy_prepare(&from, &to, false)) {
         return;
     }
--=20
2.20.1


