Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66876432DFE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 08:18:18 +0200 (CEST)
Received: from localhost ([::1]:36562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mciS1-0000x4-0s
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 02:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mciPS-0007lD-9h
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:15:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mciPO-0005zJ-1P
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634624132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=60KlOswIUog4Z0nbwB+CKPjyYDEsfL3LQOQedWhA3tg=;
 b=Dh4c2aUJOgurRMvturY+kmDDot0OAl4N+XewO6/XPzyJ0mapRfPhbh2zD+4ZTEs3C5CeAW
 soHuJZ/GNSdrCUN6zJXdK7o7HRR8A/RF0kogoEDZ2PmBxeyn8q8koMBSLp4oXzUegEOs8L
 Kb/TD4SdeUf9X8WlsynfjDMG+/GUFbM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-f1M57hsTNIyFIbQl9VflBw-1; Tue, 19 Oct 2021 02:15:30 -0400
X-MC-Unique: f1M57hsTNIyFIbQl9VflBw-1
Received: by mail-wr1-f71.google.com with SMTP id
 j19-20020adfb313000000b00160a9de13b3so9707788wrd.8
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 23:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=60KlOswIUog4Z0nbwB+CKPjyYDEsfL3LQOQedWhA3tg=;
 b=jJaGcUUIqEFJ3ltUZle1h3s4uFiMFRoliGwI1cIUcsTjay2zna8Ojb+GJJzfSRPrVu
 qyK+dU6rHoWKD/3ePu+b0YYwJoGDHhCbY+MMkmb2rixULhc27Ktp31zb47SkHqdq0xjc
 truobsN/1hW++1jamBbERzC8oAjjohGsexcK786k/dUn/0JvqeA3GPCiQ17DKURaL8MY
 2723m+5S6tXi3giOA54DD4zkh0i/uidTavpIyaadyC2rBACfhWKWJho+ngfBs9g/XbSe
 gbb/vVfDankWAxKi8DpKwm6Zpy6hcGMBhEBoM7JfUbOVOqYOLRK4HuRLtL8NI6Yw/jkC
 65kA==
X-Gm-Message-State: AOAM533nwasN8LEGOo+Xyjzd8kV8xhMg0jh2N1EWCui8t6Vv8ji8yX41
 0DpUHDl8qYQAJPcnpCGJsZi3hBlnVpMMG7Xs+j77TptZ91T/mfoXGgez93l3nArTGKwzxbjB2Qc
 6uoMkcQkNGnkZ4qc=
X-Received: by 2002:a7b:ce8d:: with SMTP id q13mr3834018wmj.103.1634624129700; 
 Mon, 18 Oct 2021 23:15:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxeCwChztu5676Mr0w+9Sfva05Adqlg/jbTLBEL4yegc1oqMYLCVZMoDogbZtmmo5RMwLT6Q==
X-Received: by 2002:a7b:ce8d:: with SMTP id q13mr3833995wmj.103.1634624129510; 
 Mon, 18 Oct 2021 23:15:29 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id r128sm1337031wma.44.2021.10.18.23.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 23:15:28 -0700 (PDT)
Date: Tue, 19 Oct 2021 02:15:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xueming Li <xuemingl@nvidia.com>
Subject: Re: [PATCH v3 1/2] vhost-user: fix VirtQ notifier cleanup
Message-ID: <20211019021457-mutt-send-email-mst@kernel.org>
References: <20211008075805.589644-1-xuemingl@nvidia.com>
 <20211008075805.589644-2-xuemingl@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20211008075805.589644-2-xuemingl@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>, qemu-devel@nongnu.org,
 tiwei.bie@intel.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 08, 2021 at 03:58:04PM +0800, Xueming Li wrote:
> When vhost-user device cleanup and unmmap notifier address, VM cpu
> thread that writing the notifier failed with accessing invalid address.
> 
> To avoid this concurrent issue, wait memory flatview update by draining
> rcu callbacks, then unmap notifiers.
> 
> Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
> Cc: tiwei.bie@intel.com
> Cc: qemu-stable@nongnu.org
> Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
> Signed-off-by: Xueming Li <xuemingl@nvidia.com>
> ---
>  hw/virtio/vhost-user.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index bf6e50223c..b2e948bdc7 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1165,6 +1165,12 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
>  
>      if (n->addr && n->set) {
>          virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
> +        if (!qemu_in_vcpu_thread()) { /* Avoid vCPU dead lock. */
> +            /* Wait for VM threads accessing old flatview which contains notifier. */
> +            drain_call_rcu();
> +        }
> +        munmap(n->addr, qemu_real_host_page_size);
> +        n->addr = NULL;
>          n->set = false;
>      }
>  }


../hw/virtio/vhost-user.c: In function ‘vhost_user_host_notifier_remove’:
../hw/virtio/vhost-user.c:1168:14: error: implicit declaration of function ‘qemu_in_vcpu_thread’ [-Werror=implicit-function-declaration]
 1168 |         if (!qemu_in_vcpu_thread()) { /* Avoid vCPU dead lock. */
      |              ^~~~~~~~~~~~~~~~~~~
../hw/virtio/vhost-user.c:1168:14: error: nested extern declaration of ‘qemu_in_vcpu_thread’ [-Werror=nested-externs]
cc1: all warnings being treated as errors
ninja: build stopped: subcommand failed.
make[1]: *** [Makefile:162: run-ninja] Error 1
make[1]: Leaving directory '/scm/qemu/build'
make: *** [GNUmakefile:11: all] Error 2


Although the following patch fixes it, bisect is broken.


> @@ -1502,12 +1508,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
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
> @@ -2485,11 +2486,17 @@ void vhost_user_cleanup(VhostUserState *user)
>      for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>          if (user->notifier[i].addr) {
>              object_unparent(OBJECT(&user->notifier[i].mr));
> +        }
> +    }
> +    memory_region_transaction_commit();
> +    /* Wait for VM threads accessing old flatview which contains notifier. */
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


