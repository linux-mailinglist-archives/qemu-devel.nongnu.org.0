Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB4E6339FC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 11:24:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQRI-0008II-HX; Tue, 22 Nov 2022 05:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQRG-0008Ht-I6
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQRE-0004mO-I4
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669112615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YXgILXRzQ35uaiYJ0xWzjDvRkf6Ce/SEEm9XD9ULZtg=;
 b=DDk6GS88QVGFIrZ87H7sSXKwM2IpzkcYlPPmFxh2tw90QltaGQfb9UdCgVYfKZt3blZl6t
 XmTII/+7Ylq0kcfQDiGRaTU4w6htQK4Myg5sO9jj4qLQo39MYvCKEM0/i3EmIiC4+9YFsr
 zpJ19s/N0AVJSjKP8BRzHnflk6gRLi8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-211-wzQdfJxdPx2thOKPocaQIw-1; Tue, 22 Nov 2022 05:23:34 -0500
X-MC-Unique: wzQdfJxdPx2thOKPocaQIw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m14-20020a7bcb8e000000b003cfcff0057eso3914008wmi.9
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 02:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YXgILXRzQ35uaiYJ0xWzjDvRkf6Ce/SEEm9XD9ULZtg=;
 b=Rgor+jyhTPY+JILiUcALXCgEWd9iZSowYYT0l6qwARATXNcESobn/33OnV6NLYamLE
 +SuC/z7hUG5FG3bE3Dd9zKtFYDNs/mBax22KqlNye1zqp5+sFZzUbIjajuVyDad2q18i
 NDMcENxlVg42ta5KIvJtB97wjo2XWir7eRVRPmaJ0BI5Gzr+uEWusQ8sJPXMnCqZzqh2
 TaVhSokbeW4S22vRIpNAFZfM58du4NBeffo5hTP05QeX23I1Pv5bUnX4RF4zT68o5067
 u7fSEa8/i+CzlFYrTGZK0b8br0PaP4UnlRQZrlQhq18cK4E8Dg6mYltnyDQAo1wHLJtk
 vwvg==
X-Gm-Message-State: ANoB5pk8V4ynhHA9RDsKBX6CFknrXxZAnkWURhv/ZXpcfMjGSbbPlM+W
 2snc41ZypDIFbvdn8uimPiNefWBSQERUyr52fqItGb5I0rHCigc2Qsv73t7QdvL33jxHhu5V3QZ
 krLmMLOx60v3fLthTpZJmSEqk2+7N7WHnfeAvlQzn0/dORVi4GzRAYkgy3cbe
X-Received: by 2002:a05:6000:501:b0:22c:d27d:12e4 with SMTP id
 a1-20020a056000050100b0022cd27d12e4mr13269459wrf.546.1669112613189; 
 Tue, 22 Nov 2022 02:23:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf66eF20OFaT3eJq7SHUABzTfm/KE2EkPDq5xZJIXoTt+e6JbL4F+OFjH8Ti6LUnSHSqGamzCg==
X-Received: by 2002:a05:6000:501:b0:22c:d27d:12e4 with SMTP id
 a1-20020a056000050100b0022cd27d12e4mr13269443wrf.546.1669112612842; 
 Tue, 22 Nov 2022 02:23:32 -0800 (PST)
Received: from redhat.com ([2.52.21.254]) by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c315000b003cff309807esm22496031wmo.23.2022.11.22.02.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 02:23:32 -0800 (PST)
Date: Tue, 22 Nov 2022 05:23:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 3/8] acpi: x86: move RPQx field back to _SB scope
Message-ID: <20221122102227.6603-4-mst@redhat.com>
References: <20221122102227.6603-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221122102227.6603-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

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
Message-Id: <20221121153613.3972225-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


