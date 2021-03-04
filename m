Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A235332D16E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 12:03:20 +0100 (CET)
Received: from localhost ([::1]:52962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHllH-0007Dm-OD
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 06:03:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHleV-00015t-Nm
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:56:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHleT-00033L-Vu
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:56:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614855377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5SOwtyN3Zbc4Z927SH0l0jz+6PoxQQXJFaiIPfeFKOQ=;
 b=BXMbpzvjzbNI5GpjhFYcmNS+WY4MWlNOSDC2iXoKnFOQu33ds13QX/c1Nonr6ef5R46VoR
 5Yha9S+/nb1Tany1/seAA3E3GN64Sv6C54wJtBdyMvbQthwqNahEaDJVZXtD3sLxlNxapo
 cOJ2ocFAMwBNZ1E4IpMkJSv9lFQwKyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-ei-ldS5NOou_OcrXB0wmLg-1; Thu, 04 Mar 2021 05:56:15 -0500
X-MC-Unique: ei-ldS5NOou_OcrXB0wmLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0241D80432E;
 Thu,  4 Mar 2021 10:56:14 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A632F5D720;
 Thu,  4 Mar 2021 10:56:11 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] acpi: Set proper maximum size for "etc/acpi/rsdp" blob
Date: Thu,  4 Mar 2021 11:55:54 +0100
Message-Id: <20210304105554.121674-5-david@redhat.com>
In-Reply-To: <20210304105554.121674-1-david@redhat.com>
References: <20210304105554.121674-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's also set a maximum size for "etc/acpi/rsdp", so the maximum
size doesn't get implicitly set based on the initial table size. In my
experiments, the table size was in the range of 22 bytes, so a single
page (== what we used until now) seems to be good enough.

Now that we have defined maximum sizes for all currently used table types,
let's assert that we catch usage with new tables that need a proper maximum
size definition.

Also assert that our initial size does not exceed the maximum size; while
qemu_ram_alloc_internal() properly asserts that the initial RAMBlock size
is <= its maximum size, the result might differ when the host page size
is bigger than 4k.

Suggested-by: Laszlo Ersek <lersek@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/acpi/utils.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/utils.c b/hw/acpi/utils.c
index f2d69a6d92..0c486ea29f 100644
--- a/hw/acpi/utils.c
+++ b/hw/acpi/utils.c
@@ -29,14 +29,19 @@
 MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
                                 GArray *blob, const char *name)
 {
-    uint64_t max_size = 0;
+    uint64_t max_size;
 
     /* Reserve RAM space for tables: add another order of magnitude. */
     if (!strcmp(name, ACPI_BUILD_TABLE_FILE)) {
         max_size = 0x200000;
     } else if (!strcmp(name, ACPI_BUILD_LOADER_FILE)) {
         max_size = 0x10000;
+    } else if (!strcmp(name, ACPI_BUILD_RSDP_FILE)) {
+        max_size = 0x1000;
+    } else {
+        g_assert_not_reached();
     }
+    g_assert(acpi_data_len(blob) <= max_size);
 
     return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
                         name, update, opaque, NULL, true);
-- 
2.29.2


