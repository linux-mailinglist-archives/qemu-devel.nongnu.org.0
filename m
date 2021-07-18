Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511063CC94E
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 15:18:13 +0200 (CEST)
Received: from localhost ([::1]:34598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m56gO-0004qW-5R
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 09:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m56fc-00047A-H2
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 09:17:24 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:45989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m56fa-0004rs-Jb
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 09:17:24 -0400
Received: by mail-pf1-x433.google.com with SMTP id q10so13700206pfj.12
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=HNWjVWFONB7lQgMbX2KWuNmYyT/phajklqav9BNiAm4=;
 b=smJawSvG1X+EDSKoGcnV71BHMxU95Vpie0ldxW2BRFed2ZGdzb3uQ76QBzqgpHwD47
 c1lc6G7iGxOEKI0t74evAXJ8PyrruFndyzu4waL4/r8KX7INOu5HY+zF4CLShZ1IWeYH
 I10zJ1pSR6FeFHflYNs2r/zZU65YrtYW1VxGpbBRMgwcnv3wdlRQOOo9WTIzkUW1KJly
 yHvBqi9A27jNaifjIGIjDfW1WKzcowU/+fNC7cfy0cFgIaJa9AbezVi2VMjTnHriOL5/
 1T5BWOao1z6ACiQsvEMPqU2HcStByZ0qNWteoTLMoFDrASMlykcQVdXJQvgV6GANLnhj
 IUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HNWjVWFONB7lQgMbX2KWuNmYyT/phajklqav9BNiAm4=;
 b=Ka3bANKpUna4LvrFDsFpFUccBJJ0nAlEAc44jTO6TPiw/cA3XxcI0C69IXfpDAbwAi
 QFS+it7I4EJCfRjtwsW11VekZ1Ruoh35fsR6k8L7SV1D5eSolJfVSqtzAGvIyweupEXe
 sDx2vcEe2SBjRoOgXmqnKuymuUjPaFAe9vTwH5BmxC2RIrF0Q1JrqevD4TIywRcxaoXQ
 CA9F+nC96SlJBnahmOvLsoNxsMVB3fFr9QfQATVmuiXnUDu7Dmd/o3RKYS0AVpDPT8oC
 KWH5DFBzbQfScLGhS+JqA2LTVrstw88rBq3eSxqmkD+A4lOM05pmVl5WSDMlfo1lJYHq
 VJww==
X-Gm-Message-State: AOAM532dMcSYZwzDfBs8z8h3P4zRMrJjaP+6wGkaEuYtEq1SjRr0dR+B
 LKNBDfxqTUXKGiK5hG6e8dUSg+SxFES4xQ==
X-Google-Smtp-Source: ABdhPJyNhdrcRSUXe8DWH7UcXzt1bTRG4W8aEWWVO57c4AWybzPtG5KcMqg1LfQ9tz1HvJkIqAf7Vw==
X-Received: by 2002:a05:6a00:a1e:b029:303:56b5:414b with SMTP id
 p30-20020a056a000a1eb029030356b5414bmr20922484pfh.48.1626614239632; 
 Sun, 18 Jul 2021 06:17:19 -0700 (PDT)
Received: from localhost.localdomain ([115.96.122.116])
 by smtp.gmail.com with ESMTPSA id s7sm15682543pfk.12.2021.07.18.06.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 06:17:19 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/pci: remove all references to find_i440fx function
Date: Sun, 18 Jul 2021 18:46:59 +0530
Message-Id: <20210718131659.55783-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=2607:f8b0:4864:20::433;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 jusual@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

commit c0e427d6eb5fefc538 ("hw/acpi/ich9: Enable ACPI PCI hot-plug") removed all
uses of find_i440fx() function. This has been replaced by the more generic call
acpi_get_i386_pci_host() which maybe able to find the root bus both for i440fx
machine type as well as for the q35 machine type. There seems to be no more any
need to maintain a i440fx specific version of the api call. Remove it.

Tested by building from a clean tree successfully.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/pci-host/i440fx.c         | 8 --------
 include/hw/pci-host/i440fx.h | 1 -
 stubs/meson.build            | 1 -
 stubs/pci-host-piix.c        | 7 -------
 4 files changed, 17 deletions(-)
 delete mode 100644 stubs/pci-host-piix.c

diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 28c9bae899..e08716142b 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -314,14 +314,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
     return b;
 }
 
-PCIBus *find_i440fx(void)
-{
-    PCIHostState *s = OBJECT_CHECK(PCIHostState,
-                                   object_resolve_path("/machine/i440fx", NULL),
-                                   TYPE_PCI_HOST_BRIDGE);
-    return s ? s->bus : NULL;
-}
-
 static void i440fx_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index 7fcfd9485c..f068aaba8f 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -45,6 +45,5 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     MemoryRegion *pci_memory,
                     MemoryRegion *ram_memory);
 
-PCIBus *find_i440fx(void);
 
 #endif
diff --git a/stubs/meson.build b/stubs/meson.build
index d3fa8646b3..0faa2a74b7 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -27,7 +27,6 @@ stub_ss.add(files('module-opts.c'))
 stub_ss.add(files('monitor.c'))
 stub_ss.add(files('monitor-core.c'))
 stub_ss.add(files('pci-bus.c'))
-stub_ss.add(files('pci-host-piix.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
 stub_ss.add(files('qmp_memory_device.c'))
 stub_ss.add(files('qmp-command-available.c'))
diff --git a/stubs/pci-host-piix.c b/stubs/pci-host-piix.c
deleted file mode 100644
index 93975adbfe..0000000000
--- a/stubs/pci-host-piix.c
+++ /dev/null
@@ -1,7 +0,0 @@
-#include "qemu/osdep.h"
-#include "hw/pci-host/i440fx.h"
-
-PCIBus *find_i440fx(void)
-{
-    return NULL;
-}
-- 
2.17.1


