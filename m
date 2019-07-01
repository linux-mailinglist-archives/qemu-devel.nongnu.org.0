Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894D649C18
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 10:36:15 +0200 (CEST)
Received: from localhost ([::1]:54786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hd9bC-0007vZ-PU
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 04:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41258)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <drjones@redhat.com>) id 1hd9a0-0007Ef-Hl
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 04:35:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1hd9Zz-0000lp-E3
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 04:35:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48712)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1hd9Zx-0000cP-Ax; Tue, 18 Jun 2019 04:34:57 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 54863307FBCB;
 Tue, 18 Jun 2019 08:34:45 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C6A882749;
 Tue, 18 Jun 2019 08:34:44 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 18 Jun 2019 10:34:42 +0200
Message-Id: <20190618083442.10407-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 18 Jun 2019 08:34:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] hw/arm/boot: fix direct kernel boot setup
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need to check ram_end, not ram_size.

Fixes: 852dc64d665f ("hw/arm/boot: Diagnose layouts that put initrd or
DTB off the end of RAM")
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b2f93f6beff6..8a280ab3ed49 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1109,7 +1109,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cp=
u,
                              info->initrd_filename);
                 exit(1);
             }
-            if (info->initrd_start + initrd_size > info->ram_size) {
+            if (info->initrd_start + initrd_size > ram_end) {
                 error_report("could not load initrd '%s': "
                              "too big to fit into RAM after the kernel",
                              info->initrd_filename);
--=20
2.20.1


