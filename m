Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4D23A0FE3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:04:13 +0200 (CEST)
Received: from localhost ([::1]:41978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqv4G-0005GB-J0
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lquzW-0005B9-0l
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:59:18 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:35821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lquzR-0002ug-0E
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:59:17 -0400
Received: by mail-lj1-x22f.google.com with SMTP id n17so13761090ljg.2
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 02:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LN3Pu6RJs3i4flwBlMNyC34bGcWkq6y11cJZxjQuFKo=;
 b=xNOUQPBSuWF1zjacNLh3kmGW1FKQd17jTZbCcTYEdrOAFk7YYYFbG+U7Qf3tSOcE1I
 InmUGR+y791bV4nWs9AVBurYG8LDAHYLtdPGVs968ENYprQTXXP0ICWs494n5QBfLknH
 ykf0bHd6EBp7Eu5ryaFkudFOJdImC5gOktRRoGSaaUXJvvpBPHP9jEXtbV2haMn6QuVV
 DHNkLWbJuz5lBzsSEeMytVEuhW3G+e+le/A7/1Dtv5vpEiabar0Io2EZJd3HST8UJKj/
 YjluC/v/ELnkSq+Nzm8PYXWgxJyTnJN8hRSPISXWu8vugdcZWFBnqiA2Wkn8LGlauHt4
 Qipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LN3Pu6RJs3i4flwBlMNyC34bGcWkq6y11cJZxjQuFKo=;
 b=XoHXPCUZQtk0ShIV79jwURXR88YMaNyPg3nBpyFn8Sr41zifjziirYF4LHUCr9V2oD
 DJtQSd09e2N/1jWN8zuh74kf2PKSs0geyCH3oP7qO0pG8cqhaoeaCLu1xPigjmJIKCln
 zcCfjRpuejLOTiDM3IY2vJK964qbDTbF+P1hAtLBzKW0EUzC6Y4qoamaLT4oU98MTFam
 hgRObdISHfPhnE2OXPxSIFLoN8nmZ0S9qtQ/GNipIPa0jm2ZsfpxDw+UTx7IO4zvXFxa
 NJAYlk7sfs18kqTzf4dM3bSNvMyTx1MrVIyCsz2vnYvyyIOb+B0KIu6FFvBNWiuKTyFX
 bIUg==
X-Gm-Message-State: AOAM533nnVUoZCOymDQn9tqeDhJR5iEFOHKWQtHTYB16bX7l8ooxJFbX
 zowKZ+3OU7JGUyofjzdVJc+IAQ==
X-Google-Smtp-Source: ABdhPJwGfrVAbEZlB5x1qhcbQiO5ZjYeBxR1NVfsF3atb+4Kjhv9AGsxkb5KwvaCLXLwQf53sonylw==
X-Received: by 2002:a2e:8147:: with SMTP id t7mr7715643ljg.241.1623232751555; 
 Wed, 09 Jun 2021 02:59:11 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id q6sm218751lfj.88.2021.06.09.02.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 02:59:11 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com
Subject: [PATCH 2/3] virtio-pci: Added check for virtio device in PCI config
 cbs.
Date: Wed,  9 Jun 2021 12:58:42 +0300
Message-Id: <20210609095843.141378-3-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609095843.141378-1-andrew@daynix.com>
References: <20210609095843.141378-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::22f;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x22f.google.com
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

Now, if virtio device is not present on virtio-bus - pci config callbacks
will not lead to possible crush. The read will return "-1" which should be
interpreted by a driver that pci device may be unplugged.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 hw/virtio/virtio-pci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 05865b1fcb..186b7bc0f6 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -423,6 +423,11 @@ static uint64_t virtio_pci_config_read(void *opaque, hwaddr addr,
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     uint32_t config = VIRTIO_PCI_CONFIG_SIZE(&proxy->pci_dev);
     uint64_t val = 0;
+
+    if (vdev == NULL) {
+        return UINT64_MAX;
+    }
+
     if (addr < config) {
         return virtio_ioport_read(proxy, addr);
     }
@@ -454,6 +459,11 @@ static void virtio_pci_config_write(void *opaque, hwaddr addr,
     VirtIOPCIProxy *proxy = opaque;
     uint32_t config = VIRTIO_PCI_CONFIG_SIZE(&proxy->pci_dev);
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+
+    if (vdev == NULL) {
+        return;
+    }
+
     if (addr < config) {
         virtio_ioport_write(proxy, addr, val);
         return;
-- 
2.31.1


