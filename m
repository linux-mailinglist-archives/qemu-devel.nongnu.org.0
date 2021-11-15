Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8BA450A49
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:56:06 +0100 (CET)
Received: from localhost ([::1]:55696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmfH3-00025m-RN
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:56:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf1h-0006R6-4o
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:40:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf1f-0005Qv-8b
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R01BxX4l5C5eaCov7FEv3t7wD4gp/yqC3ffLI+K8L7g=;
 b=Zg5wRL8Nmqcx9/zLqkWJvG4fKLH0RKidtHJvxEmD8zwcpVwWHj1WFcUaH9UbZqCiVJ3MZe
 FKNYneB/PcHWvqqPmBWF77mwMvCDU0ZCm72WJZCOieClEq/p7xO9ghr+eeGRi+4XAGhzBF
 WuOpXsw9hwM5IHZHYMR9obMMinRiqR4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-RrbbeYIUPtOKDgnbNmq8Wg-1; Mon, 15 Nov 2021 11:37:47 -0500
X-MC-Unique: RrbbeYIUPtOKDgnbNmq8Wg-1
Received: by mail-ed1-f70.google.com with SMTP id
 b15-20020aa7c6cf000000b003e7cf0f73daso2197113eds.22
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:37:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=R01BxX4l5C5eaCov7FEv3t7wD4gp/yqC3ffLI+K8L7g=;
 b=qr4kk5UapLATOrUdpne2lUTLI4zSFxZ2pVXi3X+4GOinyYIyZX+RRVOdgzFgeBovhV
 hV52QzEeKTsKP0gD90KE8IynBwiVqPqOVReacVPivQG3tkR3j7FRV61RrKJpcSAQnd81
 q3BsT3+0cSYa3TdHw2cSWba00q6qZTt+vJ1+1CIWiLmoslEvhWMVhRMNY0rdC08mR+6L
 ZWFnvAXdUlR7vBCepOdUaSve0BF0e1jzkw/Dt9EGK1XcVo87I56rhdeBXSsl5F8bCdBc
 1XcXDMMXRZY2NKn/L7a0AKFFKcLlAg3Pf4XysooRW5mTM9Ri1aJm+D1b1d772gBc06le
 w3zw==
X-Gm-Message-State: AOAM531P6TAiUguCdys+tSS7ou1bljjMeoomg9DQG/IToIzV+SLLJIKe
 1Kle2WMOJxjolttKM6K2PR3hb3PJbNy+V08eZiasa8kZH4bDqjo5klZKp2ro21H9uXbDtVzak2X
 RAHfX+Quz+cMmoYKyC/W+14BILN7E3PM5zuDli7eOe1/XajR4KHtLIRIy/u9Q
X-Received: by 2002:a17:906:608:: with SMTP id s8mr320964ejb.405.1636994265822; 
 Mon, 15 Nov 2021 08:37:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiF0n5b+00BhpsJb9KilgdOrcFfAH8saZZW6AvLsqG442RZGW2VU3WgMydYM7dr20iP9QKfg==
X-Received: by 2002:a17:906:608:: with SMTP id s8mr320937ejb.405.1636994265662; 
 Mon, 15 Nov 2021 08:37:45 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id s3sm6739305ejm.49.2021.11.15.08.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:37:44 -0800 (PST)
Date: Mon, 15 Nov 2021 11:37:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/20] vhost: Rename last_index to vq_index_end
Message-ID: <20211115163607.177432-4-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

The doc of this field pointed out that last_index is the last vq index.
This is misleading, since it's actually one past the end of the vqs.

Renaming and modifying comment.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211104085625.2054959-2-eperezma@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost.h | 4 ++--
 hw/net/vhost_net.c        | 4 ++--
 hw/virtio/vhost-vdpa.c    | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 3fa0b554ef..58a73e7b7a 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -74,8 +74,8 @@ struct vhost_dev {
     unsigned int nvqs;
     /* the first virtqueue which would be used by this vhost dev */
     int vq_index;
-    /* the last vq index for the virtio device (not vhost) */
-    int last_index;
+    /* one past the last vq index for the virtio device (not vhost) */
+    int vq_index_end;
     /* if non-zero, minimum required value for max_queues */
     int num_queues;
     uint64_t features;
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 0d888f29a6..29f2c4212f 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -232,10 +232,10 @@ fail:
 }
 
 static void vhost_net_set_vq_index(struct vhost_net *net, int vq_index,
-                                   int last_index)
+                                   int vq_index_end)
 {
     net->dev.vq_index = vq_index;
-    net->dev.last_index = last_index;
+    net->dev.vq_index_end = vq_index_end;
 }
 
 static int vhost_net_start_one(struct vhost_net *net,
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 0d8051426c..bcaf00e09f 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -645,7 +645,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     }
 
-    if (dev->vq_index + dev->nvqs != dev->last_index) {
+    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
         return 0;
     }
 
-- 
MST


