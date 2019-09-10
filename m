Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE97AE3E2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 08:40:35 +0200 (CEST)
Received: from localhost ([::1]:34212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7ZpJ-0006Qb-F9
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 02:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38579)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1i7ZmO-0004kI-AS
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 02:37:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1i7ZmN-0007iq-Cc
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 02:37:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44438)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1i7ZmN-0007hl-0Y
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 02:37:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 32CF3970F6;
 Tue, 10 Sep 2019 06:37:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A73F5C224;
 Tue, 10 Sep 2019 06:37:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 30DB811655F2; Tue, 10 Sep 2019 08:37:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 08:37:13 +0200
Message-Id: <20190910063724.28470-6-armbru@redhat.com>
In-Reply-To: <20190910063724.28470-1-armbru@redhat.com>
References: <20190910063724.28470-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 10 Sep 2019 06:37:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 05/16] tests/qapi-schema: Demonstrate bad
 reporting of funny characters
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
Cc: marcandre.lureau@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Invalid name 'not\\possible' is reported as 'not\possible'.  Control
characters (quoted or not) are even more confusing.  Mark FIXME.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qapi-schema/enum-bad-name.err  | 2 +-
 tests/qapi-schema/enum-bad-name.json | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qapi-schema/enum-bad-name.err b/tests/qapi-schema/enum=
-bad-name.err
index 9c3c1002b7..26a09f84ad 100644
--- a/tests/qapi-schema/enum-bad-name.err
+++ b/tests/qapi-schema/enum-bad-name.err
@@ -1 +1 @@
-tests/qapi-schema/enum-bad-name.json:2: Member of enum 'MyEnum' uses inv=
alid name 'not^possible'
+tests/qapi-schema/enum-bad-name.json:3: Member of enum 'MyEnum' uses inv=
alid name 'not\possible'
diff --git a/tests/qapi-schema/enum-bad-name.json b/tests/qapi-schema/enu=
m-bad-name.json
index 8506562b31..b233fdc825 100644
--- a/tests/qapi-schema/enum-bad-name.json
+++ b/tests/qapi-schema/enum-bad-name.json
@@ -1,2 +1,3 @@
 # we ensure all enum names can map to C
-{ 'enum': 'MyEnum', 'data': [ 'not^possible' ] }
+# FIXME reports 'not\posible' instead of 'not\\possible'
+{ 'enum': 'MyEnum', 'data': [ 'not\\possible' ] }
--=20
2.21.0


