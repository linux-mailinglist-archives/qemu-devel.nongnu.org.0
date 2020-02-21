Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D58E166DDB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 04:38:49 +0100 (CET)
Received: from localhost ([::1]:51682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4z9L-0003rg-Q4
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 22:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48511)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z7l-0001sW-Ho
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z7k-0007x1-AF
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:09 -0500
Received: from ozlabs.org ([203.11.71.1]:58709)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j4z7j-0007bT-Ui; Thu, 20 Feb 2020 22:37:08 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48NxwB5BM1z9sSJ; Fri, 21 Feb 2020 14:36:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582256218;
 bh=prW/2H1j7RiFZ0gM0sGFBlRUzh9v72j0IMZbcjUNblg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZtigdW5dd0lfa35jaqrE1e9VXaCWqyGK7bJreFC+fwS8Vw/iASmnJjrR4QFURplDA
 CF/D58EhnL241/BvDg6EviSmCBXtoBI7Rlzseie/aLyyYaYhekYlmBaaSD4u9onRM6
 pSUB6rj5KGpp9fRVUh/bbOrVxJw6b4Ks4Uc0fcAg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 02/20] qtest: Fix rtas dependencies
Date: Fri, 21 Feb 2020 14:36:32 +1100
Message-Id: <20200221033650.444386-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221033650.444386-1-david@gibson.dropbear.id.au>
References: <20200221033650.444386-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

qtest "rtas" command is only available with pseries not all ppc64 targets=
,
so if I try to compile only powernv machine, the build fails with:

  /usr/bin/ld: qtest.o: in function `qtest_process_command':
  .../qtest.c:645: undefined reference to `qtest_rtas_call'

We fix this by enabling rtas command only with pseries machine.

Fixes: eeddd59f5962 ("tests: add RTAS command in the protocol")
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20200205232016.588202-2-lvivier@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 qtest.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/qtest.c b/qtest.c
index 12432f99cf..587dcbb4b5 100644
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
@@ -628,7 +629,7 @@ static void qtest_process_command(CharBackend *chr, g=
char **words)
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


