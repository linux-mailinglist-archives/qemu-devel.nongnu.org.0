Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CFD213787
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 11:22:05 +0200 (CEST)
Received: from localhost ([::1]:41158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrHtU-0001eo-4X
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 05:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jrHdE-0001OB-42
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 05:05:16 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:45684
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jrHdC-0004cT-5v
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 05:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593767113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zxsZyEl0Ic2zeqGPCHFNr5fX901vp9gn578GtCCySkg=;
 b=GzXDLl34WaNEJZhZSqccwFGR06/C0l8Tu1mrYK+hPop97riVRqGbaL0j2bkkqBeCOH3TiE
 eSEdzIeN/VS0I5roONxHUY2hRcw3BK/GPJFwnbzWZkzOMKGehWllbi3+guPmjAsdX9KcoT
 R8Lrqr2+DNtVGUYCybiCX7bHOuRvhOM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-q6ZgD4AKPQSjHoxyicTQGA-1; Fri, 03 Jul 2020 05:05:10 -0400
X-MC-Unique: q6ZgD4AKPQSjHoxyicTQGA-1
Received: by mail-wm1-f72.google.com with SMTP id v6so32317049wmg.1
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 02:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zxsZyEl0Ic2zeqGPCHFNr5fX901vp9gn578GtCCySkg=;
 b=AHgl3qEujd9538jWOdoqpbFZOKtdagzKdt+7+/8thH5s0N4gSNxm5dv0edfoGGnN/g
 nm3dB0odLomPqjhaUR06nTh+4KUw/miZEsAsaEzAi3wNw4jlmU8spVemZsTJE4xQgQ/x
 BgBh8cThbcJhhuvtDCciO94zbz7/8uleK1/cR7InErNrhawjlBZ8jifKDDDECvxNlfau
 Hz8oCDQJk4KDmaTsMDbRXrPRk7DI0Vr55INitj6lKUQ0RUecMomDF7xyI0EnU1Sm57Xg
 SEM5wIjK0FzzGeLdMCMXMeqrvI49LChtzA6D1z8fSYZ/MzrlNIPfFTdyr4Ku7TWCX2/+
 EIbg==
X-Gm-Message-State: AOAM53009/VDTlAOEUWNKued4hL4Ak+DOPiaB0edEv2l6jbVS4h8xPLN
 01rSKdkFc5uKOon4vvCHc0quaKyn8rr58xBaH/nUxna1slKbeHLZC2faJwgrhqLOZM2Blr9URkG
 mQwKYwugE6J0lr9U=
X-Received: by 2002:a5d:4992:: with SMTP id r18mr33929657wrq.323.1593767109631; 
 Fri, 03 Jul 2020 02:05:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtr03rcNACSmb0UpIZQYQnkHGUcx0kffoXsoY7GeQbNs+qvVb11RIKvz60jek8LLTOiIuqsg==
X-Received: by 2002:a5d:4992:: with SMTP id r18mr33929646wrq.323.1593767109478; 
 Fri, 03 Jul 2020 02:05:09 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 w13sm13166619wrr.67.2020.07.03.02.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 02:05:08 -0700 (PDT)
Date: Fri, 3 Jul 2020 05:05:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 37/41] vhost: introduce new VhostOps vhost_force_iommu
Message-ID: <20200703090252.368694-38-mst@redhat.com>
References: <20200703090252.368694-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200703090252.368694-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 01:34:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cindy Lu <lulu@redhat.com>

This patch introduces new VhostOps vhost_force_iommu callback
to force enable features bit VIRTIO_F_IOMMU_PLATFORM.

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20200701145538.22333-11-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 include/hw/virtio/vhost-backend.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index bfc24207e2..e7cb8d028c 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -121,6 +121,8 @@ typedef int (*vhost_vq_get_addr_op)(struct vhost_dev *dev,
 
 typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
 
+typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
+
 typedef struct VhostOps {
     VhostBackendType backend_type;
     vhost_backend_init vhost_backend_init;
@@ -164,6 +166,7 @@ typedef struct VhostOps {
     vhost_dev_start_op vhost_dev_start;
     vhost_vq_get_addr_op  vhost_vq_get_addr;
     vhost_get_device_id_op vhost_get_device_id;
+    vhost_force_iommu_op vhost_force_iommu;
 } VhostOps;
 
 extern const VhostOps user_ops;
-- 
MST


