Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E104069FDCB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 22:40:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUwqa-0000hR-Jc; Wed, 22 Feb 2023 16:40:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pUwqX-0000go-IH
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:40:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pUwqV-0006UJ-Iq
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677102014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RcbMfCCUVZU65eqs0V6yVnLHYCanuRZINLjD7BqNGcU=;
 b=arQ/k5sjpAg6oSAhiHNw315bv1QxuTJSr5E3zJ5iZQMt1zT1wWbE7AQ3CMncVLhHfE6A6g
 ArQ6Ykw2+20cOn/16maOjI2nSBx7T7H007NF3Zdpcz4dMF1Irct4AhsLFIKFIQFqIIHF/d
 vjjnhJQXf144MOUJdrPxBDO1ntt1U48=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-471-8DYpf6YzM1ShzGfxHrT4Yg-1; Wed, 22 Feb 2023 16:40:12 -0500
X-MC-Unique: 8DYpf6YzM1ShzGfxHrT4Yg-1
Received: by mail-io1-f70.google.com with SMTP id
 p25-20020a5d9c99000000b00745dfcf1ed3so5810987iop.1
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 13:40:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RcbMfCCUVZU65eqs0V6yVnLHYCanuRZINLjD7BqNGcU=;
 b=T2oH1tZ1wSeTP5T6d+GETsaifdyz9dd7HP7FhmyBmHTbYtwAVQHymqP61lznAVKPNL
 XdKYVs+8E1iwQXky1oV7c51yvSE6P+OPNuhRky2fL1wpoFvCj/7fRiQbEBAJjPkdeaFq
 MRcrG36q80L3z5CGudQecciWnQv/qPGxVXdF6mNGs9bsEqcp9A9romaOrczzOIKQpRAv
 s3JguTH2M9JgMvqQ9YTSm3YFfAIZALS5SoKyuXuWTLAjTgrY5WGLW30zUSftC6Fv5bza
 iMzuYuu5Y4VRqfe/e4PARH5DTrBTYtKNVIooqw27bEI7kSPLuiW4rRxi7eyJVuLALULP
 6N7w==
X-Gm-Message-State: AO0yUKX34/sgwjdLNfiWpoRAX0vmNZY/6Z5iAIM+pKJlWc8DHp9gUods
 LeGbqozgKH6UITST4CLk9BZWxII+NS8JI30H8vlpW11MvuYgS6F1Q3aw8lAXjTlSsN4LvSUHTCI
 kuFS+UK4cr/JXsKU=
X-Received: by 2002:a05:6e02:1d85:b0:312:5834:f6cf with SMTP id
 h5-20020a056e021d8500b003125834f6cfmr7361594ila.1.1677102011862; 
 Wed, 22 Feb 2023 13:40:11 -0800 (PST)
X-Google-Smtp-Source: AK7set88TmwihBtVwYdVdCmj2iGzc913uzo05PNStbyNb0amOYHbjWgveB1FOXM339cHaODS1Zn8xQ==
X-Received: by 2002:a05:6e02:1d85:b0:312:5834:f6cf with SMTP id
 h5-20020a056e021d8500b003125834f6cfmr7361571ila.1.1677102011626; 
 Wed, 22 Feb 2023 13:40:11 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g2-20020a056e02130200b00313f1b861b7sm2838630ilr.51.2023.02.22.13.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 13:40:10 -0800 (PST)
Date: Wed, 22 Feb 2023 14:40:09 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Jason Wang" <jasowang@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "David Hildenbrand"
 <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH v2 07/20] vfio/common: Add VFIOBitmap and (de)alloc
 functions
Message-ID: <20230222144009.2a59f1d0.alex.williamson@redhat.com>
In-Reply-To: <20230222174915.5647-8-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-8-avihaih@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 22 Feb 2023 19:49:02 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> There are already two places where dirty page bitmap allocation and
> calculations are done in open code. With device dirty page tracking
> being added in next patches, there are going to be even more places.
> 
> To avoid code duplication, introduce VFIOBitmap struct and corresponding
> alloc and dealloc functions and use them where applicable.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  hw/vfio/common.c | 89 ++++++++++++++++++++++++++++++++----------------
>  1 file changed, 60 insertions(+), 29 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ac93b85632..84f08bdbbb 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -320,6 +320,41 @@ const MemoryRegionOps vfio_region_ops = {
>   * Device state interfaces
>   */
>  
> +typedef struct {
> +    unsigned long *bitmap;
> +    hwaddr size;
> +    hwaddr pages;
> +} VFIOBitmap;
> +
> +static VFIOBitmap *vfio_bitmap_alloc(hwaddr size)
> +{
> +    VFIOBitmap *vbmap = g_try_new0(VFIOBitmap, 1);
> +    if (!vbmap) {
> +        errno = ENOMEM;
> +
> +        return NULL;
> +    }
> +
> +    vbmap->pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
> +    vbmap->size = ROUND_UP(vbmap->pages, sizeof(__u64) * BITS_PER_BYTE) /
> +                                         BITS_PER_BYTE;
> +    vbmap->bitmap = g_try_malloc0(vbmap->size);
> +    if (!vbmap->bitmap) {
> +        g_free(vbmap);
> +        errno = ENOMEM;
> +
> +        return NULL;
> +    }
> +
> +    return vbmap;
> +}
> +
> +static void vfio_bitmap_dealloc(VFIOBitmap *vbmap)
> +{
> +    g_free(vbmap->bitmap);
> +    g_free(vbmap);
> +}

Nit, '_alloc' and '_free' seems like a more standard convention.
Thanks,

Alex


