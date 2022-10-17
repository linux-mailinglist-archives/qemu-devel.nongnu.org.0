Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ACE600C80
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 12:33:10 +0200 (CEST)
Received: from localhost ([::1]:44484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okNQi-0006ao-4n
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 06:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1okNG2-0005bj-VD
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:22:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1okNFy-0002kE-NB
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:22:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666002122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KgrKDRWXMmYjbZgU0jd7WXT8e+ulTsPdEGRzK4nKc3M=;
 b=TAygF1NdYd+x4qPu5q5fk47WPWLBCl6j50eYAx91xiPkps95Wu8FsjvIk8TebJIfEoGKJu
 JZXGX5fnvtz/0HjGPi/Uxyz6qhy+pV4zbOAIvPkprqCUZeyUfy7y3qJmP6pdmcGLD7LJQI
 W8xRSE2Vc+qE8kb16pnVfRou5uUYUM8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-BsWNpl0WMCahRy7THcjb6Q-1; Mon, 17 Oct 2022 06:22:00 -0400
X-MC-Unique: BsWNpl0WMCahRy7THcjb6Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D98F185A7AC;
 Mon, 17 Oct 2022 10:22:00 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC233492B04;
 Mon, 17 Oct 2022 10:21:59 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca
Subject: [PATCH 06/11] acpi: add get_dev_aml_func() helper
Date: Mon, 17 Oct 2022 12:21:41 +0200
Message-Id: <20221017102146.2254096-7-imammedo@redhat.com>
In-Reply-To: <20221017102146.2254096-1-imammedo@redhat.com>
References: <20221017102146.2254096-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It will be used in followup commits to figure out if
device has it's own, device specific AML block.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/acpi_aml_interface.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/hw/acpi/acpi_aml_interface.h b/include/hw/acpi/acpi_aml_interface.h
index ab76f0e55d..436da069d6 100644
--- a/include/hw/acpi/acpi_aml_interface.h
+++ b/include/hw/acpi/acpi_aml_interface.h
@@ -29,11 +29,20 @@ struct AcpiDevAmlIfClass {
     dev_aml_fn build_dev_aml;
 };
 
-static inline void call_dev_aml_func(DeviceState *dev, Aml *scope)
+static inline dev_aml_fn get_dev_aml_func(DeviceState *dev)
 {
     if (object_dynamic_cast(OBJECT(dev), TYPE_ACPI_DEV_AML_IF)) {
         AcpiDevAmlIfClass *klass = ACPI_DEV_AML_IF_GET_CLASS(dev);
-        klass->build_dev_aml(ACPI_DEV_AML_IF(dev), scope);
+        return klass->build_dev_aml;
+    }
+    return NULL;
+}
+
+static inline void call_dev_aml_func(DeviceState *dev, Aml *scope)
+{
+    dev_aml_fn fn = get_dev_aml_func(dev);
+    if (fn) {
+        fn(ACPI_DEV_AML_IF(dev), scope);
     }
 }
 
-- 
2.31.1


