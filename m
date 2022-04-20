Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1499D508CFE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:15:57 +0200 (CEST)
Received: from localhost ([::1]:37946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCzk-00077U-1y
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLz-00020v-0A
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:51 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:33022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLx-000107-EZ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:50 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l3-20020a05600c1d0300b0038ff89c938bso2613255wms.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U1Ym0oWh6yDBjxqy2SbaqlllddfKPVs7BVcBIihMzss=;
 b=KbViuvRQsHbFUQ566tVoFx7cEKhVK6MytmCJJM+mXelan29Jvvl0nqC35GRZrLjwaf
 OW1VgXRvb0JgJ3BOta+MN2qtITUMe1Tz2uKMeyqDU8KnDDNfGSU8INPD3RQpnI08gk/W
 LXwV8f6koA+GRg/BlLgBn0kRj5hd2jqYBgawTLqk8bJrR9drQGMMa6dBHd37eccDYNZM
 Y0IdxJr7Sp+oTqaEn7mSIR2gUR9wtvNH0yObxGg2zvl9/FSIOdYO4IhBkdjzmHgl09H1
 Ba3SEL6EJ8JhiJSCQJCQYZsj+G277yyQf90RtfbNNg73hqPJoW+pZ6+HLtDS7cqxZYNq
 Bhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U1Ym0oWh6yDBjxqy2SbaqlllddfKPVs7BVcBIihMzss=;
 b=0kYEXWvd/3Oj04gucV3mLzucA5eGbhdYLH1vpHty7GAwhxA31RDLu2Fx8+Nc5p1xek
 AQb+C0RStH2+oH2BK315/ftQuDEaCRFR/+BeqshzdPWBxW0InncKI1whgLzQXZBtmC/r
 +dYYXnj0VEM1xC4f2fId4DE6e3v1d0YSIkXc/R2wYCdG6ICRLHDbmyubVzdkhCPvL3Un
 LbzCFFLwWruu9g3m4Aw7EmlVZrBnqGMvaKiFm9hzP+P04XGZTzxIhOwhVcY0QFZ9fcDJ
 4VRJn5EnqT2XvL+ORByTBXajBpTEOfyudyXcqzJnDHnAQWI5q4EEI5cDFjHX1Md2K/7K
 LNXw==
X-Gm-Message-State: AOAM533T5dv//dJczNaxbNPIIuw0WhJL8vtE8mF1Qy4e7h4MfMRfH7Si
 53Y6fuHPnNAOwKFyeruFKzanAdl1pq5qVg==
X-Google-Smtp-Source: ABdhPJy3p0P3yK0qAKhHZzrN+TtEMiGFj0oEbC9lDWTQo+fhDAjJeUamZ15QaVdRi35xZ8CSJUrUUg==
X-Received: by 2002:a05:600c:6011:b0:38e:bc5f:5197 with SMTP id
 az17-20020a05600c601100b0038ebc5f5197mr4327588wmb.37.1650468888124; 
 Wed, 20 Apr 2022 08:34:48 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/34] meson,
 virtio: place all virtio-pci devices under virtio_pci_ss
Date: Wed, 20 Apr 2022 17:34:00 +0200
Message-Id: <20220420153407.73926-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since a sourceset already exists for this, avoid unnecessary repeat
of CONFIG_VIRTIO_PCI.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/virtio/meson.build | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 67dc77e00f..f371404b04 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -16,9 +16,7 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-shadow-virtqueue.c', 'vhost-vdpa.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto.c'))
-virtio_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VIRTIO_PCI'], if_true: files('virtio-crypto-pci.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs.c'))
-virtio_ss.add(when: ['CONFIG_VHOST_USER_FS', 'CONFIG_VIRTIO_PCI'], if_true: files('vhost-user-fs-pci.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock.c', 'vhost-vsock-common.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock.c', 'vhost-vsock-common.c'))
@@ -26,17 +24,20 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
-virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'], if_true: files('vhost-user-i2c-pci.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
-virtio_ss.add(when: ['CONFIG_VHOST_USER_RNG', 'CONFIG_VIRTIO_PCI'], if_true: files('vhost-user-rng-pci.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk-pci.c'))
+virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_INPUT', if_true: files('vhost-user-input-pci.c'))
+virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCSI', if_true: files('vhost-user-scsi-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_SCSI', if_true: files('vhost-scsi-pci.c'))
+virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-pci.c'))
+
+virtio_pci_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_INPUT_HOST', if_true: files('virtio-input-host-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-input-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng-pci.c'))
-- 
2.35.1



