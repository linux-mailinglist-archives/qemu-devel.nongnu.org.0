Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0482C129
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 10:25:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVXPz-0007B1-3z
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 04:25:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hVXO6-0006Ku-Eh
	for qemu-devel@nongnu.org; Tue, 28 May 2019 04:23:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hVXO5-0002pd-Hx
	for qemu-devel@nongnu.org; Tue, 28 May 2019 04:23:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58448)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hVXO5-0002ou-Cq
	for qemu-devel@nongnu.org; Tue, 28 May 2019 04:23:13 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AED1930833C1;
	Tue, 28 May 2019 08:23:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-250.ams2.redhat.com
	[10.36.117.250])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A24E6C35B;
	Tue, 28 May 2019 08:23:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E288D1132BB6; Tue, 28 May 2019 10:23:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 28 May 2019 10:23:06 +0200
Message-Id: <20190528082308.22032-3-armbru@redhat.com>
In-Reply-To: <20190528082308.22032-1-armbru@redhat.com>
References: <20190528082308.22032-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 28 May 2019 08:23:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/4] Makefile: Drop bogus cleaning of
 $(ALL_SUBDIRS)/qemu-options.def
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, philmd@redhat.com
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
---
 Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Makefile b/Makefile
index 940594cc7c..80c9c6416f 100644
--- a/Makefile
+++ b/Makefile
@@ -658,7 +658,6 @@ clean:
 	rm -rf qga/qapi-generated
 	for d in $(ALL_SUBDIRS); do \
 	if test -d $$d; then $(MAKE) -C $$d $@ || exit 1; fi; \
-	rm -f $$d/qemu-options.def; \
         done
 	rm -f config-all-devices.mak
=20
--=20
2.17.2


