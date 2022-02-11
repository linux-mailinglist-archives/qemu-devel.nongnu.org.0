Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1044B2C68
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 19:06:27 +0100 (CET)
Received: from localhost ([::1]:35752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIaJO-0001Yp-BA
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 13:06:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIaCU-0003Tx-5H
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 12:59:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIaCS-0006jr-LT
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 12:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644602355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wcn3gBRK6/6VKzHT3P18Rq/BFY2mvRFLMNI6yx9CnAE=;
 b=LezG+I3yCW8K/HoXYRv6ccMaTnSCVZzr9XITmNesCuix6vF+9F4DDm/WOd/Edu1yzB9Plb
 bdH8+f0NTZ3l2AduUW2mkvnjvT0exALAfO5KOnrKqxY3RzUtvIWD6z91q1tTH5Vbw0CmuX
 NumJnTd+2Ulf9N2izl29FKAzYMXheoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-kdXwbZ-VNtqOWNwyfywdZQ-1; Fri, 11 Feb 2022 12:59:09 -0500
X-MC-Unique: kdXwbZ-VNtqOWNwyfywdZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E007A1006AA4;
 Fri, 11 Feb 2022 17:59:08 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE5AD78AA7;
 Fri, 11 Feb 2022 17:59:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 3/3] hw/block/fdc-isa: Respect QOM properties when building AML
Date: Fri, 11 Feb 2022 18:58:54 +0100
Message-Id: <20220211175854.153798-4-kwolf@redhat.com>
In-Reply-To: <20220211175854.153798-1-kwolf@redhat.com>
References: <20220211175854.153798-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Other ISA devices such as serial-isa use the properties in their
build_aml functions. fdc-isa not using them is probably an oversight.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20220209191558.30393-1-shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/fdc-isa.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
index 3bf64e0665..ab663dce93 100644
--- a/hw/block/fdc-isa.c
+++ b/hw/block/fdc-isa.c
@@ -216,6 +216,7 @@ int cmos_get_fd_drive_type(FloppyDriveType fd0)
 
 static void fdc_isa_build_aml(ISADevice *isadev, Aml *scope)
 {
+    FDCtrlISABus *isa = ISA_FDC(isadev);
     Aml *dev;
     Aml *crs;
     int i;
@@ -227,11 +228,13 @@ static void fdc_isa_build_aml(ISADevice *isadev, Aml *scope)
     };
 
     crs = aml_resource_template();
-    aml_append(crs, aml_io(AML_DECODE16, 0x03F2, 0x03F2, 0x00, 0x04));
-    aml_append(crs, aml_io(AML_DECODE16, 0x03F7, 0x03F7, 0x00, 0x01));
-    aml_append(crs, aml_irq_no_flags(6));
     aml_append(crs,
-        aml_dma(AML_COMPATIBILITY, AML_NOTBUSMASTER, AML_TRANSFER8, 2));
+        aml_io(AML_DECODE16, isa->iobase + 2, isa->iobase + 2, 0x00, 0x04));
+    aml_append(crs,
+        aml_io(AML_DECODE16, isa->iobase + 7, isa->iobase + 7, 0x00, 0x01));
+    aml_append(crs, aml_irq_no_flags(isa->irq));
+    aml_append(crs,
+        aml_dma(AML_COMPATIBILITY, AML_NOTBUSMASTER, AML_TRANSFER8, isa->dma));
 
     dev = aml_device("FDC0");
     aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0700")));
-- 
2.34.1


