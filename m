Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC92A9D29
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 10:37:55 +0200 (CEST)
Received: from localhost ([::1]:43254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5nH8-0004kD-D6
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 04:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33122)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1i5nAW-0007qO-Dl
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 04:31:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1i5nAU-0005rd-Mk
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 04:31:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42476)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1i5nAU-0005rC-CQ
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 04:31:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 94F4610C6976;
 Thu,  5 Sep 2019 08:31:01 +0000 (UTC)
Received: from thuth.com (ovpn-116-96.ams2.redhat.com [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD1385D704;
 Thu,  5 Sep 2019 08:31:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  5 Sep 2019 10:30:48 +0200
Message-Id: <20190905083049.11645-8-thuth@redhat.com>
In-Reply-To: <20190905083049.11645-1-thuth@redhat.com>
References: <20190905083049.11645-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Thu, 05 Sep 2019 08:31:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 7/8] tests/vm: Take the J=x setting into account
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For testing whether the VMs can deal with multiple CPUs correctly,
it is useful to be able to use the "J=<cpus>" setting for the
vm-boot-ssh targets, too.

Message-Id: <20190726100207.19112-1-thuth@redhat.com>
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
-- 
2.18.1


