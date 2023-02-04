Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3734C68AAE1
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 16:13:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOKC0-0002PB-C1; Sat, 04 Feb 2023 10:11:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKBx-0002Nr-3x; Sat, 04 Feb 2023 10:11:01 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKBv-0006aD-Ir; Sat, 04 Feb 2023 10:11:00 -0500
Received: by mail-ej1-x62d.google.com with SMTP id me3so22884470ejb.7;
 Sat, 04 Feb 2023 07:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LA6ZuoQya0s6wnCk3SNGbAuFteCxPNtvbIq0Ce0nCis=;
 b=YI88LN/t4Lm2N6GWYuEPcwEXt2SnegGrLFt2/87lYbqa2Net4cFpzGXIhbigG3ccRW
 H3HO7//L3eTZM6vd5f07KivEQBKA8+C3EKOP+jUPToZnRn0LCSe1cWUjYfEhP0W2KLOF
 eTkGrv0HUmjw0mVG7jny1hptyX0vDtexaDMzjfdv7IL8vWdHQzycevFkWygSiYVgvXDh
 J5OM+hOy4X+WHmu2dnXtM5891I2CXbOcdJxsZpgR5NGnEaXzDEEaGbwjjVkYAxfzFJbp
 BlZaUDXlJGHbsTB320dCPhlIbdAfRImfA4ST4cIWHK0qJ6dItNhoTthQMuxDJnU7ANs/
 V3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LA6ZuoQya0s6wnCk3SNGbAuFteCxPNtvbIq0Ce0nCis=;
 b=nlkGOsMIomFB0YUbkyi1SRY/4a8zJRa8Wz17n9T5bjcxX1qyRcPc3heZUafYJkSFwm
 xJAqBWiMbYBevU5p9U0CrLyy450ql5b+Ipc2898k7QoWyK8fT0uE8SFCXlX8qwmox0Xo
 k7y0cqzAu9rRvFq2JEkuuJgj4VG5OhLHnTWSYY1rpuVctQSWF7Au+c6jVdiJttGqS6hO
 Ox6zPzP6EbI9gmvW69C36CYyC3tvFGVqDOpgD9pxBzW8SkqvHaiRAsPmts2qBI4m91Wp
 q2UTMSc6+nsBVXX9ACwDmEyBu6J6z4+FQFiZcOr3j4Qp09PSMJXFBmC3cJar+MEhLSrl
 zz3A==
X-Gm-Message-State: AO0yUKXFSRp7F2F8xe/Sa1I+jse+fbeW0H5kvZFVJx3Nz79l4PngLmtr
 akRdMWxE+iExZg0RpxzcEND1VoaRxuA=
X-Google-Smtp-Source: AK7set+NjoLkA+OkSXzV8o5XGvFhc85fome84pNCw1nDoCgum8RSmxHIrnCy29s8M+V6ag3dE0bOaA==
X-Received: by 2002:a17:906:9f06:b0:82e:a57b:cc9b with SMTP id
 fy6-20020a1709069f0600b0082ea57bcc9bmr4752073ejc.24.1675523457739; 
 Sat, 04 Feb 2023 07:10:57 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-183-077-083.77.183.pool.telefonica.de. [77.183.77.83])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906211100b0088a2aebb146sm2937922ejt.52.2023.02.04.07.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 07:10:57 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 2/9] hw/pci-host/q35: Inline sysbus_add_io()
Date: Sat,  4 Feb 2023 16:10:20 +0100
Message-Id: <20230204151027.39007-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204151027.39007-1-shentey@gmail.com>
References: <20230204151027.39007-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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
memory region s->mch.address_space_io which is set as an alias to
get_system_io() by the q35 machine.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/pci-host/q35.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 26390863d6..fa05844319 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -50,10 +50,12 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
     Q35PCIHost *s = Q35_HOST_DEVICE(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
-    sysbus_add_io(sbd, MCH_HOST_BRIDGE_CONFIG_ADDR, &pci->conf_mem);
+    memory_region_add_subregion(s->mch.address_space_io,
+                                MCH_HOST_BRIDGE_CONFIG_ADDR, &pci->conf_mem);
     sysbus_init_ioports(sbd, MCH_HOST_BRIDGE_CONFIG_ADDR, 4);
 
-    sysbus_add_io(sbd, MCH_HOST_BRIDGE_CONFIG_DATA, &pci->data_mem);
+    memory_region_add_subregion(s->mch.address_space_io,
+                                MCH_HOST_BRIDGE_CONFIG_DATA, &pci->data_mem);
     sysbus_init_ioports(sbd, MCH_HOST_BRIDGE_CONFIG_DATA, 4);
 
     /* register q35 0xcf8 port as coalesced pio */
-- 
2.39.1


