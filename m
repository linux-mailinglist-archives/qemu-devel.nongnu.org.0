Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDF02124A6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 15:28:01 +0200 (CEST)
Received: from localhost ([::1]:36250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqzFw-0008LQ-4D
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 09:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqzDj-0004mz-K9
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 09:25:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26553
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqzDg-000770-Gg
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 09:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593696339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3B7D73osJV34ZpW7kqXjjaJizObZ2jBdfEs5A5DbAn0=;
 b=gFzjfq57tKwG8dWGN5V4ZydsuClzi28PQ6bSsKpR/YhO/SmzGzh4bnxV1baP5SFNzcc90V
 pK++OIiWMzDWFxu6P3WSzUOdj4EFMEOk183098Qguwu095iXFueIjYUScFMNy4+VAeFgGT
 1fuklZrmyqsy8uL3TfQ9PWLf6wKfIxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-2VMOCDPFMga6D8VFOZf_hw-1; Thu, 02 Jul 2020 09:25:37 -0400
X-MC-Unique: 2VMOCDPFMga6D8VFOZf_hw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2744F80572F;
 Thu,  2 Jul 2020 13:25:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F25110013D2;
 Thu,  2 Jul 2020 13:25:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2737031E88; Thu,  2 Jul 2020 15:25:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/20] stubs: add pci_create_simple
Date: Thu,  2 Jul 2020 15:25:07 +0200
Message-Id: <20200702132525.6849-3-kraxel@redhat.com>
In-Reply-To: <20200702132525.6849-1-kraxel@redhat.com>
References: <20200702132525.6849-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:00:43
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Needed for -soundhw cleanup.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 stubs/pci-bus.c     | 7 +++++++
 stubs/Makefile.objs | 1 +
 2 files changed, 8 insertions(+)
 create mode 100644 stubs/pci-bus.c

diff --git a/stubs/pci-bus.c b/stubs/pci-bus.c
new file mode 100644
index 000000000000..a8932fa93250
--- /dev/null
+++ b/stubs/pci-bus.c
@@ -0,0 +1,7 @@
+#include "qemu/osdep.h"
+#include "hw/pci/pci.h"
+
+PCIDevice *pci_create_simple(PCIBus *bus, int devfn, const char *name)
+{
+    g_assert_not_reached();
+}
diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index ff0411d21f22..918e46bdc1ca 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -13,6 +13,7 @@ stub-obj-$(CONFIG_LINUX_AIO) += linux-aio.o
 stub-obj-$(CONFIG_LINUX_IO_URING) += io_uring.o
 stub-obj-y += monitor-core.o
 stub-obj-y += notify-event.o
+stub-obj-y += pci-bus.o
 stub-obj-y += qmp_memory_device.o
 stub-obj-y += qtest.o
 stub-obj-y += ramfb.o
-- 
2.18.4


