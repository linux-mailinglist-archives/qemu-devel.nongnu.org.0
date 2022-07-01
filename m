Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDB056347B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 15:42:36 +0200 (CEST)
Received: from localhost ([::1]:60636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Gup-0001hc-Ig
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 09:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o7Go3-000148-Uw
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:35:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o7Gnz-0004rF-P3
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656682531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3p1C3yYCjfpCuLRtFlBMP2uD93sna5kkLszqPPmS0TQ=;
 b=cP71aFkitIlJo7+K81IiaG8CsUsW80YcYrGtwDiRoBrTI115mSAfLRx5V8lMaSkK3PfmOp
 bx1bGIBM5vSB04Tmce/sEmRq7cIKkleYEmXsz8N3P0xj9dBJLdLRMqXnfrG5NCYZFEul0v
 THfsXjuT6A3GTxvbkUQs1jOiV6bEUfw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-K4zpBsyhPqSnsZEoztCckA-1; Fri, 01 Jul 2022 09:35:27 -0400
X-MC-Unique: K4zpBsyhPqSnsZEoztCckA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95B2D1C0CE6E;
 Fri,  1 Jul 2022 13:35:27 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0928140E7F28;
 Fri,  1 Jul 2022 13:35:26 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca
Subject: [PATCH 12/17] x86: pci: acpi: reorder Device's _ADR and _SUN fields
Date: Fri,  1 Jul 2022 09:35:10 -0400
Message-Id: <20220701133515.137890-13-imammedo@redhat.com>
In-Reply-To: <20220701133515.137890-1-imammedo@redhat.com>
References: <20220701133515.137890-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

no functional change, align order of fields in empty slot
descriptor with a populated slot ordering.
Expected diff:
  -                Name (_SUN, 0x0X)  // _SUN: Slot User Number
                   Name (_ADR, 0xY)  // _ADR: Address
  ...
  +                Name (_SUN, 0xX)  // _SUN: Slot User Number

that will eliminate contextual changes (causing test failures)
when follow up patches merge code generating populated and empty
slots descriptors.

Put mandatory _ADR as the 1st field, then ASUN as it can be
present for both pupulated and empty slots and only then _SUN
which is present only when slot is hotpluggable.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 36fe43c52f..fd7f3253e5 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -442,8 +442,8 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
                     break;
                 }
                 dev = aml_device("S%.02X", devfn);
-                aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
                 aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
+                aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
                 aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
                 method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
                 aml_append(method,
-- 
2.31.1


