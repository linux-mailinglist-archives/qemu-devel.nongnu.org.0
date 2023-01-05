Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED1165E810
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:41:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMLg-0002IQ-DM; Thu, 05 Jan 2023 04:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLL-00025Q-7d
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLI-00073Q-QP
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TW26SpRLvo3EQOgqHPmT0jppiI/VcZdoEpjPo9AUTRY=;
 b=K0zaoB9mw5mG0pPKF0u5Hy4rWzh1/S6NWrnqs0qQfJzZwMes+gakrSFKv7Qxrms5OO7P7r
 HoSNrHpWyjo/TlMDECE4Hgay3jEGU1g3VAVr2dpMqmOIOUagcyjICrhfj+DyN+qrRsph5u
 2J8UIxKH2iWIH/4TGDQmDFPTHEeqyaY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-Vt1q-27eO2qqeYInMVKUpg-1; Thu, 05 Jan 2023 04:15:19 -0500
X-MC-Unique: Vt1q-27eO2qqeYInMVKUpg-1
Received: by mail-wm1-f72.google.com with SMTP id
 f20-20020a7bc8d4000000b003d1cda5bd6fso260769wml.9
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:15:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TW26SpRLvo3EQOgqHPmT0jppiI/VcZdoEpjPo9AUTRY=;
 b=BTmyxZF/rPHAX3rWE7l34SqhJk7BFrLHmf2zZvW85hl71CYKQS2KGNhVYbfUn3VVaf
 WALJDPgNnyv3uROAvGaVStl9lsW+FHqMD/Czc7zvwVBA8CsYlZ+391LekYz1EvqTqvSq
 iaXVtQFsWnmBK1yM5UEja9kHRYgibA8wMjEWKmIP677XAIkvLPbzB1vcK14qit9uGCrU
 PyPxH4pgSmGSF44zbBTMHUMPHg0gxQmSk1OqgknS968zvsx3GNRQ3lilDLSFBSIiDmen
 kZnWZoTzKt0fvJ7asxLnv5UagyPANGRUhGDJaWHjGistzibxDW+b+SV78tUhgdg807zw
 5p7A==
X-Gm-Message-State: AFqh2kpPNNYeBUM06DlVPVySWdT0jWopYq1NpZJJnvMB6wlmi5psJRVt
 RXVUUPb7UHbS7WPaLnxhAvJfyBQaZV89NOdx02Q/+tbFZGIqVzCn8cG2OF+SrqPvRtsCrfiVTAw
 Fmw7GELUkzsfeKTIyhG76Vp0HT+luhg/qWl5yJMjH9iJj6iHqeMehjfRRj8pl
X-Received: by 2002:a05:600c:35ca:b0:3d1:f2de:195a with SMTP id
 r10-20020a05600c35ca00b003d1f2de195amr39012979wmq.32.1672910117633; 
 Thu, 05 Jan 2023 01:15:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtAt8LRuVRwOi3CZqOk/GVrJfLtKQpjF44hZjsz5JkcrRI1cgTmlmiV0dYM7NiIRHpqBFCq0A==
X-Received: by 2002:a05:600c:35ca:b0:3d1:f2de:195a with SMTP id
 r10-20020a05600c35ca00b003d1f2de195amr39012968wmq.32.1672910117436; 
 Thu, 05 Jan 2023 01:15:17 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 cc15-20020a5d5c0f000000b00298d87b6309sm11250041wrb.78.2023.01.05.01.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:15:16 -0800 (PST)
Date: Thu, 5 Jan 2023 04:15:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 18/51] vhost: introduce new VhostOps vhost_set_config_call
Message-ID: <20230105091310.263867-19-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
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

From: Cindy Lu <lulu@redhat.com>

This patch introduces new VhostOps vhost_set_config_call.
This function allows the qemu to set the config
event fd to kernel driver.

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20221222070451.936503-5-lulu@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-backend.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index eab46d7f0b..c5ab49051e 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -128,6 +128,8 @@ typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
 
 typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
 
+typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
+                                       int fd);
 typedef struct VhostOps {
     VhostBackendType backend_type;
     vhost_backend_init vhost_backend_init;
@@ -174,6 +176,7 @@ typedef struct VhostOps {
     vhost_vq_get_addr_op  vhost_vq_get_addr;
     vhost_get_device_id_op vhost_get_device_id;
     vhost_force_iommu_op vhost_force_iommu;
+    vhost_set_config_call_op vhost_set_config_call;
 } VhostOps;
 
 int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
-- 
MST


