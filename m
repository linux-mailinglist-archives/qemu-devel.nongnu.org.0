Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EA0B2686
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 22:17:52 +0200 (CEST)
Received: from localhost ([::1]:47416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8s0s-0007u8-UA
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 16:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39212)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1i8rx6-0005xl-UF
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 16:13:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1i8rx5-0000aX-Qd
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 16:13:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:24196)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1i8rx5-0000Zu-Jq
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 16:13:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D8A5D1DA2;
 Fri, 13 Sep 2019 20:13:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A841560920;
 Fri, 13 Sep 2019 20:13:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8360811385C9; Fri, 13 Sep 2019 22:13:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Sep 2019 22:13:38 +0200
Message-Id: <20190913201349.24332-6-armbru@redhat.com>
In-Reply-To: <20190913201349.24332-1-armbru@redhat.com>
References: <20190913201349.24332-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Fri, 13 Sep 2019 20:13:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 05/16] tests/qapi-schema: Demonstrate bad
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
Reviewed-by: Eric Blake <eblake@redhat.com>
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
index 8506562b31..1c4620edda 100644
--- a/tests/qapi-schema/enum-bad-name.json
+++ b/tests/qapi-schema/enum-bad-name.json
@@ -1,2 +1,3 @@
 # we ensure all enum names can map to C
-{ 'enum': 'MyEnum', 'data': [ 'not^possible' ] }
+# FIXME reports 'not\possible' instead of 'not\\possible'
+{ 'enum': 'MyEnum', 'data': [ 'not\\possible' ] }
--=20
2.21.0


