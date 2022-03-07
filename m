Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AFE4CFBB3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:43:45 +0100 (CET)
Received: from localhost ([::1]:44804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAq8-0006UK-J0
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:43:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACo-0002EX-Ku
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACl-0002pU-Qf
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2BxKih/Yy0qiS5QUDi7wjAqw2GnHJ/nwONeXDCjAw2o=;
 b=B1KGexiqeJO0NHprEyrQFNN8Nb2kMKkUN86/3wArQu3rdDTYTJ1UmnJQX44MczsivkR0tV
 ad4pmrF6D0p2a3qoPnY5NzaZvy03ORYWG0a+fIn/VCodi6iU4qDRvY6QEb2UsuQeltCK+g
 7uz+aomns9a/c8tAv4t9LutoA3sBYaQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-vleeYp5rPWa4cRWtG-q_fA-1; Mon, 07 Mar 2022 05:03:02 -0500
X-MC-Unique: vleeYp5rPWa4cRWtG-q_fA-1
Received: by mail-ed1-f69.google.com with SMTP id
 da28-20020a056402177c00b00415ce4b20baso7408307edb.17
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2BxKih/Yy0qiS5QUDi7wjAqw2GnHJ/nwONeXDCjAw2o=;
 b=rbbYnWOIK8T+DTyXXoZE+U/Ii4vc5ArVEftIwkiL1fJR8xyBSrSlZ6AWmtjWszjRjZ
 jBg51Am68vWtQ/YE5xLR/fngvc48yIFSzPOs4dT6wGqueADeAuF/KrQJHXCm4rA9SeaJ
 xBPC4u2fnxvs58AgnKS0Nj7owyKO1mXOnTubbNkwSDqiLy/r/ZzMEQvc3rOEeO6IBTVn
 nTzs9UpnEqExws07h60lCHUX6cPZbd+9FoBcd2ayoBNOzu2EspZaBy76xXp5poy7eKa8
 cMzmLKvuC+ZUIbnjg/fKWRye5UWE/IJaafmIDjh2qWcN81oLSSWfgJYKYotBaYfJYnOM
 lV0A==
X-Gm-Message-State: AOAM532n00Zl0vLpmfYfvu6WdnMZmT4jRO5qxhvZpP59hLVOoIV3lMlv
 jGpfDRrCBlk4kdepHJ5X2NBUkC0sFJ8vP5rvc9qYW5dgZjtdl0M/e+2Tb8CtK/WSaUyJhTKlWtj
 yMGsh8joE0KmCuzaB/nBh92XGGccSO1M8+jAWZYcMEo25f6PFqXstCwCQi54E
X-Received: by 2002:a05:6402:4406:b0:415:c310:8e4b with SMTP id
 y6-20020a056402440600b00415c3108e4bmr10441472eda.249.1646647380758; 
 Mon, 07 Mar 2022 02:03:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzj01XrcEo3kk5AP0OvsTuKGcqwHBuK86kZb7aQTA32zUlh+nO0t6I5GcZz7/rkcuQaxmNRbw==
X-Received: by 2002:a05:6402:4406:b0:415:c310:8e4b with SMTP id
 y6-20020a056402440600b00415c3108e4bmr10441454eda.249.1646647380550; 
 Mon, 07 Mar 2022 02:03:00 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 d4-20020a1709067a0400b006d6e3ca9f71sm4604327ejo.198.2022.03.07.02.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:03:00 -0800 (PST)
Date: Mon, 7 Mar 2022 05:02:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 33/47] pci: expose TYPE_XIO3130_DOWNSTREAM name
Message-ID: <20220307100058.449628-34-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Type name will be used in followup patch for cast check
in pcihp code.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220301151200.3507298-2-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci-bridge/xio3130_downstream.h | 15 +++++++++++++++
 hw/pci-bridge/xio3130_downstream.c         |  3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/pci-bridge/xio3130_downstream.h

diff --git a/include/hw/pci-bridge/xio3130_downstream.h b/include/hw/pci-bridge/xio3130_downstream.h
new file mode 100644
index 0000000000..1d10139aea
--- /dev/null
+++ b/include/hw/pci-bridge/xio3130_downstream.h
@@ -0,0 +1,15 @@
+/*
+ * TI X3130 pci express downstream port switch
+ *
+ * Copyright (C) 2022 Igor Mammedov <imammedo@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_PCI_BRIDGE_XIO3130_DOWNSTREAM_H
+#define HW_PCI_BRIDGE_XIO3130_DOWNSTREAM_H
+
+#define TYPE_XIO3130_DOWNSTREAM "xio3130-downstream"
+
+#endif
+
diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
index 080a6613fe..05e2b06c0c 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -28,6 +28,7 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "hw/pci-bridge/xio3130_downstream.h"
 
 #define PCI_DEVICE_ID_TI_XIO3130D       0x8233  /* downstream port */
 #define XIO3130_REVISION                0x1
@@ -173,7 +174,7 @@ static void xio3130_downstream_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo xio3130_downstream_info = {
-    .name          = "xio3130-downstream",
+    .name          = TYPE_XIO3130_DOWNSTREAM,
     .parent        = TYPE_PCIE_SLOT,
     .class_init    = xio3130_downstream_class_init,
     .interfaces = (InterfaceInfo[]) {
-- 
MST


