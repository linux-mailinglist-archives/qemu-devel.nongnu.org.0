Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32342467D4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 20:47:05 +0200 (CEST)
Received: from localhost ([::1]:54246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbrE8-0004N4-CI
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 14:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39557)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <lvivier@redhat.com>) id 1hbqKJ-0004lf-Dv
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:49:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lvivier@redhat.com>) id 1hbqKI-0004Bo-5k
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:49:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47448)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1hbqKH-00044U-Rg
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:49:22 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6061D81E19
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 17:49:05 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-117-111.ams2.redhat.com
 [10.36.117.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 225A85D982;
 Fri, 14 Jun 2019 17:49:01 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 19:49:01 +0200
Message-Id: <20190614174901.20359-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 14 Jun 2019 17:49:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] helpers: build vhost-user-gpu only for softmmu
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
Cc: Laurent Vivier <lvivier@redhat.com>, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

with

  ./configure --enable-user --disable-tools --disable-system

it fails with:

  /usr/bin/ld: contrib/vhost-user-gpu/main.o: in function `vg_resource_de=
stroy':
  .../contrib/vhost-user-gpu/main.c:382: undefined reference to `pixman_i=
mage_unref'
  /usr/bin/ld: contrib/vhost-user-gpu/main.o: in function `vg_resource_fl=
ush':
  .../contrib/vhost-user-gpu/main.c:694: undefined reference to `pixman_r=
egion_init_rect'
  /usr/bin/ld: .../contrib/vhost-user-gpu/main.c:763: undefined reference=
 to `pixman_region_fini'

Fixes: d52c454aadcd ("contrib: add vhost-user-gpu")
Cc: marcandre.lureau@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 8e2fc6624c31..49ddec1dcf35 100644
--- a/Makefile
+++ b/Makefile
@@ -322,11 +322,13 @@ HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINU=
X)) =3D qemu-bridge-helper$(EXE
 ifdef CONFIG_LINUX
 ifdef CONFIG_VIRGL
 ifdef CONFIG_GBM
+ifdef CONFIG_SOFTMMU
 HELPERS-y +=3D vhost-user-gpu$(EXESUF)
 vhost-user-json-y +=3D contrib/vhost-user-gpu/50-qemu-gpu.json
 endif
 endif
 endif
+endif
=20
 ifdef BUILD_DOCS
 DOCS=3Dqemu-doc.html qemu-doc.txt qemu.1 qemu-img.1 qemu-nbd.8 qemu-ga.8
--=20
2.21.0


