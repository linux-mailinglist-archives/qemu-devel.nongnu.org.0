Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75CC486553
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:35:40 +0100 (CET)
Received: from localhost ([::1]:44082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Svb-0006sn-Sn
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:35:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SdW-0004EF-IX
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SdU-0000ps-LD
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n1iLjx4SHThqUNpgxKUlFJfbmdTeh8ixg5DBOW9i3IU=;
 b=hGthJhgcoPfIr3AnwFMjonyHKoDBVB7ahsnzlk4qj/ieVybCTR9j9pB3lMmvHNG3u0rvGI
 EHKjSef49gnOqGmvEFlFzGsSGjSUvSyfTcDTBRWPWRJePH7nR52OW/XsRWTzMTHmJzcxZF
 J1yov0xAYLihn5pJyZi0lbwmm4Ziipo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-DipdJaVmMPiD5ulDUqKZbA-1; Thu, 06 Jan 2022 08:16:55 -0500
X-MC-Unique: DipdJaVmMPiD5ulDUqKZbA-1
Received: by mail-wr1-f72.google.com with SMTP id
 q16-20020adfbb90000000b001a4838099baso1248477wrg.10
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=n1iLjx4SHThqUNpgxKUlFJfbmdTeh8ixg5DBOW9i3IU=;
 b=E+95/S4skXzWUQ1zKj5nBNXpRvyLrJDPTT5fvjxiKsWsfWH7ejHVRuHDqLRKOtNDry
 QG3i0vQLzO2pA2aXgbA6sl3IAmiScMG0x/2lvA81GoewuNXayHOorrwFK0V/WJwjdwIV
 wFUjkTuHApxWeuDxcKw3jJywSfHqMOXcvMGj2UkMRC6Y9AzBbb+LfzvxNVenR67yvkPi
 zVLBud3+4rlL0wpGfemfYthN16fxnRKOj3Qaq94crviknzTV2wdtGl6/DGNHwEC4QBOw
 lAKPRXAxJUZv7H834/oofS1R+W029sF9iWpMmDqOuXNQOYNygwX4/H9UiM8YYs67z4QH
 4Ibw==
X-Gm-Message-State: AOAM532m0e6mHKf6gr0oMI6OOdSNOJa76mOrHgWx1f5tpmHJxUPZ5z7n
 6EkwvBAL/EApAcT9bUu7ws/bR8ky2d8OFR4qYY+G45uI4fShq8EfKZtQt1O77VReiDCHOMOsYUH
 tpTcvkUyeg+BlcBkijhl5CjjekiEuWDW8kuwE04L9oriJLH5oWhJoF2ekMEht
X-Received: by 2002:a5d:59af:: with SMTP id p15mr50374370wrr.237.1641475013491; 
 Thu, 06 Jan 2022 05:16:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySSRQIIV0h7BY3dQ59v4vBKXhs7IAfJv0EFew+XT8fUcBMP0lgJ0OMJdelpXnx7vrLQ9hlvg==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr50374348wrr.237.1641475013217; 
 Thu, 06 Jan 2022 05:16:53 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id k19sm4987186wmo.29.2022.01.06.05.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:16:52 -0800 (PST)
Date: Thu, 6 Jan 2022 08:16:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/52] trace-events,pci: unify trace events format
Message-ID: <20220106131534.423671-14-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

Unify format used by trace_pci_update_mappings_del(),
trace_pci_update_mappings_add(), trace_pci_cfg_write() and
trace_pci_cfg_read() to print the device name and bus number,
slot number and function number.

For instance:

  pci_cfg_read virtio-net-pci 00:0 @0x20 -> 0xffffc00c
  pci_cfg_write virtio-net-pci 00:0 @0x20 <- 0xfea0000c
  pci_update_mappings_del d=0x555810b92330 01:00.0 4,0xffffc000+0x4000
  pci_update_mappings_add d=0x555810b92330 01:00.0 4,0xfea00000+0x4000

becomes

  pci_cfg_read virtio-net-pci 01:00.0 @0x20 -> 0xffffc00c
  pci_cfg_write virtio-net-pci 01:00.0 @0x20 <- 0xfea0000c
  pci_update_mappings_del virtio-net-pci 01:00.0 4,0xffffc000+0x4000
  pci_update_mappings_add virtio-net-pci 01:00.0 4,0xfea00000+0x4000

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20211105192541.655831-1-lvivier@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pci.c        | 4 ++--
 hw/pci/pci_host.c   | 6 ++++--
 hw/pci/trace-events | 8 ++++----
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e5993c1ef5..322ba450e7 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1390,7 +1390,7 @@ static void pci_update_mappings(PCIDevice *d)
 
         /* now do the real mapping */
         if (r->addr != PCI_BAR_UNMAPPED) {
-            trace_pci_update_mappings_del(d, pci_dev_bus_num(d),
+            trace_pci_update_mappings_del(d->name, pci_dev_bus_num(d),
                                           PCI_SLOT(d->devfn),
                                           PCI_FUNC(d->devfn),
                                           i, r->addr, r->size);
@@ -1398,7 +1398,7 @@ static void pci_update_mappings(PCIDevice *d)
         }
         r->addr = new_addr;
         if (r->addr != PCI_BAR_UNMAPPED) {
-            trace_pci_update_mappings_add(d, pci_dev_bus_num(d),
+            trace_pci_update_mappings_add(d->name, pci_dev_bus_num(d),
                                           PCI_SLOT(d->devfn),
                                           PCI_FUNC(d->devfn),
                                           i, r->addr, r->size);
diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index 7beafd40a8..eaf217ff55 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -79,7 +79,8 @@ void pci_host_config_write_common(PCIDevice *pci_dev, uint32_t addr,
         return;
     }
 
-    trace_pci_cfg_write(pci_dev->name, PCI_SLOT(pci_dev->devfn),
+    trace_pci_cfg_write(pci_dev->name, pci_dev_bus_num(pci_dev),
+                        PCI_SLOT(pci_dev->devfn),
                         PCI_FUNC(pci_dev->devfn), addr, val);
     pci_dev->config_write(pci_dev, addr, val, MIN(len, limit - addr));
 }
@@ -104,7 +105,8 @@ uint32_t pci_host_config_read_common(PCIDevice *pci_dev, uint32_t addr,
     }
 
     ret = pci_dev->config_read(pci_dev, addr, MIN(len, limit - addr));
-    trace_pci_cfg_read(pci_dev->name, PCI_SLOT(pci_dev->devfn),
+    trace_pci_cfg_read(pci_dev->name, pci_dev_bus_num(pci_dev),
+                       PCI_SLOT(pci_dev->devfn),
                        PCI_FUNC(pci_dev->devfn), addr, ret);
 
     return ret;
diff --git a/hw/pci/trace-events b/hw/pci/trace-events
index fc777d0b5e..7570752c40 100644
--- a/hw/pci/trace-events
+++ b/hw/pci/trace-events
@@ -1,12 +1,12 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
 # pci.c
-pci_update_mappings_del(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
-pci_update_mappings_add(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
+pci_update_mappings_del(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "%s %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
+pci_update_mappings_add(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "%s %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
 
 # pci_host.c
-pci_cfg_read(const char *dev, unsigned devid, unsigned fnid, unsigned offs, unsigned val) "%s %02u:%u @0x%x -> 0x%x"
-pci_cfg_write(const char *dev, unsigned devid, unsigned fnid, unsigned offs, unsigned val) "%s %02u:%u @0x%x <- 0x%x"
+pci_cfg_read(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, unsigned offs, unsigned val) "%s %02x:%02x.%x @0x%x -> 0x%x"
+pci_cfg_write(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, unsigned offs, unsigned val) "%s %02x:%02x.%x @0x%x <- 0x%x"
 
 # msix.c
 msix_write_config(char *name, bool enabled, bool masked) "dev %s enabled %d masked %d"
-- 
MST


