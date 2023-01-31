Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A5F682BFF
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:56:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpD2-00061i-Ls; Tue, 31 Jan 2023 06:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpD0-000606-17; Tue, 31 Jan 2023 06:53:54 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpCy-0002Kh-8w; Tue, 31 Jan 2023 06:53:53 -0500
Received: by mail-ed1-x530.google.com with SMTP id q19so4196317edd.2;
 Tue, 31 Jan 2023 03:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+H/hm+NzJf5UK4Gy3W0jifT6di0xnThf7l7iJbMFcRQ=;
 b=J3/gfD35FFPJlaMStFUC2d5+NrMjog26RghZv65GWxfhwDcrsK9XQ9vgrxuuTc0zXG
 JyXcZ5bzYspEj6s1Fg99D6X/Q0GndW52E2anpfWhVywJ0Doa2qiPUTU+lqi97EBewdTm
 lb3DzEy2ezPnrjTTNjwUKmqPQU1en4a6MdCLZzOYPjlSDx4VEsdsqT5jblnIoYXXxXxE
 Gh2ao8yaNZWcEIhwG7ktsLrmrzrNwL7pUw/oMWCamAkzspOnkWBkIU9XmRKz4LA3jiNO
 OP2/yGseIPDthSaIPQe5AUAMyQUMOWZOHmQkYr4RHk79iDanxyDGWItrkk7t542hzeQ+
 a0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+H/hm+NzJf5UK4Gy3W0jifT6di0xnThf7l7iJbMFcRQ=;
 b=3KjgVhzOAkco4yNNmwFAccaudwh/PmoUnC0e9oDJVKsd1HuTTe7QmCXtvSJf5oqAOi
 Glxzz+IB/l428R4tWUclMU8uoFH/gm/iYxhSeiELU2YRXbwWkOUNswdVUYGdn3Y/Frpw
 kblY1RcOCzPIL5pxnOuIxNsBjqTjee3HWtm+fS0lZUM/qnJOqih8AL8yntEqQC9GdYuN
 etywXSSLPGmpzlxCt30B8ZnT1oH26kAzWGrNlwySK0A+tlnJtlpaqYRu8zwf/40GNZGA
 T1NPENKHfI+1R58CNgVN3pR2rWPlnVJ7jBcK8L7NX+IFcIK/PS1ys/3b+ErjnnZt75Fn
 ZixA==
X-Gm-Message-State: AO0yUKXOmfMgfDzuSw9meH2LDXHQR+4l3Ht8B+7PLqyCr22l+P61aUaF
 YhCmlyJlsFU6Qx2sgKnTewZK91+2m1w=
X-Google-Smtp-Source: AK7set+V3mdoe10qLyNeSQ8OPSKDtF3Fi5eZ5vfwoiNyEmAb/bkM1ihxTPd/XHGB2bzRmBcSM6eWuA==
X-Received: by 2002:a05:6402:1010:b0:4a0:b64e:3db9 with SMTP id
 c16-20020a056402101000b004a0b64e3db9mr21677271edu.16.1675166030082; 
 Tue, 31 Jan 2023 03:53:50 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-082-236.77.13.pool.telefonica.de. [77.13.82.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8178318edu.96.2023.01.31.03.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:53:49 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 01/20] hw/pci-host/i440fx: Inline sysbus_add_io()
Date: Tue, 31 Jan 2023 12:53:07 +0100
Message-Id: <20230131115326.12454-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131115326.12454-1-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

sysbus_add_io() just wraps memory_region_add_subregion() while also
obscuring where the memory is attached. So use
memory_region_add_subregion() directly and attach it to the existing
memory region s->bus->address_space_io which is set as an alias to
get_system_io() by the pc machine.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/pci-host/i440fx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 262f82c303..9c6882d3fc 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -27,6 +27,7 @@
 #include "qemu/range.h"
 #include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_host.h"
 #include "hw/pci-host/i440fx.h"
 #include "hw/qdev-properties.h"
@@ -217,10 +218,10 @@ static void i440fx_pcihost_realize(DeviceState *dev, Error **errp)
     PCIHostState *s = PCI_HOST_BRIDGE(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
-    sysbus_add_io(sbd, 0xcf8, &s->conf_mem);
+    memory_region_add_subregion(s->bus->address_space_io, 0xcf8, &s->conf_mem);
     sysbus_init_ioports(sbd, 0xcf8, 4);
 
-    sysbus_add_io(sbd, 0xcfc, &s->data_mem);
+    memory_region_add_subregion(s->bus->address_space_io, 0xcfc, &s->data_mem);
     sysbus_init_ioports(sbd, 0xcfc, 4);
 
     /* register i440fx 0xcf8 port as coalesced pio */
-- 
2.39.1


