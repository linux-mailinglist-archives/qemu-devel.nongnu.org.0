Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F25D64B407
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 12:19:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p53I4-0004Iv-Cx; Tue, 13 Dec 2022 06:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p53Hs-0004FX-MB
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 06:17:30 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p53Hm-0002Ma-7r
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 06:17:24 -0500
Received: by mail-wr1-x432.google.com with SMTP id h11so15211423wrw.13
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 03:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbPrC1EppR72Ye7FiBlVhG5eby+ePW/9OVleOE7ggh8=;
 b=Lkvu9eeu2fLEB04sSqoReEv1U/9UsoUpMDV07mqqaP4j00yM4PoM5IbnELu383eX3Q
 fi/kmSHSsntIZgA2EhgUX26yDmT3LCcTo4b9m2/ed93GtYfytAVy+3wltB1jtzkT2pf2
 J8Gt8d1YD8eydikPLWRMiVMOkkeLqLDX4SvM9RQ9dIxnRMIkDrVmT/lOZO1OlfLz6/UP
 hF0esd+JlcuAGKXJZ5bqoCgprVCUcpaM+rnKm+xcRWD3QLmgwYwXBQMkFXuMNFjVWVDA
 pyXNL4akTRMOsUVe2EoZDglP8kuS6cGD7SsL8gW2F5rhYQo9T+TsnjiWOD9EfMGLHcMp
 unAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbPrC1EppR72Ye7FiBlVhG5eby+ePW/9OVleOE7ggh8=;
 b=RgXRScTkDpad/5UwHfsEGxVCZaCkpcIXCPJcJI8DMpyULLk5qAE85Lx8tC1kEKIQ3w
 etoatX6iD9iRQ39/2zNVkxRtwDSI/HqomLSneo2t5kXP4ybF0Z9XrvsHRv8PZKQoAcGT
 P40gyEOA2N0fN2gSTFPMIZGNa9jJ7ouh2tlISDuQMsB0d8rVMdU/8xal+Zdjdg0a+4Ah
 mysqI6V2yLFpJuDm9S3RvPrlyiW43v8TlKxmnZAsJ6M/Q8RJXIu/hL10+4HlInr9ax9Y
 y96sTQSMFVQQw7cLQsSF3C9kh+3LaGpPwxFPkR58K1civrPDk5wAFccPnxSo/bwmxG1u
 MypA==
X-Gm-Message-State: ANoB5pnvzc+xMFKwZ7DJ+8hEvMpKAsYKHjMC1y9BjmLvUlnywozzdBBx
 CTqPMJB5pxNJJzp1CKHrtRr04Z3teeE5KMjgIPQ=
X-Google-Smtp-Source: AA0mqf6NBd4VnCZz3FIORhenS44gPmOY/nbrtxciM1U/1qRlNwouQg85o7DG1DLRZG3nBnB3mTGMAA==
X-Received: by 2002:adf:d212:0:b0:242:6055:dee3 with SMTP id
 j18-20020adfd212000000b002426055dee3mr12584595wrh.63.1670930240414; 
 Tue, 13 Dec 2022 03:17:20 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a5d444c000000b00241bd7a7165sm11376561wrr.82.2022.12.13.03.17.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Dec 2022 03:17:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Jonah Palmer <jonah.palmer@oracle.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 v2 2/6] hw/virtio: Rename virtio_ss[] ->
 specific_virtio_ss[]
Date: Tue, 13 Dec 2022 12:17:03 +0100
Message-Id: <20221213111707.34921-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213111707.34921-1-philmd@linaro.org>
References: <20221213111707.34921-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since virtio_ss[] is added to specific_ss[], rename it as
specific_virtio_ss[] to make it clearer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/meson.build | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index dfed1e7af5..23a980efaa 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -3,34 +3,34 @@ softmmu_virtio_ss.add(files('virtio-bus.c'))
 softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_PCI', if_true: files('virtio-pci.c'))
 softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_MMIO', if_true: files('virtio-mmio.c'))
 
-virtio_ss = ss.source_set()
-virtio_ss.add(files('virtio.c'))
+specific_virtio_ss = ss.source_set()
+specific_virtio_ss.add(files('virtio.c'))
 
 if have_vhost
-  virtio_ss.add(files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c'))
+  specific_virtio_ss.add(files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c'))
   if have_vhost_user
-    virtio_ss.add(files('vhost-user.c'))
+    specific_virtio_ss.add(files('vhost-user.c'))
   endif
   if have_vhost_vdpa
-    virtio_ss.add(files('vhost-vdpa.c', 'vhost-shadow-virtqueue.c'))
+    specific_virtio_ss.add(files('vhost-vdpa.c', 'vhost-shadow-virtqueue.c'))
   endif
 else
   softmmu_virtio_ss.add(files('vhost-stub.c'))
 endif
 
-virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))
-virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto.c'))
-virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs.c'))
-virtio_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem.c'))
-virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock.c', 'vhost-vsock-common.c'))
-virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock.c', 'vhost-vsock-common.c'))
-virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
-virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
-virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
-virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
-virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
-virtio_ss.add(when: 'CONFIG_VHOST_USER_GPIO', if_true: files('vhost-user-gpio.c'))
-virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_GPIO'], if_true: files('vhost-user-gpio-pci.c'))
+specific_virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))
+specific_virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto.c'))
+specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs.c'))
+specific_virtio_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem.c'))
+specific_virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock.c', 'vhost-vsock-common.c'))
+specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock.c', 'vhost-vsock-common.c'))
+specific_virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
+specific_virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
+specific_virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
+specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
+specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
+specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_GPIO', if_true: files('vhost-user-gpio.c'))
+specific_virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_GPIO'], if_true: files('vhost-user-gpio-pci.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
@@ -57,11 +57,12 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem-pci.c'
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem-pci.c'))
 
-virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
+specific_virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
 
-specific_ss.add_all(when: 'CONFIG_VIRTIO', if_true: virtio_ss)
 softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
 softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
 softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('virtio-stub.c'))
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
+
+specific_ss.add_all(when: 'CONFIG_VIRTIO', if_true: specific_virtio_ss)
-- 
2.38.1


