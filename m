Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F0D2E10A1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 00:46:30 +0100 (CET)
Received: from localhost ([::1]:50182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krrML-0004jC-A9
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 18:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1krrGB-0000Np-59
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 18:40:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1krrG6-0005HF-UE
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 18:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608680393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zPDTtMuVWH7cDEENau1hatGQ/3PgZ39Wy4zAGtqhPTg=;
 b=FklzqYSp2qws8TYrNtLuRTVBTH9e//AeELOu47DjyIINe56TD2DKZh/fgvIFfGAjpkK5ik
 Zo0WkwZoK4f+r8+wt9Fp90uJoUDyoEk2ZZYcLa1X3r9iTOILqkItpVUelJd2wDY1HQxqlX
 3f6waEDuedq8XuGE6TjBv/wHHBCVHHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-2UA1hzGpMviH7O3lNoeHWw-1; Tue, 22 Dec 2020 18:39:51 -0500
X-MC-Unique: 2UA1hzGpMviH7O3lNoeHWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3422D87315D;
 Tue, 22 Dec 2020 23:39:50 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0ED485D9CC;
 Tue, 22 Dec 2020 23:39:48 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 1/5] acpi: add aml_to_decimalstring() and aml_call6() helpers
Date: Tue, 22 Dec 2020 18:39:30 -0500
Message-Id: <20201222233934.451578-2-imammedo@redhat.com>
In-Reply-To: <20201222233934.451578-1-imammedo@redhat.com>
References: <20201222233934.451578-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
index e727bea1bc..695b7e6323 100644
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
index f976aa667b..89702be788 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -633,6 +633,19 @@ Aml *aml_to_buffer(Aml *src, Aml *dst)
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
@@ -834,6 +847,21 @@ Aml *aml_call5(const char *method, Aml *arg1, Aml *arg2, Aml *arg3, Aml *arg4,
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


