Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22C3362F53
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 12:41:51 +0200 (CEST)
Received: from localhost ([::1]:48614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXiOc-0006H0-RF
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 06:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiET-00023o-8D; Sat, 17 Apr 2021 06:31:21 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:50871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiER-00016L-Mo; Sat, 17 Apr 2021 06:31:20 -0400
Received: by mail-wm1-x32d.google.com with SMTP id u20so10996964wmj.0;
 Sat, 17 Apr 2021 03:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H87QzDiZPuBQ9eTqYywlU8zauYyWci4oQ6E2mLqaLQ4=;
 b=B8XTj1eSX5Z61m2jd98jl0TwesKxcpUQMAJzpJBkfTlZPUuUI2gDvEt/xFNixlgEw3
 VNuBdCYeV5v0vHuMA1DK/l/b02LQx5tubcKuXhZbUIay5tqu5FWKJDO8RMOsp+ATUQta
 otjOmtWd0LHd8R538FK01e7UATB1ttLlLOwXoUgOjBe6VjrQSnV+Esdi5te2lXnBN/nX
 S9xiIBVjdRq2isgbh67CoNDAZVtY8O+L7hYwjk71iVQ9uoTVfbAWAZ9+0S/RHPXkS1VU
 QQjIGrh5XK6hxJ8WSniFwaKr4+AKw9eUKtru9A0/uwHQDAuAd5drC9bOBIl8QwWrhtx6
 VeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H87QzDiZPuBQ9eTqYywlU8zauYyWci4oQ6E2mLqaLQ4=;
 b=iNw9pU2I0Ya+jrtT1tlQQwwsAyYdMAN4FT1gFK4F9JEkTEp5DuzKuIpNE+BEo5wrLQ
 U5GdpQTf5eJlrbxHnJU7r4Zqc5iZAKVWZtTukVQ16+uoc8UYUfGxdoULvLR6oXFGIw0A
 WA5PxyzmqR5QvxK1aRkvQmLcAeJsfWAY67N817ai3hf0KyoF4hMxNNnuoFHGQXncuYaq
 LdlLzV8yRz9XNYjGDM/ipTMFK0IUr66xR3Wayv7zjQq2g54524Go7a9Fy3IDPQ73/EVt
 lqIE58TVi6FW8KTHG0FoKVUN2xMxVSOGEjQY+sM0yyHH/THWHBdhs99hz60Bi4rXanw4
 WdiA==
X-Gm-Message-State: AOAM532CDr9UV2KmlSjOIQIOTVOEpMUS3t+Wyrx1O2/UvsezqFWfxOrK
 dxkQA9yt8tDBKllYtASHimfp8dpOwU8=
X-Google-Smtp-Source: ABdhPJyQocOTkwS7Q1Zv7kSIdVoats4dgVtn8k7jr0NwqdbX0GUUDodrmg0B35nLZwTEw4VnZLdOBA==
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr11847698wmk.55.1618655477336; 
 Sat, 17 Apr 2021 03:31:17 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id s10sm13952026wrt.23.2021.04.17.03.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 03:31:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/11] hw/pci-host/prep: Do not directly map bus-master
 region onto main bus
Date: Sat, 17 Apr 2021 12:30:26 +0200
Message-Id: <20210417103028.601124-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210417103028.601124-1-f4bug@amsat.org>
References: <20210417103028.601124-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The raven bus-master memory region is exposed as an AddressSpace.
AddressSpaces root MemoryRegion must not be mapped into other
MemoryRegion, therefore map the region using its alias.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/raven.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index f9c92b83770..d8c1aaa11f5 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -307,8 +307,6 @@ static void raven_pcihost_initfn(Object *obj)
     memory_region_add_subregion(address_space_mem, PCI_IO_BASE_ADDR,
                                 &s->pci_io_non_contiguous);
     memory_region_add_subregion(address_space_mem, 0xc0000000, &s->pci_memory);
-    pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj), NULL,
-                             &s->pci_memory, &s->pci_io, 0, TYPE_PCI_BUS);
 
     /* Bus master address space */
     memory_region_init(&s->bm, obj, "bm-raven", 4 * GiB);
@@ -320,6 +318,10 @@ static void raven_pcihost_initfn(Object *obj)
     memory_region_add_subregion(&s->bm, 0         , &s->bm_pci_memory_alias);
     memory_region_add_subregion(&s->bm, 0x80000000, &s->bm_ram_alias);
     address_space_init(&s->bm_as, &s->bm, "raven-bm");
+
+    pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj), NULL,
+                             &s->bm_pci_memory_alias, &s->pci_io, 0,
+                             TYPE_PCI_BUS);
     pci_setup_iommu(&s->pci_bus, raven_pcihost_set_iommu, s);
 
     h->bus = &s->pci_bus;
-- 
2.26.3


