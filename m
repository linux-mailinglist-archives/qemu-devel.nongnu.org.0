Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5155010DF9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 22:27:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40939 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLvot-0004yK-Bm
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 16:27:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hLvn1-0003fH-8a
	for qemu-devel@nongnu.org; Wed, 01 May 2019 16:25:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hLvn0-00018r-B6
	for qemu-devel@nongnu.org; Wed, 01 May 2019 16:25:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37650)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1hLvmy-00016q-8a; Wed, 01 May 2019 16:25:12 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7796F81106;
	Wed,  1 May 2019 20:25:11 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-238.bos.redhat.com [10.18.17.238])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8EC017C5EE;
	Wed,  1 May 2019 20:25:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 May 2019 16:25:05 -0400
Message-Id: <20190501202506.13875-2-jsnow@redhat.com>
In-Reply-To: <20190501202506.13875-1-jsnow@redhat.com>
References: <20190501202506.13875-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 01 May 2019 20:25:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/2] Makefile: add nit-picky mode to sphinx-build
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
Cc: peter.maydell@linaro.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	jsnow@redhat.com, qemu-stable@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we add references that don't resolve (or accidentally remove them),
it will be helpful to have warning messages alerting us to that.

Further, turn those warnings into errors so we can be alerted to these
problems sooner rather than later.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-id: 20190426221528.30293-2-jsnow@redhat.com
[adjusted commit message. --js]
Signed-off-by: John Snow <jsnow@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6ccb8639b0..f1325947f6 100644
--- a/Makefile
+++ b/Makefile
@@ -898,7 +898,7 @@ docs/version.texi: $(SRC_PATH)/VERSION
 sphinxdocs: $(MANUAL_BUILDDIR)/devel/index.html $(MANUAL_BUILDDIR)/inter=
op/index.html
=20
 # Canned command to build a single manual
-build-manual =3D $(call quiet-command,sphinx-build $(if $(V),,-q) -b htm=
l -D version=3D$(VERSION) -D release=3D"$(FULL_VERSION)" -d .doctrees/$1 =
$(SRC_PATH)/docs/$1 $(MANUAL_BUILDDIR)/$1 ,"SPHINX","$(MANUAL_BUILDDIR)/$=
1")
+build-manual =3D $(call quiet-command,sphinx-build $(if $(V),,-q) -W -n =
-b html -D version=3D$(VERSION) -D release=3D"$(FULL_VERSION)" -d .doctre=
es/$1 $(SRC_PATH)/docs/$1 $(MANUAL_BUILDDIR)/$1 ,"SPHINX","$(MANUAL_BUILD=
DIR)/$1")
 # We assume all RST files in the manual's directory are used in it
 manual-deps =3D $(wildcard $(SRC_PATH)/docs/$1/*.rst) $(SRC_PATH)/docs/$=
1/conf.py $(SRC_PATH)/docs/conf.py
=20
--=20
2.20.1


