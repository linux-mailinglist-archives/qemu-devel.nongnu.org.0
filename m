Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D723133B23
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 06:28:08 +0100 (CET)
Received: from localhost ([::1]:37020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ip3t0-0001Wb-Pt
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 00:28:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47330)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ip3oX-0003qK-8X
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 00:23:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ip3oW-0002d6-8b
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 00:23:29 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43747 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ip3oV-0002Uc-Bd; Wed, 08 Jan 2020 00:23:28 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47syM93DzXz9sNx; Wed,  8 Jan 2020 16:23:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578460997;
 bh=RIG8AVq/A1LrdRejHrsb2i5wZf5SloXuDpwkP/Qb1zQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=adAP7IjrZFjRDOqW4vvufUM7oifi56f52xwirILWr9Wmnaew6Yo0Vh8QgsL20DVhv
 nQrEkb/byFP9G53Fhs9pBjikaBXQZYPWJm/B2P0nWVyKnFC26DGXZsreYeIuorLWAf
 hZu0pdAzy+Y9ci8Xu0v4OslV+CXnBQSoEdnYULpY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 02/26] target/ppc: Handle AIL=0 in ppc_excp_vector_offset
Date: Wed,  8 Jan 2020 16:22:48 +1100
Message-Id: <20200108052312.238710-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108052312.238710-1-david@gibson.dropbear.id.au>
References: <20200108052312.238710-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, Fabiano Rosas <farosas@linux.ibm.com>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

The exception vector offset calculation was moved into a function but
the case when AIL=3D0 was not checked.

The reason we got away with this is that the sole caller of
ppc_excp_vector_offset checks the AIL before calling the function:

    /* Handle AIL */
    if (ail) {
        ...
        vector |=3D ppc_excp_vector_offset(cs, ail);
    }

Fixes: 2586a4d7a0 ("target/ppc: Move exception vector offset computation =
into a function")
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20191217142512.574075-1-farosas@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/excp_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 50b004d00d..5752ed4a4d 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -112,6 +112,8 @@ static uint64_t ppc_excp_vector_offset(CPUState *cs, =
int ail)
     uint64_t offset =3D 0;
=20
     switch (ail) {
+    case AIL_NONE:
+        break;
     case AIL_0001_8000:
         offset =3D 0x18000;
         break;
--=20
2.24.1


