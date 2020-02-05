Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CDD153BC9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 00:22:00 +0100 (CET)
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izTzb-0001qn-KL
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 18:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lvivier@redhat.com>) id 1izTy8-0000Ep-Iy
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 18:20:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lvivier@redhat.com>) id 1izTy7-0004U5-Gb
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 18:20:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28870
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1izTy7-0004Qd-Cb
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 18:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580944826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OCLalSyt+BFfXkOQ9Vf9Z6EQFjhJKX1hmjYwhlz1B6Q=;
 b=Rtzyo7m87whjLDn9j6YuRKrmLeUC7PTwavvau5zPcBJdjEv7/d8IH/aAoZIEi+mWqvGxjT
 76I7FZJ1205NVuvsn3KCS1GczCLw8uJ1gLDNZfo2HDQ324CZeAvqp/DMxzZckFxnnjyJWI
 Bd/2ADXrQoqu+ebM4v9MB9umL6RPW3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-Y73zC_GMMYWAEw-O3MI8VA-1; Wed, 05 Feb 2020 18:20:23 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 269D31137875;
 Wed,  5 Feb 2020 23:20:22 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-116-229.ams2.redhat.com
 [10.36.116.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3963784DB4;
 Wed,  5 Feb 2020 23:20:20 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] qtest: Fix rtas dependencies
Date: Thu,  6 Feb 2020 00:20:15 +0100
Message-Id: <20200205232016.588202-2-lvivier@redhat.com>
In-Reply-To: <20200205232016.588202-1-lvivier@redhat.com>
References: <20200205232016.588202-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Y73zC_GMMYWAEw-O3MI8VA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qtest "rtas" command is only available with pseries not all ppc64 targets,
so if I try to compile only powernv machine, the build fails with:

  /usr/bin/ld: qtest.o: in function `qtest_process_command':
  .../qtest.c:645: undefined reference to `qtest_rtas_call'

We fix this by enabling rtas command only with pseries machine.

Fixes: eeddd59f5962 ("tests: add RTAS command in the protocol")
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 qtest.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/qtest.c b/qtest.c
index 12432f99cf44..587dcbb4b515 100644
--- a/qtest.c
+++ b/qtest.c
@@ -27,7 +27,8 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
-#ifdef TARGET_PPC64
+#include "config-devices.h"
+#ifdef CONFIG_PSERIES
 #include "hw/ppc/spapr_rtas.h"
 #endif
=20
@@ -628,7 +629,7 @@ static void qtest_process_command(CharBackend *chr, gch=
ar **words)
 #else
         qtest_sendf(chr, "OK little\n");
 #endif
-#ifdef TARGET_PPC64
+#ifdef CONFIG_PSERIES
     } else if (strcmp(words[0], "rtas") =3D=3D 0) {
         uint64_t res, args, ret;
         unsigned long nargs, nret;
--=20
2.24.1


