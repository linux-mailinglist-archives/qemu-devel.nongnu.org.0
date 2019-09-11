Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0EEAF3C6
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 02:48:09 +0200 (CEST)
Received: from localhost ([::1]:45696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7qno-0003cM-Pc
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 20:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46364)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1i7qiA-0007Xx-SQ
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 20:42:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1i7qi9-00081F-PP
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 20:42:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41722)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1i7qi9-00080y-Ki
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 20:42:17 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 017453174640
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 00:42:17 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-121-171.rdu2.redhat.com
 [10.10.121.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CA3760166;
 Wed, 11 Sep 2019 00:42:16 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 20:42:04 -0400
Message-Id: <20190911004204.29286-5-crosa@redhat.com>
In-Reply-To: <20190911004204.29286-1-crosa@redhat.com>
References: <20190911004204.29286-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 11 Sep 2019 00:42:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 4/4] tests/acceptance/cpu_queries.py: minor
 optmizations
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This avoids the second loop over the cpus, and reuses some of the
variables.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/cpu_queries.py | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/acceptance/cpu_queries.py b/tests/acceptance/cpu_queri=
es.py
index 9cd6f553ff..54aa310fb8 100644
--- a/tests/acceptance/cpu_queries.py
+++ b/tests/acceptance/cpu_queries.py
@@ -25,9 +25,8 @@ class QueryCPUModelExpansion(Test):
=20
         cpus =3D self.vm.command('query-cpu-definitions')
         for c in cpus:
-            self.assertNotIn('', c['unavailable-features'], c['name'])
-
-        for c in cpus:
-            model =3D {'name': c['name']}
-            e =3D self.vm.command('query-cpu-model-expansion', model=3Dm=
odel, type=3D'full')
-            self.assertEquals(e['model']['name'], c['name'])
+            model_name =3D c['name']
+            self.assertNotIn('', c['unavailable-features'], model_name)
+            e =3D self.vm.command('query-cpu-model-expansion',
+                                model=3D{'name': model_name}, type=3D'fu=
ll')
+            self.assertEquals(e['model']['name'], model_name)
--=20
2.21.0


