Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DF6150194
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 07:13:28 +0100 (CET)
Received: from localhost ([::1]:34748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyUz9-0004Ld-1L
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 01:13:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57138)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iyUxM-0002Lh-3C
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 01:11:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iyUxL-0002Wc-4A
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 01:11:36 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:53705)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iyUxJ-0002OE-4m; Mon, 03 Feb 2020 01:11:35 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 489yBm07Clz9sS9; Mon,  3 Feb 2020 17:11:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580710288;
 bh=dCdn1ruMSLsjZuuCJv7VxVhSfR0TgqtIsrQxGA4YTIk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dkULL3hYJ5AYoEZtkQOA+KJHTjxYQ5vc69s3w94ebX4Alkrus+NciUZbYU3CKgv2w
 vsRW0pwTdilWq7Z+P3TfEhRWDuKAIeZK8DJQq1VkJPnWyBBgvvU4LwCiKTwmYUg1Nh
 Rqhnp9V80LtqG4nSDFFEAk993QamicswhUysI0DQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 02/35] ppc/pnv: improve error logging when a PNOR update fails
Date: Mon,  3 Feb 2020 17:10:50 +1100
Message-Id: <20200203061123.59150-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203061123.59150-1-david@gibson.dropbear.id.au>
References: <20200203061123.59150-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

Print out the offset at which the error occured.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20200108090348.21224-3-clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv_pnor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv_pnor.c b/hw/ppc/pnv_pnor.c
index 060c6e6a31..c365ee58b8 100644
--- a/hw/ppc/pnv_pnor.c
+++ b/hw/ppc/pnv_pnor.c
@@ -47,7 +47,8 @@ static void pnv_pnor_update(PnvPnor *s, int offset, int=
 size)
     ret =3D blk_pwrite(s->blk, offset, s->storage + offset,
                      offset_end - offset, 0);
     if (ret < 0) {
-        error_report("Could not update PNOR: %s", strerror(-ret));
+        error_report("Could not update PNOR offset=3D0x%" PRIx32" : %s",=
 offset,
+                     strerror(-ret));
     }
 }
=20
--=20
2.24.1


