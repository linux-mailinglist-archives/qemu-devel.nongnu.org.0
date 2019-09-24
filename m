Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBDFBC994
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 15:57:56 +0200 (CEST)
Received: from localhost ([::1]:45986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iClKF-0002DL-5g
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 09:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58765)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iCks1-0000Ee-CZ
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iCkru-0001Si-Tr
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41854)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iCkru-0001RG-7m
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:38 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0EE4F3082131;
 Tue, 24 Sep 2019 13:28:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD3225C1B2;
 Tue, 24 Sep 2019 13:28:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 861761138528; Tue, 24 Sep 2019 15:28:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/25] qapi: Make check_type()'s array case a bit more obvious
Date: Tue, 24 Sep 2019 15:28:18 +0200
Message-Id: <20190924132830.15835-14-armbru@redhat.com>
In-Reply-To: <20190924132830.15835-1-armbru@redhat.com>
References: <20190924132830.15835-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 24 Sep 2019 13:28:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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

check_type() checks the array's contents, then peels off the array and
falls through to the "not array" code without resetting allow_array
and allow_dict to False.  Works because the peeled value is a string,
and allow_array and allow_dict aren't used then.  Tidy up anyway:
recurse instead, defaulting allow_array and allow_dict to False.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 5e708c3b45..07cf72e72c 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -794,7 +794,8 @@ def check_type(value, info, source,
             raise QAPISemError(info,
                                "%s: array type must contain single type =
name" %
                                source)
-        value =3D value[0]
+        check_type(value[0], info, source, allow_metas=3Dallow_metas)
+        return
=20
     # Check if type name for value is okay
     if isinstance(value, str):
--=20
2.21.0


