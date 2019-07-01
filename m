Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B9834109
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 10:01:29 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48046 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hY4Nr-000504-OX
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 04:01:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hY4Mk-0004ag-Dr
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 04:00:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hY4Mi-0006hV-Ai
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 04:00:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34790)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hY4Mg-0006dT-B6
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 04:00:16 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB9BD368E3
	for <qemu-devel@nongnu.org>; Tue,  4 Jun 2019 08:00:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
	[10.36.116.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A52C31018A13;
	Tue,  4 Jun 2019 08:00:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 341C611386A0; Tue,  4 Jun 2019 10:00:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  4 Jun 2019 10:00:10 +0200
Message-Id: <20190604080010.23186-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 04 Jun 2019 08:00:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] test: Fix make target check-report.tap
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a fat-fingered invocation of tap-merge.pl in the recipe of target
check-report.tap.

Fixes: 9df43317b82 "test: replace gtester with a TAP driver"
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 46a36c2c95..34df040583 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -904,7 +904,7 @@ check-report-unit.tap: $(check-unit-y)
 # Reports and overall runs
=20
 check-report.tap: $(patsubst %,check-report-qtest-%.tap, $(QTEST_TARGETS=
)) check-report-unit.tap
-	$(call quiet-command,./scripts/tap-merge.py $^ > $@,"GEN","$@")
+	$(call quiet-command, cat $^ | scripts/tap-merge.pl >$@,"GEN","$@")
=20
 # FPU Emulation tests (aka softfloat)
 #
--=20
2.21.0


