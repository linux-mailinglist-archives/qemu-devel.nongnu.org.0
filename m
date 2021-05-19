Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B0E388775
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 08:19:52 +0200 (CEST)
Received: from localhost ([::1]:36454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljFYd-0007jK-6m
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 02:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ljFWS-00071D-9S
 for qemu-devel@nongnu.org; Wed, 19 May 2021 02:17:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ljFWQ-0000yR-Os
 for qemu-devel@nongnu.org; Wed, 19 May 2021 02:17:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621405054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xx06MsYUFjoIi1/4sq9uSLRLhUbM4SSWyTD5bQut1DE=;
 b=TyxPtzS7fRFsaupyyX4nAytdMMxxaOW7LhG34pQSi30bpU7o8+v0EpLSz+uEnb4XodEa23
 DClgXumCcR7BzEDlCLJmDemM3+qv6JGmmApnYJvRDnGn0WcBHVlF5y353dGiM9peU1oC8Z
 TKGZoGFhO/eB+6ysmy491+BL0Z80NAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-ZRTAwhEGPoOWwUUzKX3Z9w-1; Wed, 19 May 2021 02:17:32 -0400
X-MC-Unique: ZRTAwhEGPoOWwUUzKX3Z9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ED376D595;
 Wed, 19 May 2021 06:17:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-0.ams2.redhat.com
 [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15712687CC;
 Wed, 19 May 2021 06:17:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8E05718007A2; Wed, 19 May 2021 08:17:28 +0200 (CEST)
Date: Wed, 19 May 2021 08:17:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v5 10/13] virtio-gpu: Add helpers to create and destroy
 dmabuf objects
Message-ID: <20210519061728.6lg5pweuodhoidgv@sirius.home.kraxel.org>
References: <20210519001414.786439-1-vivek.kasireddy@intel.com>
 <20210519001414.786439-11-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210519001414.786439-11-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +int virtio_gpu_update_dmabuf(VirtIOGPU *g,
> +                             uint32_t scanout_id,
> +                             struct virtio_gpu_simple_resource *res,
> +                             struct virtio_gpu_framebuffer *fb)
> +{
> +    struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
> +    VGPUDMABuf *new_primary, *old_primary;
> +
> +    new_primary = virtio_gpu_create_dmabuf(g, scanout_id, res, fb);
> +    if (!new_primary) {
> +        return -EINVAL;
> +    }
> +
> +    if (g->dmabuf.primary) {
> +        old_primary = g->dmabuf.primary;
> +    }
> +
> +    g->dmabuf.primary = new_primary;
> +    qemu_console_resize(scanout->con,
> +			new_primary->buf.width,
> +                        new_primary->buf.height);
> +    dpy_gl_scanout_dmabuf(scanout->con, &new_primary->buf);
> +
> +    if (old_primary) {
> +        virtio_gpu_free_dmabuf(g, old_primary);
> +    }
> +
> +    return 0;
> +}

../../hw/display/virtio-gpu-udmabuf.c: In function ‘virtio_gpu_update_dmabuf’:
/home/kraxel/projects/qemu/include/qemu/queue.h:456:62: error: ‘old_primary’ may be used uninitialized in this function [-Werror=maybe-uninitialized]

take care,
  Gerd


