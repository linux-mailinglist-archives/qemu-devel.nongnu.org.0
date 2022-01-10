Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C35648A1A4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:16:30 +0100 (CET)
Received: from localhost ([::1]:58528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n721l-0005ly-Cn
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:16:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71re-00085i-Up
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:06:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71rP-0004aD-Ii
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641848707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LUvJ7tIyqBOqSen0Qaoh/iwRKNN92+aeMnfonMUuG0A=;
 b=PsofjzB5nN+3FwNJMWH0qXEB5jhf4zs8ahkJMr2eNdqBsbOAs482GvtIMoxnqBk7uqTTh2
 NBjfPMxvk3TEjYRRc7us8LB10X+cIPpxdt8uWfbp7m+mFhOWwH5llhIq0kHqq6ynK/rzc9
 WONF1ZOUzbgHVmZOdlfFuahjFVTGdvo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-ax4nVYo0PPmmkQUqDpcGGw-1; Mon, 10 Jan 2022 16:05:06 -0500
X-MC-Unique: ax4nVYo0PPmmkQUqDpcGGw-1
Received: by mail-wm1-f69.google.com with SMTP id
 z13-20020a05600c0a0d00b003457d6619f8so630464wmp.1
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 13:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LUvJ7tIyqBOqSen0Qaoh/iwRKNN92+aeMnfonMUuG0A=;
 b=Ku6KBmTuNyu8LzD4Dzm9yvjMH2PpXfHSc+bq630utaLqLTyC27spdAcJtj5jEHT6kv
 AkBQh+4xIYoXZ6oe8z8cv9e37mtp5iT9WDIa1EhtvrOqpWmug6zJunCSOhxpb7Zt99/h
 yqRylDdhGagXybs/42JFxTKZxTrL6mw/r//Li2GIKlYceboYGOnnxCqgrtJIp5qs7yIo
 pIVMEVEQ5Viiei6zdbuRSzbvCfCxEC1MkDhxrteEFhPeP/Ub/20KtxKZHYpJ2H1Pul27
 HIHnBkTO1WO6HeVuL/R5dy5BkigzJIWOfq85GXujtEh5UYN9QQZYgYl9FoF2f6nLy0AK
 Du/A==
X-Gm-Message-State: AOAM531rMEelTbjpxxmg6Azx+s40ulXXrPwXnlraoJdQGPzO5tgK8qOo
 A1fs7PrdRsO/Ru8PUtE7kc9rdega8cMbjZOaGMJag7gQf58At+LmhI9C/xot4IQdLPMXeshGUHR
 EI//PrERmAMAJWlyN3A/Wpjrb4J4aqFNTdw0Hncg4Cij8hpQKO7xTnux4eD0/
X-Received: by 2002:a05:6000:2a3:: with SMTP id
 l3mr1098174wry.289.1641848704404; 
 Mon, 10 Jan 2022 13:05:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz362t6Hy6ASCRaqOMM8CBqNSGr3DFei0QvAoEylotubQ9UjXbCIuqKFviYArPV855FSV+OlA==
X-Received: by 2002:a05:6000:2a3:: with SMTP id
 l3mr1098157wry.289.1641848704162; 
 Mon, 10 Jan 2022 13:05:04 -0800 (PST)
Received: from redhat.com ([2.55.19.241])
 by smtp.gmail.com with ESMTPSA id l13sm8516112wrs.73.2022.01.10.13.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 13:05:03 -0800 (PST)
Date: Mon, 10 Jan 2022 16:05:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 06/10] Revert "vhost-vdpa: add support for config interrupt"
Message-ID: <20220110210416.18779-7-mst@redhat.com>
References: <20220110210416.18779-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110210416.18779-1-mst@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This reverts commit 634f7c89fbd78f57d00d5d6b39c0ade9df1fe27f.

Fixes: 634f7c89fb ("vhost-vdpa: add support for config interrupt")
Cc: "Cindy Lu" <lulu@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 7 -------
 hw/virtio/trace-events | 1 -
 2 files changed, 8 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index ac0cb575fb..04ea43704f 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -734,12 +734,6 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
     trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
     return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
 }
-static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
-                                       int fd)
-{
-    trace_vhost_vdpa_set_config_call(dev, fd);
-    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, &fd);
-}
 
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
                                      uint64_t *features)
@@ -810,5 +804,4 @@ const VhostOps vdpa_ops = {
         .vhost_get_device_id = vhost_vdpa_get_device_id,
         .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
         .vhost_force_iommu = vhost_vdpa_force_iommu,
-        .vhost_set_config_call = vhost_vdpa_set_config_call,
 };
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 595ce015ff..f7ad6be5fb 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -53,7 +53,6 @@ vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRI
 vhost_vdpa_set_owner(void *dev) "dev: %p"
 vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
 vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last) "dev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
-vhost_vdpa_set_config_call(void *dev, int fd)"dev: %p fd: %d"
 
 # virtio.c
 virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
-- 
MST


