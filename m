Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFE66A8613
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:18:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlbk-00077U-Ok; Thu, 02 Mar 2023 11:16:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlbF-0006F0-QE
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:16:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlbB-0000Kj-Dd
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677773759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bcmg0jaxFyqFEMiKKeBfQBz8lQ1fHakYeaIW0tuP6eQ=;
 b=bUT1gpDmfgIkqosS7FiM4EmTNZ2YBqQYZ8q4Mtg7YG7NLHTNhg1fMo8Ekxy5InN6A7A4C4
 Eqjx22O9xAE2DUUm3E0fItc4mfGBSrvSH8qXlbs1qERp0tFiZcj/jWC5Nlq+c4igLMFWNs
 AiQL95qfSCil/DgCmJO0xKTi/uMhYgs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-Pw-lu_P5MBGXbn_0FaBJUw-1; Thu, 02 Mar 2023 11:15:56 -0500
X-MC-Unique: Pw-lu_P5MBGXbn_0FaBJUw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DE9880D0F0
 for <qemu-devel@nongnu.org>; Thu,  2 Mar 2023 16:15:56 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17851140EBF6;
 Thu,  2 Mar 2023 16:15:55 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 14/34] pcihp: move PCI _DSM function 0 prolog into separate
 function
Date: Thu,  2 Mar 2023 17:15:23 +0100
Message-Id: <20230302161543.286002-15-imammedo@redhat.com>
In-Reply-To: <20230302161543.286002-1-imammedo@redhat.com>
References: <20230302161543.286002-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

it will be reused by follow up patches that will implement
static _DSM for non-hotpluggable devices.

no functional AML change, only context one, where 'cap' (Local1)
initialization is moved after UUID/revision checks.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 54 ++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index c691104d47..d8ec91b8e3 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -373,6 +373,33 @@ Aml *aml_pci_device_dsm(void)
     return method;
 }
 
+static void build_append_pci_dsm_func0_common(Aml *ctx, Aml *retvar)
+{
+    Aml *UUID, *ifctx1;
+    uint8_t byte_list[1] = { 0 }; /* nothing supported yet */
+
+    aml_append(ctx, aml_store(aml_buffer(1, byte_list), retvar));
+    /*
+     * PCI Firmware Specification 3.1
+     * 4.6.  _DSM Definitions for PCI
+     */
+    UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
+    ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(0), UUID)));
+    {
+        /* call is for unsupported UUID, bail out */
+        aml_append(ifctx1, aml_return(retvar));
+    }
+    aml_append(ctx, ifctx1);
+
+    ifctx1 = aml_if(aml_lless(aml_arg(1), aml_int(2)));
+    {
+        /* call is for unsupported REV, bail out */
+        aml_append(ifctx1, aml_return(retvar));
+    }
+    aml_append(ctx, ifctx1);
+}
+
+
 static void build_append_pcihp_notify_entry(Aml *method, int slot)
 {
     Aml *if_ctx;
@@ -570,14 +597,13 @@ static bool build_append_notfication_callback(Aml *parent_scope,
 
 static Aml *aml_pci_pdsm(void)
 {
-    Aml *method, *UUID, *ifctx, *ifctx1;
+    Aml *method, *ifctx, *ifctx1;
     Aml *ret = aml_local(0);
     Aml *caps = aml_local(1);
     Aml *acpi_index = aml_local(2);
     Aml *zero = aml_int(0);
     Aml *one = aml_int(1);
     Aml *func = aml_arg(2);
-    Aml *rev = aml_arg(1);
     Aml *params = aml_arg(4);
     Aml *bnum = aml_derefof(aml_index(params, aml_int(0)));
     Aml *sunum = aml_derefof(aml_index(params, aml_int(1)));
@@ -587,29 +613,9 @@ static Aml *aml_pci_pdsm(void)
     /* get supported functions */
     ifctx = aml_if(aml_equal(func, zero));
     {
-        uint8_t byte_list[1] = { 0 }; /* nothing supported yet */
-        aml_append(ifctx, aml_store(aml_buffer(1, byte_list), ret));
-        aml_append(ifctx, aml_store(zero, caps));
-
-       /*
-        * PCI Firmware Specification 3.1
-        * 4.6.  _DSM Definitions for PCI
-        */
-        UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
-        ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(0), UUID)));
-        {
-            /* call is for unsupported UUID, bail out */
-            aml_append(ifctx1, aml_return(ret));
-        }
-        aml_append(ifctx, ifctx1);
-
-        ifctx1 = aml_if(aml_lless(rev, aml_int(2)));
-        {
-            /* call is for unsupported REV, bail out */
-            aml_append(ifctx1, aml_return(ret));
-        }
-        aml_append(ifctx, ifctx1);
+        build_append_pci_dsm_func0_common(ifctx, ret);
 
+        aml_append(ifctx, aml_store(zero, caps));
         aml_append(ifctx,
             aml_store(aml_call2("AIDX", bnum, sunum), acpi_index));
         /*
-- 
2.39.1


