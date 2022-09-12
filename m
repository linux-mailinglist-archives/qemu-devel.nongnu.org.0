Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A6B5B5ADC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 15:08:25 +0200 (CEST)
Received: from localhost ([::1]:57876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXjAm-0006pM-NM
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 09:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oXiiT-0005G8-AN
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:39:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oXiiO-0007nk-AS
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:39:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662986340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZrNdS7MF5rWhtAnAXfiNppJ2y3XYLSGAh78N9CvzHrE=;
 b=G1VzvlRrSvnOf6KwTTf3W5pi5QnxxtRs9aEZbxcpcss1m9B2c2T1PmiO151ya9MtZyDxfl
 /3qWCJcCd6aIPKNy0VK4zBAWc/HYM7ELIQ8NM6zuhxdbP0DFHgvuClITU6yR9dopa4uTm3
 tA/VrHypPbKn+dybLusrSvAUzJGtbsk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-LE-zHJMWM2iQMRmSTkRFOA-1; Mon, 12 Sep 2022 08:38:54 -0400
X-MC-Unique: LE-zHJMWM2iQMRmSTkRFOA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7351010665A4;
 Mon, 12 Sep 2022 12:38:54 +0000 (UTC)
Received: from localhost (unknown [10.39.193.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A2D1C15BA4;
 Mon, 12 Sep 2022 12:38:54 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Nicolin Chen <nicolinc@nvidia.com>, alex.williamson@redhat.com
Cc: qemu-devel@nongnu.org, kwankhede@nvidia.com, avihaih@nvidia.com,
 shayd@nvidia.com, jgg@nvidia.com
Subject: Re: [PATCH] vfio/common: Do not g_free in vfio_get_iommu_info
In-Reply-To: <20220910004245.2878-1-nicolinc@nvidia.com>
Organization: Red Hat GmbH
References: <20220910004245.2878-1-nicolinc@nvidia.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 12 Sep 2022 14:38:52 +0200
Message-ID: <8735cwu5r7.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 09 2022, Nicolin Chen <nicolinc@nvidia.com> wrote:

> Its caller vfio_connect_container() assigns a default value
> to info->iova_pgsizes, even if vfio_get_iommu_info() fails.
> This would result in a "Segmentation fault" error, when the
> VFIO_IOMMU_GET_INFO ioctl errors out.
>
> Since the caller has g_free already, drop the g_free in its
> rollback routine and add a line of comments to highlight it.

There's basically two ways to fix this:

- return *info in any case, even on error
- free *info on error, and make sure that the caller doesn't try to
  access *info if the function returned !0

The problem with the first option is that the caller will access invalid
information if it neglects to check the return code, and that might lead
to not-that-obvious errors; in the second case, a broken caller would at
least fail quickly with a segfault. The current code is easier to fix
with the first option.

I think I'd prefer the second option; but obviously maintainer's choice.

>
> Fixes: 87ea529c50 ("vfio: Get migration capability flags for container")
> Cc: Kirti Wankhede <kwankhede@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  hw/vfio/common.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ace9562a9b..51b2e05c76 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1940,6 +1940,7 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
>      return 0;
>  }
>  
> +/* The caller is responsible for g_free(*info) */
>  static int vfio_get_iommu_info(VFIOContainer *container,
>                                 struct vfio_iommu_type1_info **info)
>  {
> @@ -1951,8 +1952,6 @@ again:
>      (*info)->argsz = argsz;
>  
>      if (ioctl(container->fd, VFIO_IOMMU_GET_INFO, *info)) {
> -        g_free(*info);
> -        *info = NULL;
>          return -errno;
>      }
>  


