Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8617B64B3FE
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 12:18:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p53I2-0004I5-QB; Tue, 13 Dec 2022 06:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p53Hv-0004GA-4o
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 06:17:31 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p53Hs-0002N3-FC
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 06:17:30 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so7669160wmb.5
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 03:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WeB80bFW7RzZrO3+jyxQUk9pPGne0pEuXafR02efqyM=;
 b=UnOhR17AtbfVr+Tk281X0+H94NzpDCOP3q0RzJgaHIoH7bVpCz8MiAfOEo63bhMLrj
 eq09MEW08JUimEwoy1lv/F1VFEE/Zju5kCio2zHpzDduOQHSR9rqCHZCOvElRtmctWoO
 +YyxddJWr202BHJZCFnL+Lh6+4jZl4z6+ChiA3yQHRJQkFqUHPRH7acLxqE6PqN1ldH0
 vh+wHys8/iwWH1vQt33bYPqKdz5GakhHvXQD4Q9gDlnjy5xUlijmP+4xK8g0zR2QdbHZ
 ztwL1c2jJQwlf0QNTmOQ+wLekVDhrlA/X7H4dISPgO+lS09lKgM6iCdGLzyNZwhZ7VcN
 fRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WeB80bFW7RzZrO3+jyxQUk9pPGne0pEuXafR02efqyM=;
 b=fkGupAnLBElVRXQhrQYlLHNdwpgFR1ZjuXSZHTAl/dXlEVBNNaglOnbHhoyxODgoPa
 JLzh3MZZmoe6MCyyUbIs0joTYqbn/YW8Ieh1rLbN9u6N4C3si28aJuv95zz3AYk2gR3B
 p516At2P/gujV1h17Trg+9XIWR19EROSKA+XnT7mNF+xDV8VWwweestZ4npwE/G7Lnqa
 +ix8UI/x+sAmLzWz93F1bxti+KSdRmVZwwXm6pmd/+NGPi5/OW/qs3FfE1BjSzvWZsZm
 v6wPGTx5YxHCUX1KwIm/meOHFfoFV0hGtQov14ANE0gfWPhmSlRY9/HLz2wq1sqY/Wwu
 u0uQ==
X-Gm-Message-State: ANoB5plPkaikQIVxTg278155Chm/QmOgbvYabwD2GAkzWaA05tkpmDyJ
 QILZmH8KW0LQ7gdeL65Cyx0OPnsFlwx3wIfSMOc=
X-Google-Smtp-Source: AA0mqf7q53oHpY+z0JcEuXZdeYk60/H3c82xpgO0UIY6YxWeYPbUNB4tEyjf/L9nLLXDyMMTAbgbtA==
X-Received: by 2002:a1c:f614:0:b0:3cf:5502:8a0 with SMTP id
 w20-20020a1cf614000000b003cf550208a0mr15324701wmc.27.1670930245381; 
 Tue, 13 Dec 2022 03:17:25 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a7bc416000000b003c5571c27a1sm14480817wmi.32.2022.12.13.03.17.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Dec 2022 03:17:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Jonah Palmer <jonah.palmer@oracle.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH-for-8.0 v2 3/6] hw/virtio: Guard and restrict scope of
 qmp_virtio_feature_map_t[]
Date: Tue, 13 Dec 2022 12:17:04 +0100
Message-Id: <20221213111707.34921-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213111707.34921-1-philmd@linaro.org>
References: <20221213111707.34921-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Commit f3034ad71f ("qmp: decode feature & status bits in
virtio-status") did not guard all qmp_virtio_feature_map_t
arrays with the corresponding #ifdef'ry used in
qmp_decode_features(). Fix that and reduce the arrays scope
by declaring them static.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/virtio.c | 56 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5817f4cbc9..b35480be8f 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -179,7 +179,8 @@ static qmp_virtio_feature_map_t virtio_config_status_map[] = {
 };
 
 /* virtio-blk features mapping */
-qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
+#ifdef CONFIG_VIRTIO_BLK
+static qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_BLK_F_SIZE_MAX, \
             "VIRTIO_BLK_F_SIZE_MAX: Max segment size is size_max"),
     FEATURE_ENTRY(VIRTIO_BLK_F_SEG_MAX, \
@@ -216,9 +217,11 @@ qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio-serial features mapping */
-qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
+#ifdef CONFIG_VIRTIO_SERIAL
+static qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_CONSOLE_F_SIZE, \
             "VIRTIO_CONSOLE_F_SIZE: Host providing console size"),
     FEATURE_ENTRY(VIRTIO_CONSOLE_F_MULTIPORT, \
@@ -227,9 +230,11 @@ qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
             "VIRTIO_CONSOLE_F_EMERG_WRITE: Emergency write supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio-gpu features mapping */
-qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
+#ifdef CONFIG_VIRTIO_GPU
+static qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL, \
             "VIRTIO_GPU_F_VIRGL: Virgl 3D mode supported"),
     FEATURE_ENTRY(VIRTIO_GPU_F_EDID, \
@@ -248,9 +253,11 @@ qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio-input features mapping */
-qmp_virtio_feature_map_t virtio_input_feature_map[] = {
+#ifdef CONFIG_VIRTIO_INPUT
+static qmp_virtio_feature_map_t virtio_input_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
@@ -258,9 +265,11 @@ qmp_virtio_feature_map_t virtio_input_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio-net features mapping */
-qmp_virtio_feature_map_t virtio_net_feature_map[] = {
+#ifdef CONFIG_VIRTIO_NET
+static qmp_virtio_feature_map_t virtio_net_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_NET_F_CSUM, \
             "VIRTIO_NET_F_CSUM: Device handling packets with partial checksum "
             "supported"),
@@ -336,9 +345,11 @@ qmp_virtio_feature_map_t virtio_net_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio-scsi features mapping */
-qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
+#ifdef CONFIG_VIRTIO_SCSI
+static qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_SCSI_F_INOUT, \
             "VIRTIO_SCSI_F_INOUT: Requests including read and writable data "
             "buffers suppoted"),
@@ -357,9 +368,11 @@ qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio/vhost-user-fs features mapping */
-qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
+#ifdef CONFIG_VHOST_USER_FS
+static qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
@@ -367,9 +380,11 @@ qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio/vhost-user-i2c features mapping */
-qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
+#ifdef CONFIG_VIRTIO_I2C_ADAPTER
+static qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_I2C_F_ZERO_LENGTH_REQUEST, \
             "VIRTIO_I2C_F_ZERO_LEGNTH_REQUEST: Zero length requests supported"),
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
@@ -379,9 +394,11 @@ qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio/vhost-vsock features mapping */
-qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
+#ifdef CONFIG_VHOST_VSOCK
+static qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_VSOCK_F_SEQPACKET, \
             "VIRTIO_VSOCK_F_SEQPACKET: SOCK_SEQPACKET supported"),
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
@@ -391,9 +408,11 @@ qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio-balloon features mapping */
-qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
+#ifdef CONFIG_VIRTIO_BALLOON
+static qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_BALLOON_F_MUST_TELL_HOST, \
             "VIRTIO_BALLOON_F_MUST_TELL_HOST: Tell host before reclaiming "
             "pages"),
@@ -409,16 +428,20 @@ qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
             "VIRTIO_BALLOON_F_REPORTING: Page reporting VQ enabled"),
     { -1, "" }
 };
+#endif
 
 /* virtio-crypto features mapping */
-qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
+#ifdef CONFIG_VIRTIO_CRYPTO
+static qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio-iommu features mapping */
-qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
+#ifdef CONFIG_VIRTIO_IOMMU
+static qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_IOMMU_F_INPUT_RANGE, \
             "VIRTIO_IOMMU_F_INPUT_RANGE: Range of available virtual addrs. "
             "available"),
@@ -439,9 +462,11 @@ qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
             "available"),
     { -1, "" }
 };
+#endif
 
 /* virtio-mem features mapping */
-qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
+#ifdef CONFIG_VIRTIO_MEM
+static qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
 #ifndef CONFIG_ACPI
     FEATURE_ENTRY(VIRTIO_MEM_F_ACPI_PXM, \
             "VIRTIO_MEM_F_ACPI_PXM: node_id is an ACPI PXM and is valid"),
@@ -451,9 +476,11 @@ qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
             "accessed"),
     { -1, "" }
 };
+#endif
 
 /* virtio-rng features mapping */
-qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
+#ifdef CONFIG_VIRTIO_RNG
+static qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
@@ -461,6 +488,7 @@ qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /*
  * The alignment to use between consumer and producer parts of vring.
-- 
2.38.1


