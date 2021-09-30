Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4894E41E1D2
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 20:55:07 +0200 (CEST)
Received: from localhost ([::1]:46650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW1Cz-0003Iw-Tx
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 14:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mW1AW-0001CZ-WC
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 14:52:33 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:41765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mW1AS-0004J8-U3
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 14:52:32 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso5101091wme.0
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 11:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=APTVDF/D3IubpWB8qDVO2Zw8T5nSgcTbPJqBTW5jp90=;
 b=tTzael8PJ9J8ctwCzLKvCf5IXAySj5qvoJUlqCT+rRLOV3gsnNvWv1ce9/eoi1rfkb
 Veni2SCcuUxJ5nbTa1e/6Rj6ne/rfQCVaES6ryLnwogbWn5FLnhjhLDvkwLfglhCdtYz
 foCYa1JlACNeVwc2Fr05LhJ9ABsEBp5hz3N6I3NjSmJI8h4fBzE7Ee9tMLP4hBHPOmlg
 fajBjXKdhXJlu84xuQlOiz7CDGdbS8n23QdPLC3o/MGdpJWJHW8/7hbLuX1cBt8eGFYM
 r9WIxzGZ7a0DIqDwnB5Ur+nEKrk0tE6dwfS+98uqhTjQgmqYi6f2UDZVoDD4mUSNMhz9
 EjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=APTVDF/D3IubpWB8qDVO2Zw8T5nSgcTbPJqBTW5jp90=;
 b=gCrQoGpG+d3V/bKbX4h685198ODkmlB5hN4c13PZpgHyEH0gvmxH4qZLYspDk77MA5
 KudKscLPFlCCzkfzkuYLELsFNxu9j9nm6zBj9TiPdTluGa3tZBQj5VHbWmu7Wx2uYTEs
 p7T/q7Sa9AlRxPEv66Q1GLkienpsw8o13wRTCW5RP3lvO9OvDmOStmIamvgoo4dhGNCL
 2JJIK6eOLwadSADRZ0FWuwLBZL4dsnZpQSb2SrXt2oH7GhLO7y8fqaTOR0yDwMB2OK3Y
 j/46sRZ88TNHjtRKSbf/D+SbuWWKo16YHMoAdzqUYhJsxH8BzkpC0oLZtp24YULJ6eeR
 NaXQ==
X-Gm-Message-State: AOAM532utCQRzpSB5ybC+VcyMqQXUFhyIqCdn8wm5Zywl8epXbnujXau
 2z5kPuGttoLYr10jp1A6tnBSBA==
X-Google-Smtp-Source: ABdhPJy8WYPeneEsu/39Q0V6iHgRQw5YjFGojOSYnI/FysF8ymY2qbz6jab0VHs3rWExVibs1ksvVQ==
X-Received: by 2002:a1c:7e53:: with SMTP id z80mr779727wmc.152.1633027946857; 
 Thu, 30 Sep 2021 11:52:26 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id l124sm5487151wml.8.2021.09.30.11.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 11:52:26 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH 1/3] NOMERGE: virtio-iommu: Add definitions for
 VIRTIO_IOMMU_F_BYPASS_CONFIG
Date: Thu, 30 Sep 2021 19:50:49 +0100
Message-Id: <20210930185050.262759-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930185050.262759-1-jean-philippe@linaro.org>
References: <20210930185050.262759-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull VIRTIO_IOMMU_F_BYPASS_CONFIG changes from Linux (not upstream yet).

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/standard-headers/linux/virtio_iommu.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/standard-headers/linux/virtio_iommu.h b/include/standard-headers/linux/virtio_iommu.h
index b9443b83a1..d14808e3fb 100644
--- a/include/standard-headers/linux/virtio_iommu.h
+++ b/include/standard-headers/linux/virtio_iommu.h
@@ -13,9 +13,10 @@
 #define VIRTIO_IOMMU_F_INPUT_RANGE		0
 #define VIRTIO_IOMMU_F_DOMAIN_RANGE		1
 #define VIRTIO_IOMMU_F_MAP_UNMAP		2
-#define VIRTIO_IOMMU_F_BYPASS			3
+#define VIRTIO_IOMMU_F_BYPASS			3 /* Deprecated */
 #define VIRTIO_IOMMU_F_PROBE			4
 #define VIRTIO_IOMMU_F_MMIO			5
+#define VIRTIO_IOMMU_F_BYPASS_CONFIG		6
 
 struct virtio_iommu_range_64 {
 	uint64_t					start;
@@ -36,6 +37,8 @@ struct virtio_iommu_config {
 	struct virtio_iommu_range_32		domain_range;
 	/* Probe buffer size */
 	uint32_t					probe_size;
+	uint8_t					bypass;
+	uint8_t					reserved[7];
 };
 
 /* Request types */
@@ -66,11 +69,14 @@ struct virtio_iommu_req_tail {
 	uint8_t					reserved[3];
 };
 
+#define VIRTIO_IOMMU_ATTACH_F_BYPASS		(1 << 0)
+
 struct virtio_iommu_req_attach {
 	struct virtio_iommu_req_head		head;
 	uint32_t					domain;
 	uint32_t					endpoint;
-	uint8_t					reserved[8];
+	uint32_t					flags;
+	uint8_t					reserved[4];
 	struct virtio_iommu_req_tail		tail;
 };
 
-- 
2.33.0


