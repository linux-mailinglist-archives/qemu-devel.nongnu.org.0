Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ED264B3FD
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 12:18:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p53I6-0004NR-3T; Tue, 13 Dec 2022 06:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p53Hx-0004IY-N4
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 06:17:35 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p53Hv-0002NO-Os
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 06:17:33 -0500
Received: by mail-wr1-x432.google.com with SMTP id h12so15213825wrv.10
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 03:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x1gEyf5jfXi/hGZYXJ0kTY5g2BKzQury1FGOK1zxRFg=;
 b=c3sQtBSSwanIJwTejihMNVqt35rObZK90UfBSITFbirUyZIBRxvQA9JdQfz92Arjzy
 HZhV7bdFPmaMHy2wByPMlsrhFjiPnVmL+iICjRvIOrOfGIrFckzPDFuW14XYhJYp02E5
 ofq45oY6KMtLan8MEdDIZf48WwhgEOvgX+9j0iR7MMYIRQzliHUucHRqbAo+0vruqJHZ
 L1RJQ5BDRCJpMTZifvr4yGjHOIpIPYhK26plvp93faNFisrA8TcykR2aiQcta56v3b4r
 DomT6F9swhd+kosnCWlRfyhCUKSx6yF1mfgviHhSZ6Jp8MSbB9BDpx2bkFKh12oWLNxU
 7/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x1gEyf5jfXi/hGZYXJ0kTY5g2BKzQury1FGOK1zxRFg=;
 b=uxhsZdM41uYSrUZLSwHEjmmrS1wtEa47Tt3CdAs7V7YXFvm3YdSXHYn6DefrhoiBvG
 SoAHPUh3DrDVrqaO03TbTC0IGqibPZbCd1ul52i+7gC8ha+Kq6/tF2nKB/W5TuasuFkX
 isPSglq+CX9N7AcvcujCB726oMhH0Okxe9S/9o9+IUWPRVjep3SjLTHcc8gkdPNF0KwG
 8K1XIBjKQbVYSq3dQ0Tk1OSWlaUeUu4RxXpW2Ia5f08lV+nShJSi7LFfwp4umZlRHlcY
 3FoGdvUPp2PTrKtuZ9THgQ+ou/yDT4iOZ3e1WazK7xzmP7ANnwl+mh9j+YUgF6nf/7T/
 B1Sw==
X-Gm-Message-State: ANoB5pm546Vih9sG0VtfdBwl6l0mck9ARESG1k0J9BWqpPB0UwJ8BpXe
 3kHgDCkvMA/hp/h8CwmrIG/jeo5MDG5RSNblGJk=
X-Google-Smtp-Source: AA0mqf6lMzw5nZF8idH9nNOXIO+3ysD1CyFAX0yBN0Wy6Ke9OVUFGCm+YM4gQPifUlfP3NfnLVxRGA==
X-Received: by 2002:adf:e74f:0:b0:242:865b:903a with SMTP id
 c15-20020adfe74f000000b00242865b903amr13037781wrn.17.1670930250284; 
 Tue, 13 Dec 2022 03:17:30 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c500e00b003cf774c31a0sm12787892wmr.16.2022.12.13.03.17.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Dec 2022 03:17:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Jonah Palmer <jonah.palmer@oracle.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 v2 4/6] hw/virtio: Constify qmp_virtio_feature_map_t[]
Date: Tue, 13 Dec 2022 12:17:05 +0100
Message-Id: <20221213111707.34921-5-philmd@linaro.org>
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

These arrays are only accessed read-only, move them to .rodata.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/virtio.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index b35480be8f..f2298bb437 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -80,7 +80,7 @@ enum VhostUserProtocolFeature {
 };
 
 /* Virtio transport features mapping */
-static qmp_virtio_feature_map_t virtio_transport_map[] = {
+static const qmp_virtio_feature_map_t virtio_transport_map[] = {
     /* Virtio device transport features */
 #ifndef VIRTIO_CONFIG_NO_LEGACY
     FEATURE_ENTRY(VIRTIO_F_NOTIFY_ON_EMPTY, \
@@ -111,7 +111,7 @@ static qmp_virtio_feature_map_t virtio_transport_map[] = {
 };
 
 /* Vhost-user protocol features mapping */
-static qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
+static const qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
     FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_MQ, \
             "VHOST_USER_PROTOCOL_F_MQ: Multiqueue protocol supported"),
     FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_LOG_SHMFD, \
@@ -161,7 +161,7 @@ static qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
 };
 
 /* virtio device configuration statuses */
-static qmp_virtio_feature_map_t virtio_config_status_map[] = {
+static const qmp_virtio_feature_map_t virtio_config_status_map[] = {
     FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER_OK, \
             "VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready"),
     FEATURE_ENTRY(VIRTIO_CONFIG_S_FEATURES_OK, \
@@ -180,7 +180,7 @@ static qmp_virtio_feature_map_t virtio_config_status_map[] = {
 
 /* virtio-blk features mapping */
 #ifdef CONFIG_VIRTIO_BLK
-static qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_BLK_F_SIZE_MAX, \
             "VIRTIO_BLK_F_SIZE_MAX: Max segment size is size_max"),
     FEATURE_ENTRY(VIRTIO_BLK_F_SEG_MAX, \
@@ -221,7 +221,7 @@ static qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
 
 /* virtio-serial features mapping */
 #ifdef CONFIG_VIRTIO_SERIAL
-static qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_CONSOLE_F_SIZE, \
             "VIRTIO_CONSOLE_F_SIZE: Host providing console size"),
     FEATURE_ENTRY(VIRTIO_CONSOLE_F_MULTIPORT, \
@@ -234,7 +234,7 @@ static qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
 
 /* virtio-gpu features mapping */
 #ifdef CONFIG_VIRTIO_GPU
-static qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL, \
             "VIRTIO_GPU_F_VIRGL: Virgl 3D mode supported"),
     FEATURE_ENTRY(VIRTIO_GPU_F_EDID, \
@@ -257,7 +257,7 @@ static qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
 
 /* virtio-input features mapping */
 #ifdef CONFIG_VIRTIO_INPUT
-static qmp_virtio_feature_map_t virtio_input_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_input_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
@@ -269,7 +269,7 @@ static qmp_virtio_feature_map_t virtio_input_feature_map[] = {
 
 /* virtio-net features mapping */
 #ifdef CONFIG_VIRTIO_NET
-static qmp_virtio_feature_map_t virtio_net_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_net_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_NET_F_CSUM, \
             "VIRTIO_NET_F_CSUM: Device handling packets with partial checksum "
             "supported"),
@@ -349,7 +349,7 @@ static qmp_virtio_feature_map_t virtio_net_feature_map[] = {
 
 /* virtio-scsi features mapping */
 #ifdef CONFIG_VIRTIO_SCSI
-static qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_SCSI_F_INOUT, \
             "VIRTIO_SCSI_F_INOUT: Requests including read and writable data "
             "buffers suppoted"),
@@ -372,7 +372,7 @@ static qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
 
 /* virtio/vhost-user-fs features mapping */
 #ifdef CONFIG_VHOST_USER_FS
-static qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
@@ -384,7 +384,7 @@ static qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
 
 /* virtio/vhost-user-i2c features mapping */
 #ifdef CONFIG_VIRTIO_I2C_ADAPTER
-static qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_I2C_F_ZERO_LENGTH_REQUEST, \
             "VIRTIO_I2C_F_ZERO_LEGNTH_REQUEST: Zero length requests supported"),
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
@@ -398,7 +398,7 @@ static qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
 
 /* virtio/vhost-vsock features mapping */
 #ifdef CONFIG_VHOST_VSOCK
-static qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_VSOCK_F_SEQPACKET, \
             "VIRTIO_VSOCK_F_SEQPACKET: SOCK_SEQPACKET supported"),
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
@@ -412,7 +412,7 @@ static qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
 
 /* virtio-balloon features mapping */
 #ifdef CONFIG_VIRTIO_BALLOON
-static qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_BALLOON_F_MUST_TELL_HOST, \
             "VIRTIO_BALLOON_F_MUST_TELL_HOST: Tell host before reclaiming "
             "pages"),
@@ -432,7 +432,7 @@ static qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
 
 /* virtio-crypto features mapping */
 #ifdef CONFIG_VIRTIO_CRYPTO
-static qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     { -1, "" }
@@ -441,7 +441,7 @@ static qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
 
 /* virtio-iommu features mapping */
 #ifdef CONFIG_VIRTIO_IOMMU
-static qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_IOMMU_F_INPUT_RANGE, \
             "VIRTIO_IOMMU_F_INPUT_RANGE: Range of available virtual addrs. "
             "available"),
@@ -466,7 +466,7 @@ static qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
 
 /* virtio-mem features mapping */
 #ifdef CONFIG_VIRTIO_MEM
-static qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
 #ifndef CONFIG_ACPI
     FEATURE_ENTRY(VIRTIO_MEM_F_ACPI_PXM, \
             "VIRTIO_MEM_F_ACPI_PXM: node_id is an ACPI PXM and is valid"),
@@ -480,7 +480,7 @@ static qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
 
 /* virtio-rng features mapping */
 #ifdef CONFIG_VIRTIO_RNG
-static qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-- 
2.38.1


