Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF58587BFC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 14:09:26 +0200 (CEST)
Received: from localhost ([::1]:42460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIqiC-00050J-Sp
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 08:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oIqgK-0001z6-AB
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 08:07:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oIqg3-0005bA-1b
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 08:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659442029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MUsTOLHt9XVH7jinwJei5WXXxCYMQBLV+QrxsUjQLb4=;
 b=QFptcQXJ60FbaprhNNCtsJKRt+QyC4Bo7JvpYdmWG9mTgCLAhjfrs5JXlk9zOGnJcecy4I
 /hUZgdbBk0Thk3rs9vrLI3HmRmOJPw1sj5j5gOHVYuwdBm2l7bulq1eUFqcU2Zva3O+vOI
 XLlzfj05A1A1XJK+8bmIG9YECHxs3Yc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-UdcuhHjBMu6gVNkq89v08A-1; Tue, 02 Aug 2022 08:07:07 -0400
X-MC-Unique: UdcuhHjBMu6gVNkq89v08A-1
Received: by mail-wr1-f69.google.com with SMTP id
 i17-20020adfaad1000000b0021ecb856a71so3445268wrc.4
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 05:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MUsTOLHt9XVH7jinwJei5WXXxCYMQBLV+QrxsUjQLb4=;
 b=0w6XFga8zOS+SOpc5MbhwXsvy0fFbukNbbNIjngAPSKZsvi9BKK+cf4N1Lnse+thNU
 rk1jq8aX4L66pY08LB83ldV70+0yQxaCU+q9N5QYLahcjNjYpz+CQ2DQoa/KoNQgi7UH
 6pou3B4x+jhoIdMzTt1TR/AH2Kb2rqBdJRugLhUxzSBG/cD5mQ6qIhuZcpM5DIQszodB
 /PeVEi5Qvx8SFGNmiDdS1h+UBymsC08Ikxau7yjcd6Jc6/eT8Ovc8PjGAPZhMljUvL4k
 KmtXThgdEjI8EENgd0IKvgIkXQ9bAxXRtNwBGep8cXF/m6t3ba/IxjkolLiuHENO2qoq
 SKSQ==
X-Gm-Message-State: ACgBeo0LDUpn9Uii8BedGtfbMMFoap4aMGPs+ViwHNfX1htExISY15Ob
 UUUWQ4GWdR6KnJXYZMZA7AIPwA/et2sXCHWP8sJyRRgkuuVBmQdxsxyiK9IH1HdgXuUDF7S3JpR
 knhCva1q70LFJ7x0=
X-Received: by 2002:a05:6000:888:b0:21f:bc6:cc12 with SMTP id
 ca8-20020a056000088800b0021f0bc6cc12mr13134658wrb.90.1659442026444; 
 Tue, 02 Aug 2022 05:07:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7T/RRX4AklHsZBxutnKVEU9bIUQgsvjAHyujqP8Z4i4eN+77n2FwZ1nJd+65odectXa/iYfA==
X-Received: by 2002:a05:6000:888:b0:21f:bc6:cc12 with SMTP id
 ca8-20020a056000088800b0021f0bc6cc12mr13134636wrb.90.1659442026204; 
 Tue, 02 Aug 2022 05:07:06 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 bi9-20020a05600c3d8900b003a0375c4f73sm17558520wmb.44.2022.08.02.05.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 05:07:05 -0700 (PDT)
Message-ID: <aa7f3a8c-0f1d-8652-b574-48f824d2bd37@redhat.com>
Date: Tue, 2 Aug 2022 14:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] vdpa: Fix file descriptor leak on get features error
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20220802112447.249436-1-eperezma@redhat.com>
 <20220802112447.249436-2-eperezma@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220802112447.249436-2-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 02/08/2022 13:24, Eugenio Pérez wrote:
> File descriptor vdpa_device_fd is not free in the case of returning
> error from vhost_vdpa_get_features. Fixing it by making all errors go to
> the same error path.
> 
> Resolves: Coverity CID 1490785
> Fixes: 8170ab3f43 ("vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs")
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 6abad276a6..303447a68e 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -566,7 +566,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>       g_autofree NetClientState **ncs = NULL;
>       g_autoptr(VhostIOVATree) iova_tree = NULL;
>       NetClientState *nc;
> -    int queue_pairs, r, i, has_cvq = 0;
> +    int queue_pairs, r, i = 0, has_cvq = 0;
>   
>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>       opts = &netdev->u.vhost_vdpa;
> @@ -582,7 +582,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>   
>       r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
>       if (unlikely(r < 0)) {
> -        return r;
> +        goto err;
>       }
>   
>       queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, features,

Reviewed-by: Laurent Vivier <lvivier@redhat.com>

I can take this one via the trivial branch.

Thanks,
Laurent


