Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5A4CD61E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:15:48 +0100 (CET)
Received: from localhost ([::1]:54082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8ih-0001X8-C3
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:15:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ89Y-0001hX-CN
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:39:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ89W-0000Xo-Ah
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lIN0r7Tzi8KrQtJyX7X8jpPXvsBirmYREU9z5w5uvvo=;
 b=HFqMVS8phE7JDubyRTJ57DjSb3fWNsEqE0LH9FYZXRCe+xJpd29JA67N9a3wv1uaCmxEAc
 nB+FylMqgsv8neGzs0SsSNAVWk5ND9EShHlkJ7ZvzcBesuuAvcKHJhq9aCSjo6o2wl8dK0
 Qy7Bs31yaYLlF3jmq2Sc57I40tMfmfQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-Mew5bO6kNuOlSzYIaSFq0A-1; Fri, 04 Mar 2022 08:39:24 -0500
X-MC-Unique: Mew5bO6kNuOlSzYIaSFq0A-1
Received: by mail-wr1-f72.google.com with SMTP id
 w2-20020adfbac2000000b001ea99ca4c50so3400458wrg.11
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lIN0r7Tzi8KrQtJyX7X8jpPXvsBirmYREU9z5w5uvvo=;
 b=rx/grrmSmbDcQ35dm2Z3naXAutxlKAOJgXDiEcn7n6HPPd4hUUCedsQ2wxjBarESqd
 TkLBlowiwBquKCr1BPBObhjL13saB5KlAlEyiE4bhyCdf2UX3JgM28BnMhTQy1AFiUZS
 uJ3On0e+cAcZdoZK5ZX4EQA7gSVj52P3XzeVyfOi/RR1TxeQDkEiWmval7BV1R0ab+ii
 HjPsnuEBh4yXvBQN8VJwNYJ5BC4RqpnfLlBx6f6KQpg9UeJN4fxBAVBCN+uCIdgbONT1
 MVyxjNhzwcdbf4DjWJdNm1NbZCgojRUeayq9PaXA2h7Xj6P+gPb6UF8deMJth3C4cUjE
 QUZA==
X-Gm-Message-State: AOAM530NlWuUxygytIxy823eWXlnhk/Vflw9gTeRLfZgQo8UoCyiBgsd
 /v8p9pbby7Gh96aqpF6sEVf0mBBnbyv6D582sO2r096I8u/j5dUBHHkCUmGXKGpnHpCHIUuHeSR
 7n0AKMbn7SRoJr53ZLr7wUp0X4v5Bka4Dv++hyuc/JWm55kJabhh7mR49WgOo
X-Received: by 2002:a05:6000:15cc:b0:1f0:21f8:c99c with SMTP id
 y12-20020a05600015cc00b001f021f8c99cmr12689411wry.339.1646401163281; 
 Fri, 04 Mar 2022 05:39:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwndblTirB+C0l2wi11gj3XrC/1PY2roJ2VZonerYXt6r5lDkYsxlbfEhOWSzr+hqm7CzyGqQ==
X-Received: by 2002:a05:6000:15cc:b0:1f0:21f8:c99c with SMTP id
 y12-20020a05600015cc00b001f021f8c99cmr12689385wry.339.1646401163001; 
 Fri, 04 Mar 2022 05:39:23 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 o22-20020a05600c4fd600b0038133076dcesm5507228wmq.16.2022.03.04.05.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:39:14 -0800 (PST)
Date: Fri, 4 Mar 2022 08:39:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/45] tests/qtest/libqos: Skip hotplug tests if pci root bus
 is not hotpluggable
Message-ID: <20220304133556.233983-15-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Amit Shah <amit@kernel.org>,
 Jason Wang <jasowang@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Eric Auger <eric.auger@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

ARM does not not support hotplug on pcie.0. Add a flag on the bus
which tells if devices can be hotplugged and skip hotplug tests
if the bus cannot be hotplugged. This is a temporary solution to
enable the other pci tests on aarch64.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>

Message-Id: <20220210145254.157790-4-eric.auger@redhat.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqos/pci.h          |  1 +
 tests/qtest/e1000e-test.c         |  6 ++++++
 tests/qtest/vhost-user-blk-test.c | 10 ++++++++++
 tests/qtest/virtio-blk-test.c     |  5 +++++
 tests/qtest/virtio-net-test.c     |  5 +++++
 tests/qtest/virtio-rng-test.c     |  5 +++++
 6 files changed, 32 insertions(+)

diff --git a/tests/qtest/libqos/pci.h b/tests/qtest/libqos/pci.h
index 44f6806fe4..6a28b40522 100644
--- a/tests/qtest/libqos/pci.h
+++ b/tests/qtest/libqos/pci.h
@@ -52,6 +52,7 @@ struct QPCIBus {
     uint64_t pio_alloc_ptr, pio_limit;
     uint64_t mmio_alloc_ptr, mmio_limit;
     bool has_buggy_msi; /* TRUE for spapr, FALSE for pci */
+    bool not_hotpluggable; /* TRUE if devices cannot be hotplugged */
 
 };
 
diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index 0273fe4c15..48f3dbb0fd 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -235,6 +235,12 @@ static void test_e1000e_multiple_transfers(void *obj, void *data,
 static void test_e1000e_hotplug(void *obj, void *data, QGuestAllocator * alloc)
 {
     QTestState *qts = global_qtest;  /* TODO: get rid of global_qtest here */
+    QE1000E_PCI *dev = obj;
+
+    if (dev->pci_dev.bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
 
     qtest_qmp_device_add(qts, "e1000e", "e1000e_net", "{'addr': '0x06'}");
     qpci_unplug_acpi_device_test(qts, "e1000e_net", 0x06);
diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index 62e670f39b..1316aae0fa 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -676,6 +676,11 @@ static void pci_hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
     QVirtioPCIDevice *dev;
     QTestState *qts = dev1->pdev->bus->qts;
 
+    if (dev1->pdev->bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
     /* plug secondary disk */
     qtest_qmp_device_add(qts, "vhost-user-blk-pci", "drv1",
                          "{'addr': %s, 'chardev': 'char2'}",
@@ -703,6 +708,11 @@ static void multiqueue(void *obj, void *data, QGuestAllocator *t_alloc)
     uint64_t features;
     uint16_t num_queues;
 
+    if (pdev1->pdev->bus->not_hotpluggable) {
+        g_test_skip("bus pci.0 does not support hotplug");
+        return;
+    }
+
     /*
      * The primary device has 1 queue and VIRTIO_BLK_F_MQ is not enabled. The
      * VIRTIO specification allows VIRTIO_BLK_F_MQ to be enabled when there is
diff --git a/tests/qtest/virtio-blk-test.c b/tests/qtest/virtio-blk-test.c
index 2a23698211..acb44c9fb8 100644
--- a/tests/qtest/virtio-blk-test.c
+++ b/tests/qtest/virtio-blk-test.c
@@ -701,6 +701,11 @@ static void pci_hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
     QVirtioPCIDevice *dev;
     QTestState *qts = dev1->pdev->bus->qts;
 
+    if (dev1->pdev->bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
     /* plug secondary disk */
     qtest_qmp_device_add(qts, "virtio-blk-pci", "drv1",
                          "{'addr': %s, 'drive': 'drive1'}",
diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.c
index 8bf74e516c..af3027144f 100644
--- a/tests/qtest/virtio-net-test.c
+++ b/tests/qtest/virtio-net-test.c
@@ -174,6 +174,11 @@ static void hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
     QTestState *qts = dev->pdev->bus->qts;
     const char *arch = qtest_get_arch();
 
+    if (dev->pdev->bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
     qtest_qmp_device_add(qts, "virtio-net-pci", "net1",
                          "{'addr': %s}", stringify(PCI_SLOT_HP));
 
diff --git a/tests/qtest/virtio-rng-test.c b/tests/qtest/virtio-rng-test.c
index e6b8cd8e0c..5ce444ad72 100644
--- a/tests/qtest/virtio-rng-test.c
+++ b/tests/qtest/virtio-rng-test.c
@@ -20,6 +20,11 @@ static void rng_hotplug(void *obj, void *data, QGuestAllocator *alloc)
     QVirtioPCIDevice *dev = obj;
     QTestState *qts = dev->pdev->bus->qts;
 
+   if (dev->pdev->bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
     const char *arch = qtest_get_arch();
 
     qtest_qmp_device_add(qts, "virtio-rng-pci", "rng1",
-- 
MST


