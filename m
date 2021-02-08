Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082EA3143A7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:24:14 +0100 (CET)
Received: from localhost ([::1]:56550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ft7-0008Oq-0z
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:24:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCk-0003gs-Tk
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:11 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCj-0006LW-9b
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:10 -0500
Received: by mail-wr1-x435.google.com with SMTP id m13so18331423wro.12
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cxe8c6RNhdHlx5HuOWhXgpelKV1ga1qAtyeZmqGBD58=;
 b=XvXmySpwpXx522l1iWW2yfV2/aN066ZxnmBrz1a33s7hdlV4mhId6kSMNQ/RSxavDf
 OjyO3QvE88idFG3RoQdk8rh/Vzt3RNcbjE2FoHZnBOz2z8tZWRy5pIw4+Hjw0n7sJFNV
 PcYHYL8cfbwkIJcntFmD9SiQqQ0qaLbdzApnYEu/NQWvWcVsH4dq6UETK7tPhvYD+66O
 slVxBhyomo4OrJUnoovFfO/Fuo5XfXpaexWfkkwfFjaX+hb+XNyA0PTtAJ6TMiPFwZYF
 UVwk4BEczoyqlXBIB1AgxOxtFbDOnT7nXZYkHQxfCUoLOuQ1hItJPbUsJ61u/XzKd8tU
 k/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cxe8c6RNhdHlx5HuOWhXgpelKV1ga1qAtyeZmqGBD58=;
 b=FENJajv3db1w+gvNydjfqMQeFokBnGX1zUas+pAYNWNi7EhDsl4G0wuNBxsk9MrUUh
 H0uGiX4UdlLVnYWFU8oVm3SjnCoPzsTo8bhpMenQxmJMThcR1vPH85BVXxZxrWeEHBpZ
 VLLAJO9otKvhh0R8WLxlouFOTjzMgJd/EitzYLtZoT8A5MZcg5d/s3KxhrTS6D7tPCOq
 fiSDRlLCSNpuS9+u3UFHW7bYg4Xi4USeihenk9B539mwqA0skIM3hSF1Umo1i4RJYUiY
 Cl/Awgl9Nu34kDCidBOz3QObqqToxQxcUQ3ltKJz3ATyTNK5nKZtyel2Ia6imjlbzT5D
 Xv8w==
X-Gm-Message-State: AOAM5338uO09Bi8O39JNq8MpNERTAWwDHC51Rat3PwCToBF5dzpafBHm
 vIMavqpm+4kTyNlJCBVQ0jqo84/7NE2lBg==
X-Google-Smtp-Source: ABdhPJzhd2qsSimYMcoirohGflNxdyBWqWviHrasEYm3ChW7eARJbuQP+P87cgVUP8v7wqCW9oJCGg==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr20739961wrq.179.1612808648140; 
 Mon, 08 Feb 2021 10:24:08 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:24:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 37/46] hw/pci-host: add pci-intack write method
Date: Mon,  8 Feb 2021 19:23:22 +0100
Message-Id: <20210208182331.58897-38-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Lei Sun <slei.casper@gmail.com>, Li Qiang <liq3ea@gmail.com>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Add pci-intack mmio write method to avoid NULL pointer dereference
issue.

Reported-by: Lei Sun <slei.casper@gmail.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
Message-Id: <20200811114133.672647-2-ppandit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/pci-host/prep.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index 0469db8c1d..0a9162fba9 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -27,6 +27,7 @@
 #include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
+#include "qemu/log.h"
 #include "qapi/error.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
@@ -121,8 +122,15 @@ static uint64_t raven_intack_read(void *opaque, hwaddr addr,
     return pic_read_irq(isa_pic);
 }
 
+static void raven_intack_write(void *opaque, hwaddr addr,
+                                        uint64_t data, unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s not implemented\n", __func__);
+}
+
 static const MemoryRegionOps raven_intack_ops = {
     .read = raven_intack_read,
+    .write = raven_intack_write,
     .valid = {
         .max_access_size = 1,
     },
-- 
2.29.2



