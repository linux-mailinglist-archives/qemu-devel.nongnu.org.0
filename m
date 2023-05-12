Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0029E70083C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:42:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxS54-0007gd-QL; Fri, 12 May 2023 08:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pxS52-0007fM-1N
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:41:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pxS50-0006V7-Kl
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:41:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683895262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r2BccYoOx2k0HwjA4DwjvxxZAuhnf8jscG4McHG5l/Y=;
 b=dxaBm7nmiAltGVGU24BRYWGXwWTudNwWe/H2764Mffpci0i3b3xPX25MtB2mMAl7EkFD8X
 WwYMlLgX2Xw4ZToGXHo55IldneE7LpDQpsxsOUhgorJv8NqN4MaFHzvbTjdnpQMfjuWt3L
 PlKqmINftQ4AfGhnFCu+8Rg7zT7sAI8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-29cwMG5tN8Oev6j0H-s9JA-1; Fri, 12 May 2023 08:40:58 -0400
X-MC-Unique: 29cwMG5tN8Oev6j0H-s9JA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 525DE185A79C;
 Fri, 12 May 2023 12:40:58 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FE391121314;
 Fri, 12 May 2023 12:40:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 12/18] tests/qtest/usb-hcd-uhci-test: Skip test if UHCI
 controller is not available
Date: Fri, 12 May 2023 14:40:27 +0200
Message-Id: <20230512124033.502654-13-thuth@redhat.com>
In-Reply-To: <20230512124033.502654-1-thuth@redhat.com>
References: <20230512124033.502654-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The test is already fenced with CONFIG_USB_UHCI in meson.build, but in
case we build the ppc or mips targets in parallel, this config switch
is still set in "config_all_devices" and thus the test is still run.
Thus we need an explicit additional check here before adding the tests
to the test plan.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/usb-hcd-uhci-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/usb-hcd-uhci-test.c b/tests/qtest/usb-hcd-uhci-test.c
index f264d2bf73..84ac2f3c1a 100644
--- a/tests/qtest/usb-hcd-uhci-test.c
+++ b/tests/qtest/usb-hcd-uhci-test.c
@@ -66,6 +66,11 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
 
+    if (!qtest_has_device("piix3-usb-uhci")) {
+        g_debug("piix3-usb-uhci not available");
+        return 0;
+    }
+
     qtest_add_func("/uhci/pci/init", test_uhci_init);
     qtest_add_func("/uhci/pci/port1", test_port_1);
     qtest_add_func("/uhci/pci/hotplug", test_uhci_hotplug);
-- 
2.31.1


