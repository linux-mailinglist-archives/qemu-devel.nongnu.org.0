Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E491237B456
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 04:57:57 +0200 (CEST)
Received: from localhost ([::1]:50454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgf4P-0004bP-14
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 22:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lgf3D-0002tH-KV
 for qemu-devel@nongnu.org; Tue, 11 May 2021 22:56:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lgf3B-0005Qb-SG
 for qemu-devel@nongnu.org; Tue, 11 May 2021 22:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620788201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7dgJ2VBvYgXlW8nrgz1xqOSk080AmTGIBqPcItbHJ8=;
 b=SFWdZyvSgl47wG4Ei0yYdiRMxoea0SmUuuK+w6Zv8m9XFTcn5xz09fycNFe0DoJKFI7V4s
 E0C8wDbTHpNx8q3o0ECWakmTMBjEEbpz+ogLk9wwa7S9cN1TiKw5q3ArKS1/3UDw7GmHwG
 WjMylHO7eOtqEonKfhhgduWdH9E7oo0=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-U6vCit2PPwedkJB9EqXcCw-1; Tue, 11 May 2021 22:56:39 -0400
X-MC-Unique: U6vCit2PPwedkJB9EqXcCw-1
Received: by mail-pf1-f199.google.com with SMTP id
 s5-20020aa78d450000b02902ace63a7e93so8477671pfe.8
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 19:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=H7dgJ2VBvYgXlW8nrgz1xqOSk080AmTGIBqPcItbHJ8=;
 b=t0BbSkTBjeHJpDSC7PG/Ew+VfYS/P3re0u1UMb4QdcGV5OhBX62qvdJ1UoIACtlqxB
 K5YxzX1TCthE6nEbj/LgPez7Nw3jisH+oyfepuxXnqiAgiqPuBEdbCh87CWef7xGWeNc
 CqME6hw32fNC3XXNQz48n5UmWTDlOBSUmo6YkBtzswnyyesUxxvXZ6c4vXdoupiTrsYF
 UoY6gAzfYa6cCxmU4Na9OVTaU5kLmcPET1bcZHCzVfPTn5ylG4PpNEZ16XVR5LWSsCU7
 GywztM7XUTeFlHcCZPGEn07ttVWZdKN44XMOg0BQwY3yusG86Dpyi2Y0PkWMA/EfEoiU
 nIaA==
X-Gm-Message-State: AOAM532G1yWMGvwiiLvx2L0zZVRGH3yp8XKEr7mUphbR5uUhQeNBdGD7
 TqRwg9UkOxG3A7+6Uhc9/ypokEAj4uLnkjzuiMueUPQMUpW6TSZbkwwyZyce5TxLHdXZj7ZveFY
 7rplTCW82ko4f568=
X-Received: by 2002:a17:90b:3781:: with SMTP id
 mz1mr5939444pjb.92.1620788198498; 
 Tue, 11 May 2021 19:56:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSQ2rjJhej6j6lVXtiuyX9Ti34Cim6flcy/ZudBCjb5vmVDZAeSFIqKEFIM6drUWAoT7BAVQ==
X-Received: by 2002:a17:90b:3781:: with SMTP id
 mz1mr5939429pjb.92.1620788198246; 
 Tue, 11 May 2021 19:56:38 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id m2sm4803460pgu.85.2021.05.11.19.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 19:56:37 -0700 (PDT)
Subject: Re: [PATCH 2/3] virtio-blk: Constify VirtIOFeature feature_sizes[]
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511104157.2880306-1-philmd@redhat.com>
 <20210511104157.2880306-3-philmd@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ceeaa52d-4a76-4ce9-d355-61a909040ed8@redhat.com>
Date: Wed, 12 May 2021 10:56:32 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210511104157.2880306-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/11 下午6:41, Philippe Mathieu-Daudé 写道:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/block/virtio-blk.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index d28979efb8d..f139cd7cc9c 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -40,7 +40,7 @@
>    * Starting from the discard feature, we can use this array to properly
>    * set the config size depending on the features enabled.
>    */
> -static VirtIOFeature feature_sizes[] = {
> +static const VirtIOFeature feature_sizes[] = {
>       {.flags = 1ULL << VIRTIO_BLK_F_DISCARD,
>        .end = endof(struct virtio_blk_config, discard_sector_alignment)},
>       {.flags = 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,


Acked-by: Jason Wang <jasowang@redhat.com>



