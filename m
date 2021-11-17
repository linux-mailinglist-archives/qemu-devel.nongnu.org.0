Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92647454DD0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 20:23:43 +0100 (CET)
Received: from localhost ([::1]:48818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnQX0-0000R2-Kf
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 14:23:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mnQT3-0006VP-4D
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:19:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mnQSx-0005bq-9V
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:19:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637176769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ssGri1qnh68f2H9BKMGkpeD9WyXeA/tRhviPQ9uItHo=;
 b=T7llAyAPT6O2/lhhRJHgKmCBUyvayvnkBd1rxxcMgKS1jjhKCBkFy2QNMWV+/HFZ7rumdh
 f5JKtqie5QRS+BtN5u0XrytXcan2Yct1UAPmXLGyD2/3+U356bLptbfeNZITWfQMu8u/nU
 dlw37se4UZ4u3B83NgWp61oaLS+rOAc=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-w9YIy8aDOp-EeiKHcur6mw-1; Wed, 17 Nov 2021 14:19:28 -0500
X-MC-Unique: w9YIy8aDOp-EeiKHcur6mw-1
Received: by mail-ot1-f70.google.com with SMTP id
 f3-20020a9d6c03000000b0055c9d337de8so2408680otq.13
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 11:19:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ssGri1qnh68f2H9BKMGkpeD9WyXeA/tRhviPQ9uItHo=;
 b=LGmw13KP1qwkIIZEFSMDQxmt9bBCtiHrUkQeGqwZrB+5wVRFPljcQwHUcRyeE9lhcl
 52otNNeP9MwSLWMGBAVeFjsc5rPDDTLk9HITFnP3WKeaWpmMw/bh8ua9rghupde/o2fF
 e4tBatr/3wmXFnsSV1QsE1aiEQpQKISYnmogdUnCmR9W5dCaSoYyHUdjUvuMCPPzKuK0
 rA8NVetX1adDkQXLcsAAV4ffvLwrQgDgeQncsmi3kW5xg9p+BkXWpD518aYXBFuwmEp1
 U5vF2Qg4plykCuarkg6gN1dknJ4oXjiyixQcOxpzCBJoKa+pzQtFKefeMbhIZJE5gR9Z
 mMSA==
X-Gm-Message-State: AOAM5336waO4f8JqpwkVqhrHeeTXRz3unS6sJJEINR523NkgN9TWG9Do
 oYZ//J9n9sI4C6h+V2tZTKT2Lj3t4hzg+ese2rC0vcf3H8DLSX6FCxNJtGIu4ASHSumQBQgr1t9
 9YE/rK+y9++xMSlk=
X-Received: by 2002:aca:ac8a:: with SMTP id v132mr2137766oie.44.1637176767883; 
 Wed, 17 Nov 2021 11:19:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCw6vNjnVrQpIcJFYS8GNT5EKykQydGD9CApLQVhtpkXDmO3SjChR2FFE7lZk+3F2iUM89FA==
X-Received: by 2002:aca:ac8a:: with SMTP id v132mr2137745oie.44.1637176767647; 
 Wed, 17 Nov 2021 11:19:27 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id y192sm149767oie.21.2021.11.17.11.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 11:19:27 -0800 (PST)
Date: Wed, 17 Nov 2021 12:19:26 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Peng Liang <liangpeng10@huawei.com>
Subject: Re: [PATCH v2] vfio: Fix memory leak of hostwin
Message-ID: <20211117121926.458aad95.alex.williamson@redhat.com>
In-Reply-To: <20211117014739.1839263-1-liangpeng10@huawei.com>
References: <20211117014739.1839263-1-liangpeng10@huawei.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: zhengchuan@huawei.com, wanghao232@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Nov 2021 09:47:39 +0800
Peng Liang <liangpeng10@huawei.com> wrote:

> hostwin is allocated and added to hostwin_list in vfio_host_win_add, but
> it is only deleted from hostwin_list in vfio_host_win_del, which causes
> a memory leak.  Also, freeing all elements in hostwin_list is missing in
> vfio_disconnect_container.
> 
> Fix: 2e4109de8e58 ("vfio/spapr: Create DMA window dynamically (SPAPR IOMMU v2)")
> CC: qemu-stable@nongnu.org
> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
> ---
> v1 -> v2:
> - Don't change to _SAFE variant in vfio_host_win_del. [Alex]
> ---
>  hw/vfio/common.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Thanks, pull request sent to include this in 6.2.

Alex

> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index dd387b0d3959..080046e3f511 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -551,6 +551,7 @@ static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
>      QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
>          if (hostwin->min_iova == min_iova && hostwin->max_iova == max_iova) {
>              QLIST_REMOVE(hostwin, hostwin_next);
> +            g_free(hostwin);
>              return 0;
>          }
>      }
> @@ -2239,6 +2240,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
>      if (QLIST_EMPTY(&container->group_list)) {
>          VFIOAddressSpace *space = container->space;
>          VFIOGuestIOMMU *giommu, *tmp;
> +        VFIOHostDMAWindow *hostwin, *next;
>  
>          QLIST_REMOVE(container, next);
>  
> @@ -2249,6 +2251,12 @@ static void vfio_disconnect_container(VFIOGroup *group)
>              g_free(giommu);
>          }
>  
> +        QLIST_FOREACH_SAFE(hostwin, &container->hostwin_list, hostwin_next,
> +                           next) {
> +            QLIST_REMOVE(hostwin, hostwin_next);
> +            g_free(hostwin);
> +        }
> +
>          trace_vfio_disconnect_container(container->fd);
>          close(container->fd);
>          g_free(container);


