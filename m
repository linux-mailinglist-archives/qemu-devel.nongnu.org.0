Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED4737AB38
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:58:20 +0200 (CEST)
Received: from localhost ([::1]:37154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUm3-0000T9-Am
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgUiF-0005FE-Sb
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:54:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgUiB-0001TU-2r
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620748456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ISzcTyeqpFPJKCkmwsme759uUOl966TzGtwslLb0Jt0=;
 b=ffLVTTpdrIELUqc9VGJGw5QojycqkFTpcfW94U7piPTRJ/dLrsZDc8eJe4xIDI6VuuHqk0
 JP4wHmQgYGYbHAhAj28WPY96fJvsNfcACQQc+kY5SrVLjC/S5/62+SrYk8wDRZ2e7ioIA2
 L2r/FuUnE67608v0iIUKPEckHDUO8Z8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-OAuY9XO2PBCGMFwpQVa7Og-1; Tue, 11 May 2021 11:54:14 -0400
X-MC-Unique: OAuY9XO2PBCGMFwpQVa7Og-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a1ca5120000b02901333a56d46eso42478wme.8
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ISzcTyeqpFPJKCkmwsme759uUOl966TzGtwslLb0Jt0=;
 b=ByqDnj4Q7PNPRU58U7KQJk3GOLgZ6Ks2WlzrmkjmRxXEAga4B4upsU8aji8nBVREHg
 6tYeh3biiCqNHbfF/fV6ZlD7hxZ9qWdKVraIN76H6zCyKLBcWFjtdvIxUW5AaweQzL4D
 3De5r9lNO4F9cMF5ogs34mE2EH2f3li1wjVQ6ucqiLm/ri1e6lg2/tC5MQFF6zGEIl8s
 UW7ITuembBYIYV0R6yTzK2SSpwO5yOoW8O+5mjrxIMmHoVPneNlzJJgg5HrRfIw9SZoa
 6jbQNgrEg7t2BsNjCSkJhLPAw4KG2viBJQYwWYejE4lh39nf1qL7cvj+/WrO2O0b8V/l
 OM3Q==
X-Gm-Message-State: AOAM532X8qNIBMxU+TDZGUZMK6MjcakWVqsQBTyAQnoOMtEzurbWzEd7
 YXPx+trtLiB3inX1c9Ad4pyrAScJbf+k2IsjVxU3OzA+meYlfUCLEqsFVJW6ay5NImxSI3rHisU
 xo/P70YqMh4YMGkKTbSXrIF59DCBa0VR2QUHjN+r+8cqu3+JEPJdjVdrpJlN6CKcJ
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr33147475wmh.151.1620748453280; 
 Tue, 11 May 2021 08:54:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJ/EKPiyvUjRjHZUb88UX11PfXR671R0PgcBflDQVqvMdfkF/biU8tf8IKtv7xFszEqCErcQ==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr33147436wmh.151.1620748453036; 
 Tue, 11 May 2021 08:54:13 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n20sm20232505wmk.12.2021.05.11.08.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 08:54:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/5] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
Date: Tue, 11 May 2021 17:53:50 +0200
Message-Id: <20210511155354.3069141-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511155354.3069141-1-philmd@redhat.com>
References: <20210511155354.3069141-1-philmd@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the kconfig.rst:

  A device should be listed [...] ``imply`` if (depending on
  the QEMU command line) the board may or  may not be started
  without it.

This is the case with the NVDIMM device, so use the 'imply'
weak reverse dependency to select the symbol.

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


