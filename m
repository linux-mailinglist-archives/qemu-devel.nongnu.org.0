Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30266F1CDE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 18:49:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psRH1-0001Cw-Qt; Fri, 28 Apr 2023 12:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1psRGr-0001Bm-Rj
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:48:34 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1psRGp-0004pf-QR
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:48:33 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1a5197f00e9so1464575ad.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 09:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682700510; x=1685292510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NJnt6ntleyXFmH7KvMNIGZiL6NhH63V00eqJpl3X74c=;
 b=AJa9/E+5cqjHT/XOH4dkuP53E4BdmKtJv8edTPMKKIVy8TyyRKFGNNV79uVSu14ECI
 sPU3UJTZg50QSN1Dq+dWpCPyjGvkbkmhQ7/2UEMm92tdyvRm4Ncu8SIW05QttBuTjFqc
 TzmICuiiYT5ZMhOKzMIA6MbfKL+RQoBW6INrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682700510; x=1685292510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NJnt6ntleyXFmH7KvMNIGZiL6NhH63V00eqJpl3X74c=;
 b=fDA8P8kW+XgHAt85PzPXJMxiv4WzsILQL90kboMxhd1L7Kmk9IrXSmIpEJabs0CrMX
 +vf+6kduOmA/MR5XYpVC3GR0H94ANdejzDEkKicZjiv981o009cKOs8wYObVMASEQzHX
 PHiW23PR9wd8pPFq+RDi+B8WnlEJA09IZ6eAWx9LqfYq4LFhB95eWJFwt0IBi+wQBU/H
 SE3nEyqn2boRjr6ERvh63MToWnETSjwg3BuWZNQepB/Aw+Hl0spqSLUMKGTOtBNh0AjU
 I0cltnJEV9CqBMlf1+//mqkA5B+A3oRMsS7PLZuKtk0uRVIqaERYdw6kg7x2ZXdMGlj4
 fPDw==
X-Gm-Message-State: AC+VfDwlblu0HYCEsKDjZ5yRrJUpQ0FCMYjpacQUGs90bp/XFvTVqJ8u
 HTnszOuC6RqS2zxUclJ1fMj14I43qSxupP6I0m0=
X-Google-Smtp-Source: ACHHUZ65cntUxbqhYAj/cF9Tk4mvDYwWm3T+TXDYNXBHZ0sVqFYhHuEvTlGRViIbsZaIDFiVWoIWJA==
X-Received: by 2002:a17:902:ed49:b0:1a1:cef2:accf with SMTP id
 y9-20020a170902ed4900b001a1cef2accfmr5792718plb.30.1682700509993; 
 Fri, 28 Apr 2023 09:48:29 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:fdc4:a664:d93b:43db])
 by smtp.gmail.com with ESMTPSA id
 jf19-20020a170903269300b001a2806ae2f7sm13566796plb.83.2023.04.28.09.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 09:48:29 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
X-Google-Original-From: Gurchetan Singh <gurchetansingh@google.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org
Subject: [PATCH v2 4/5] virtio: Add shared memory capability
Date: Fri, 28 Apr 2023 09:48:22 -0700
Message-Id: <20230428164823.789-4-gurchetansingh@google.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230428164823.789-1-gurchetansingh@google.com>
References: <20230428164823.789-1-gurchetansingh@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Define a new capability type 'VIRTIO_PCI_CAP_SHARED_MEMORY_CFG' to allow
defining shared memory regions with sizes and offsets of 2^32 and more.
Multiple instances of the capability are allowed and distinguished
by a device-specific 'id'.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 hw/virtio/virtio-pci.c         | 18 ++++++++++++++++++
 include/hw/virtio/virtio-pci.h |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 02fb84a8fa..40a798d794 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1399,6 +1399,24 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
     return offset;
 }
 
+int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
+                           uint8_t bar, uint64_t offset, uint64_t length,
+                           uint8_t id)
+{
+    struct virtio_pci_cap64 cap = {
+        .cap.cap_len = sizeof cap,
+        .cap.cfg_type = VIRTIO_PCI_CAP_SHARED_MEMORY_CFG,
+    };
+
+    cap.cap.bar = bar;
+    cap.cap.length = cpu_to_le32(length);
+    cap.length_hi = cpu_to_le32(length >> 32);
+    cap.cap.offset = cpu_to_le32(offset);
+    cap.offset_hi = cpu_to_le32(offset >> 32);
+    cap.cap.id = id;
+    return virtio_pci_add_mem_cap(proxy, &cap.cap);
+}
+
 static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
                                        unsigned size)
 {
diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index ab2051b64b..5a3f182f99 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -264,4 +264,8 @@ unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
 void virtio_pci_set_guest_notifier_fd_handler(VirtIODevice *vdev, VirtQueue *vq,
                                               int n, bool assign,
                                               bool with_irqfd);
+
+int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy, uint8_t bar, uint64_t offset,
+                           uint64_t length, uint8_t id);
+
 #endif
-- 
2.40.1.495.gc816e09b53d-goog


