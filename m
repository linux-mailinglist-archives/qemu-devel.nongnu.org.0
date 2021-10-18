Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7769843233B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 17:47:42 +0200 (CEST)
Received: from localhost ([::1]:55958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcUrV-0002R6-JO
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 11:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mcUoS-0000uG-Dt
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 11:44:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mcUoP-0007cH-Qd
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 11:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634571868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BBBK8xK/z4JnOYYi1h0nGgyzqXkYYVdmRwRlxGL0y84=;
 b=a2oOaYF6oOlDDNDOTYPgk/tCyR7YMcjiI498sYALYQKTkzZ0IRTRMVCeVUYmA1gQ2vGI8X
 2nbS5r0NLYkr+GzyHQSVgPeO1hqy5QnJmnVWU/KXBh+w34L2IyvwhkD6b+KjEu7WwG3RT0
 rf1AHCtogbNPIcRt13cQ+s9hIWxAxpo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-aGGyNsytPkKeIs10V4y5mg-1; Mon, 18 Oct 2021 11:44:27 -0400
X-MC-Unique: aGGyNsytPkKeIs10V4y5mg-1
Received: by mail-ed1-f71.google.com with SMTP id
 x5-20020a50f185000000b003db0f796903so14751277edl.18
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 08:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BBBK8xK/z4JnOYYi1h0nGgyzqXkYYVdmRwRlxGL0y84=;
 b=3y0MHMDwLl09PjQaQPQfrwRNV6aQ3qkWzpZHLMXWfveLNxMg26luiU5j5OQbjdR/AD
 9dn5pHqW4QDczGGZfRXKJahXurILn9gnx2roy9UkHGBL2/hsgIWyJMdvVgqD2IO7jTtq
 LJQ1byEMDTfavWuoHLNQ8QCnodxwvnDYHkE7d7pgyaVSvG+ROqAr8+7Zm1ZvMAfGFPy8
 4/P71nGPKRRP9YfNE2T8tkJfFEscc+PKMKmkdfKMGPStlPgjFSn73k+44asUTzd4+awM
 7IadNXiNEMyHpjIkv/aXowxl9R8zr8O4DVfZpew7mBxqol+1+vva4fce5ZFPw2zdl9di
 pCVQ==
X-Gm-Message-State: AOAM5338QXIW/r/d9EutY8swSHNjwIge5B5zmm4zz8SUIV9yNm0oYPkj
 SMH914idbdI/tlyE4TUNPP7ThbPhYNWoNtjO2sJTDOvbz6+RPpRwboSCi7hlm8JiylRi5GuehJ5
 GC3E4Q0r1Qr9F9MY=
X-Received: by 2002:a17:906:22c9:: with SMTP id
 q9mr32410795eja.216.1634571866075; 
 Mon, 18 Oct 2021 08:44:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEfxy89aI2sao9jvaTbO13osC6IAcp0uWQCoSsDtpzEJG5kvIemBdWZxAaWeXsZQ3UV4x+eA==
X-Received: by 2002:a17:906:22c9:: with SMTP id
 q9mr32410763eja.216.1634571865876; 
 Mon, 18 Oct 2021 08:44:25 -0700 (PDT)
Received: from steredhat (host-79-34-250-211.business.telecomitalia.it.
 [79.34.250.211])
 by smtp.gmail.com with ESMTPSA id o25sm9996677edq.40.2021.10.18.08.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 08:44:25 -0700 (PDT)
Date: Mon, 18 Oct 2021 17:44:23 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V4 03/10] vhost-vdpa: prepare for the multiqueue support
Message-ID: <20211018154423.uc3ehhrfvmxd3nry@steredhat>
References: <20211011042829.4159-1-jasowang@redhat.com>
 <20211011042829.4159-4-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211011042829.4159-4-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: lulu@redhat.com, mst@redhat.com, qemu-devel@nongnu.org, gdawar@xilinx.com,
 eperezma@redhat.com, lingshan.zhu@intel.com, elic@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 12:28:22PM +0800, Jason Wang wrote:
>Unlike vhost-kernel, vhost-vdpa adapts a single device multiqueue
>model. So we need to simply use virtqueue index as the vhost virtqueue
>index. This is a must for multiqueue to work for vhost-vdpa.
>
>Signed-off-by: Jason Wang <jasowang@redhat.com>
>Message-Id: <20210907090322.1756-4-jasowang@redhat.com>
>Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>---
> hw/virtio/vhost-vdpa.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>index edac4017da..8587d30918 100644
>--- a/hw/virtio/vhost-vdpa.c
>+++ b/hw/virtio/vhost-vdpa.c
>@@ -504,8 +504,8 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
> {
>     assert(idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs);

Should we also change this assert?

Thanks,
Stefano

>
>-    trace_vhost_vdpa_get_vq_index(dev, idx, idx - dev->vq_index);
>-    return idx - dev->vq_index;
>+    trace_vhost_vdpa_get_vq_index(dev, idx, idx);
>+    return idx;
> }
>
> static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>-- 
>2.25.1
>
>


