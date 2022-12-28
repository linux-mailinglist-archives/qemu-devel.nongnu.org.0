Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5959565776E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 14:57:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAWvP-0000Sr-6m; Wed, 28 Dec 2022 08:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pAWvN-0000S6-QW
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:56:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pAWvM-0005RY-3P
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:56:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672235811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QeLWwB9OUd735grLNqyA28bwFZgu1jjH+bLFUfs4XXY=;
 b=ajPR3hSI446qTBi1pU+3k5OLHgiICkOq8ieJ7ZMAyd+fnS1Xmc4yQU0pJFOvp0di4CjebV
 DlkocQJAPtjAenaH1ugi2mOgpqOg7D5y+swI9IQcY+YkKtXYFRhjlqlUZNlQhZnPiKhaKK
 bnZb3U8QXJIuMc7h3JeEQMfFmf0ZZeE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-527-yUFWMul2Nf6xKQXKAcZ0nw-1; Wed, 28 Dec 2022 08:56:49 -0500
X-MC-Unique: yUFWMul2Nf6xKQXKAcZ0nw-1
Received: by mail-wm1-f71.google.com with SMTP id
 q6-20020a05600c2e4600b003d211775a99so6466042wmf.1
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 05:56:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QeLWwB9OUd735grLNqyA28bwFZgu1jjH+bLFUfs4XXY=;
 b=uBo9p31mWr9pE9qYy3FLtbJ24RuwUsbqLI8MyC4WbmtrGUblDU8FvGNB0ZmrMhtw/r
 Avzo03tBT/Bvn0IArISX6NnApdo+phmgqCA9AZ0CUfHQIMmvcWkN1Fmq6ZfJJe9xzjAD
 3TEo4Y3ERUrWGWo6BjoIEBrSP/4E5Fb6iwVA2Hs3rBkzRFKPJAhjs/G6r1EQb2QE0TZO
 4PLrmDAo2fPTo0yllkuhatfcoaLzI6nxe2u+OukW0Dq2NSLMiATlE9dx0HZJqmA8zulD
 FmcGDIEUg3AIXgfhpGYtUXdkzAkNJG4q2iloLkaKVVTyARPldAIw3DVYMg+UE4OgubUz
 o1qA==
X-Gm-Message-State: AFqh2kpZjuza5UbTbzNoZoehkzNp1p5fclNBd/QQD04aNDQjqEzfv3AW
 igiVeI2zTldausTy9Q7lGYy67dS2/IpoSZK2Warki9CGDpjYR7Ajmj+4mUjpy0ACCXHce40kipm
 m005CgX/uuAsHJBc=
X-Received: by 2002:a05:600c:1f11:b0:3d0:57ea:319c with SMTP id
 bd17-20020a05600c1f1100b003d057ea319cmr17891140wmb.13.1672235808826; 
 Wed, 28 Dec 2022 05:56:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtC0W5JP0yxJWcqALDCi4x+ohiyP6ab6c3oSQt3VESgOA2/mULXGTtOaAbIdurz8cQF2ypPNg==
X-Received: by 2002:a05:600c:1f11:b0:3d0:57ea:319c with SMTP id
 bd17-20020a05600c1f1100b003d057ea319cmr17891131wmb.13.1672235808593; 
 Wed, 28 Dec 2022 05:56:48 -0800 (PST)
Received: from ?IPV6:2003:d8:2f16:1800:a9b4:1776:c5d9:1d9a?
 (p200300d82f161800a9b41776c5d91d9a.dip0.t-ipconnect.de.
 [2003:d8:2f16:1800:a9b4:1776:c5d9:1d9a])
 by smtp.gmail.com with ESMTPSA id
 hg24-20020a05600c539800b003cf71b1f66csm20692988wmb.0.2022.12.28.05.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 05:56:48 -0800 (PST)
Message-ID: <6ce798ab-dd67-7f7a-38ec-abb12b35ac58@redhat.com>
Date: Wed, 28 Dec 2022 14:56:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] virtio-mem: Fix the iterator variable in a vmem->rdl_list
 loop
Content-Language: en-US
To: Chenyi Qiang <chenyi.qiang@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20221228090312.17276-1-chenyi.qiang@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221228090312.17276-1-chenyi.qiang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 28.12.22 10:03, Chenyi Qiang wrote:
> It should be the variable rdl2 to revert the already-notified listeners.
> 
> Fixes: 2044969f0b ("virtio-mem: Implement RamDiscardManager interface")
> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
> ---
>   hw/virtio/virtio-mem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index d96bde1fab..88c9c10318 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -341,7 +341,7 @@ static int virtio_mem_notify_plug(VirtIOMEM *vmem, uint64_t offset,
>       if (ret) {
>           /* Notify all already-notified listeners. */
>           QLIST_FOREACH(rdl2, &vmem->rdl_list, next) {
> -            MemoryRegionSection tmp = *rdl->section;
> +            MemoryRegionSection tmp = *rdl2->section;
>   
>               if (rdl2 == rdl) {
>                   break;

Indeed, most probably we barely hit that error path in practice. Thanks!

I really have to find a way to simulate a sparse bitmap easily, and to 
inject errors to better test these paths.

https://github.com/davidhildenbrand/qemu.git mem-next

-- 
Thanks,

David / dhildenb


