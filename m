Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72DB6AFC30
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:21:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiLP-0001Ph-Pu; Tue, 07 Mar 2023 20:11:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLN-0001Kw-LG
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLM-0001Zi-02
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oA8R5GnRl2r5pdtAn8QzizgEI8Vtmh5N+JhG5tVfA9Y=;
 b=ZLWQoRmwkyFvmIxXBBEUICxbjoX+A1Iav1as+6L6LJWqgDCiBVFQSJXRW+/9wcVrjelrlR
 qQ8oAoFDz/AZ1gWya/dQnL1rlr6SGVXWZRVVbTj59eMrzsqx2qTb3SKYXVzA8QOLmG/cbz
 lxrD2bakNRSAKIvkcGBph/hbA1LtXoU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-xrsbqluYN8i3C2CYjp5Tkw-1; Tue, 07 Mar 2023 20:11:46 -0500
X-MC-Unique: xrsbqluYN8i3C2CYjp5Tkw-1
Received: by mail-ed1-f71.google.com with SMTP id
 y1-20020a056402358100b004ea439d57b7so9284136edc.12
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237905;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oA8R5GnRl2r5pdtAn8QzizgEI8Vtmh5N+JhG5tVfA9Y=;
 b=LO4xMDxFbSyJS3d8RzeK9XXPgBZr5ytJCAJcjuTK25l+zIr6D13ZYXvVdWApPan2gI
 fTJS3KqyjsERObRQO2N7Db3sjRQhOLpoD164cF9AwW+RLX3qs3kpZzvYpN8zhdbRmDJ8
 A0B7XMzNRFnsr58+j9x860SIAKAD3YUSCBGAozWCy3Sa24+hQlq1hyuSgAPiGw7EzTo8
 JN1ZdvxcKTDyBeewNJE9ae4ZzgQytN+Ja7kUBudK7Q2Tuv22BvNlzIakuQsYlhuUtMVj
 KNYuDr+EaxEe7VkSyF2uDO68HeM9r7ZcNxFtAzeALPPUklBqXuHkUeSfA+q3sXsd1KbG
 ht2Q==
X-Gm-Message-State: AO0yUKX3DwIEa1W9g0A7x0RlxAxe3+wf6HqP3ZiwDZvUvWZSBRbpeyAK
 EMapoPpdkEujJYcBrTTDB5zZmgbxob19Si0HF6Z0shLw7GOqqsQweH0E/TEJu+mFcwc7kRA7zzL
 Cbpg/IC0hMGOQDlbz4Zrxqup9NYi/BKHGrMflrpH1ZeZ8EJgJZsYVhf+8velLgIw/CyU0
X-Received: by 2002:a17:907:6e0f:b0:907:672b:736a with SMTP id
 sd15-20020a1709076e0f00b00907672b736amr19715792ejc.31.1678237904773; 
 Tue, 07 Mar 2023 17:11:44 -0800 (PST)
X-Google-Smtp-Source: AK7set/3a3uk2v0eOSoYm+oR1FZJrDR0jEkKzuVpanGhEUk3vxkqNfzRigIAh8gtxbzzfUqwcCxeJQ==
X-Received: by 2002:a17:907:6e0f:b0:907:672b:736a with SMTP id
 sd15-20020a1709076e0f00b00907672b736amr19715767ejc.31.1678237904473; 
 Tue, 07 Mar 2023 17:11:44 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 x8-20020a170906440800b008e8e975e185sm6752540ejo.32.2023.03.07.17.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:44 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>
Subject: [PULL 17/73] vdpa: add vhost_vdpa->suspended parameter
Message-ID: <b6662cb7e5376659c7abb56efe27dcf3898d4fe6.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

This allows vhost_vdpa to track if it is safe to get the vring base from
the device or not.  If it is not, vhost can fall back to fetch idx from
the guest buffer again.

No functional change intended in this patch, later patches will use this
field.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20230303172445.1089785-6-eperezma@redhat.com>
Tested-by: Lei Yang <leiyang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h | 2 ++
 hw/virtio/vhost-vdpa.c         | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 7997f09a8d..4a7d396674 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -42,6 +42,8 @@ typedef struct vhost_vdpa {
     bool shadow_vqs_enabled;
     /* Vdpa must send shadow addresses as IOTLB key for data queues, not GPA */
     bool shadow_data;
+    /* Device suspended successfully */
+    bool suspended;
     /* IOVA mapping used by the Shadow Virtqueue */
     VhostIOVATree *iova_tree;
     GPtrArray *shadow_vqs;
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 1550b1e26a..517e3cdc8d 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1193,6 +1193,14 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
         return 0;
     }
 
+    if (!v->suspended) {
+        /*
+         * Cannot trust in value returned by device, let vhost recover used
+         * idx from guest.
+         */
+        return -1;
+    }
+
     ret = vhost_vdpa_call(dev, VHOST_GET_VRING_BASE, ring);
     trace_vhost_vdpa_get_vring_base(dev, ring->index, ring->num);
     return ret;
-- 
MST


