Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6875122363
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 06:08:19 +0100 (CET)
Received: from localhost ([::1]:35438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih55m-00077a-8r
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 00:08:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33708)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4iG-0008JO-5S
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:44:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4iB-0005ZB-C8
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:43:58 -0500
Received: from ozlabs.org ([203.11.71.1]:59995)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ih4iA-0005Qt-3f; Mon, 16 Dec 2019 23:43:54 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47cQWT4m6Kz9sSq; Tue, 17 Dec 2019 15:43:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1576557813;
 bh=rqWdDbUCcpNjWZZpcK2jNRyA4bZeefxs9gm4nLiAqUM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B/VxeNQ25Ptsu8PVHK1qRpKomuP7Z9uRb5/EpuD/ky6m5jTzA0VoS3XjljzR2kmIq
 lI8853r20DoThbJx7NSrepkK5BIjiVD1tVulKsazZvdGTD7ei83a/e2kubthKTQDwz
 D5r+QxAKRpX+VuUlZvL0rkqwgEz4dPvdBx6CeDrA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 23/88] ppc/xive: Check V bit in TM_PULL_POOL_CTX
Date: Tue, 17 Dec 2019 15:42:17 +1100
Message-Id: <20191217044322.351838-24-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191217044322.351838-1-david@gibson.dropbear.id.au>
References: <20191217044322.351838-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: C=C3=A9dric Le Goater <clg@kaod.org>

A context should be 'valid' when pulled from the thread interrupt
context registers.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20191115162436.30548-8-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/xive.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 42e9a11ef7..511e1a9363 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -377,6 +377,11 @@ static uint64_t xive_tm_pull_os_ctx(XiveTCTX *tctx, =
hwaddr offset,
=20
     qw1w2 =3D xive_tctx_get_os_cam(tctx, &nvt_blk, &nvt_idx, &vo);
=20
+    if (!vo) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: pulling invalid NVT %x/%x =
!?\n",
+                      nvt_blk, nvt_idx);
+    }
+
     /* Invalidate CAM line */
     qw1w2_new =3D xive_set_field32(TM_QW1W2_VO, qw1w2, 0);
     xive_tctx_set_os_cam(tctx, qw1w2_new);
--=20
2.23.0


