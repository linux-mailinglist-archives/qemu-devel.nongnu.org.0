Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEF876303
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 12:02:42 +0200 (CEST)
Received: from localhost ([::1]:37970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqx3i-00066u-45
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 06:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57785)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <thuth@redhat.com>) id 1hqx3R-0005iB-JB
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 06:02:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hqx3Q-0005Pb-H7
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 06:02:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39410)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1hqx3Q-0005KT-9x
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 06:02:24 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C927B59451;
 Fri, 26 Jul 2019 10:02:20 +0000 (UTC)
Received: from thuth.com (reserved-198-198.str.redhat.com [10.33.198.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B64F360C44;
 Fri, 26 Jul 2019 10:02:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Date: Fri, 26 Jul 2019 12:02:07 +0200
Message-Id: <20190726100207.19112-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 26 Jul 2019 10:02:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] tests/vm: Take the J=x setting into account
 for the vm-boot-ssh targets, too
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For testing whether the VMs can deal with multiple CPUs correctly,
it is useful to be able to use the "J=3D<cpus>" setting for the
vm-boot-ssh targets, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/Makefile.include | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index 3560716092..fea348e845 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -80,6 +80,7 @@ vm-boot-serial-%: $(IMAGES_DIR)/%.img
 vm-boot-ssh-%: $(IMAGES_DIR)/%.img
 	$(call quiet-command, \
 		$(SRC_PATH)/tests/vm/$* \
+		$(if $(J),--jobs $(J)) \
 		--image "$<" \
 		--interactive \
 		false, \
--=20
2.21.0


