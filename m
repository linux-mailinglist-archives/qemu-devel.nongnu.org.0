Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD761BE078
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 16:15:46 +0200 (CEST)
Received: from localhost ([::1]:55612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTnV3-0002fL-2w
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 10:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42544)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jTnGp-0002Ov-Po
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 10:01:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jTnGL-00043f-QR
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 10:01:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50077
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jTnGL-00043S-CK
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 10:00:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588168832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5eleDN6DsLA6DYusavg7UDhHoUtm8pXBb0dPnybbnM=;
 b=J9PvuYpiwI6hup18z69b2i4Bm0cZ/NaXMw5Brvv3nMGYbBOtUdSTkgS/MgkBEQ/COpi5Ii
 6J35VegP5nUKcLCiagofzrIXAI6b/YYgpWfNkL/4I4aDVplua8LkynVbe//e/7XT6HblMJ
 CBgS/r+Gl2thRH7BTgv2xbq5pmUrV6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-18swSLtDOVOBHjqFohHjtA-1; Wed, 29 Apr 2020 10:00:20 -0400
X-MC-Unique: 18swSLtDOVOBHjqFohHjtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECD128BEE85;
 Wed, 29 Apr 2020 14:00:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B36F66070;
 Wed, 29 Apr 2020 14:00:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 325759D9B; Wed, 29 Apr 2020 16:00:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/15] acpi: add aml builder stubs
Date: Wed, 29 Apr 2020 15:59:50 +0200
Message-Id: <20200429140003.7336-3-kraxel@redhat.com>
In-Reply-To: <20200429140003.7336-1-kraxel@redhat.com>
References: <20200429140003.7336-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 01:18:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Needed when moving aml builder code to devices.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/aml-build-stub.c | 79 ++++++++++++++++++++++++++++++++++++++++
 hw/acpi/Makefile.objs    |  4 +-
 2 files changed, 81 insertions(+), 2 deletions(-)
 create mode 100644 hw/acpi/aml-build-stub.c

diff --git a/hw/acpi/aml-build-stub.c b/hw/acpi/aml-build-stub.c
new file mode 100644
index 000000000000..58b2e162277f
--- /dev/null
+++ b/hw/acpi/aml-build-stub.c
@@ -0,0 +1,79 @@
+/*
+ * ACPI aml builder stubs for platforms that don't support ACPI.
+ *
+ * Copyright (c) 2006 Fabrice Bellard
+ * Copyright (c) 2016 Red Hat, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/aml-build.h"
+
+void aml_append(Aml *parent_ctx, Aml *child)
+{
+}
+
+Aml *aml_resource_template(void)
+{
+    return NULL;
+}
+
+Aml *aml_device(const char *name_format, ...)
+{
+    return NULL;
+}
+
+Aml *aml_eisaid(const char *str)
+{
+    return NULL;
+}
+
+Aml *aml_name_decl(const char *name, Aml *val)
+{
+    return NULL;
+}
+
+Aml *aml_io(AmlIODecode dec, uint16_t min_base, uint16_t max_base,
+            uint8_t aln, uint8_t len)
+{
+    return NULL;
+}
+
+Aml *aml_irq_no_flags(uint8_t irq)
+{
+    return NULL;
+}
+
+Aml *aml_int(const uint64_t val)
+{
+    return NULL;
+}
+
+Aml *aml_package(uint8_t num_elements)
+{
+    return NULL;
+}
+
+Aml *aml_dma(AmlDmaType typ, AmlDmaBusMaster bm, AmlTransferSize sz,
+             uint8_t channel)
+{
+    return NULL;
+}
+
+Aml *aml_buffer(int buffer_size, uint8_t *byte_list)
+{
+    return NULL;
+}
diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
index 777da07f4d70..cab9bcd457dc 100644
--- a/hw/acpi/Makefile.objs
+++ b/hw/acpi/Makefile.objs
@@ -20,6 +20,6 @@ common-obj-$(CONFIG_TPM) +=3D tpm.o
 common-obj-$(CONFIG_IPMI) +=3D ipmi.o
 common-obj-$(call lnot,$(CONFIG_IPMI)) +=3D ipmi-stub.o
 else
-common-obj-y +=3D acpi-stub.o
+common-obj-y +=3D acpi-stub.o aml-build-stub.o
 endif
-common-obj-$(CONFIG_ALL) +=3D acpi-stub.o acpi-x86-stub.o ipmi-stub.o
+common-obj-$(CONFIG_ALL) +=3D acpi-stub.o aml-build-stub.o acpi-x86-stub.o=
 ipmi-stub.o
--=20
2.18.2


