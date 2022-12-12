Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD6564AB25
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 00:08:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4rrd-00076X-Sy; Mon, 12 Dec 2022 18:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rrb-00074g-Lh
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:05:35 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rrZ-0004Bp-L2
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:05:35 -0500
Received: by mail-ej1-x635.google.com with SMTP id gh17so32212066ejb.6
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbPrC1EppR72Ye7FiBlVhG5eby+ePW/9OVleOE7ggh8=;
 b=wDmSII9+XHWe//xfo+zznt/rqMY4lSEas0zvtmnNmOEKIDKUfk+s/ZnmQFkh792D6y
 GgzCaEDY1uqg1wqdTLhJq6XOl539797tQ7I4zxpMfRMKOIOxgLadtpGZPDu5Z1oIUwrs
 EuUg+X9S+ncM+0Jab1s77QTYVYzDi0P/8PS9rcIpyWVqtVM8TPBqHucHAPCVdmq9O6zd
 6rNxdgvQxdABNkyMYRYVVfsuossqFtox+6UugnWnyIIyLjbDgSn+HWU9PaaivkAm0QAf
 x3SiixdZAE17isqGc1QdNOXNStATYAeMZR0/I7RlR4WjgyMskbE8KCJRBJgZhOvoal6g
 2U7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbPrC1EppR72Ye7FiBlVhG5eby+ePW/9OVleOE7ggh8=;
 b=oqv7GdmhiZ2lbQohxtJO7sRVdTWLQpBg93a9yX0BBvHd/THYfSl4kpJAoYjIPhTtIG
 UzBOa1JNoVnnETuyHj9UsLcYpgFzafzq8HWKqZtdrYeeygRHPjbIJaly1ZKICa6/X0R9
 i0hnOY9VPugLCtSBPqjCFnYBGRo7pa8CXMZLzbgJFKpaVEaUq2TNRBfCV0Y7zsrApMMP
 5ODGaNnIwiuJ38uwGw3PTYSWrLm4qBeEZkjRuEQaUZ9AfhAGAfMWsaV1JCreaOXXXidO
 RYLO9v+1gtJkxx7oN2rlm8BPyb9g/AzA5Ri+57BjkRqB+JhRiPQctfajZYvOjI0NChrV
 8SCw==
X-Gm-Message-State: ANoB5pkgfVcX8pQNTwjtdE+AT1bYBo3ydkfY2VsQ0cP3T0HXcP1j0QRQ
 THz0Las8UxDx5J7UoTsFRKntD9qFtuqxyNO2lPs=
X-Google-Smtp-Source: AA0mqf6jtnyCU8ruo2UpS6QWSKYFGCHydLnq0oegm88NNzN7+sJ0xlzIFxuP5xgiENPvbB4y2mpT9g==
X-Received: by 2002:a17:906:2449:b0:7c0:f44d:984 with SMTP id
 a9-20020a170906244900b007c0f44d0984mr20762701ejb.74.1670886331812; 
 Mon, 12 Dec 2022 15:05:31 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 23-20020a170906309700b00788c622fa2csm3776296ejv.135.2022.12.12.15.05.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Dec 2022 15:05:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 02/10] hw/virtio: Rename virtio_ss[] ->
 specific_virtio_ss[]
Date: Tue, 13 Dec 2022 00:05:09 +0100
Message-Id: <20221212230517.28872-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212230517.28872-1-philmd@linaro.org>
References: <20221212230517.28872-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


