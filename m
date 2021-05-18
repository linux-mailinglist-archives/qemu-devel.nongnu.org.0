Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441B238827F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 23:58:31 +0200 (CEST)
Received: from localhost ([::1]:58778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7jM-0001UG-B7
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 17:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7hT-0007Er-Ia
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7hI-0003EV-8S
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621374975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z2jo9vllxtRVdXYudVjnDuNUHTkF+iLAh9lZ9RqOdvs=;
 b=aT7bqo8mfVb7HsvBg/6u8N2/IlY8h32KSaFftHHaszmsxZd5byW2RC3i3G3kEPtKJkMFmW
 PtDtywy63c4Vru7B87CuClzhGjLvU6RhkJIWiwrBFO0aWIQWo/1RthQ+Z91Jdzit/I99Pf
 ud4IHFTnSAgBBoTXUv2VmDUcI8HyPII=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-DHuIdnn7MJ2YcQ2pgZVCmw-1; Tue, 18 May 2021 17:56:14 -0400
X-MC-Unique: DHuIdnn7MJ2YcQ2pgZVCmw-1
Received: by mail-ed1-f71.google.com with SMTP id
 c15-20020a05640227cfb029038d710bf29cso490559ede.16
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 14:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z2jo9vllxtRVdXYudVjnDuNUHTkF+iLAh9lZ9RqOdvs=;
 b=ft+X2pgRotcSf+8FT0t7FUHK0pAXhXoKidt6e4aYmWoo6sLN4v8kYnm/F12j/OHuRa
 aGVS9yLNaMV/kcs4hRf6FxthVOsnEoZ0O6noKXXoJJRJE0X1UpIbuqse1Wo2gnT6kRDU
 au0UbT/Hon3veWwof/9EdvTO8M1fMifX5O942YPKGAJyr9nAW88/rJh6L8cq2ZGyAU/y
 FWSC7BU5tatzluo26Tvca6bCk1Lo2h31eI8gtqfP10cgcS7IZvtOv27OX1jo6Yt3/f8T
 CeplHYQFCGe+QX+YmbmtG3PobGi+nu2bgeVbtW3bnImttqTX/Mn7sJYjS1L7S/M0YY/1
 n04A==
X-Gm-Message-State: AOAM530KpQRQdtgDFrtodbKZvonvtNvgGGcfbFWisFexukEGuCbdD4II
 oCJiLFqwl5EaUGj9tMzCQptB6JFwLnSbEEewAHN8cUOktqZSKtjKYyjFPecplduJCAueqi32B5D
 ytI4RKxFYLULJNEk=
X-Received: by 2002:a17:906:3883:: with SMTP id q3mr8088489ejd.4.1621374971381; 
 Tue, 18 May 2021 14:56:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfQFpA9LNFzEWOM0TFjIGwruGLe+BynHlo8AVtNrc5Ezqha8EVgrLfergrXNZHXSj1iFpn3w==
X-Received: by 2002:a17:906:3883:: with SMTP id q3mr8088468ejd.4.1621374971251; 
 Tue, 18 May 2021 14:56:11 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id zg18sm3285496ejb.41.2021.05.18.14.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 14:56:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 05/11] hw/isa: Extract isa_bus_get_irq() from isa_get_irq()
Date: Tue, 18 May 2021 23:55:39 +0200
Message-Id: <20210518215545.1793947-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518215545.1793947-1-philmd@redhat.com>
References: <20210518215545.1793947-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_get_irq() takes an ISADevice argument mostly to resolve
the ISA bus. Extract the bus logic to isa_bus_get_irq().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/isa/isa.h | 1 +
 hw/isa/isa-bus.c     | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index ddaae89a853..fd8b84d8007 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -91,6 +91,7 @@ struct ISADevice {
 ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *address_space,
                     MemoryRegion *address_space_io, Error **errp);
 void isa_bus_irqs(ISABus *bus, qemu_irq *irqs);
+qemu_irq isa_bus_get_irq(ISABus *bus, unsigned isairq);
 qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq);
 void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq);
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq);
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 7820068e6e1..b946e6dc478 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -75,6 +75,12 @@ void isa_bus_irqs(ISABus *bus, qemu_irq *irqs)
     bus->irqs = irqs;
 }
 
+qemu_irq isa_bus_get_irq(ISABus *bus, unsigned isairq)
+{
+    assert(isairq < ISA_NUM_IRQS);
+    return bus->irqs[isairq];
+}
+
 /*
  * isa_get_irq() returns the corresponding qemu_irq entry for the i8259.
  *
@@ -84,8 +90,7 @@ void isa_bus_irqs(ISABus *bus, qemu_irq *irqs)
 qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
 {
     assert(!dev || ISA_BUS(qdev_get_parent_bus(DEVICE(dev))) == isabus);
-    assert(isairq < ISA_NUM_IRQS);
-    return isabus->irqs[isairq];
+    return isa_bus_get_irq(isabus, isairq);
 }
 
 void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq)
-- 
2.26.3


