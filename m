Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8E720F4A8
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 14:32:06 +0200 (CEST)
Received: from localhost ([::1]:44044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqFQj-0005GV-ON
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 08:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jqFOt-00044x-OQ
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 08:30:11 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33430
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jqFOr-0003SD-Tf
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 08:30:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593520209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nf2jiKcgao0KRB8jp6YKGOLtoeAw61e09YX+V3F/S9o=;
 b=czRrxgAVWI2EqE28Wd2CEPRQYpmVxxAJ11Wr/8uNuZSaLv8u0AOl1yE6O23Wt6l/1pI+/P
 VSES7lYI1uPEUg+r/jUgBgT74cKbyBROzhXtiuKvmuEalpkIVaDL+J/ZXW+7W2ZzRl7ZPt
 Lt9hZWM8WWWWrmIf7SIx9EjHF17yEAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-TGVF1GlwNBaNpnmwuv3oog-1; Tue, 30 Jun 2020 08:30:05 -0400
X-MC-Unique: TGVF1GlwNBaNpnmwuv3oog-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8E5F104ECFE;
 Tue, 30 Jun 2020 12:29:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32D335C66E;
 Tue, 30 Jun 2020 12:29:45 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 2/9] pci-host: add pcie-msi read method
Date: Tue, 30 Jun 2020 17:57:03 +0530
Message-Id: <20200630122710.1119158-3-ppandit@redhat.com>
In-Reply-To: <20200630122710.1119158-1-ppandit@redhat.com>
References: <20200630122710.1119158-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 02:00:02
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Lei Sun <slei.casper@gmail.com>, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Add pcie-msi mmio read method to avoid NULL pointer dereference
issue.

Reported-by: Lei Sun <slei.casper@gmail.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/pci-host/designware.c | 9 +++++++++
 1 file changed, 9 insertions(+)

Update v3: Add Reviewed-by: ...
  -> https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg09400.html

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 8492c18991..82262bdfdf 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/log.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_host.h"
@@ -63,6 +64,13 @@ designware_pcie_root_to_host(DesignwarePCIERoot *root)
     return DESIGNWARE_PCIE_HOST(bus->parent);
 }
 
+static uint64_t designware_pcie_root_msi_read(void *opaque, hwaddr addr,
+                                              unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s not implemented\n", __func__);
+    return 0;
+}
+
 static void designware_pcie_root_msi_write(void *opaque, hwaddr addr,
                                            uint64_t val, unsigned len)
 {
@@ -77,6 +85,7 @@ static void designware_pcie_root_msi_write(void *opaque, hwaddr addr,
 }
 
 static const MemoryRegionOps designware_pci_host_msi_ops = {
+    .read = designware_pcie_root_msi_read,
     .write = designware_pcie_root_msi_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
-- 
2.26.2


