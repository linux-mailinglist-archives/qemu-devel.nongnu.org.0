Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F171D64F385
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 22:54:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IV3-0006gc-EA; Fri, 16 Dec 2022 16:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IUC-00064x-Ny
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:21 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU7-0000ad-Be
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:16 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so5041363wmh.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=p23dzeVMJeBlC5T/z5p/oWaIFlDAiyWvA9icRXV99Mg=;
 b=LbRwThVG+rrs3bGsVEeAMZdTm26SW0XjMQ6oSFSTIyNRk72QfVXmXle6GKRMzJcnIq
 ca4tJ038GP6dMTJxnJCQ/uphF356+f9inOyWYAONtwF6bmBfWQ9lNtONx/z6qABn9Gwa
 fjbwBAgJjp0dPWuESz8ZZ3xa8W23uLTFSBvyifLTT6gyF600qdmpASkvCbD4chph5dU6
 j62dKru+RHHxl3RF2XpY+FIrLiw0BkH5Z5KjJGSBP5mrRMsLU0dh4rmn4obPx0XnOfEw
 ptJc4wO0pZOtxX5l76m/rXX3oNZY7+cXsj9idWC05H1ruwXriEQrz9AEOQMmgPWBuPF5
 RXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p23dzeVMJeBlC5T/z5p/oWaIFlDAiyWvA9icRXV99Mg=;
 b=X4zj0KuppFdJP0poUyj/r/CJLIn83T1P/pPh//mDIoBHI3udbYusVWHSnB1poOeZbp
 9n7rQYqcwdKYE0EaYHUPzmFF/5urFXWRiXtEWjPcLzd0RUw0uOGEgugU87t4u35RLVLK
 LHhwfqh59c2rqBO9wSMbg/QBrkakItLUre0Y0KfLW8s5dEawbseh0r7GJUis8Rrot95Y
 ysFGgCvVZFP4TBTRS4TvmszLews7T7Jpmv9bOLmWmzreiUGx7shOWPHWVsnrs/UOlBS+
 D0mXdxyE4PQTeQpQIo+SUncWP5pSHXpcFGuudcfE/1/NpjWFe5EI3/xxCqb9wj1lvAyb
 WSkg==
X-Gm-Message-State: ANoB5pkjFQqV2rARkGyqZHQBMhdWYkxM96EDNhM3aWKDATnVPDjVJ3jG
 pCWFlfo+xCKm13In+Ez7NnUm+fiUJPTAhm8a
X-Google-Smtp-Source: AA0mqf6MFNjnBdJJ3BBX1pEYRlee7AvRjrNI8kh1axtN+4Vu4L1n8VTL0z9ZLdght3rBu7YmmGVOMA==
X-Received: by 2002:a05:600c:1c9e:b0:3d2:7a7:5cc6 with SMTP id
 k30-20020a05600c1c9e00b003d207a75cc6mr24389061wms.18.1671226994680; 
 Fri, 16 Dec 2022 13:43:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/36] hw/virtio: Convert TYPE_VIRTIO_PCI to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:38 +0000
Message-Id: <20221216214244.1391647-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Convert the TYPE_VIRTIO_PCI class to 3-phase reset.  This is
necessary so that we can convert the subclass TYPE_VIRTIO_VGA_BASE
also to 3-phase reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221125115240.3005559-2-peter.maydell@linaro.org
---
 hw/virtio/virtio-pci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index a1c9dfa7bb5..7873083b860 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -2008,9 +2008,10 @@ static void virtio_pci_reset(DeviceState *qdev)
     }
 }
 
-static void virtio_pci_bus_reset(DeviceState *qdev)
+static void virtio_pci_bus_reset_hold(Object *obj)
 {
-    PCIDevice *dev = PCI_DEVICE(qdev);
+    PCIDevice *dev = PCI_DEVICE(obj);
+    DeviceState *qdev = DEVICE(obj);
 
     virtio_pci_reset(qdev);
 
@@ -2071,6 +2072,7 @@ static void virtio_pci_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     VirtioPCIClass *vpciklass = VIRTIO_PCI_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     device_class_set_props(dc, virtio_pci_properties);
     k->realize = virtio_pci_realize;
@@ -2080,7 +2082,7 @@ static void virtio_pci_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_OTHERS;
     device_class_set_parent_realize(dc, virtio_pci_dc_realize,
                                     &vpciklass->parent_dc_realize);
-    dc->reset = virtio_pci_bus_reset;
+    rc->phases.hold = virtio_pci_bus_reset_hold;
 }
 
 static const TypeInfo virtio_pci_info = {
-- 
2.25.1


