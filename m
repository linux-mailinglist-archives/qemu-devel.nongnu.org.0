Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD213A0FDE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:01:49 +0200 (CEST)
Received: from localhost ([::1]:34064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqv1w-0008Ra-TP
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lquzU-00058G-RN
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:59:16 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:33284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lquzQ-0002u1-Fq
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:59:16 -0400
Received: by mail-lf1-x12a.google.com with SMTP id bp38so1535985lfb.0
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 02:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cynhB7H844usO/w7q82Q6cxltDJPQ4Zf1PvkeKtrTf0=;
 b=IRNUHyTf4y7Mdijcy82BwMO+ryphNeDci32XDifug2O3nb9lYr+TCx1eAwu+JrQK8h
 hqGlj3h96FBA4oNCwZD2fYu5yF6Mg0kLRHlcqf7Z1SEC8IGeqJz4WMsPh1PsXRxXPMTs
 PNugZJ2yu3KGE4sucmEVTVNqBEZazhvh53pUK7Ra66oEfa+nH3RJxBYpBicMVYMKslN9
 Ekv2q/PQu/oGUyU8qawkjTAionuJRGr53pB0EWNoE6YwzDZZRBbpnFOMAxVCC8UqHA92
 sR7JMnabLz9dpyUdKyN0wMv1zcB2ehb1orU50xpYm1zmW+GS0qAz77qn0TFnmtgMlg3M
 XGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cynhB7H844usO/w7q82Q6cxltDJPQ4Zf1PvkeKtrTf0=;
 b=CRxbufzyBTeGQznGqy4dG1+PDHI30YAlGYfuMhISqdtI5yZtDT2B4D+pfO9lceuBYq
 W1SjNjFqcH9wI1167wNY/8r78eHOZ7OaMiJrZShJpjuQeNocNcqK9IQgLiGxP5/mD5pq
 0Pdnud9ti9XjxMDnCskgVk0V8Ud8zrQyWw8l6l6gKfuycH8mjy43S3cwmYOVdrGPITCn
 g4VBc+NAV2guLRKQtShInKj5rGL8B/iHQatWGr4BSrGoAzO/d6c+oI9s0zRdumIm36V0
 7GOatPipoepesQYZlXAAELLLhdCcSUEsP9g6+jBpYiHx3TCKUrLRCM+piy4TT6yr39Yj
 CmGg==
X-Gm-Message-State: AOAM530HThEJagbZUm3rE8nRAAf1bI6jRzUuO4Uk1/9aawDwxQaBAMpE
 85VKdUgNG3hvVEBoAG0ibW9bhg==
X-Google-Smtp-Source: ABdhPJw+SgwrzbFMEF/eVSC3WKjlgBJqG1w6pNvEPNEqZA4yZmdpoRZrp6VA2l0qtkXNtzH+pn+JQw==
X-Received: by 2002:a05:6512:39ca:: with SMTP id
 k10mr11700483lfu.473.1623232750724; 
 Wed, 09 Jun 2021 02:59:10 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id q6sm218751lfj.88.2021.06.09.02.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 02:59:10 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com
Subject: [PATCH 1/3] virtio-pci: Added check for virtio device presence in mm
 callbacks.
Date: Wed,  9 Jun 2021 12:58:41 +0300
Message-Id: <20210609095843.141378-2-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609095843.141378-1-andrew@daynix.com>
References: <20210609095843.141378-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::12a;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x12a.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During unplug the virtio device is unplugged from virtio-bus on pci. In some cases,
requests to virtio-pci mm may acquire during/after unplug. Added check that virtio
device is on the bus, for "common" memory region.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 hw/virtio/virtio-pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index b321604d9b..05865b1fcb 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1146,6 +1146,10 @@ static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
     uint32_t val = 0;
     int i;
 
+    if (vdev == NULL) {
+        return UINT64_MAX;
+    }
+
     switch (addr) {
     case VIRTIO_PCI_COMMON_DFSELECT:
         val = proxy->dfselect;
@@ -1229,6 +1233,10 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
     VirtIOPCIProxy *proxy = opaque;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
 
+    if (vdev == NULL) {
+        return;
+    }
+
     switch (addr) {
     case VIRTIO_PCI_COMMON_DFSELECT:
         proxy->dfselect = val;
-- 
2.31.1


