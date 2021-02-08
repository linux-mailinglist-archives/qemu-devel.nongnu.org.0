Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4CE3143B8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:27:08 +0100 (CET)
Received: from localhost ([::1]:36786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Fvv-0003Td-D8
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCt-0003jQ-JN
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:19 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCp-0006Mm-9n
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:16 -0500
Received: by mail-wr1-x431.google.com with SMTP id b3so18383509wrj.5
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2vmEdwiG9gIDiJbroeNYD3Zy7ceWJ6BYH/roxCMRMPo=;
 b=KitxW6zI0eLQR2lMs+XgCv7q9MKr/aWWVyx+R5loNyquQ/d2FzVJuQDaeSIwQGtTrj
 68ZI+jRkim8iGbzAYQA8594nrhJrsyEPeDUzy4gLe3rsQHtAlnsDZsNyhWNEnCsax5EU
 BgaN2hLFTAjkGmPaWUT64SJZHw91kNwQqjuiMJ4j5wyzi0Qv5ldneosm++RMh9pBABVB
 TSpvsMQ01xk3ljaekE17QsByVip+gjCs5JIENmaGPewbyJ/csW/6GUtvry+IPrOumxxf
 4jlLYaRYAqyUZj0JU62qhLJpKE5KHkuhBswWndUrul5BkE9XqDXs8qVEGFDYFW1GXZBq
 OfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2vmEdwiG9gIDiJbroeNYD3Zy7ceWJ6BYH/roxCMRMPo=;
 b=iWVKG4VrU2ABE1sa0zQRY3N0rgRen/dScV7WZ7HgXXNNFuVgo41xtTp40ttY8rLwr6
 uFWGL13D/Jk8yvWVpFQ/okPcSbKklAiVfrxLqKG9E5U+A0Y9NsfvPaRTCZI4kmpR+pKl
 X8BRSEFq5FkMyspIE4u72GiYfy8q1OOv8CEUC9q1db8Df11exKuLLb45b5o6JGl1QPef
 qHlCs/ZU5kACT+nQMzNkvUX9Qqi+FFzMRPOsSF31FfXgwNM+QBDUXAHkyX6Hn12mTIPs
 z1gbbGkeu20TQoG0oTq4/ZpyIvH3I8XRfD4bmmxz5FraAw3xOGCIx+N7NZV2gYdh5hEu
 ZSBQ==
X-Gm-Message-State: AOAM533ZnGDduNi6mTQ5E+/O102pV4T2VktLx51xwscAxHMnQ1/Ufcxn
 gvN+XnilsQl/GkovJpiKG14o349agBDhDQ==
X-Google-Smtp-Source: ABdhPJxyGpB+oDRsxs+baILs0si4rrpwj7qKBrpEplUelZA9P3wnuNIqv8HLN3d3Ar/aeTFEBx1jwg==
X-Received: by 2002:a5d:6684:: with SMTP id l4mr21701066wru.111.1612808650375; 
 Mon, 08 Feb 2021 10:24:10 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:24:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 39/46] vfio: add quirk device write method
Date: Mon,  8 Feb 2021 19:23:24 +0100
Message-Id: <20210208182331.58897-40-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Lei Sun <slei.casper@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Add vfio quirk device mmio write method to avoid NULL pointer
dereference issue.

Reported-by: Lei Sun <slei.casper@gmail.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
Message-Id: <20200811114133.672647-4-ppandit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/vfio/pci-quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index fc8d63c850..c5c4c61d01 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -14,6 +14,7 @@
 #include CONFIG_DEVICES
 #include "exec/memop.h"
 #include "qemu/units.h"
+#include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
@@ -264,8 +265,15 @@ static uint64_t vfio_ati_3c3_quirk_read(void *opaque,
     return data;
 }
 
+static void vfio_ati_3c3_quirk_write(void *opaque, hwaddr addr,
+                                        uint64_t data, unsigned size)
+{
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid access\n", __func__);
+}
+
 static const MemoryRegionOps vfio_ati_3c3_quirk = {
     .read = vfio_ati_3c3_quirk_read,
+    .write = vfio_ati_3c3_quirk_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
-- 
2.29.2



