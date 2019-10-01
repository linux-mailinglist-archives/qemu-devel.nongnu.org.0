Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187D3C40E1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 21:20:47 +0200 (CEST)
Received: from localhost ([::1]:46928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFNhV-0006V2-NH
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 15:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46680)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iFNcJ-0004N9-D8
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:15:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iFNcH-0003IX-98
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:15:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59494)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iFNcH-0003Hn-3Q
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:15:21 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EF3883090FC6;
 Tue,  1 Oct 2019 19:15:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D2A31001B11;
 Tue,  1 Oct 2019 19:15:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 09E2311385FA; Tue,  1 Oct 2019 21:15:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] qapi: Eliminate accidental global frontend state
Date: Tue,  1 Oct 2019 21:15:10 +0200
Message-Id: <20191001191514.11208-4-armbru@redhat.com>
In-Reply-To: <20191001191514.11208-1-armbru@redhat.com>
References: <20191001191514.11208-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 01 Oct 2019 19:15:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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

The frontend can't be run more than once due to its global state.
A future commit will want to do that.

The only global frontend state remaining is accidental:
QAPISchemaParser.__init__()'s parameter previously_included=3D[].
Python evaluates the default once, at definition time.  Any
modifications to it are visible in subsequent calls.  Well-known
Python trap.  Change the default to None and replace it by the real
default in the function body.  Use the opportunity to convert
previously_included to a set.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 5abab44302..9d5c05f6a1 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -391,8 +391,9 @@ class QAPIDoc(object):
=20
 class QAPISchemaParser(object):
=20
-    def __init__(self, fname, previously_included=3D[], incl_info=3DNone=
):
-        previously_included.append(os.path.abspath(fname))
+    def __init__(self, fname, previously_included=3DNone, incl_info=3DNo=
ne):
+        previously_included =3D previously_included or set()
+        previously_included.add(os.path.abspath(fname))
=20
         try:
             if sys.version_info[0] >=3D 3:
--=20
2.21.0


