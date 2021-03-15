Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA28733B208
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:05:07 +0100 (CET)
Received: from localhost ([::1]:51718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLly1-0002jj-Cw
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lLlt6-0000x0-6L
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:00:00 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lLlsz-0005SF-5e
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:59:55 -0400
Received: by mail-wr1-x42c.google.com with SMTP id a18so8514960wrc.13
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 04:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=g3QrGxkuOO+QPmBaM2fPuBuIAL78mE/TCDsppZUhMUE=;
 b=xtk8PDYpiLUPX6BK/N1ER0DnP9kbgQy6ilFOhCGFcAFgzsNBX/falGAR9EoglIiwLz
 t3CJ7Z5dLLA/V5HF58+zPWrxAqWL+kmsTMLkMLby/7hgGSx3/y+4wS2LIiJ9+8bkS4DG
 3W90BrEtuYCrJp7qFYPYlL5yx8+OBmMmRzp2FsOt8fR/BhZ3ZKg/IFPaNc7db2yop3t9
 LuAuzGRVdYTloRqYlz8cAXmyO38XRa21zx2FEnLJkYQuK2R5gJhIyShJ+1YsTF/tJzxV
 yZ7JMz1I2shq+jA0GvScjtnUYzcktayNKVwKvyZvpDrAbgrDJcSSrABOYUwYG2bPzwGp
 t5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=g3QrGxkuOO+QPmBaM2fPuBuIAL78mE/TCDsppZUhMUE=;
 b=mmP1LgddXExPX/vPCJsVc6Gwnh3eP/Z9ZxcdQRTY5lY2bqbjRl2I514XqOel7GSH8+
 CoKURVSSJayo0NLEx1N9AHZs7wwBSDRf66TuBiQ+uTwJIxrwBLdnsrsMSbfWTCtbkWMZ
 rJprBewWUJkWB5kXLEilEw28a9c8NXKa7mKTovgwKsFuOtlk/2t12s7vJ/oXR4dz+Lx8
 F8WwE/NyoGOBlvfmlbEIuuT9LKT1TEa43Tkk8H+KfD7m0RK61QB+lrqh0sK59oSfnA+r
 J9Yhe7ga2VcWw4rhJ9Q1CLcYfbD5/gBhZnwyOOWYAkJh42Wb0S0bUcg7geSXml3tXp8C
 52qw==
X-Gm-Message-State: AOAM530qub9wuuI8LasVQNyqP/3fQtHCJQo+MG2bQoAN0XT/8UkMMRBv
 208K6p3YZc3F1UgC8BIu7T152wyv4sAkTg==
X-Google-Smtp-Source: ABdhPJyytrehAwiLXTK8FkGNx6ayZHLqy1qa4iB7bRDlkz2ve7BjhUxMyOOjRcR86qdRuABp1qE2qQ==
X-Received: by 2002:a5d:6b8a:: with SMTP id n10mr27147192wrx.150.1615809587274; 
 Mon, 15 Mar 2021 04:59:47 -0700 (PDT)
Received: from f2.redhat.com (bzq-79-176-30-57.red.bezeqint.net.
 [79.176.30.57])
 by smtp.gmail.com with ESMTPSA id a6sm14060010wmm.0.2021.03.15.04.59.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Mar 2021 04:59:46 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com
Subject: [PATCH v2 2/2] virtio-pci: remove explicit initialization of val
Date: Mon, 15 Mar 2021 13:59:37 +0200
Message-Id: <20210315115937.14286-3-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210315115937.14286-1-yuri.benditovich@daynix.com>
References: <20210315115937.14286-1-yuri.benditovich@daynix.com>
Received-SPF: none client-ip=2a00:1450:4864:20::42c;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wr1-x42c.google.com
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
Cc: yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The value is assigned later in this procedure.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 hw/virtio/virtio-pci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 4a3dcee771..c1b67cf6fc 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1385,10 +1385,10 @@ static uint64_t virtio_pci_device_read(void *opaque, hwaddr addr,
 {
     VirtIOPCIProxy *proxy = opaque;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
-    uint64_t val = 0;
+    uint64_t val;
 
     if (vdev == NULL) {
-        return val;
+        return 0;
     }
 
     switch (size) {
@@ -1401,6 +1401,9 @@ static uint64_t virtio_pci_device_read(void *opaque, hwaddr addr,
     case 4:
         val = virtio_config_modern_readl(vdev, addr);
         break;
+    default:
+        val = 0;
+        break;
     }
     return val;
 }
-- 
2.17.1


