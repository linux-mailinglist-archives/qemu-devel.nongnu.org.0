Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDC13F6DA6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 05:21:25 +0200 (CEST)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIjTh-0001UQ-0b
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 23:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIjSR-0007hP-EI
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 23:20:07 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIjSO-0005YS-9g
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 23:20:07 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so3183607pjb.3
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 20:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XD7CH6PtFEM6PzrrdSSPuX4DbBlROf9i/Uo9ehMlyoM=;
 b=gQplbBXRBU0IcVJtJgFkpTt58bhUHTM9q0VV+1yXdmkpo284hgPfO0GXhpTSJ00axZ
 50HM2ho3qBiYE3vMHykGDiY2TEpaUh7xEPdBcRnojURjQxoxE+nNTff9tZ0G9MLOlU6E
 g952I1wdbCXoSDypnuM7aDCx1pS/Cbbik0+1rkU/T9i1Cp3QwT+MVO2qMEFVevhsWLEb
 n2qJIZMZKK3exKx+j9YXSZhLnQODwFaCU76EeG7P6nnxDxGn0tZDQRXkjCy+LwRlTdi7
 cCZuQEj4fSbqjINp1HERtp/SpChjjkBPuSSnkhK7umySiTJbEZqHwZvUxG7DuNpyEhVs
 VBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XD7CH6PtFEM6PzrrdSSPuX4DbBlROf9i/Uo9ehMlyoM=;
 b=jvdd+oeUe8ZEd9wYMLm1xay/kGNubZoqKWlSJcpt6ZflS9tdLUpkp/SADfPovXVGFw
 DfWRe5VGY7e3AyiUcG2ygbMgUWNspIzDBVpuVtHm+O2qBN73HwiSKKz0GVgMu7Bh2u1K
 xgOkoXknzSnMW3edA1pRTWKaiyrfR4TkllhfZiSCZMyF8ed1R2pyUfvQG6xdEAMS8gI1
 UQZqrZBMRJvtj0m48Gx1JEaeioaWwY4pGvBBzwIw4HZmjzmTWFZvQHkbL/9RAVPEc0ef
 ywc7hVtjqc0EmJigN16Um7WcVyAWvqBphyfKvJQhaVk11F9uurxt6VyiiWY16C2yClFJ
 CorA==
X-Gm-Message-State: AOAM531BiFXCYuefics4jtND9mTvRzlIT9a/Crw52jQVVYuqQOM8P/kU
 OMm9JBZAAqmO+dCVdBlJqU/tKddqJqvOfw==
X-Google-Smtp-Source: ABdhPJzitTgtvCXJ6zUX+ITkXpzFCM+Q29WJA08Z5/dIzjCsXlzMqpSFE2OmNGbkBezPcFYJTH1Cxg==
X-Received: by 2002:a17:90a:d3d0:: with SMTP id
 d16mr8111121pjw.103.1629861603085; 
 Tue, 24 Aug 2021 20:20:03 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.155.195])
 by smtp.googlemail.com with ESMTPSA id c19sm3404895pjs.1.2021.08.24.20.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 20:20:02 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: mst@redhat.com
Subject: [PATCH 1/5] hw/pci: remove all references to find_i440fx function
Date: Wed, 25 Aug 2021 08:49:45 +0530
Message-Id: <20210825031949.919376-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825031949.919376-1-ani@anisinha.ca>
References: <20210825031949.919376-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102a.google.com
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
Cc: ani@anisinha.ca, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

commit c0e427d6eb5fefc538 ("hw/acpi/ich9: Enable ACPI PCI hot-plug") removed all
uses of find_i440fx() function. This has been replaced by the more generic call
acpi_get_i386_pci_host() which maybe able to find the root bus both for i440fx
machine type as well as for the q35 machine type. There seems to be no more any
need to maintain a i440fx specific version of the api call. Remove it.

Tested by building from a clean tree successfully.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.25.1


