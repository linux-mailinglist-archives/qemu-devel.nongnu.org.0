Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AED04349FD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:27:01 +0200 (CEST)
Received: from localhost ([::1]:55046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9kK-0000S5-7l
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8iN-0004uP-Ft
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8iK-0003uy-GZ
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PfjOqB9kjBvbXknqljRNhTP69fh+V4ztljrYZwt0Bno=;
 b=gkSMh0hCeBNQRCljJ+vAjVAE2GIZnY/LouMlw7OO0U8Zuu9pPCvR+Nl0lustlypOTkcLST
 x7h16KY54oC3W7USxB7MmbseMDUq5HXFtrvI16hz89e1zT7nq+pXWRMtyDUGgPUiH1Vp82
 sX4eAjmaA/mEpuO/k50W9qLxcyKU5Nc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-QmFtfQzVNAyJXrMei_dbcQ-1; Wed, 20 Oct 2021 06:20:49 -0400
X-MC-Unique: QmFtfQzVNAyJXrMei_dbcQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 l22-20020aa7c316000000b003dbbced0731so20532409edq.6
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PfjOqB9kjBvbXknqljRNhTP69fh+V4ztljrYZwt0Bno=;
 b=vrlpbAVnARppkZ5Di+bsQvaA7OC7KEEfLHsVew9O3sUPHy2W8VCb2pxfUYC2jiTBnL
 /zbPkbIfUyd6P4WFXLKxvW38ZXc+zDXNfX7TbxHLPHY0vVcDDN2rwWRZZqt8NkAI9Ytj
 sVuF23E6MNGf6n9HOIN/1Ep+6bXyjsq03RV/imce9ta/V8rjIbu6Gl2bMrmigGk37Z9g
 jfDkeO3MMbBnXTfr+S147U0FmCeSWEJL9+Dk58ZvGLhCdHQqL3XdJmh8brwZHnKKNfmc
 CByIheTLZ2MIq6k7jRIjLLcWoVX+0MUjLxqsjgNzBpvp8VUiS3iKjQxrTp5WDqGSJiln
 7XvQ==
X-Gm-Message-State: AOAM533SiA5O+E/A197eW7Gfn5QU0cg57rjltEc73uiJzWIhs7SqBkiY
 330zrOFHk16Jli+OMfsuxlWn24HbEW4xk0uyvsV4k6HzxAvXZr1khsBvL2mYpJ5yFaNuhA3aJpp
 vY4AwHPcfLbH0dS/Owu6FWR9FO7BhOyUlzon0OqoK3/m9y98NlMt+NPwBfJPs
X-Received: by 2002:a17:906:3ac6:: with SMTP id
 z6mr44869028ejd.196.1634725248333; 
 Wed, 20 Oct 2021 03:20:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUxRK8PgXjZSti2rOFUf1L/1fal+M+u+HX4MndySFTYSGrpvOSTeDFbWShWlx6G/fbBUbwdg==
X-Received: by 2002:a17:906:3ac6:: with SMTP id
 z6mr44869001ejd.196.1634725248127; 
 Wed, 20 Oct 2021 03:20:48 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id z4sm1028795edd.46.2021.10.20.03.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:47 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 33/44] vhost-vdpa: prepare for the multiqueue support
Message-ID: <20211020101844.988480-34-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

Unlike vhost-kernel, vhost-vdpa adapts a single device multiqueue
model. So we need to simply use virtqueue index as the vhost virtqueue
index. This is a must for multiqueue to work for vhost-vdpa.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211020045600.16082-4-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index ceb53613ba..8948fd316b 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -546,8 +546,8 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
 {
     assert(idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs);
 
-    trace_vhost_vdpa_get_vq_index(dev, idx, idx - dev->vq_index);
-    return idx - dev->vq_index;
+    trace_vhost_vdpa_get_vq_index(dev, idx, idx);
+    return idx;
 }
 
 static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
-- 
MST


