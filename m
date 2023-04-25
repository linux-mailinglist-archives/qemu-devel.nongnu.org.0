Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09EF6EDD0E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:47:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDMo-0007DG-M6; Tue, 25 Apr 2023 03:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMf-0006Yk-Rh
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMe-0006jV-C7
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EdvJhVnF3qG5wb91wGjKf/B8uyjZMpU3Oo0rcoSg8ps=;
 b=OY2ENwZBZWC0Ek8Y7uX7z/2WdltUs2H1UFlPD8yB/v5XDrQV6kIziKW23MBdN6y8lm96a6
 6FK2VG6bcHZus7u2kaLORZnWQtmAhORMindukGL3q3e1IAhlDyOeJn8i5aq76Lr4f6CXFb
 jtPEeDQos978ddIGXAhH8NNo4eyYksA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-RK9K-k6mNJ-dlng30RVpvw-1; Tue, 25 Apr 2023 03:45:26 -0400
X-MC-Unique: RK9K-k6mNJ-dlng30RVpvw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f21e35dc08so9373605e9.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408724; x=1685000724;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EdvJhVnF3qG5wb91wGjKf/B8uyjZMpU3Oo0rcoSg8ps=;
 b=ZpkeElEopHZlsP/tATXTvesC4cbyMqSWGj5OrHINWEHgtoBiOo7MpTJboftXGrkJTO
 13z+hczTRHYr2Recub08AhOQBR24WHFqseUK8iuvQqrYWxV33rWC44n8yRRrKFzzMEn6
 6K3OjvtSA/MsZnMB6XtHbMF4LLzlbkagZLsKB/wXsn9JOLH+Cjxe3MCtJXtHrBOKvY90
 LN70fbKd5YXjUlkhyd9WoGtvz9Y3C4GeIi7Ct3hBqdMX7MvjU2P4d0RV7iim+L4l7whW
 8MCPZIbIwXT2pZ0bSU7FWD952QzV9TFk1wxqYKAhzbU2wwpZsvO8995CFBGao6QnrAP8
 /7nw==
X-Gm-Message-State: AAQBX9cLhyDHc+C9/ttjO7q+ixZfwYxLbh1LMdo28RR1qkmCU0C8Ruy8
 4BRf89fxl6S600c3vaTp9GY1KqRWvP403N1HsAn6TyJEnWIBd3DgrOAve+gsZ7FyOL/cOCPWIiM
 OakOZ/u9lptp96GIDvJRD7VOgMcVyd2c8oAztUwF/us40XUSRhepzdfcaYu9bGOvu05Sr
X-Received: by 2002:a1c:7409:0:b0:3f2:4fca:1b0f with SMTP id
 p9-20020a1c7409000000b003f24fca1b0fmr3962952wmc.24.1682408724235; 
 Tue, 25 Apr 2023 00:45:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350a7e50FCAAhyOaCoEyqBZKf6YFbgyU/hrytYUZqxgG09H+XbdKwcgVXFoCYWvQ5PgfpVA8REg==
X-Received: by 2002:a1c:7409:0:b0:3f2:4fca:1b0f with SMTP id
 p9-20020a1c7409000000b003f24fca1b0fmr3962921wmc.24.1682408723829; 
 Tue, 25 Apr 2023 00:45:23 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 d14-20020a5d538e000000b002efac42ff35sm12450857wrv.37.2023.04.25.00.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:45:23 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:45:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 10/31] hw/i386/amd_iommu: Explicit use of AMDVI_BASE_ADDR in
 amdvi_init
Message-ID: <6291a28645a0656477bc5962a81b181e6a99487c.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

By accessing MemoryRegion internals, amdvi_init() gives the false
idea that the PCI BAR can be modified. However this isn't true
(at least the model isn't ready for that): the device is explicitly
maps at the BAR at the fixed AMDVI_BASE_ADDR address in
amdvi_sysbus_realize(). Since the SysBus API isn't designed to
remap regions, directly use the fixed address in amdvi_init().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230313153031.86107-3-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/amd_iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index bcd016f5c5..3813b341ec 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1519,9 +1519,9 @@ static void amdvi_init(AMDVIState *s)
     /* reset AMDVI specific capabilities, all r/o */
     pci_set_long(s->pci.dev.config + s->capab_offset, AMDVI_CAPAB_FEATURES);
     pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_BAR_LOW,
-                 s->mmio.addr & ~(0xffff0000));
+                 AMDVI_BASE_ADDR & ~(0xffff0000));
     pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_BAR_HIGH,
-                (s->mmio.addr & ~(0xffff)) >> 16);
+                (AMDVI_BASE_ADDR & ~(0xffff)) >> 16);
     pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_RANGE,
                  0xff000000);
     pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_MISC, 0);
-- 
MST


