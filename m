Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978EC64AB19
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 00:06:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4rrj-0007AL-Ep; Mon, 12 Dec 2022 18:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rrh-00079v-8J
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:05:41 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rre-0004G6-To
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:05:41 -0500
Received: by mail-ej1-x62e.google.com with SMTP id vv4so32218033ejc.2
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=blM7A2ZtBOEvrOOyVb68rTbl2nGKVpaDUjZZ/09ilWY=;
 b=EWTAYxZnd09SLTtGq6/R674WKwfn22bKGpZb8sy41dZvq2ttMSNDKqeU/qJ4hnZdRo
 yoVTgbFRtCPGvZWzAPNeD/7IV54U/qyp3J7mwJVORO71fpP0c4o18ZsSyvl9j3NY0Ew/
 b90X7QRdoBtGb+X3fcblpWteGD2Gnn2q8xOKKC55WFsrUcFGCZV0X+rMbYD0Ju1pbIiw
 ggfMjFaY7K6fW0oboEyC0vbgkoYgh6yCqUhco5tIF/avla2b0AC1iHUl/QBT1yU0Pnw2
 mitf0TJsdS2Pa0fh2MMbRDo+EwFHkDT/Xity0hHAi6rO8qYxqFw7jhyFYFl33OkmgkDY
 WFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=blM7A2ZtBOEvrOOyVb68rTbl2nGKVpaDUjZZ/09ilWY=;
 b=5cP4B4jeuOMKDjx3/v+Liz5gnmm1hYBPuxphxqe9DkfRxF0S9EQqln8sV0GbRvXO4b
 ZYysrYt2wjgtyFJ9YQ0UAPFBDR7wYLeVcICnIRyNQU/X73ZmigddfjxDuHowli0rCYkj
 mzeeZPNqvZqbA4I463UTglp/+hIbaGZI8XVmmN/HJ2JwB1yrIC9DLSqMqoszAfNdzG3M
 HHu6aofaNUwUROZwngI3CcDKVeoZGr32zp8FjJnzQfD9f/HjaZNrcmUcw6nYmNs9rB10
 9RrSwIKgLOjAEhMO5OtQgCKqPaABDO6sbtQ9KP1W9UZuQPRlzxVB4BtH1k5jwV+mD0aT
 jnZg==
X-Gm-Message-State: ANoB5pn91dxcfWF1pCSgeWifEcyiYdLCn2F+LJ7rBqdl27v6cFYUOOpN
 A+K7GSD9a567r5W8ezfINr9ocXR9xlbl3lk7nEY=
X-Google-Smtp-Source: AA0mqf4KSeWFI6Q4yu8UJ7M1ePah6fRR2IWK9GojluCZN4xls3Q+UvDO46GIUJsQVn5HXRW8LCj/dA==
X-Received: by 2002:a17:906:25c7:b0:7c1:8ba6:6eb3 with SMTP id
 n7-20020a17090625c700b007c18ba66eb3mr409887ejb.35.1670886337134; 
 Mon, 12 Dec 2022 15:05:37 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1709060cc900b007b5903e595bsm3774463ejh.84.2022.12.12.15.05.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Dec 2022 15:05:36 -0800 (PST)
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
Subject: [PATCH-for-8.0 03/10] hw/virtio: Constify qmp_virtio_feature_map_t[]
Date: Tue, 13 Dec 2022 00:05:10 +0100
Message-Id: <20221212230517.28872-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212230517.28872-1-philmd@linaro.org>
References: <20221212230517.28872-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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

These arrays are only accessed read-only, move them to .rodata.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/virtio.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5817f4cbc9..f54cc23304 100644
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
@@ -179,7 +179,7 @@ static qmp_virtio_feature_map_t virtio_config_status_map[] = {
 };
 
 /* virtio-blk features mapping */
-qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
+const qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_BLK_F_SIZE_MAX, \
             "VIRTIO_BLK_F_SIZE_MAX: Max segment size is size_max"),
     FEATURE_ENTRY(VIRTIO_BLK_F_SEG_MAX, \
@@ -218,7 +218,7 @@ qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
 };
 
 /* virtio-serial features mapping */
-qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
+const qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_CONSOLE_F_SIZE, \
             "VIRTIO_CONSOLE_F_SIZE: Host providing console size"),
     FEATURE_ENTRY(VIRTIO_CONSOLE_F_MULTIPORT, \
@@ -229,7 +229,7 @@ qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
 };
 
 /* virtio-gpu features mapping */
-qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
+const qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL, \
             "VIRTIO_GPU_F_VIRGL: Virgl 3D mode supported"),
     FEATURE_ENTRY(VIRTIO_GPU_F_EDID, \
@@ -250,7 +250,7 @@ qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
 };
 
 /* virtio-input features mapping */
-qmp_virtio_feature_map_t virtio_input_feature_map[] = {
+const qmp_virtio_feature_map_t virtio_input_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
@@ -260,7 +260,7 @@ qmp_virtio_feature_map_t virtio_input_feature_map[] = {
 };
 
 /* virtio-net features mapping */
-qmp_virtio_feature_map_t virtio_net_feature_map[] = {
+const qmp_virtio_feature_map_t virtio_net_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_NET_F_CSUM, \
             "VIRTIO_NET_F_CSUM: Device handling packets with partial checksum "
             "supported"),
@@ -338,7 +338,7 @@ qmp_virtio_feature_map_t virtio_net_feature_map[] = {
 };
 
 /* virtio-scsi features mapping */
-qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
+const qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_SCSI_F_INOUT, \
             "VIRTIO_SCSI_F_INOUT: Requests including read and writable data "
             "buffers suppoted"),
@@ -359,7 +359,7 @@ qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
 };
 
 /* virtio/vhost-user-fs features mapping */
-qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
+const qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
@@ -369,7 +369,7 @@ qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
 };
 
 /* virtio/vhost-user-i2c features mapping */
-qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
+const qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_I2C_F_ZERO_LENGTH_REQUEST, \
             "VIRTIO_I2C_F_ZERO_LEGNTH_REQUEST: Zero length requests supported"),
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
@@ -381,7 +381,7 @@ qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
 };
 
 /* virtio/vhost-vsock features mapping */
-qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
+const qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_VSOCK_F_SEQPACKET, \
             "VIRTIO_VSOCK_F_SEQPACKET: SOCK_SEQPACKET supported"),
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
@@ -393,7 +393,7 @@ qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
 };
 
 /* virtio-balloon features mapping */
-qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
+const qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_BALLOON_F_MUST_TELL_HOST, \
             "VIRTIO_BALLOON_F_MUST_TELL_HOST: Tell host before reclaiming "
             "pages"),
@@ -411,14 +411,14 @@ qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
 };
 
 /* virtio-crypto features mapping */
-qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
+const qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     { -1, "" }
 };
 
 /* virtio-iommu features mapping */
-qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
+const qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_IOMMU_F_INPUT_RANGE, \
             "VIRTIO_IOMMU_F_INPUT_RANGE: Range of available virtual addrs. "
             "available"),
@@ -441,7 +441,7 @@ qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
 };
 
 /* virtio-mem features mapping */
-qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
+const qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
 #ifndef CONFIG_ACPI
     FEATURE_ENTRY(VIRTIO_MEM_F_ACPI_PXM, \
             "VIRTIO_MEM_F_ACPI_PXM: node_id is an ACPI PXM and is valid"),
@@ -453,7 +453,7 @@ qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
 };
 
 /* virtio-rng features mapping */
-qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
+const qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-- 
2.38.1


