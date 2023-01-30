Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 914A3681B6E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:27:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMacg-0002Ic-3M; Mon, 30 Jan 2023 15:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacX-0002GY-4u
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacU-0006pT-6a
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2g5ysF7CAHTyvaXDtnVWs2/BqxrqcBQDQxiGugZ8DgE=;
 b=DFZ3ZeywGTK5FOOBaG2N/aqibmK9/R2Nnw/hdVGq8XWJnm5rc7MI9NcrrcojltyiUWoJdJ
 Badw93P+kAz/Rk6e9B3Zl4MkKsFRfTkHUgVjUui11XGf3XlnYIkSGee4R46dBPeCqi6mHw
 4AHS40h/YUqQ9t6XuyIoUOC4k1csuAA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-331-xspxYTnaNTemFkosYEZZ1w-1; Mon, 30 Jan 2023 15:19:09 -0500
X-MC-Unique: xspxYTnaNTemFkosYEZZ1w-1
Received: by mail-ej1-f71.google.com with SMTP id
 d14-20020a170906c20e00b00889f989d8deso1895516ejz.15
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2g5ysF7CAHTyvaXDtnVWs2/BqxrqcBQDQxiGugZ8DgE=;
 b=B4YGBXlG8RPMNWPNrEEtV4nboLfQ4ylLIB80QwDQJ0ZLL+1bwGdw5GYVuHcJkBFi3l
 aWBil2BaljBRpCaJ55Qm2YPFA34Ltx1rfD4i2mGLdXjJed7t/f/YDXjfD2BsXrDzrT8w
 QBZrZoJtuvQjRUxYB1UqlcF3uEX6tlEl9sTqo+uylhQvAgJvy+AoJCu574ZS1iGPhg/R
 y/IcjJzR5GAR+6/X0NToCEnf82d4+8TTDnwMbjLDrH806tOytt5Fd/+glMW1OzXugrv2
 BkAj+cPGTeFcCK4w85n+49JDa2arQvVfn4ZE0KxzzU54ZANWZO7cLNILY3EEq06Qc46w
 vcWg==
X-Gm-Message-State: AO0yUKXTxHjt38Fv6mcREwQqkMEhwh2jd+wtF1AoIhbCC1APYgIVg0rR
 NQHV+384ZlvE+k5THOok99BBrTd+jTsQ75cWICY21SMp+exQCkGPW//cu6b4dcupToBCquRP8eK
 QdVwAOhzktwGL3VmDM+jDRAoX6/Lt2nXzO4GwNognAdhr+DhoFbGRVkTW4I/k
X-Received: by 2002:a17:906:ee8a:b0:884:c6d8:e291 with SMTP id
 wt10-20020a170906ee8a00b00884c6d8e291mr12007732ejb.57.1675109947530; 
 Mon, 30 Jan 2023 12:19:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9QzP3EAcrInRNBFyo4LNVjrB5mPKe90POlfgTs8XdMJrrUqnPn7RlGf7lTsCRTOJdgTm8E6Q==
X-Received: by 2002:a17:906:ee8a:b0:884:c6d8:e291 with SMTP id
 wt10-20020a170906ee8a00b00884c6d8e291mr12007699ejb.57.1675109947240; 
 Mon, 30 Jan 2023 12:19:07 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 k2-20020a170906970200b008775b8a5a5fsm7247292ejx.198.2023.01.30.12.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:19:06 -0800 (PST)
Date: Mon, 30 Jan 2023 15:19:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>, qemu-ppc@nongnu.org
Subject: [PULL 07/56] hw/pci-host: Use register definitions from PCI standard
Message-ID: <20230130201810.11518-8-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

No need to document magic values when the definition names
from "standard-headers/linux/pci_regs.h" are self-explicit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230105173702.56610-1-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/pci-host/grackle.c  |  2 +-
 hw/pci-host/raven.c    |  6 +++---
 hw/pci-host/uninorth.c | 33 +++++++++++----------------------
 3 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
index 8cf318cb80..8e589ff2c9 100644
--- a/hw/pci-host/grackle.c
+++ b/hw/pci-host/grackle.c
@@ -91,7 +91,7 @@ static void grackle_init(Object *obj)
 
 static void grackle_pci_realize(PCIDevice *d, Error **errp)
 {
-    d->config[0x09] = 0x01;
+    d->config[PCI_CLASS_PROG] = 0x01;
 }
 
 static void grackle_pci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 5b00b4e462..cdfb62ac2e 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -330,9 +330,9 @@ static void raven_realize(PCIDevice *d, Error **errp)
     char *filename;
     int bios_size = -1;
 
-    d->config[0x0C] = 0x08; // cache_line_size
-    d->config[0x0D] = 0x10; // latency_timer
-    d->config[0x34] = 0x00; // capabilities_pointer
+    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
+    d->config[PCI_LATENCY_TIMER] = 0x10;
+    d->config[PCI_CAPABILITY_LIST] = 0x00;
 
     memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios", BIOS_SIZE,
                                      &error_fatal);
diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
index e3abe3c0f9..e4c1abd871 100644
--- a/hw/pci-host/uninorth.c
+++ b/hw/pci-host/uninorth.c
@@ -276,12 +276,9 @@ static void pci_unin_internal_init(Object *obj)
 
 static void unin_main_pci_host_realize(PCIDevice *d, Error **errp)
 {
-    /* cache_line_size */
-    d->config[0x0C] = 0x08;
-    /* latency_timer */
-    d->config[0x0D] = 0x10;
-    /* capabilities_pointer */
-    d->config[0x34] = 0x00;
+    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
+    d->config[PCI_LATENCY_TIMER] = 0x10;
+    d->config[PCI_CAPABILITY_LIST] = 0x00;
 
     /*
      * Set kMacRISCPCIAddressSelect (0x48) register to indicate PCI
@@ -296,30 +293,22 @@ static void unin_main_pci_host_realize(PCIDevice *d, Error **errp)
 
 static void unin_agp_pci_host_realize(PCIDevice *d, Error **errp)
 {
-    /* cache_line_size */
-    d->config[0x0C] = 0x08;
-    /* latency_timer */
-    d->config[0x0D] = 0x10;
-    /* capabilities_pointer
-    d->config[0x34] = 0x80; */
+    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
+    d->config[PCI_LATENCY_TIMER] = 0x10;
+    /* d->config[PCI_CAPABILITY_LIST] = 0x80; */
 }
 
 static void u3_agp_pci_host_realize(PCIDevice *d, Error **errp)
 {
-    /* cache line size */
-    d->config[0x0C] = 0x08;
-    /* latency timer */
-    d->config[0x0D] = 0x10;
+    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
+    d->config[PCI_LATENCY_TIMER] = 0x10;
 }
 
 static void unin_internal_pci_host_realize(PCIDevice *d, Error **errp)
 {
-    /* cache_line_size */
-    d->config[0x0C] = 0x08;
-    /* latency_timer */
-    d->config[0x0D] = 0x10;
-    /* capabilities_pointer */
-    d->config[0x34] = 0x00;
+    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
+    d->config[PCI_LATENCY_TIMER] = 0x10;
+    d->config[PCI_CAPABILITY_LIST] = 0x00;
 }
 
 static void unin_main_pci_host_class_init(ObjectClass *klass, void *data)
-- 
MST


