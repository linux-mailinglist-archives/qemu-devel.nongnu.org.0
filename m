Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796BD422C1C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:14:30 +0200 (CEST)
Received: from localhost ([::1]:43236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXm9F-0006Zl-6r
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXlcQ-0002UN-4G
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:40:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXlcO-0000tz-Hm
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:40:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633444831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iOjTd9S61ut/P05qmmBp8xhn5E1imt1QuNXKhaiKgso=;
 b=SwZvxbMxWRCFwhUdudz5Nd/xuD+nWmJrMaaaSVpB+N2ABpD6sHlpC/CGcbXKSlNe/fn2Sr
 fcpm9FJLTljh3dR7zxLIdgQP11v3qSVYeQn79uvWk6j+m467Vfk+uCw0K+jWyeraRELfII
 8XcYxWBUvbrxm0aEriPE/07jyCADMTE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-wSsZ1qFNPSm3t1wAXAFMBA-1; Tue, 05 Oct 2021 10:40:29 -0400
X-MC-Unique: wSsZ1qFNPSm3t1wAXAFMBA-1
Received: by mail-ed1-f72.google.com with SMTP id
 n19-20020a509353000000b003dad185759bso12913864eda.6
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 07:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iOjTd9S61ut/P05qmmBp8xhn5E1imt1QuNXKhaiKgso=;
 b=idQLE09C+CzCoMTYlQcy0RUe2nER6VRJdRNaMMxNET/fKaZEdsM7KyNvxn/d2FTHNB
 iMGT6njDxadsMQXtLkT2DWgUAjxoctD0YZDRpmRSW86b2R/nw4ZnmFy4yQXQd3rWgbrC
 l5ZsvOyh2Wj+ypFDs6nxrtmnM1HicqC87QsFFEa6xiFnURQJS4QfhbBB7Ei8WPewWGpV
 +OZ+ZlYtNghXR2n5408dycijiYYYcJuQkem7ddrsIZbriGSVWDOr7PVn/A3MJSekSIyY
 FhJVrl/MhmCg+jYzkc7Iy5nW+w7NAUlSfzrs/YNs2QfZl4fFMoT7bRAs/YFOHArn3lP9
 8H7Q==
X-Gm-Message-State: AOAM5324iyCfHAJq0u5wZFVvAgApqN+FDm3RlQwcYLEtx6OeoytMvDYH
 ULDcmF8K7lT1mKF4x48mccLFmLwyi1vdiAb4voCfn5/66dy8AoT9pBFIEHQiDVJLYjUqy/iiy5+
 FC8o4dSJmOWyktRA=
X-Received: by 2002:a05:6402:270e:: with SMTP id
 y14mr23176953edd.212.1633444828676; 
 Tue, 05 Oct 2021 07:40:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFhfGJGalcuTJLczRqH/k5ic3OnNBLs1IYY1xUfOfrfB1xAexvMFx2a8D5M2GGDb2dkN5KLg==
X-Received: by 2002:a05:6402:270e:: with SMTP id
 y14mr23176933edd.212.1633444828432; 
 Tue, 05 Oct 2021 07:40:28 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id bq4sm7931208ejb.43.2021.10.05.07.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 07:40:27 -0700 (PDT)
Date: Tue, 5 Oct 2021 10:40:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xueming Li <xuemingl@nvidia.com>
Subject: Re: [PATCH v2 1/2] vhost-user: fix VirtQ notifier cleanup
Message-ID: <20211005103916-mutt-send-email-mst@kernel.org>
References: <20210912162014.106704-1-xuemingl@nvidia.com>
 <20210917122616.6067-1-xuemingl@nvidia.com>
 <20210917122616.6067-2-xuemingl@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210917122616.6067-2-xuemingl@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>, qemu-devel@nongnu.org,
 tiwei.bie@intel.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 17, 2021 at 08:26:15PM +0800, Xueming Li wrote:
> When vhost-user device stop and unmmap notifier address, vCPU thread
> that writing the notifier via old flatview failed with accessing invalid
> address.
> 
> To avoid this concurrent issue, wait memory flatview update by draining
> rcu callbacks before unmaping notifiers.
> 
> Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
> Cc: tiwei.bie@intel.com
> Cc: qemu-stable@nongnu.org
> Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
> Signed-off-by: Xueming Li <xuemingl@nvidia.com>


Pls post v2 as a new thread, with changelog in the cover letter.

> ---
>  hw/virtio/vhost-user.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 2c8556237f..08581e6711 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1165,6 +1165,11 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
>  
>      if (n->addr && n->set) {
>          virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
> +        if (!qemu_in_vcpu_thread())
> +            /* Wait vCPU threads accessing notifier via old flatview. */

Wait VM - Wait for VM

> +            drain_call_rcu();

okay.
but this has a coding style violation:
should use {} in if.


> +        munmap(n->addr, qemu_real_host_page_size);
> +        n->addr = NULL;
>          n->set = false;
>      }
>  }
> @@ -1502,12 +1507,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
>  
>      n = &user->notifier[queue_idx];
>  
> -    if (n->addr) {
> -        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
> -        object_unparent(OBJECT(&n->mr));
> -        munmap(n->addr, page_size);
> -        n->addr = NULL;
> -    }
> +    vhost_user_host_notifier_remove(dev, queue_idx);
>  
>      if (area->u64 & VHOST_USER_VRING_NOFD_MASK) {
>          return 0;
> @@ -2484,11 +2484,17 @@ void vhost_user_cleanup(VhostUserState *user)
>      for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>          if (user->notifier[i].addr) {
>              object_unparent(OBJECT(&user->notifier[i].mr));
> +        }
> +    }
> +    memory_region_transaction_commit();
> +    /* Wait VM threads accessing old flatview which contains notifier. */

Wait VM - Wait for VM

> +    drain_call_rcu();
> +    for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
> +        if (user->notifier[i].addr) {
>              munmap(user->notifier[i].addr, qemu_real_host_page_size);
>              user->notifier[i].addr = NULL;
>          }
>      }
> -    memory_region_transaction_commit();
>      user->chr = NULL;
>  }
>  
> -- 
> 2.33.0


