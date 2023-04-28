Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C0B6F108E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 04:54:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psEEK-00056P-Qi; Thu, 27 Apr 2023 22:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1psEEI-00056D-W1
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 22:53:03 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1psEEH-0005cG-D8
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 22:53:02 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-63b5c830d5eso7257486b3a.2
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 19:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682650380; x=1685242380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NJnt6ntleyXFmH7KvMNIGZiL6NhH63V00eqJpl3X74c=;
 b=ej/vxDk0XLFaRIO7hxIbWwhIG1kiUEScNQUvHfDXjmVar6+mUKL8zJBCw3Zxm6U42w
 SscjARSWwppW2zjWkPJGzmDPiTenqgrQibuuVQemsKH1g73qvRPN6ECGs8Hc5S+aEEO4
 hG8nKv3pMFtoI+Yz8nqFfZNq8rT37HBQI2WtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682650380; x=1685242380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NJnt6ntleyXFmH7KvMNIGZiL6NhH63V00eqJpl3X74c=;
 b=IoqfcdO3jvXgL2I5aCTfbZQAJuIATjzDnoG+bzsTtsrWcZkKCJVFQdfHTtSMU4GmQj
 qe1k6hb9HkCIiGzI50gyu/oUCFX4R8+aWBDgi8Grt9UsM4Yjl5ibro65Vcb3OnzBsxu3
 wzYkMXd71llVChuBkToZfIikqoiOlIRaLFGPsI9250njFAFjs4y4REvu4fkqQhikYz3F
 3CTZ4DjVWdHnAUEevMyN1EEMFrqnmgl8eXLqUFCsrSUZ/8BMJrEUqhfqcGbYEob40IiT
 kSH1nCORxONiE+1imBjbEDEmwyEF/3XR6qpXhr1BE5WF3HTGC7tdl2A/DK16x3SyaT+M
 TB8A==
X-Gm-Message-State: AC+VfDxJy9mfmlSzD5nsDwetXv+bo86hBGyKgWH9bKyXMCLfDQR41BmT
 EkyYrvIWFOBjO4jGN+NA8I1z+2ixSgSJ8G9/opM=
X-Google-Smtp-Source: ACHHUZ4eBxBM+mtPCGdlto3udBymP8E2/3VPkXlCt5/DSXXt0JeTmL+Xjdlj/0XHSASgR9S2ZTvc4A==
X-Received: by 2002:a05:6a00:8c6:b0:63d:2f13:200 with SMTP id
 s6-20020a056a0008c600b0063d2f130200mr5237705pfu.16.1682650379907; 
 Thu, 27 Apr 2023 19:52:59 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:9f50:6799:fba2:1f53])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a62d115000000b0063d24fcc2b7sm13854437pfg.1.2023.04.27.19.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 19:52:59 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
X-Google-Original-From: Gurchetan Singh <gurchetansingh@google.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, david@redhat.com, kraxel@redhat.com,
 marcandre.lureau@redhat.com, akihiko.odaki@gmail.com,
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
Subject: [PATCH 4/5] virtio: Add shared memory capability
Date: Thu, 27 Apr 2023 19:52:50 -0700
Message-Id: <20230428025251.603-5-gurchetansingh@google.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230428025251.603-1-gurchetansingh@google.com>
References: <20230428025251.603-1-gurchetansingh@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pf1-x433.google.com
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


