Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E7F6F731A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 21:14:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pueNs-0005KB-Ry; Thu, 04 May 2023 15:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pueNr-0005Jy-Hr
 for qemu-devel@nongnu.org; Thu, 04 May 2023 15:12:55 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pueNq-0004d2-1N
 for qemu-devel@nongnu.org; Thu, 04 May 2023 15:12:55 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1a5197f00e9so6581185ad.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 12:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683227572; x=1685819572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LhcgR1tfEW81XgkDFEMdq0i555SGCKv5VKEGEtWb7CM=;
 b=FK3j1i8a/RwA0wGEXRObxCGBG/2eWgHy4uFZ3UhDDDgyU/S0i/1gCg8f5ehQK1sS+H
 bpueN1H5GiRyWrJYSbGn0rxNHs/fHRNr3JAydYPfPqjCLPxE/2Et2lhB/zkvyHbyiyEf
 k17Lh8XA32vRRSMs23+X5p4eMGNyIlwHbRwq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683227572; x=1685819572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LhcgR1tfEW81XgkDFEMdq0i555SGCKv5VKEGEtWb7CM=;
 b=VdDJ5nKiFKyJEvTbdxrhrjWRYsjUVgcGZxJNuAYNIPlVQ9nxWf4SjgkI7cvDRmOE0a
 1BlpnxCgnD4SFk8QgTwzTgyrWOTVwRBuRV2jCDMeeIraaSkSTePdTw7ASD5jzhT/Ybu/
 NMtp8Yhdz8b69WIsRYvnmHZ8+doCzieEjee7okT9ak+uhRwMfXrsSRexx4FOLLGY4YZX
 o4g22egCJ9AIYTfNgWvzGmrnuh06Bg9j5EzwmIRLG1D5D/Y2kJqSQ2dTWgn0TViCkVsF
 LLeqS0RS0Pwq3cZ1HYypPyhqitvMIaK/ZVMELBhGEN30AnDYkz1pj80d7Yx+juSVAd/9
 P/DA==
X-Gm-Message-State: AC+VfDyN6HZ7TQKQUjjaxW6yMsoXxAK6AXeCEZ2aZJU7FxpaTWHMpjhT
 SOVAQgUqCq80UIrQTSp4AKpP2mN2Tj8NrHINI3Y=
X-Google-Smtp-Source: ACHHUZ6fmEH/llMOaM7cjIOKLXIcz75wisPrXwdz0eVIO8LWEkC4hdAVfrAPa48WRVycRLd7dhG8hQ==
X-Received: by 2002:a17:90a:f48c:b0:24d:f159:d28b with SMTP id
 bx12-20020a17090af48c00b0024df159d28bmr3067703pjb.47.1683227572300; 
 Thu, 04 May 2023 12:12:52 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:4891:407:d4c8:7fa9])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a170902e88200b001ab2a0733aasm2185980plg.39.2023.05.04.12.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 12:12:51 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org, shentey@gmail.com
Subject: [PATCH v3 4/5] virtio: Add shared memory capability
Date: Thu,  4 May 2023 12:12:42 -0700
Message-Id: <20230504191243.746-5-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230504191243.746-1-gurchetansingh@chromium.org>
References: <20230504191243.746-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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
2.40.1.521.gf1e218fcd8-goog


