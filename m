Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4B9C11D0
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Sep 2019 20:42:43 +0200 (CEST)
Received: from localhost ([::1]:34362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEHg1-0001zZ-M3
	for lists+qemu-devel@lfdr.de; Sat, 28 Sep 2019 14:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43916)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iEHd8-0008Pl-Hd
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 14:39:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iEHd5-0003ta-DN
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 14:39:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43432)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iEHd5-0003sN-3E
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 14:39:39 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5776259455
 for <qemu-devel@nongnu.org>; Sat, 28 Sep 2019 18:39:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26F401001281;
 Sat, 28 Sep 2019 18:39:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5A57811384A9; Sat, 28 Sep 2019 20:39:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/27] qapi: Make check_type()'s array case a bit more obvious
Date: Sat, 28 Sep 2019 20:39:21 +0200
Message-Id: <20190928183934.12459-15-armbru@redhat.com>
In-Reply-To: <20190928183934.12459-1-armbru@redhat.com>
References: <20190928183934.12459-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Sat, 28 Sep 2019 18:39:38 +0000 (UTC)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

check_type() checks the array's contents, then peels off the array and
falls through to the "not array" code without resetting allow_array
and allow_dict to False.  Works because the peeled value is a string,
and allow_array and allow_dict aren't used then.  Tidy up anyway:
recurse instead, defaulting allow_array and allow_dict to False.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20190927134639.4284-14-armbru@redhat.com>
---
 scripts/qapi/common.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 111a4bbe55..870d8b0ecb 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -795,7 +795,8 @@ def check_type(value, info, source,
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


