Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B414694C66
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:22:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbZO-0004aI-5z; Mon, 13 Feb 2023 11:20:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZJ-0004YZ-W6; Mon, 13 Feb 2023 11:20:42 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZH-0007vM-Uk; Mon, 13 Feb 2023 11:20:41 -0500
Received: by mail-ej1-x62a.google.com with SMTP id dr8so33120053ejc.12;
 Mon, 13 Feb 2023 08:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7iycG/CYzi5qr7Pya6NhclvK6Ts8hrm+dv8CLlGtddE=;
 b=TZAvFc2p81l79U83YOv+5eTOPz5jm6oJ74pAumWmTlFASK2ztkbkCBZ7Q4lEEMnfiW
 AlMgqWJozMWKLjf0UTTntOKDMWKE9gSQmbfB6L4oMMQfSw58Y0IoP3ayvrtcIi5c6xQv
 ftJSmdppH9jbanQusxybOmFgI/6EPRCHhVqrB4JfIoLFwxegA98vMp1x+6MCQhV6Wern
 JI/HJG1xF5it7/Q9xaE+UJY0ELj/dD+yoc0ae4yxxZbpJj052xMvuMHexXYuX7OgXEiI
 raqh1+n2YTWoO9hX2ATjYZ4ZKy5CnDyVOR3oYKD2iSYpzhd2+BMSx9QZot/fQJBGxnqt
 zEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7iycG/CYzi5qr7Pya6NhclvK6Ts8hrm+dv8CLlGtddE=;
 b=RRe0NGj5fMYDg5NaPiNtzJkzNpGJ4BlLs6sWvTDUC4ZHHHMEAcTimfxAUEPcY8DsH6
 ai4tne08SMvYSs4aYuSrRnJG3pFBNRlvYCi2RBut8v9bBrPSuBzrjGO/jSQIPJ7ZBEgy
 q6y67vRG+GEDjK92n55TmpZklO4ld4AgFORENBr32NUfGIzw5Jxr8hDeG9HByNqtGgqZ
 4cwdIhro7FmmEVcjn25CGoZtu0rEM2SK0Apffru1empB0rdSW/GVTLBGl/7E1YMhRbqt
 Ux5J/1ZTs6W74i2mxjz9lOG86F3O/lgETzNCOJloKD6z9CyT8TjeinngFzvmhLiSTtzU
 fGjw==
X-Gm-Message-State: AO0yUKUPf3Mcj1yNmlY+YmFyD+wwwZGWOggNH/UJsL1h2p2ZpPDA9n8W
 ncjAihmpLdxi8AyDR5W7OM9C+16ojYc=
X-Google-Smtp-Source: AK7set8ioqS5tcfhmN7dxR+d/+XwKwhg11BMqUy3DWVAoFyRmzibfyW59iXFtO7u57j+ELS9eMITNg==
X-Received: by 2002:a17:906:e218:b0:871:dd2:4af0 with SMTP id
 gf24-20020a170906e21800b008710dd24af0mr23260393ejb.26.1676305237747; 
 Mon, 13 Feb 2023 08:20:37 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906025400b008841aa86484sm6979952ejl.211.2023.02.13.08.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 08:20:37 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 1/9] hw/pci-host/i440fx: Inline sysbus_add_io()
Date: Mon, 13 Feb 2023 17:19:56 +0100
Message-Id: <20230213162004.2797-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213162004.2797-1-shentey@gmail.com>
References: <20230213162004.2797-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
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


