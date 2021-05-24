Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C6A38F1D3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:54:25 +0200 (CEST)
Received: from localhost ([::1]:53810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDqS-0005fH-19
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeQ-0004o5-9U
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:58 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeI-0004LE-IN
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:57 -0400
Received: by mail-ej1-x629.google.com with SMTP id gb17so24764531ejc.8
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LJ7zb0d3J9pbQsFoNs7yYsC3rg5PuI/z4b6K7acxh+A=;
 b=V6CfDxkYYmU9OvyXNHsBWh6TRNHdFnRNGxSBpnnPFj1yrp/bExY9leENV5U3FZeO/D
 laDavgzRD42khTRkNCaYyECh+X+PZ7/f5iCy3z57tUUQh+C6zRt0lf1zHKZWSkJ1VPSr
 dsHbSC4gCiZBisEeVJnGjbMSn0zUTMto2KZrDqmSwebKKHhIwo9y2ZiaiHrPoB2YdPK/
 PrqyPEQ4B7LhGiaR0xPAsClRUaOvyvXMx0xuAW6POftv5OdPDYJbQfn7otMH8DtDIIHp
 nzp4SF8t1vpYcgNyiO25TRC34ZLQcA/ehQjy3BFPTyVDSuO4sv4VB6eIyxThA9szuBCT
 wl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LJ7zb0d3J9pbQsFoNs7yYsC3rg5PuI/z4b6K7acxh+A=;
 b=IzosBIm9XIz0fsc212U6u9rmQ3hv8SqGalEZyRcn5D4B8GIvcGj1uJZ5/av6ZM45hI
 dzbV2cbkiKclmASAYTSept5u9iNxm8zY4jUkhwtK2I1u4DEbAJPmTULdyvGqCgYYsLCH
 26aPIZIXiygXnQtUtSUed9oZxDYnCYIVpmyJayA+N6rAIrnN6Qb+y6KZ2KMKbcA04ra/
 RJckyYxDTpHBF4+JXZpK5mtrFj5EBpk/ux0jV5ccgyDBn3SFihL089MGPpKd6Bg3NF3C
 GTXWwomz5vrUCGuM0/ya9Yzn5RNBQXs2iUa+vyejYLRkMWGNgZUlbFXU9HUTVDLTgo2l
 H4hQ==
X-Gm-Message-State: AOAM533fnMzAf4Mmv7zPC1fLCdpA90rzrFZkB0Y1clmNKscPZJjXMONT
 voNmzYBtwPYS6QD2VJeI6YPtHs3wn4cZfQ==
X-Google-Smtp-Source: ABdhPJxznLT8GLajZsvRx/NW1WR46XmbjfdrlLzNN8BoBlACdR4yXFLMesMmFgusqco9AFNXVQxuPg==
X-Received: by 2002:a17:906:11cc:: with SMTP id
 o12mr23784789eja.547.1621874494971; 
 Mon, 24 May 2021 09:41:34 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/28] hw/mem/nvdimm: Use Kconfig 'imply' instead of 'depends
 on'
Date: Mon, 24 May 2021 18:41:07 +0200
Message-Id: <20210524164131.383778-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Per the kconfig.rst:

  A device should be listed [...] ``imply`` if (depending on
  the QEMU command line) the board may or  may not be started
  without it.

This is the case with the NVDIMM device, so use the 'imply'
weak reverse dependency to select the symbol.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210511155354.3069141-2-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 default-configs/devices/ppc64-softmmu.mak | 1 -
 hw/arm/Kconfig                            | 1 +
 hw/i386/Kconfig                           | 1 +
 hw/mem/Kconfig                            | 2 --
 hw/ppc/Kconfig                            | 1 +
 5 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-configs/devices/ppc64-softmmu.mak
index ae0841fa3a..cca52665d9 100644
--- a/default-configs/devices/ppc64-softmmu.mak
+++ b/default-configs/devices/ppc64-softmmu.mak
@@ -8,4 +8,3 @@ CONFIG_POWERNV=y
 
 # For pSeries
 CONFIG_PSERIES=y
-CONFIG_NVDIMM=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b887f6a5b1..67723d9ea6 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -6,6 +6,7 @@ config ARM_VIRT
     imply VFIO_PLATFORM
     imply VFIO_XGMAC
     imply TPM_TIS_SYSBUS
+    imply NVDIMM
     select ARM_GIC
     select ACPI
     select ARM_SMMUV3
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 7f91f30877..66838fa397 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -23,6 +23,7 @@ config PC
     imply TPM_TIS_ISA
     imply VGA_PCI
     imply VIRTIO_VGA
+    imply NVDIMM
     select FDC
     select I8259
     select I8254
diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
index a0ef2cf648..8b19fdc49f 100644
--- a/hw/mem/Kconfig
+++ b/hw/mem/Kconfig
@@ -7,6 +7,4 @@ config MEM_DEVICE
 
 config NVDIMM
     bool
-    default y
-    depends on (PC || PSERIES || ARM_VIRT)
     select MEM_DEVICE
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index e51e0e5e5a..66e0b15d9e 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -3,6 +3,7 @@ config PSERIES
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply VIRTIO_VGA
+    imply NVDIMM
     select DIMM
     select PCI
     select SPAPR_VSCSI
-- 
2.31.1



