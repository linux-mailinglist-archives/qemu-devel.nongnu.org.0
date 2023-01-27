Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4466467EB78
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 17:48:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLRtD-0002Kj-Eu; Fri, 27 Jan 2023 11:47:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pLRt1-0002Hd-Nr; Fri, 27 Jan 2023 11:47:35 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pLRsz-0005eC-GG; Fri, 27 Jan 2023 11:47:35 -0500
Received: by mail-ed1-x531.google.com with SMTP id x10so5235634edd.10;
 Fri, 27 Jan 2023 08:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wBSkQW9/N2/BoX+ctneP3uHks26t/IksUJUykB7eF44=;
 b=d+P7dx9HlGM04wP5hMW09kzs5VoL+E62W9l31IfXC5pRQDYTfmeaqaYCM0BTtD/bQ9
 Zl/BK66YZKWQhR8z7IfucE9opXgtEyP50RtLE4tuMQgc8VyXtX+gT/F0rcDONCQr7rvT
 tZiWUjKLxduXdX6taw1fcNcIbAl+9MM6+qjAUwQwYacXslZLd72SlHhBx5F34uqTCHRz
 i7K3cbBfLois6L3B4RSqwX9e1bT8ISIVg83IgF+06KtdXgax4W/1g0LPryjAhE+RS0oX
 SdTDtMymRqiOgX9Dc51hURj/pmlUC2J0NXv356eYjXbh2yYci2XFHHBt+atjzHobL7ld
 qIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wBSkQW9/N2/BoX+ctneP3uHks26t/IksUJUykB7eF44=;
 b=2L65m07sv/MSUnDlDNBP+vHPL936SuiS3AnKI240BhPzFtlJkp2dUDrcIxDFvN2ZX0
 gcISPO+YTPO9FwlzNgC+yBt4J2EOowDPnGy6WO9/rrUGrWSOaO3clJjuXEzfzHesKLvb
 Tbsm177vKq7/bBt72axUIXkDtf0znp6HxW5yEFpRExwjAg5xxDlGvGiQRRo5ZfS3CaHH
 BiTtJ21CHcrJn+u1cZNIOaCIutyAobFeYbw9/DhvFKIugZBy3wtStPiHdSJMl0iDbwDC
 wLAHaUyem2AM07rlj6rtifguW2MA2B1juo1Dv+YxTEMYtLIHv7p+Ez+UAomri+GGqYJe
 n34Q==
X-Gm-Message-State: AFqh2kqDo7bPg17P9y/a+zmhJ6OuFQ94jM8LUMBastE9RRFka2s6o7te
 H4KaUbN45V1HDh37ugkWgPRQxt21b8VmqQ==
X-Google-Smtp-Source: AMrXdXthDcYsgM3ZHY2iJlfuD84EVs5unJZ02dZhkVRjdWpr55MR1iTtJ8LtO9Oeee4Q0nHUqD5sIw==
X-Received: by 2002:a05:6402:100b:b0:462:6e5e:329a with SMTP id
 c11-20020a056402100b00b004626e5e329amr43130789edu.8.1674838051492; 
 Fri, 27 Jan 2023 08:47:31 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a056402050f00b0049ef70a2894sm2574414edv.38.2023.01.27.08.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 08:47:30 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/7] hw/pci-host/i440fx: Inline sysbus_add_io()
Date: Fri, 27 Jan 2023 17:47:12 +0100
Message-Id: <20230127164718.98156-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127164718.98156-1-shentey@gmail.com>
References: <20230127164718.98156-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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

Rather than using get_system_io() as the parent memory region, use
s->bus->address_space_io which is set up as an alias in the pc machine.

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


