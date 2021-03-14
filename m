Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7674D33A4C2
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 13:27:29 +0100 (CET)
Received: from localhost ([::1]:38828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLPqC-0000UF-FQ
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 08:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vitaly@cyberhaven.com>)
 id 1lLPna-0008AA-5S
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 08:24:46 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vitaly@cyberhaven.com>)
 id 1lLPnY-0005fR-3t
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 08:24:45 -0400
Received: by mail-wr1-x42c.google.com with SMTP id j2so7210775wrx.9
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cyberhaven.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w1iwVVGTSg4NdbQwU7XN2V/K8U/yuHiCibwnvt9K3YQ=;
 b=dF6dBDDbAt3GU8m1J3eR2kq+9xlPimM2L/k/dUMnUAxMPrwRa4w8MeFG5c0UGAInfX
 Uti/IBJ8/cotfcgZZZ6eoF5kLiuk71ftRWGhGuyJlEtnO894Mzx9uG1RHL6q0aEAvxEM
 7+/av0sJmuPKUuAuiL8+yBQsFIS4cLOB1JCwh9dSQWOtrSnoCIFZhCIrr050ohZn4buC
 6O6xXEEFGYubEhZvkrQ0ISbaDAIAglQuQ2R+fGxMFtwaCc3WILwW0L8133OjYaNjooae
 5UgsP6sjjlSfv8KWlV/BK7HtwvDF6bXrIxjuE2jscITn4e672zCvYPJhQce0+eMrt2RN
 jAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w1iwVVGTSg4NdbQwU7XN2V/K8U/yuHiCibwnvt9K3YQ=;
 b=irSkxlBa9L8OGqHXqcbWAdrEwIZiEHGPtcsNkGH1k5vttQGCarIirtpQBx0mYPo83j
 A/OlZ/DvQ9vPl65MDV+B3bQapXx2Fe5FJHyYq4RWYIGFdh64iHep+qgdpOjNkbPAE434
 K7mPvan9poS9qkWxrd7s7laSWYoAteQv6TOqU3NDlkQKcH3Xs97glOXTN8We619/ABpM
 AJ6qLH8noJs5KLOax0+ju/U/TbBo9QfJwecRp1AOW4A5smO85oWPJxeC9Ierrut6szoM
 ZGVv9yrwG/sbqeVyyGQUvJDLk8sWsB/K9exQjpQ0dfKbaAg3hcFZ+Q75OmPj4CaFeN2z
 pPwA==
X-Gm-Message-State: AOAM533aIGICvZUDFJoqr6ovCit547Pgyj05RU6hCneBv0tqx6Uiq/YW
 Q3pwGHtPiQnGppX8cCb8OTPsUMGfdATA+FcQHkU=
X-Google-Smtp-Source: ABdhPJw7tVC/jQrxocXvPPIHCtG7yN6D7LtRpqZSCujFFxX5wHhZVx80FXjNCqFmxPxZJs0OuEiOUA==
X-Received: by 2002:a05:6000:4b:: with SMTP id
 k11mr22839702wrx.35.1615724681623; 
 Sun, 14 Mar 2021 05:24:41 -0700 (PDT)
Received: from localhost.localdomain (bbcs-71-51.pub.wingo.ch. [144.2.71.51])
 by smtp.gmail.com with ESMTPSA id
 o188sm9688011wme.7.2021.03.14.05.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 05:24:41 -0700 (PDT)
From: vitaly@cyberhaven.com
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/display/virtio-vga: made vga memory size configurable
Date: Sun, 14 Mar 2021 13:23:14 +0100
Message-Id: <20210314122314.3201195-1-vitaly@cyberhaven.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=vitaly@cyberhaven.com; helo=mail-wr1-x42c.google.com
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
Cc: Vitaly Chipounov <vitaly@cyberhaven.com>, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Chipounov <vitaly@cyberhaven.com>

This enables higher resolutions. The default is still 8MB for
backwards compatibility with existing snapshots.

The property name "vgamem_fb" is similar to that of the other
graphic adapters.

seabios/vgasrc/svgamodes.c needs to be updated as well.
For example, adding the following line would expose
a 3840x2160 resolution to the guest.

{ 0x199, { MM_DIRECT, 3840, 2160, 32, 8, 16, SEG_GRAPH } },

Signed-off-by: Vitaly Chipounov <vitaly@cyberhaven.com>
---
 hw/display/virtio-vga.c | 3 ++-
 hw/virtio/virtio-pci.h  | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index d3c6404061..657fafc48f 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -118,7 +118,7 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     int i;
 
     /* init vga compat bits */
-    vga->vram_size_mb = 8;
+    vga->vram_size_mb = vpci_dev->vgamem_size_mb;
     vga_common_init(vga, OBJECT(vpci_dev));
     vga_init(vga, OBJECT(vpci_dev), pci_address_space(&vpci_dev->pci_dev),
              pci_address_space_io(&vpci_dev->pci_dev), true);
@@ -204,6 +204,7 @@ static void virtio_vga_set_big_endian_fb(Object *obj, bool value, Error **errp)
 
 static Property virtio_vga_base_properties[] = {
     DEFINE_VIRTIO_GPU_PCI_PROPERTIES(VirtIOPCIProxy),
+    DEFINE_PROP_UINT32("vgamem_mb", VirtIOPCIProxy, vgamem_size_mb, 8),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index d7d5d403a9..8684311a8d 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -151,6 +151,8 @@ struct VirtIOPCIProxy {
     VirtIOIRQFD *vector_irqfd;
     int nvqs_with_notifiers;
     VirtioBusState bus;
+
+    uint32_t vgamem_size_mb;
 };
 
 static inline bool virtio_pci_modern(VirtIOPCIProxy *proxy)
-- 
2.25.1


