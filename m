Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6159207189
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 12:53:46 +0200 (CEST)
Received: from localhost ([::1]:56746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo32H-0004yd-Nv
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 06:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jo2zc-0000nj-Jd
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:51:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56684
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jo2za-0001B8-Cr
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:51:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592995857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhRxMbOaLQYAJuVE9Lz+Ebq4ZowpOqvvxaz28eKqdPk=;
 b=gZlYvu9AzvKRqmJxQJR2B6ZzsLTBDpthK/kM81nXlWYnVTAFQoU3CE+Js4BrqxICaxzSRt
 vY8rTK4XO+30UNJoCjBjcB+/fdAO/Bsyo9ntZaWKwjhWwM2Ofs3Z3kjElZuZtOpYgJP99b
 K0ljkp6Oc0S0uu+bCoATbWnJOtpl76Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-O54kM9ijO-WUyhcs9TzOrQ-1; Wed, 24 Jun 2020 06:50:54 -0400
X-MC-Unique: O54kM9ijO-WUyhcs9TzOrQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADED0106B242
 for <qemu-devel@nongnu.org>; Wed, 24 Jun 2020 10:50:53 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 414711DC;
 Wed, 24 Jun 2020 10:50:53 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/31] libqos: usb-hcd-ehci: use 32-bit write for config
 register
Date: Wed, 24 Jun 2020 06:50:20 -0400
Message-Id: <20200624105048.375353-3-pbonzini@redhat.com>
In-Reply-To: <20200624104917.375143-1-pbonzini@redhat.com>
References: <20200624104917.375143-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The memory region ops have min_access_size == 4 so obey it.

Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/usb-hcd-ehci-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/usb-hcd-ehci-test.c b/tests/qtest/usb-hcd-ehci-test.c
index 5251d539e9..c51e8bb223 100644
--- a/tests/qtest/usb-hcd-ehci-test.c
+++ b/tests/qtest/usb-hcd-ehci-test.c
@@ -96,7 +96,7 @@ static void pci_ehci_port_1(void)
 static void pci_ehci_config(void)
 {
     /* hands over all ports from companion uhci to ehci */
-    qpci_io_writew(ehci1.dev, ehci1.bar, 0x60, 1);
+    qpci_io_writel(ehci1.dev, ehci1.bar, 0x60, 1);
 }
 
 static void pci_uhci_port_2(void)
-- 
2.26.2



