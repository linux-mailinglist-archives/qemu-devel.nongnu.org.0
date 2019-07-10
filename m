Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF6F6380E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 16:40:31 +0200 (CEST)
Received: from localhost ([::1]:50624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkrIC-0005VF-Kj
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 10:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33250)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hkrFu-0004OJ-2e
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:38:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hkrFs-0000A9-Ve
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:38:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58190)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hkrFs-00009l-Jm
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:38:04 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 01E8D30C0DD9;
 Tue,  9 Jul 2019 14:38:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A892C848EF;
 Tue,  9 Jul 2019 14:38:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3D9231138648; Tue,  9 Jul 2019 16:38:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 16:38:01 +0200
Message-Id: <20190709143801.4517-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 09 Jul 2019 14:38:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] Makefile: Fix "make clean" in "unconfigured"
 source directory
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
Cc: peter.maydell@linaro.org, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recent commit "Makefile: Reuse all's recursion machinery for clean and
install" broke targets clean and distclean in the source directory
before running configure:

    $ make clean
      LD      recurse-clean.mo
    cc: fatal error: no input files
    compilation terminated.
    make: *** [rules.mak:118: recurse-clean.mo] Error 1

Root cause is missing .PHONY.  Fix that.

Fixes: 1338a4b72659ce08eacb9de0205fe16202a22d9c
Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index c63de4e36c..1fcbaed62c 100644
--- a/Makefile
+++ b/Makefile
@@ -518,6 +518,7 @@ ROM_DIRS_RULES=3D$(foreach t, all clean, $(addsuffix =
/$(t), $(ROM_DIRS)))
 $(ROM_DIRS_RULES):
 	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) -C $(dir $@) V=3D"$(V)=
" TARGET_DIR=3D"$(dir $@)" CFLAGS=3D"$(filter -O% -g%,$(CFLAGS))" $(notdi=
r $@),)
=20
+.PHONY: recurse-all recurse-clean recurse-install
 recurse-all: $(addsuffix /all, $(TARGET_DIRS) $(ROM_DIRS))
 recurse-clean: $(addsuffix /clean, $(TARGET_DIRS) $(ROM_DIRS))
 recurse-install: $(addsuffix /install, $(TARGET_DIRS))
--=20
2.21.0


