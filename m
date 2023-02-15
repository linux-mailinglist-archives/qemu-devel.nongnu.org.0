Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C07D6978DA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 10:22:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSDyf-0005tM-55; Wed, 15 Feb 2023 04:21:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pSDyd-0005pE-1C
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 04:21:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pSDyb-0000rH-GV
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 04:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676452880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hW09+93u9RR5LDRj2LkLhsUYccN3tS1bO7lPGpa6Gtk=;
 b=YlS24DDI0jy5JgKmUjPtiIUTAYUFxxmwXl5+BdQUINaV76gy86YY8fABh4vQlQ1NGAkRjl
 MDQU4bEBak3u1DbSNz3j+9n8QX40gkQjFO1FIWrhO2CAK8JQvrEG4gJAZ+Wsb5IuUcHX5I
 zJzsnVVdDvpryItyCJQFei/Nsu20K40=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-449-C4-_YIvXNeawANf_-mWEJQ-1; Wed, 15 Feb 2023 04:21:14 -0500
X-MC-Unique: C4-_YIvXNeawANf_-mWEJQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 s7-20020ae9f707000000b007294677a6e8so11143225qkg.17
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 01:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hW09+93u9RR5LDRj2LkLhsUYccN3tS1bO7lPGpa6Gtk=;
 b=AM1Ln98JFovUt/frLCG4vYZILT1E4iq2z1KySxi5eI9Z5hGmxGpKkhX/NGQ6gczIX6
 LQ2wXsV3V7XEeSTWQC7xZT4xq4O2qBurnLlx9kehyDeIoZtPCi2zeDQ4DGPZAeJKyTzO
 ZD4scDgOubcQZ9RKSHasGl5OXvUppYUmFur86ULlvoJTL6M1e6qsKUwU68SM9PmkQsMG
 dNRiaSy2MKaSS0cZQXUXDUMWUHyPdK+h+0I7cVfrtfNw7qXwubqRtX2Hj5in5+s1ghXk
 cAcZQxOnvRmVzWYPY0KXStVdlN7IH2QrycGytDGaqgULh9/p6d3Vv7EX68+HeiEp5MhV
 Jj9g==
X-Gm-Message-State: AO0yUKWfTfgcf6ticvzvzKYzS4m+nr+eMYynNoo4XsnJcESrQsyqj4EZ
 QrBAoXEtzpLs5NEQyOJTbdL8wJTgTJVpwhpO+GxZ2Umxw/oc02K29+2S7QFXpfCLtBCcIEjq8iQ
 ZyjOnBFyrniaCfHM=
X-Received: by 2002:ac8:5f8e:0:b0:3bb:7c6b:9cb6 with SMTP id
 j14-20020ac85f8e000000b003bb7c6b9cb6mr3239512qta.17.1676452874411; 
 Wed, 15 Feb 2023 01:21:14 -0800 (PST)
X-Google-Smtp-Source: AK7set+otCyI08VXmE4AfvtVneeDZVFG3ztZZl+iZgX6mpNfX7OPJADcijxbZCOJn+9L6T3WzMzEkA==
X-Received: by 2002:ac8:5f8e:0:b0:3bb:7c6b:9cb6 with SMTP id
 j14-20020ac85f8e000000b003bb7c6b9cb6mr3239486qta.17.1676452874157; 
 Wed, 15 Feb 2023 01:21:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 cp4-20020a05622a420400b003a7eb5baf3csm1202714qtb.69.2023.02.15.01.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 01:21:13 -0800 (PST)
Message-ID: <c28feb6c-d28b-f9c6-b5d7-0a5b57854c18@redhat.com>
Date: Wed, 15 Feb 2023 10:21:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 02/18] vfio/common: Fix error reporting in
 vfio_get_dirty_bitmap()
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-3-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <20230126184948.10478-3-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clegoate@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/26/23 19:49, Avihai Horon wrote:
> Return -errno instead of -1 if VFIO_IOMMU_DIRTY_PAGES ioctl fails in
> vfio_get_dirty_bitmap().
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/vfio/common.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 93b18c5e3d..d892609cf1 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1288,6 +1288,7 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>   
>       ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
>       if (ret) {
> +        ret = -errno;
>           error_report("Failed to get dirty bitmap for iova: 0x%"PRIx64
>                   " size: 0x%"PRIx64" err: %d", (uint64_t)range->iova,
>                   (uint64_t)range->size, errno);


