Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203A737FBD9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:55:19 +0200 (CEST)
Received: from localhost ([::1]:46794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEcH-0006Bi-Ux
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEMj-0002HT-5M
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEMg-0000jE-VL
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bW5gbIH0gVW0SIl2TNyDBPbRck/tAvlYokCEWuHZkDo=;
 b=XIuhEKBRXYaL3FuyaIyWx8dxPd7XyeWn8QbSMsQOdgF5hODL+Uq21CU9wMQIqCyulnXX6x
 oN9R40iZGaVDpc0VeP1kKfcqpWVfhmZ49nmLp4tQi5wkGZfYOlqTk5z5RqpmndK8UGb2vy
 S3bxPXrdsFpQQs3mpU2qD2IuE4cqcho=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-lyAmd97_OnOJdu8DwzrPqQ-1; Thu, 13 May 2021 12:39:06 -0400
X-MC-Unique: lyAmd97_OnOJdu8DwzrPqQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 n6-20020a0564020606b029038cdc241890so1426840edv.20
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bW5gbIH0gVW0SIl2TNyDBPbRck/tAvlYokCEWuHZkDo=;
 b=IUtNqSvL/BVejEZ1HsfNEvDfIv8Vn9hX0GaP2Zj9uxYRJWQdjugkSjuUOx9q+0uiWP
 Kq5DncODMz+aRUTnCatP6t4D8cyR77M1najaekFIQHIPIOGL3GoA5JSZcez73A/J1SdY
 71/KQSL3iX19vqwso0BU7UOJUrzxPlpguUfQcXI6a7KwjWOBd1vOgPWD+KbnSujH5+jP
 GLUlEG+s3yp7hvpZ7YaFMPFgNo5UHcPx3hVL7FXCAX+DMNDz5ODaF8hdShF2dWsrYXNd
 jHPCC2bn3p4NseSYCpH8h9mqwkFdpmyurQ62lCNoKFnOqvHk863E7OeDo7vqHpLAMwYl
 9aWg==
X-Gm-Message-State: AOAM532fL2vTKxIwOfmj9ayLjKjDhSE3MjxobL2S3Ajufgkrhj6r9VUq
 XWrHqEQdEToc2VyxU755wcFvunpD74ybYTipRGSSdOb9aimYxNAZ6ShWMqwqNb1ZMGnKrWjFQhe
 rdsHEamrha7XHPNzphJan2whKSTVFAba6Hp9KxMBsuJbjwo/ldt3kL66hGX6L93g9
X-Received: by 2002:a17:906:5917:: with SMTP id
 h23mr4105839ejq.457.1620923945252; 
 Thu, 13 May 2021 09:39:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrXzw29CRvct8vgvUH19mfvMTnZDWe4CE76WQl44rPKgdBUG1b223i/h7qZhPzWi3i9CoEyQ==
X-Received: by 2002:a17:906:5917:: with SMTP id
 h23mr4105802ejq.457.1620923944909; 
 Thu, 13 May 2021 09:39:04 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id y11sm2539673edd.91.2021.05.13.09.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 09:39:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/10] hw/mem/nvdimm: Use Kconfig 'imply' instead of 'depends
 on'
Date: Thu, 13 May 2021 18:38:49 +0200
Message-Id: <20210513163858.3928976-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210513163858.3928976-1-philmd@redhat.com>
References: <20210513163858.3928976-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the kconfig.rst:

  A device should be listed [...] ``imply`` if (depending on
  the QEMU command line) the board may or  may not be started
  without it.

This is the case with the NVDIMM device (it is certainly possible
to start a machine without NVDIMM) , so use the 'imply' weak
reverse dependency to select the symbol.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 default-configs/devices/ppc64-softmmu.mak | 1 -
 hw/arm/Kconfig                            | 1 +
 hw/i386/Kconfig                           | 1 +
 hw/mem/Kconfig                            | 2 --
 hw/ppc/Kconfig                            | 1 +
 5 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-configs/devices/ppc64-softmmu.mak
index ae0841fa3a1..cca52665d90 100644
--- a/default-configs/devices/ppc64-softmmu.mak
+++ b/default-configs/devices/ppc64-softmmu.mak
@@ -8,4 +8,3 @@ CONFIG_POWERNV=y
 
 # For pSeries
 CONFIG_PSERIES=y
-CONFIG_NVDIMM=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b887f6a5b17..67723d9ea6a 100644
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
index 7f91f30877f..66838fa397b 100644
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
index a0ef2cf648e..8b19fdc49f1 100644
--- a/hw/mem/Kconfig
+++ b/hw/mem/Kconfig
@@ -7,6 +7,4 @@ config MEM_DEVICE
 
 config NVDIMM
     bool
-    default y
-    depends on (PC || PSERIES || ARM_VIRT)
     select MEM_DEVICE
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index e51e0e5e5ac..66e0b15d9ef 100644
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
2.26.3


