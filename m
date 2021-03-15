Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3AC33C5B9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:33:48 +0100 (CET)
Received: from localhost ([::1]:38328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLs2F-0003Qw-Sr
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lLrX4-0001Ly-Bs
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:01:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lLrX2-0008T9-Bm
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:01:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615831291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KCQD1VbP/El2QMv+N/Bo91+TjtRK+FqTRcECwRqos0=;
 b=OCJ64WzXgB05t/Lp+zomNFufoOoxQRTKpjSU0DJ6vA2x3vG30e8siT+ZzDf+EsEnx0xq+s
 PZYNTOi6iszF7q2PO+YWkTx2yLhnMk9d65IVpvPipM6dyLMMu7mbRxnW8dBRt9SnLZeEwA
 RB2ENYj3a2FJhRGRwnqyXabEp2fSGBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-EzfHAUj8ObG0Q1RjRx1kQQ-1; Mon, 15 Mar 2021 14:01:29 -0400
X-MC-Unique: EzfHAUj8ObG0Q1RjRx1kQQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A26880159F
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 18:01:15 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B0D9620DE;
 Mon, 15 Mar 2021 18:01:14 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] acpi: add aml_to_decimalstring() and aml_call6() helpers
Date: Mon, 15 Mar 2021 14:01:00 -0400
Message-Id: <20210315180102.3008391-5-imammedo@redhat.com>
In-Reply-To: <20210315180102.3008391-1-imammedo@redhat.com>
References: <20210315180102.3008391-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: jusual@redhat.com, laine@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it will be used by follow up patches

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/aml-build.h |  3 +++
 hw/acpi/aml-build.c         | 28 ++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 380d3e3924..e652106e26 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -301,6 +301,7 @@ Aml *aml_arg(int pos);
 Aml *aml_to_integer(Aml *arg);
 Aml *aml_to_hexstring(Aml *src, Aml *dst);
 Aml *aml_to_buffer(Aml *src, Aml *dst);
+Aml *aml_to_decimalstring(Aml *src, Aml *dst);
 Aml *aml_store(Aml *val, Aml *target);
 Aml *aml_and(Aml *arg1, Aml *arg2, Aml *dst);
 Aml *aml_or(Aml *arg1, Aml *arg2, Aml *dst);
@@ -323,6 +324,8 @@ Aml *aml_call3(const char *method, Aml *arg1, Aml *arg2, Aml *arg3);
 Aml *aml_call4(const char *method, Aml *arg1, Aml *arg2, Aml *arg3, Aml *arg4);
 Aml *aml_call5(const char *method, Aml *arg1, Aml *arg2, Aml *arg3, Aml *arg4,
                Aml *arg5);
+Aml *aml_call6(const char *method, Aml *arg1, Aml *arg2, Aml *arg3, Aml *arg4,
+               Aml *arg5, Aml *arg6);
 Aml *aml_gpio_int(AmlConsumerAndProducer con_and_pro,
                   AmlLevelAndEdge edge_level,
                   AmlActiveHighAndLow active_level, AmlShared shared,
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index a2cd7a5830..d33ce8954a 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -634,6 +634,19 @@ Aml *aml_to_buffer(Aml *src, Aml *dst)
     return var;
 }
 
+/* ACPI 2.0a: 17.2.4.4 Type 2 Opcodes Encoding: DefToDecimalString */
+Aml *aml_to_decimalstring(Aml *src, Aml *dst)
+{
+    Aml *var = aml_opcode(0x97 /* ToDecimalStringOp */);
+    aml_append(var, src);
+    if (dst) {
+        aml_append(var, dst);
+    } else {
+        build_append_byte(var->buf, 0x00 /* NullNameOp */);
+    }
+    return var;
+}
+
 /* ACPI 1.0b: 16.2.5.4 Type 2 Opcodes Encoding: DefStore */
 Aml *aml_store(Aml *val, Aml *target)
 {
@@ -835,6 +848,21 @@ Aml *aml_call5(const char *method, Aml *arg1, Aml *arg2, Aml *arg3, Aml *arg4,
     return var;
 }
 
+/* helper to call method with 5 arguments */
+Aml *aml_call6(const char *method, Aml *arg1, Aml *arg2, Aml *arg3, Aml *arg4,
+               Aml *arg5, Aml *arg6)
+{
+    Aml *var = aml_alloc();
+    build_append_namestring(var->buf, "%s", method);
+    aml_append(var, arg1);
+    aml_append(var, arg2);
+    aml_append(var, arg3);
+    aml_append(var, arg4);
+    aml_append(var, arg5);
+    aml_append(var, arg6);
+    return var;
+}
+
 /*
  * ACPI 5.0: 6.4.3.8.1 GPIO Connection Descriptor
  * Type 1, Large Item Name 0xC
-- 
2.27.0


