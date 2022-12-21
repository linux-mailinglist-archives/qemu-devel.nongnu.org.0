Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECB16531F6
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:45:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7zOU-00059s-D3; Wed, 21 Dec 2022 08:44:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7zOS-00059V-Dv
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:44:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7zOQ-0002xj-KJ
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:44:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671630261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C1S4cxQf4+GPKAMt3V2/b+Q4ULwQzxYhetPJI0kk/3Y=;
 b=jNWLz5NYqASGouZMTKF9L1uw21zGbL/TEDxS6zna39vWrrgUuLsqRiIXNyb1QXG+c0IIFs
 HCsCzQo/kp886IMx8pwglx06uKvcT7cx/tIWcKvMqfPM5pdEYIYwy9q2yzrxMfN37zZC2O
 EW7BK9ZVaZtkYw6yYEJH9Xaz2t7Ap8g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-549-yRf3pbK3McC0RTI36W4EUA-1; Wed, 21 Dec 2022 08:44:20 -0500
X-MC-Unique: yRf3pbK3McC0RTI36W4EUA-1
Received: by mail-wm1-f69.google.com with SMTP id
 r129-20020a1c4487000000b003d153a83d27so7975563wma.0
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:44:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C1S4cxQf4+GPKAMt3V2/b+Q4ULwQzxYhetPJI0kk/3Y=;
 b=J7nQAOizKI0Nr1H7DKF0jTIdpdtcGfYRLi187p4Hs9eDxw7JdwCH0SLBNlQxMXoxLn
 Vye3tAkrjemVuxNPzjAITlbq192iKK4YRytkaAY/DESPVJFuLvqwhwLkHNJeU+qfLNkV
 JQggEuaDUrKFGypmWD3qsJxkiuClA8UsP90viMcM+roG8qR4RA4A0k6HOcwenRz5lk82
 tMhOTa4W2v955s3giWbmOOakQLKZzehnld0VH4MgNF12Q067RKCc01+vVvUM92tGc9gJ
 WzNk8KGOUb/9TRktoSmqK1j3mkBZZjjqyrRFrKSXEb2jdkE/sCn5ibgPiQTZWYF5o0xY
 P6Og==
X-Gm-Message-State: AFqh2krTZdLyy56MaI7hKfe5DRvCenYUpyRfqBGIr4tOLbSJZWCXVFXp
 vaWms/sHZJgC9aV/n61eZFYVmfPX98ABjTyWvNe9wLFvNppviTvbCJOEdC1YpW/QQ/Ee3fqtBvs
 /UNtU8LquyJuVD1Mh3vh4qUK4EyB84XCYBo41x6MapSe2vnmKa9H1oxqWuXJ1
X-Received: by 2002:adf:fc02:0:b0:24a:9b90:b619 with SMTP id
 i2-20020adffc02000000b0024a9b90b619mr971408wrr.52.1671630258644; 
 Wed, 21 Dec 2022 05:44:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsWICVmEzaGBdyWuG3q1r3mTMfwnxHm5ILHQfZAwKsGLqYY/JjAw+m0C/OLl1TvlLzldRDhmQ==
X-Received: by 2002:adf:fc02:0:b0:24a:9b90:b619 with SMTP id
 i2-20020adffc02000000b0024a9b90b619mr971397wrr.52.1671630258361; 
 Wed, 21 Dec 2022 05:44:18 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 c3-20020a5d5283000000b0024206ed539fsm15426815wrv.66.2022.12.21.05.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:44:17 -0800 (PST)
Date: Wed, 21 Dec 2022 08:44:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jonah Palmer <jonah.palmer@oracle.com>
Subject: [PULL 37/41] hw/virtio: Constify qmp_virtio_feature_map_t[]
Message-ID: <20221221130339.1234592-38-mst@redhat.com>
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

These arrays are only accessed read-only, move them to .rodata.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221213111707.34921-5-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Jonah Palmer<jonah.palmer@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <a class="moz-txt-link-rfc2396E" href="mailto:philmd@linaro.org">&lt;philmd@linaro.org&gt;</a>
---
 hw/virtio/virtio.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 7345261ed8..989c96229c 100644
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
MST


