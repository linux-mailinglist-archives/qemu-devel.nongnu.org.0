Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC7930F2FF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 13:17:53 +0100 (CET)
Received: from localhost ([::1]:40482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7da3-0004h6-T3
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 07:17:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7dYO-0003kF-7F
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:16:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7dYK-0003gL-9a
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612440960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YIe1zKZhNBF0nyoYNnL1lHIUj3xXL3mI8/seuit9/rM=;
 b=Hzc8LeQEUt9K/mBzYep8RfIdppWDjdh4V/PovGDBS9b2G965Cr/fmxbHSpkpm+H0/hYPCb
 MHL95DFnYbaVFo1tbFCF6t1c9Iu5UI9HkZOVgPMmF2uwfJQyGBQZSmEuyZjs+Vrh11yLKr
 5XcPoeKyEHfrvjFYrMgM6O9YVq9KBlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-RPuTcpbnNrin-IjhLvOfVA-1; Thu, 04 Feb 2021 07:15:58 -0500
X-MC-Unique: RPuTcpbnNrin-IjhLvOfVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 893961020C20;
 Thu,  4 Feb 2021 12:15:57 +0000 (UTC)
Received: from work-vm (ovpn-114-21.ams2.redhat.com [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60BC76F130;
 Thu,  4 Feb 2021 12:15:47 +0000 (UTC)
Date: Thu, 4 Feb 2021 12:15:38 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Subject: Re: [RFC PATCH 9/9] virtiofsd: (work around) Comment qsort in
 inflight I/O tracking
Message-ID: <20210204121538.GH3039@work-vm>
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
 <20201215162119.27360-10-zhangjiachen.jaycee@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20201215162119.27360-10-zhangjiachen.jaycee@bytedance.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, Xie Yongji <xieyongji@bytedance.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jiachen Zhang (zhangjiachen.jaycee@bytedance.com) wrote:
> This is a work around. The qsort function will malloc memory instead of use
> stack memory when the resubmit_num is larger than 64 (total size larger than
> 1024 Bytes). This will cause seccomp kill virtiofsd, so we comment qsort.
> This work around will not affect the correctness of inflight I/O tracking.
> 
> Signed-off-by: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>

That's an odd hack!   Just follow the audit log to see what seccomp was
upset by and add the right syscall.

Dave

> ---
>  contrib/libvhost-user/libvhost-user.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 
> diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
> index 8c97013e59..c226d5d915 100644
> --- a/contrib/libvhost-user/libvhost-user.c
> +++ b/contrib/libvhost-user/libvhost-user.c
> @@ -1167,20 +1167,6 @@ vu_check_queue_msg_file(VuDev *dev, VhostUserMsg *vmsg)
>      return true;
>  }
>  
> -static int
> -inflight_desc_compare(const void *a, const void *b)
> -{
> -    VuVirtqInflightDesc *desc0 = (VuVirtqInflightDesc *)a,
> -                        *desc1 = (VuVirtqInflightDesc *)b;
> -
> -    if (desc1->counter > desc0->counter &&
> -        (desc1->counter - desc0->counter) < VIRTQUEUE_MAX_SIZE * 2) {
> -        return 1;
> -    }
> -
> -    return -1;
> -}
> -
>  static int
>  vu_check_queue_inflights(VuDev *dev, VuVirtq *vq)
>  {
> @@ -1236,10 +1222,6 @@ vu_check_queue_inflights(VuDev *dev, VuVirtq *vq)
>              }
>          }
>  
> -        if (vq->resubmit_num > 1) {
> -            qsort(vq->resubmit_list, vq->resubmit_num,
> -                  sizeof(VuVirtqInflightDesc), inflight_desc_compare);
> -        }
>          vq->counter = vq->resubmit_list[0].counter + 1;
>      }
>  
> -- 
> 2.20.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


