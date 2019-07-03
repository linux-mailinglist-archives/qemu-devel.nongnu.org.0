Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2446F5E334
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 13:52:21 +0200 (CEST)
Received: from localhost ([::1]:35084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hidoC-0000kj-Bi
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 07:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43540)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hidjy-0005Jf-VU
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 07:48:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hidjv-0007je-U9
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 07:47:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38440)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hidjv-00075f-IK
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 07:47:55 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 24E1585545;
 Wed,  3 Jul 2019 11:47:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-136.ams2.redhat.com
 [10.36.116.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD0E416A20;
 Wed,  3 Jul 2019 11:47:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 45F981132A05; Wed,  3 Jul 2019 13:47:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jul 2019 13:47:12 +0200
Message-Id: <20190703114714.4234-3-armbru@redhat.com>
In-Reply-To: <20190703114714.4234-1-armbru@redhat.com>
References: <20190703114714.4234-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 03 Jul 2019 11:47:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 2/4] Makefile: Drop bogus cleaning of
 $(ALL_SUBDIRS)/qemu-options.def
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When commit df2943ba3c7 moved "rm -f qemu-options.def" from distclean
to clean, it also added "rm -f $$d/qemu-options.def" to the for d in
$(ALL_SUBDIRS) loop.  That file doesn't exist.  Remove the mistaken
rm.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190528082308.22032-3-armbru@redhat.com>
---
 Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Makefile b/Makefile
index 0f2cb271a2..cf4f34e45b 100644
--- a/Makefile
+++ b/Makefile
@@ -678,7 +678,6 @@ clean:
 	rm -rf qga/qapi-generated
 	for d in $(ALL_SUBDIRS); do \
 	if test -d $$d; then $(MAKE) -C $$d $@ || exit 1; fi; \
-	rm -f $$d/qemu-options.def; \
         done
 	rm -f config-all-devices.mak
=20
--=20
2.21.0


