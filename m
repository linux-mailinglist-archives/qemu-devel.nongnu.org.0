Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E68E31AB85
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:11:44 +0100 (CET)
Received: from localhost ([::1]:34832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAui7-00078x-D4
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaE-0001qu-5N
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:34 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaB-000640-WD
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:33 -0500
Received: by mail-wm1-x32b.google.com with SMTP id u14so2504336wmq.4
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KMNnfr19kskXvoMIQnuxddOiHnehylqtGZQ0s69znMo=;
 b=Hq52+jf/No3bA9b5DVmhbpiPhOpUkEK9NhXNyPXBe4Nny0dk69vkue0U9gT8n8Bh1G
 hXTrLv2oEHuO1bFmBScwUznjuyrV232xTgLIQa/hiOLicYM68rC/SiuHrvzMJLvEsY+j
 R6pL4kTK5Czncc0y/N6fDyoNCyaUcE+/0YKNozeEAUFFY8XnR5fQMPLH2uqlrD3gC3PT
 srkPp92g/kz2koNvzSVCk0aitpoU1iQtNijQ5ycSS1rCdsFpyloBKA1jK7ewTd2ugvPN
 1lMJtehs2ftkn295Nb6zzi61PLZ3HIVYOcllic7Po9NjZQs+296N680gyoyliQIjD354
 jykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KMNnfr19kskXvoMIQnuxddOiHnehylqtGZQ0s69znMo=;
 b=lRrKkSdaFFoOvPVLCRuxk55HOQTEO0V/MAydHr7M7hwj1Sjta34F6Nncu4J3mnHeb0
 GZ2m5hMORPSU5h7jkSzUazP//s//RpSBU6RjHnFCzFVbWMywAJoG0RuFFxpgDHQE/bbO
 OfHeQMxAT6c0V9ykTERr74INvNnUr6CFHMmtnCjV0Ja9k+jHEP/uAlfeU4qj4gnFdrXE
 eNI3kWUqCBDoYIhFeJa3tpni6fGs0MNuqoZUEQwHj8OOfmJvr8srIvukO4XGrARHFJb7
 WrblMQUT7na3Ui5N0vIIIXviy47TlFa8KBYcUbFobDKxGwwanUJFYRVhylyTHP6qpHmE
 XqSA==
X-Gm-Message-State: AOAM531FbFasbfPi22yHeSZkpmPqK5f7rcR5ghrtL4DoFDF6dnKKYG0G
 g8Op/iVB3mvSsIp6NxerBskbJw==
X-Google-Smtp-Source: ABdhPJz8chvZxfCqhHEo7SQSCZ+aokFSHQ576gp+1LIvqDoGTqTKS/y+XDLEbSeb03ihyw+IDi8K0g==
X-Received: by 2002:a7b:ce99:: with SMTP id q25mr6768514wmj.174.1613221410351; 
 Sat, 13 Feb 2021 05:03:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a84sm18090776wme.12.2021.02.13.05.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:03:26 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9399D1FF87;
 Sat, 13 Feb 2021 13:03:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/23] hw/virtio/pci: include vdev name in registered PCI
 sections
Date: Sat, 13 Feb 2021 13:03:03 +0000
Message-Id: <20210213130325.14781-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When viewing/debugging memory regions it is sometimes hard to figure
out which PCI device something belongs to. Make the names unique by
including the vdev name in the name string.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Message-Id: <20200713200415.26214-10-alex.bennee@linaro.org>
Message-Id: <20210210221053.18050-2-alex.bennee@linaro.org>
---
 hw/virtio/virtio-pci.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 094c36aa3e..883045a223 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1423,7 +1423,8 @@ static void virtio_pci_device_write(void *opaque, hwaddr addr,
     }
 }
 
-static void virtio_pci_modern_regions_init(VirtIOPCIProxy *proxy)
+static void virtio_pci_modern_regions_init(VirtIOPCIProxy *proxy,
+                                           const char *vdev_name)
 {
     static const MemoryRegionOps common_ops = {
         .read = virtio_pci_common_read,
@@ -1470,36 +1471,41 @@ static void virtio_pci_modern_regions_init(VirtIOPCIProxy *proxy)
         },
         .endianness = DEVICE_LITTLE_ENDIAN,
     };
+    g_autoptr(GString) name = g_string_new(NULL);
 
-
+    g_string_printf(name, "virtio-pci-common-%s", vdev_name);
     memory_region_init_io(&proxy->common.mr, OBJECT(proxy),
                           &common_ops,
                           proxy,
-                          "virtio-pci-common",
+                          name->str,
                           proxy->common.size);
 
+    g_string_printf(name, "virtio-pci-isr-%s", vdev_name);
     memory_region_init_io(&proxy->isr.mr, OBJECT(proxy),
                           &isr_ops,
                           proxy,
-                          "virtio-pci-isr",
+                          name->str,
                           proxy->isr.size);
 
+    g_string_printf(name, "virtio-pci-device-%s", vdev_name);
     memory_region_init_io(&proxy->device.mr, OBJECT(proxy),
                           &device_ops,
                           proxy,
-                          "virtio-pci-device",
+                          name->str,
                           proxy->device.size);
 
+    g_string_printf(name, "virtio-pci-notify-%s", vdev_name);
     memory_region_init_io(&proxy->notify.mr, OBJECT(proxy),
                           &notify_ops,
                           proxy,
-                          "virtio-pci-notify",
+                          name->str,
                           proxy->notify.size);
 
+    g_string_printf(name, "virtio-pci-notify-pio-%s", vdev_name);
     memory_region_init_io(&proxy->notify_pio.mr, OBJECT(proxy),
                           &notify_pio_ops,
                           proxy,
-                          "virtio-pci-notify-pio",
+                          name->str,
                           proxy->notify_pio.size);
 }
 
@@ -1654,7 +1660,7 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
 
         struct virtio_pci_cfg_cap *cfg_mask;
 
-        virtio_pci_modern_regions_init(proxy);
+        virtio_pci_modern_regions_init(proxy, vdev->name);
 
         virtio_pci_modern_mem_region_map(proxy, &proxy->common, &cap);
         virtio_pci_modern_mem_region_map(proxy, &proxy->isr, &cap);
-- 
2.20.1


