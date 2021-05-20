Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB90389FD6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:31:20 +0200 (CEST)
Received: from localhost ([::1]:38648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lje5P-0003Xw-Ov
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxb-0005NT-Dt
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:18 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxQ-0001UO-9q
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:12 -0400
Received: by mail-wr1-x429.google.com with SMTP id p7so12939907wru.10
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LJ7zb0d3J9pbQsFoNs7yYsC3rg5PuI/z4b6K7acxh+A=;
 b=rdD1yD8RlHL0CRCnj+xtf9O0KH6xl+AwSVbZ92Z375m4+omjpzdbGKzXrACIH/K0m2
 nhDMJgAYAdtSQIUAnpSRE5xRG2+bYtIwewkwyaIO8ef51khMTEdhP9L65bNKCeOkwy5w
 ph0piTjEND8GWZB1W0q1AB8mUACS4FfkJcfzn9MrdngtKwo+YgDU95Im3bHQlteJhPx/
 oZGVj0zLOoVZZf89p89WrZMAiOdFbd+F+ToJLeJqx90IKpv+o1uFePfytGq35TaCeB5w
 ChFxTa+bcVyeC20JhCfBNxYv2W8oQfME8fet2sal92Pf7s8KmTMyzCyqO+1Ccspf2IVA
 bpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LJ7zb0d3J9pbQsFoNs7yYsC3rg5PuI/z4b6K7acxh+A=;
 b=cs7TkL+z0Kmx8vneBLAXe4WsLTdMKiTrvDtgg/pGR2fHTxo8RUquGj6KqCKZ2FgSO9
 GEqKxMt8eAnUoL4TUPJpMw0zqnEny5d8hyxxt3A4kCfRoYrwszcfPl2FMNmIprcwR/od
 9iuQCCUxxJpnWWxFNDE2630ALab4zYei2h4+24w/KTZVGr5LWvKR6H8GqRg3RQugPOzq
 MVRkkv+3wa4M2kBdeDozxa798UE+XYfk0MXMKlhDF78d9ulVWDtbz46DIUmabPKJRIsq
 NbZkJ15Uz6VGeNjMw3RJzOkHAcVGSl5ztbrBPF/nX8fV9dLZRxk4QzQudYFRX1stUVCo
 yp8A==
X-Gm-Message-State: AOAM533zPL9RcgMN/OJbkcMEEyKgNNUaaBbVK8WKuUsPtEm6PLXUahqb
 rJCGPf1qRjo6nBOo3grIzcZj+y0kRtuyMw==
X-Google-Smtp-Source: ABdhPJydkdyLA2cyJ6aLeW9RskeRmg0qJp4zeboHMmEJK/0BB+fjD5L36DT5Ra3RSL/6Q2Vm+vQYtA==
X-Received: by 2002:adf:d081:: with SMTP id y1mr2927134wrh.179.1621498981281; 
 Thu, 20 May 2021 01:23:01 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/26] hw/mem/nvdimm: Use Kconfig 'imply' instead of 'depends
 on'
Date: Thu, 20 May 2021 10:22:35 +0200
Message-Id: <20210520082257.187061-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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



