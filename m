Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A48431C661
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 06:31:07 +0100 (CET)
Received: from localhost ([::1]:34340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBswz-0003CJ-Qf
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 00:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lBsvQ-0002Ta-Kc
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 00:29:28 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lBsvO-0005p2-5e
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 00:29:28 -0500
Received: by mail-wr1-x432.google.com with SMTP id v14so11563487wro.7
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 21:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=FpLy6ROik8mkwjeVpeUjzzK104Lh22vBdwv4RsQ+Oj0=;
 b=jtG4GIWoaPPcDV7r6KbLat9WQWtP2eP4zKoYyff5AXviTNSk9bWAP2hMMhTa1l0ZdA
 5vxh0p1xteZCeD2VoaZ3F8UJcSKRDcw04lOHLGN5gsZjVfZclrmlrPrVpOH1086vZ49V
 W7O6rEP2AOvn1AmowiY7e10qkCR4e6V/vLg+h2jDNh1u+k7oamGa+Mv7kJM8B2EdZKu3
 mKhHxnFTZjZAgwHKYeM/6rn2Qk0uPhwCVFXK2wuOdEhtUCFkrF72rineCQWsNds3J5bZ
 9Qh4eM024NzS8IuKHpsGR+ujp9ViU//EEHf8gExR8t9fl9dftzR0ddgKiZYNKAS3VL0u
 XJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FpLy6ROik8mkwjeVpeUjzzK104Lh22vBdwv4RsQ+Oj0=;
 b=puf3RFpK7lvTD/TUW8yfNdgGWkCp/JMYJX5obojAb7ZfToj29kyyQ0kE4+n/udW/CP
 Kse1KOSUcxTtVdo7/+2tl9BU7S8GSVt/XF6UVMQRqP64c6OFIFsvr7KjhGg98EyfUP+k
 +ZdfinLy1eZWdK5vwffu4M+EMrBXfskQDsrmo2L47uCmqhzOq+p48M7yMXImu6nwFDaB
 Vak0AE/dVvlcDU0Sl5gKbDQMWlb1cCP8qnA62zECZ6SrX1XYw/pp2snX5V9pAIbnO/Si
 BwJnGhOh79GO9WIQmC4kxEonftmyMs4MWuoDr1KHdlLfcXvOh/oPPBQanZP2v9yl46il
 lvCQ==
X-Gm-Message-State: AOAM532/3JFwAeRKqPjhQr26GL6eUCwGAZ6faZ2ec55aeSFYdNLTDDGs
 Kv9tUzXECgpR0Xtif0ORWZ2Ysw==
X-Google-Smtp-Source: ABdhPJy5rXyx4v0TE/e3EefvTcgRvIDHs0ziSscFVqtdwQ0Up4vUITEvIcA7h09VT/GzS9ERcLIi2A==
X-Received: by 2002:adf:9bd7:: with SMTP id e23mr21745568wrc.48.1613453364323; 
 Mon, 15 Feb 2021 21:29:24 -0800 (PST)
Received: from f2.redhat.com (bzq-109-64-9-177.red.bezeqint.net.
 [109.64.9.177])
 by smtp.gmail.com with ESMTPSA id y1sm16995653wrr.41.2021.02.15.21.29.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Feb 2021 21:29:23 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH] virtio-pci: add check for vdev in virtio_pci_isr_read
Date: Tue, 16 Feb 2021 07:29:17 +0200
Message-Id: <20210216052917.5712-1-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=2a00:1450:4864:20::432;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wr1-x432.google.com
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

https://bugzilla.redhat.com/show_bug.cgi?id=1743098
There is missing check for vdev in this procedure.
QEMU crash happens in it in hot unplug flow.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 hw/virtio/virtio-pci.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 094c36aa3e..2f19301267 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1364,7 +1364,13 @@ static uint64_t virtio_pci_isr_read(void *opaque, hwaddr addr,
 {
     VirtIOPCIProxy *proxy = opaque;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
-    uint64_t val = qatomic_xchg(&vdev->isr, 0);
+    uint64_t val = 0;
+
+    if (vdev == NULL) {
+        return val;
+    }
+
+    val = qatomic_xchg(&vdev->isr, 0);
     pci_irq_deassert(&proxy->pci_dev);
 
     return val;
-- 
2.17.1


