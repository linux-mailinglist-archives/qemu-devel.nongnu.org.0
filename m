Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CD665317E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:15:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7yns-0006iH-Bq; Wed, 21 Dec 2022 08:06:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynn-0006bB-6F
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynl-0004WR-Cx
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IBinoRmXDuqo1Heos/0rf9XjOqK9DYeod2h9/dXJJLk=;
 b=iHEYEbD1ugqVsMprBSHs5eEuSkAskeRpXCxwBsJOppUB+swixo6upl96/EqefehItt9CFd
 l6wG7tvWqrufrFToygk7uHi7s8+b7ftgJGkOHBA6cyR6joGWOTGiW70fTMvPypr0EMSHjy
 nGF6M2Hvjbm6BRP9EGiVLwGx69oxVF4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-U_OC8K3lNlyC87YyaGq0jA-1; Wed, 21 Dec 2022 08:06:27 -0500
X-MC-Unique: U_OC8K3lNlyC87YyaGq0jA-1
Received: by mail-wm1-f69.google.com with SMTP id
 x10-20020a05600c420a00b003cfa33f2e7cso7931035wmh.2
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:06:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IBinoRmXDuqo1Heos/0rf9XjOqK9DYeod2h9/dXJJLk=;
 b=24E4qPcBD8/yXvcnWbzoep3O2gtDQKl6ut04VEuBxCq9lgJm9cmD+3nv87DCyWUVcW
 D1fr0xuLpvLbGipwKOCiLiLJKisiWpidVoazzktPDQxunO2/E3sHf6w7288DPufMYxjS
 00JkuH2OXU4kspWof3LoaJCOsG17IGEiQO0UrkatkuiXCwz81rXZlk5O8I1hYe8nlGdR
 yxlv2dVZcs4gRUIbUcBmrYkelsOvkeWkm7Bq8D8nolPUAWzKTdVcVje+yX3WNFZOlgsh
 n7dPcHIyajIkY1sgWQLHcPjk5jIg9ROSauQ3UMFmfGWf06z3ES16v/RTuTq2+RMqAelt
 llYg==
X-Gm-Message-State: AFqh2krS6eZKJ74p3vp1gnwUmyC7PdctWJqnmAqXakmlxBqOoT/8Ba24
 ZEe26oh/BCCrmtp6IuaCWuJWZ7cg1spy6EP+bolUj4WM/cjKJ5SkX9V/aGMCNhoDxstHNp53HcP
 jhCtbCEMOM5aPAC7BfI+AJ0WuHGO8Cn1JY1mnhjNJpxXAczp+QT/vmfp9kUq2
X-Received: by 2002:a05:600c:5012:b0:3d3:5a4a:9103 with SMTP id
 n18-20020a05600c501200b003d35a4a9103mr1566951wmr.31.1671627985787; 
 Wed, 21 Dec 2022 05:06:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuD4tuuOPk0tx7cjafIhLc+OwNH2K8oOgyzKF5/6fCC6V2V3hzYNOsp9U5LONldVaH0ih2phA==
X-Received: by 2002:a05:600c:5012:b0:3d3:5a4a:9103 with SMTP id
 n18-20020a05600c501200b003d35a4a9103mr1566928wmr.31.1671627985449; 
 Wed, 21 Dec 2022 05:06:25 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 bi5-20020a05600c3d8500b003cf4eac8e80sm2753641wmb.23.2022.12.21.05.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:06:24 -0800 (PST)
Date: Wed, 21 Dec 2022 08:06:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 35/41] hw/virtio: Rename virtio_ss[] -> specific_virtio_ss[]
Message-ID: <20221221130339.1234592-36-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Since virtio_ss[] is added to specific_ss[], rename it as
specific_virtio_ss[] to make it clearer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221213111707.34921-3-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/meson.build | 43 ++++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 559b80cb28..0d1ea1fea6 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -3,35 +3,35 @@ softmmu_virtio_ss.add(files('virtio-bus.c'))
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
-virtio_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev.c'))
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
+specific_virtio_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
@@ -59,11 +59,12 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu-pci.
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev-pci.c'))
 
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
MST


