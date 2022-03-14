Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14584D88E3
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 17:11:02 +0100 (CET)
Received: from localhost ([::1]:58784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTnHh-0007qu-Ps
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 12:11:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nTmuB-00079F-Q0
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:46:43 -0400
Received: from smtp82.ord1d.emailsrvr.com ([184.106.54.82]:39823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nTmu9-0007aN-8W
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:46:42 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp11.relay.ord1d.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id D07C660181; 
 Mon, 14 Mar 2022 11:46:16 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/i386/acpi-build: Avoid 'sun' identifier
Date: Mon, 14 Mar 2022 10:45:57 -0500
Message-Id: <20220314154557.306-3-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220314154557.306-1-adeason@sinenomine.net>
References: <20220314154557.306-1-adeason@sinenomine.net>
X-Classification-ID: 4af82b43-bb37-46e0-ae29-cb6bfb0f992e-3-1
Received-SPF: pass client-ip=184.106.54.82;
 envelope-from=adeason@sinenomine.net; helo=smtp82.ord1d.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 14 Mar 2022 12:09:06 -0400
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Deason <adeason@sinenomine.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Solaris, 'sun' is #define'd to 1, which causes errors if a variable
is named 'sun'. Slightly change the name of the var for the Slot User
Number so we can build on Solaris.

Signed-off-by: Andrew Deason <adeason@sinenomine.net>
---
 hw/i386/acpi-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4ad4d7286c..dcf6ece3d0 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -576,32 +576,32 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
 }
 
 Aml *aml_pci_device_dsm(void)
 {
     Aml *method, *UUID, *ifctx, *ifctx1, *ifctx2, *ifctx3, *elsectx;
     Aml *acpi_index = aml_local(0);
     Aml *zero = aml_int(0);
     Aml *bnum = aml_arg(4);
     Aml *func = aml_arg(2);
     Aml *rev = aml_arg(1);
-    Aml *sun = aml_arg(5);
+    Aml *sunum = aml_arg(5);
 
     method = aml_method("PDSM", 6, AML_SERIALIZED);
 
     /*
      * PCI Firmware Specification 3.1
      * 4.6.  _DSM Definitions for PCI
      */
     UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
     ifctx = aml_if(aml_equal(aml_arg(0), UUID));
     {
-        aml_append(ifctx, aml_store(aml_call2("AIDX", bnum, sun), acpi_index));
+        aml_append(ifctx, aml_store(aml_call2("AIDX", bnum, sunum), acpi_index));
         ifctx1 = aml_if(aml_equal(func, zero));
         {
             uint8_t byte_list[1];
 
             ifctx2 = aml_if(aml_equal(rev, aml_int(2)));
             {
                 /*
                  * advertise function 7 if device has acpi-index
                  * acpi_index values:
                  *            0: not present (default value)
-- 
2.11.0


