Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C150487643
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:09:42 +0100 (CET)
Received: from localhost ([::1]:44468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5n7t-00006v-F8
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:09:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n1v-0006V5-9C
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n1t-0001jn-IN
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=873JIwL0Ssx4x2GI9hqUqv8te9fEzO/xVfFKyB9oXJQ=;
 b=DikqDfxyg/PzkzoKH86OjfUsDdPfQgDloigYxvq2VgvoA+o6fUpM9Ha3ao1lOAXq30hCj3
 xlFMT/ve9sgh/mRSAKVsBAQskTNL2ZXEFLnqvPMGIXnCgjgssidd1ao7lhLWEkjo9tdB72
 aOMeYcRkZ+OjElypRluAx3wr0W6gteI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-9H_6uD27OISFvSTygXtHLQ-1; Fri, 07 Jan 2022 06:03:28 -0500
X-MC-Unique: 9H_6uD27OISFvSTygXtHLQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 w25-20020adf8bd9000000b001a255212b7cso2092632wra.18
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:03:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=873JIwL0Ssx4x2GI9hqUqv8te9fEzO/xVfFKyB9oXJQ=;
 b=FioH2u5OX481BL1RsdXvc7CiY4YJ9ZqDo3dXybL1I5LuKk8ehn1ULKlPqIIZuXDcae
 9NpHj7tlFTtbFCLRKMK43yWHycckCYSDIyvsgFHSn/2R7RiRKdh4VVzrdZA1hung6x7W
 0YtlvUASBTd+ofj1P7e9RuQ+0kQv5F0I4ct3mg6O08wXjGe48XWZ62kwbXRrfhVU10y1
 6PJwX/bIn/dvZ4oDjZaQ2ycv6iq8pOsw7VFxfgA3x+T+yE+jvW3mOtruRmJ+OmkiklV1
 xcaNetdgtvqILenaUs1d8mKWfKbyLCmrN00tXowOTWzsUHaxO628n7n9UJLJa9vQDTMM
 KSQw==
X-Gm-Message-State: AOAM531viJZ8aKjNfk1S68/1vEH77wi4mlfvIHhJhCfXQVXIIIl5ul84
 g3MaYwY4OVKkiBYdpZYfk4a6nHvOP39PzW2hhzivZZBIVS0TV6KaqDlgRtY97VVdHqaQjGeXtVZ
 du6/OKMpOVwLRsgj1TrGW7/wF32wuq3SBt9qKF76fG8PpL4fJ8Nr9O2MEwf61
X-Received: by 2002:adf:f390:: with SMTP id m16mr52821663wro.589.1641553406528; 
 Fri, 07 Jan 2022 03:03:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwYEvmw2Z8LO0Iqlc9Mcy235idzl+vCMcH/j9WenxzoXUiC4g49jAhd7VLNUBNTqs+vXXyxA==
X-Received: by 2002:adf:f390:: with SMTP id m16mr52821645wro.589.1641553406271; 
 Fri, 07 Jan 2022 03:03:26 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id m5sm7580168wml.14.2022.01.07.03.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:03:25 -0800 (PST)
Date: Fri, 7 Jan 2022 06:03:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 06/55] vhost: introduce new VhostOps vhost_set_config_call
Message-ID: <20220107102526.39238-7-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cindy Lu <lulu@redhat.com>

This patch introduces new VhostOps vhost_set_config_call. This function allows the
vhost to set the event fd to kernel

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20211104164827.21911-5-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-backend.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 81bf3109f8..ff34eb7c8a 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -126,6 +126,8 @@ typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
 
 typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
 
+typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
+                                       int fd);
 typedef struct VhostOps {
     VhostBackendType backend_type;
     vhost_backend_init vhost_backend_init;
@@ -171,6 +173,7 @@ typedef struct VhostOps {
     vhost_vq_get_addr_op  vhost_vq_get_addr;
     vhost_get_device_id_op vhost_get_device_id;
     vhost_force_iommu_op vhost_force_iommu;
+    vhost_set_config_call_op vhost_set_config_call;
 } VhostOps;
 
 int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
-- 
MST


