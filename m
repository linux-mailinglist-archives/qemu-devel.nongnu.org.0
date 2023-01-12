Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C0A667780
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:44:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBP-0002L9-86; Thu, 12 Jan 2023 09:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBG-0002Et-GU
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBB-0005y1-Ne
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3HY/sdzrVRQnzygoIwtu86GBD7w7rHZZZ9ArsNoKKw=;
 b=e/oePyu7vOsivQuwwtu2mflI/TVqOHUozWi/hV+6zQeQiWDs02tgxorWhnJy0GvUk5YRGu
 zWb+akm5FRctkSXtiwFrjVtmKqHa1KyCOxV50nG49Vr7mdL5eFsInDts4mXnYgqpYO5LFR
 k542GNr+ms0zJbIq/LzNwYigIZDmjww=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-ZlDrrf3zP7ScDrL4OyJA9w-1; Thu, 12 Jan 2023 09:03:36 -0500
X-MC-Unique: ZlDrrf3zP7ScDrL4OyJA9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDC7F88B7A7;
 Thu, 12 Jan 2023 14:03:35 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38FD64085720;
 Thu, 12 Jan 2023 14:03:35 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 27/40] x86: pcihp: acpi: prepare slot ignore rule to work with
 self describing bridges
Date: Thu, 12 Jan 2023 15:02:59 +0100
Message-Id: <20230112140312.3096331-28-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Before switching pci bridges to AcpiDevAmlIf interface, ensure that
ignored slots are handled correctly.
(existing rule works but only if bridge doesn't have AcpiDevAmlIf interface).
While at it rewrite related comments to be less confusing (hopefully).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 9edd7bf38e..466f90c9e6 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -425,14 +425,22 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             hotpluggbale_slot = bsel && dc->hotpluggable &&
                                 !cold_plugged_bridge;
 
-            /*
-             * allow describing coldplugged bridges in ACPI even if they are not
-             * on function 0, as they are not unpluggable, for all other devices
-             * generate description only for function 0 per slot, and for other
-             * functions if device on function provides its own AML
-             */
-            if (func && !bridge_in_acpi && !get_dev_aml_func(DEVICE(pdev))) {
-                continue;
+            if (func) {
+                if (IS_PCI_BRIDGE(pdev)) {
+                    /*
+                     * Ignore only hotplugged PCI bridges on !0 functions, but
+                     * allow describing cold plugged bridges on all functions
+                     */
+                    if (DEVICE(pdev)->hotplugged) {
+                        continue;
+                    }
+                } else if (!get_dev_aml_func(DEVICE(pdev))) {
+                    /*
+                     * Ignore all other devices on !0 functions unless they
+                     * have AML description (i.e have get_dev_aml_func() != 0)
+                     */
+                    continue;
+                }
             }
         } else {
             /*
-- 
2.31.1


