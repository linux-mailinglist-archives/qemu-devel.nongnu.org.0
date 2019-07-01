Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824D84A16B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 15:02:39 +0200 (CEST)
Received: from localhost ([::1]:57522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdDl0-0004Mn-MZ
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 09:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41403)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <drjones@redhat.com>) id 1hdDhb-0003iZ-Vc
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 08:59:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1hdDhb-00071y-1Q
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 08:59:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59060)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1hdDhX-0006sQ-J5; Tue, 18 Jun 2019 08:59:03 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 56817882FF;
 Tue, 18 Jun 2019 12:58:51 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FC6E36FA;
 Tue, 18 Jun 2019 12:58:45 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 18 Jun 2019 14:58:44 +0200
Message-Id: <20190618125844.4863-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 18 Jun 2019 12:58:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] hw/arm/boot: fix direct kernel boot with initrd
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the condition used to check whether the initrd fits
into RAM; in some cases if an initrd was also passed on
the command line we would get an error stating that it
was too big to fit into RAM after the kernel. Despite the
error the loader continued anyway, though, so also add an
exit(1) when the initrd is actually too big.

Fixes: 852dc64d665f ("hw/arm/boot: Diagnose layouts that put initrd or
DTB off the end of RAM")
Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/boot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b2f93f6beff6..1fb24fbef27e 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1109,10 +1109,11 @@ static void arm_setup_direct_kernel_boot(ARMCPU *=
cpu,
                              info->initrd_filename);
                 exit(1);
             }
-            if (info->initrd_start + initrd_size > info->ram_size) {
+            if (info->initrd_start + initrd_size > ram_end) {
                 error_report("could not load initrd '%s': "
                              "too big to fit into RAM after the kernel",
                              info->initrd_filename);
+                exit(1);
             }
         } else {
             initrd_size =3D 0;
--=20
2.20.1


