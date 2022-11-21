Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C931632859
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 16:37:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox8qW-0002fo-D8; Mon, 21 Nov 2022 10:36:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ox8qU-0002f5-Hk
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:36:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ox8qP-0007sv-Ij
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669044985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oLH8CAr1JNmuEyzN94CvCCahHWeKKGMbmjL8SCL35nA=;
 b=ZXEEFA47fo4VGgcQHQjuV2WHeZxO61rbBWbU5IJECogQqhHPcmgxiAGCpr5ZqBX3ytweXq
 w3Z87DoKLslhM4ShVLCIoBEfHdLgMDNH4yJ9lcfiVMWohq6bkIbR8QHR70j2KYttOtF6xO
 seOf1JQVa55HPHPOoVVZwiQeRwSmunk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-BcTTA9JfNTuOboTRsk2JxA-1; Mon, 21 Nov 2022 10:36:18 -0500
X-MC-Unique: BcTTA9JfNTuOboTRsk2JxA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB706800B23;
 Mon, 21 Nov 2022 15:36:17 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9248492CA4;
 Mon, 21 Nov 2022 15:36:16 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, kraxel@redhat.com,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PATCH for-7.2 2/3] acpi: x86: move RPQx field back to _SB scope
Date: Mon, 21 Nov 2022 16:36:12 +0100
Message-Id: <20221121153613.3972225-3-imammedo@redhat.com>
In-Reply-To: <20221121153613.3972225-1-imammedo@redhat.com>
References: <20221121153613.3972225-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Commit 47a373faa6b2 (acpi: pc/q35: drop ad-hoc PCI-ISA bridge AML routines and let bus ennumeration generate AML)
moved ISA bridge AML generation to respective devices and was using
aml_alias() to provide PRQx fields in _SB. scope. However, it turned
out that SeaBIOS was not able to process Alias opcode when parsing DSDT,
resulting in lack of keyboard during boot (SeaBIOS console, grub, FreeDOS).

While fix for SeaBIOS is posted
  https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/RGPL7HESH5U5JRLEO6FP77CZVHZK5J65/
fixed SeaBIOS might not make into QEMU-7.2 in time.
Hence this workaround that puts PRQx back into _SB scope
and gets rid of aliases in ISA bridge description, so
DSDT will be parsable by broken SeaBIOS.

That brings back hardcoded references to ISA bridge
  PCI0.S08.P40C/PCI0.SF8.PIRQ
where middle part now is auto generated based on slot it's
plugged in, but it should be fine as bridge initialization
also hardcodes PCI address of the bridge so it can't ever
move. Once QEMU tree has fixed SeaBIOS blob, we should be able
to drop this part and revert back to alias based approach

Reported-by: Volker Rümelin <vr_qemu@t-online.de>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
tested with (including hotplug):
  pc: Fedora34x64, WS2003x32, WS2016x64, WS2022
  q35: Fedora34x64, WS2008x64, WS2019x64, WS2022
---
 hw/isa/lpc_ich9.c | 16 ++++------------
 hw/isa/piix3.c    | 12 ++++--------
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 0b0a83e080..6c44cc9767 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -813,12 +813,13 @@ static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     BusChild *kid;
     ICH9LPCState *s = ICH9_LPC_DEVICE(adev);
     BusState *bus = BUS(s->isa_bus);
+    Aml *sb_scope = aml_scope("\\_SB");
 
     /* ICH9 PCI to ISA irq remapping */
     aml_append(scope, aml_operation_region("PIRQ", AML_PCI_CONFIG,
                                            aml_int(0x60), 0x0C));
     /* Fields declarion has to happen *after* operation region */
-    field = aml_field("PIRQ", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
+    field = aml_field("PCI0.SF8.PIRQ", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
     aml_append(field, aml_named_field("PRQA", 8));
     aml_append(field, aml_named_field("PRQB", 8));
     aml_append(field, aml_named_field("PRQC", 8));
@@ -828,17 +829,8 @@ static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     aml_append(field, aml_named_field("PRQF", 8));
     aml_append(field, aml_named_field("PRQG", 8));
     aml_append(field, aml_named_field("PRQH", 8));
-    aml_append(scope, field);
-
-    /* hack: put fields into _SB scope for LNKx to find them */
-    aml_append(scope, aml_alias("PRQA", "\\_SB.PRQA"));
-    aml_append(scope, aml_alias("PRQB", "\\_SB.PRQB"));
-    aml_append(scope, aml_alias("PRQC", "\\_SB.PRQC"));
-    aml_append(scope, aml_alias("PRQD", "\\_SB.PRQD"));
-    aml_append(scope, aml_alias("PRQE", "\\_SB.PRQE"));
-    aml_append(scope, aml_alias("PRQF", "\\_SB.PRQF"));
-    aml_append(scope, aml_alias("PRQG", "\\_SB.PRQG"));
-    aml_append(scope, aml_alias("PRQH", "\\_SB.PRQH"));
+    aml_append(sb_scope, field);
+    aml_append(scope, sb_scope);
 
     QTAILQ_FOREACH(kid, &bus->children, sibling) {
             call_dev_aml_func(DEVICE(kid->child), scope);
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index f9b4af5c05..eabad7ba58 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -318,24 +318,20 @@ static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
     Aml *field;
     BusChild *kid;
+    Aml *sb_scope = aml_scope("\\_SB");
     BusState *bus = qdev_get_child_bus(DEVICE(adev), "isa.0");
 
     /* PIIX PCI to ISA irq remapping */
     aml_append(scope, aml_operation_region("P40C", AML_PCI_CONFIG,
                                            aml_int(0x60), 0x04));
     /* Fields declarion has to happen *after* operation region */
-    field = aml_field("P40C", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
+    field = aml_field("PCI0.S08.P40C", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
     aml_append(field, aml_named_field("PRQ0", 8));
     aml_append(field, aml_named_field("PRQ1", 8));
     aml_append(field, aml_named_field("PRQ2", 8));
     aml_append(field, aml_named_field("PRQ3", 8));
-    aml_append(scope, field);
-
-    /* hack: put fields into _SB scope for LNKx to find them */
-    aml_append(scope, aml_alias("PRQ0", "\\_SB.PRQ0"));
-    aml_append(scope, aml_alias("PRQ1", "\\_SB.PRQ1"));
-    aml_append(scope, aml_alias("PRQ2", "\\_SB.PRQ2"));
-    aml_append(scope, aml_alias("PRQ3", "\\_SB.PRQ3"));
+    aml_append(sb_scope, field);
+    aml_append(scope, sb_scope);
 
     QTAILQ_FOREACH(kid, &bus->children, sibling) {
         call_dev_aml_func(DEVICE(kid->child), scope);
-- 
2.31.1


