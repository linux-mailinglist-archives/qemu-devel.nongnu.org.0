Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 479D8681B95
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:33:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMafA-0007TM-ED; Mon, 30 Jan 2023 15:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeO-0006bH-Ji
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeE-0007Nq-LJ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZlLKVcZYsf7y4OaAZIfw8803rOTS7kimKK0JT2HkT6A=;
 b=UdQTsUWDIdLfFNvM6T5d2kyp7CH6Gi0nRUKAcoO+Cl8OrDwwTywA2W0H/GDZdivCKSD94R
 wGhBkaZptyS0a/g4PoYNyoOEKHgYs4gngB+coaXp/iwJMi6t4wocgI1g7Y+EpQBgT01em/
 kh+t+iElkPXtMewwaH1rnExiIE5o3jg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-450-RT1JPj4cNKuE1C2HkKfszw-1; Mon, 30 Jan 2023 15:21:00 -0500
X-MC-Unique: RT1JPj4cNKuE1C2HkKfszw-1
Received: by mail-ej1-f71.google.com with SMTP id
 kt9-20020a1709079d0900b00877f4df5aceso8156944ejc.21
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:21:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZlLKVcZYsf7y4OaAZIfw8803rOTS7kimKK0JT2HkT6A=;
 b=e+rvZuG13eGQq6E88zUxvMxF0WFsVvREuaIFIUc1eWYb/ycHhM9PTjPSFS53vlImGL
 CyGnC4eZchXwvnexKKMPG/7ppWXoVDAq7GtdgWv5Q4tFhTtyznr7VL8GRgyYUci9G6Y1
 Ew87KCk6mSq9fJrxbE/eTK8zf53O9STPWtaRIwnVAkkIefcIfbdOEZVeGHrueYbRxTHm
 oNHtzXa5po8kFdl6BUCSlkkjtjsbaR7pB0NfyXM1yneeVBXXxDendetIPrArmsxoalZu
 pBPsvpLFaBmm3s4efFey+A8z9hdlAVmxodvKmqnxKmnj+rvaWFMpxtuIu6sU0UpK0oR3
 MtOA==
X-Gm-Message-State: AO0yUKUcc2WqW5C0FGxTQU0Ii7FbQaYDaGvxdwEsMiwq8Tgl3qWncmRT
 /Ia3iiXahxs53nfWM+h68XyzcmQ7PaDpIxKGPwn6/J36NUbbkpLsvU1CJ2KDwMMa6ViR2I4WQ42
 AFFgT8FN9ffag6kmDkf0oOrlNsk8++FY7/E9DLLeoaS210ZH0vGPam2BX1+xf
X-Received: by 2002:a05:6402:22e2:b0:4a2:44d3:6d84 with SMTP id
 dn2-20020a05640222e200b004a244d36d84mr5688544edb.5.1675110058980; 
 Mon, 30 Jan 2023 12:20:58 -0800 (PST)
X-Google-Smtp-Source: AK7set8S6XSEHMYm6w5ZRNaLKdGl/vrorpHe+T2ab1OxM/dGvrjEvly8B4VZDuLCriXsO31m45Pujg==
X-Received: by 2002:a05:6402:22e2:b0:4a2:44d3:6d84 with SMTP id
 dn2-20020a05640222e200b004a244d36d84mr5688524edb.5.1675110058713; 
 Mon, 30 Jan 2023 12:20:58 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 ed10-20020a056402294a00b004a236384909sm3002773edb.10.2023.01.30.12.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:58 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 40/56] pci: make sure =?utf-8?Q?pci?=
 =?utf-8?Q?=5Fbus=5Fis=5Fexpress=28=29_won't_error_out_with_=22discards_?=
 =?utf-8?B?4oCYY29uc3TigJk=?= qualifier"
Message-ID: <20230130201810.11518-41-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Igor Mammedov <imammedo@redhat.com>

function doesn't need RW aceess to passed in bus pointer,
make it const.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-31-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pci.h | 2 +-
 hw/pci/pci.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 85ee458cd2..d5a40cd058 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -270,7 +270,7 @@ typedef void (*pci_bus_dev_fn)(PCIBus *b, PCIDevice *d, void *opaque);
 typedef void (*pci_bus_fn)(PCIBus *b, void *opaque);
 typedef void *(*pci_bus_ret_fn)(PCIBus *b, void *opaque);
 
-bool pci_bus_is_express(PCIBus *bus);
+bool pci_bus_is_express(const PCIBus *bus);
 
 void pci_root_bus_init(PCIBus *bus, size_t bus_size, DeviceState *parent,
                        const char *name,
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 39a7bb32aa..208c16f450 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -483,7 +483,7 @@ static void pci_bus_uninit(PCIBus *bus)
     pci_host_bus_unregister(BUS(bus)->parent);
 }
 
-bool pci_bus_is_express(PCIBus *bus)
+bool pci_bus_is_express(const PCIBus *bus)
 {
     return object_dynamic_cast(OBJECT(bus), TYPE_PCIE_BUS);
 }
-- 
MST


