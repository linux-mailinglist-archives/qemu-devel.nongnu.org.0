Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083845289E6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:12:05 +0200 (CEST)
Received: from localhost ([::1]:54246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdKG-0003ZA-2x
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqccc-0004v5-OW
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqccb-0006KF-4d
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652714816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=po3QKxnkXcMIWewvHkBgJ3oVIkMlPH/ZZAI9027xDSE=;
 b=P/j8qgf1TjyFxnYZrusalJKe8nSxxhrhRHI5vui6XyOYn6Ogb/3TT78N3gGFPkECcGVeDK
 X8614VkNgNis8fTJOQcIcM+OjVHv9Sr/dDnmpFCQO6ASSAUdyHAWksKbKZcdy0PhBnRDvt
 fTXE9dF2xDFnMOaYkgDQOm/JaSrnngM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-rH0KpOpRNs6ylHPNl11rsQ-1; Mon, 16 May 2022 11:26:55 -0400
X-MC-Unique: rH0KpOpRNs6ylHPNl11rsQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C830029ABA0F;
 Mon, 16 May 2022 15:26:54 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AED59492C14;
 Mon, 16 May 2022 15:26:53 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Subject: [PATCH 31/35] acpi: pc/q35: tpm-tis: fix TPM device scope
Date: Mon, 16 May 2022 11:26:06 -0400
Message-Id: <20220516152610.1963435-32-imammedo@redhat.com>
In-Reply-To: <20220516152610.1963435-1-imammedo@redhat.com>
References: <20220516152610.1963435-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

tpm-tis, is not a PCI device but ISA one, move it
under ISA scope to fix incorrect placement.

Fixes: 24cf5413aa0 (acpi: Make TPM 2.0 with TIS available as MSFT0101)
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a42f41f373..85a7313cad 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1764,15 +1764,14 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
 #ifdef CONFIG_TPM
             if (TPM_IS_TIS_ISA(tpm)) {
+                dev = aml_device("ISA.TPM");
                 if (misc->tpm_version == TPM_VERSION_2_0) {
-                    dev = aml_device("TPM");
                     aml_append(dev, aml_name_decl("_HID",
                                                   aml_string("MSFT0101")));
                     aml_append(dev,
                                aml_name_decl("_STR",
                                              aml_string("TPM 2.0 Device")));
                 } else {
-                    dev = aml_device("ISA.TPM");
                     aml_append(dev, aml_name_decl("_HID",
                                                   aml_eisaid("PNP0C31")));
                 }
-- 
2.31.1


