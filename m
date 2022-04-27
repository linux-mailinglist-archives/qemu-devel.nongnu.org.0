Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CED511882
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 15:50:39 +0200 (CEST)
Received: from localhost ([::1]:52868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nji3y-0006ez-Q6
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 09:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nji2f-00054n-Rk
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 09:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nji2d-0001GX-HP
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 09:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651067354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ftE+IzxEayZLjktE4fm1VYiMzvXBDlMK4UWinfe0zTw=;
 b=ciDOatbL0xkvm2042mn9Tl8G/AvVer5tuLWPm72pjaBOE+GMRaAvLDmZdSbVpLF1il53ZS
 a0o62/HC3iLBIenUiglUS8cFq+0lvveNQTFA7fIE3xsKMrI/SxS5PXZlWTYrEnIClU/xYC
 +aKgccMu48PHq35LskH0bej2fQiBle0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482--DVYMvjxPVickNv9XmGH7w-1; Wed, 27 Apr 2022 09:49:09 -0400
X-MC-Unique: -DVYMvjxPVickNv9XmGH7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46537185A7A4;
 Wed, 27 Apr 2022 13:49:09 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2CDB401199C;
 Wed, 27 Apr 2022 13:49:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-options: Limit the -enable-kvm option to the targets
 that support it
Date: Wed, 27 Apr 2022 15:49:06 +0200
Message-Id: <20220427134906.348118-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-trivial@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>, Marcelo Tosatti <mtosatti@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no need to present the user with -enable-kvm if there
is no support for KVM on the corresponding target.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-options.hx | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index cc3a39d21a..af1c8feda6 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4176,7 +4176,9 @@ SRST
 ERST
 
 DEF("enable-kvm", 0, QEMU_OPTION_enable_kvm, \
-    "-enable-kvm     enable KVM full virtualization support\n", QEMU_ARCH_ALL)
+    "-enable-kvm     enable KVM full virtualization support\n",
+    QEMU_ARCH_ARM | QEMU_ARCH_I386 | QEMU_ARCH_MIPS | QEMU_ARCH_PPC |
+    QEMU_ARCH_RISCV | QEMU_ARCH_S390X)
 SRST
 ``-enable-kvm``
     Enable KVM full virtualization support. This option is only
-- 
2.27.0


