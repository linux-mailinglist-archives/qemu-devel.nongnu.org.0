Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2304677C42
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:18:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJwhj-0006uO-Ui; Mon, 23 Jan 2023 08:17:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pJwhh-0006ts-EL
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:17:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pJwhf-0006zn-TU
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674479858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rH0KvBXUNksZmkR7CZj76LFS40TYV5pw7RL2bJPPbA4=;
 b=DPsGnn2xX56nmh5HMFCtriAF8fWpIm2KSwuyN6TLPuLWEX1a0mzovdp5mdKljWEfxp5a9w
 nKfaun55GpybAhMvsS6i7+a+nh2uAv8qsQMxxDns3ZeQgl9xrGS4+YYuasgO77bjINqQgA
 D3TTe3/fCG7BxPqhR5kiktKUcMcwbro=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-149-ydOd8fk0PbaCsP0ahHDO7w-1; Mon, 23 Jan 2023 08:17:37 -0500
X-MC-Unique: ydOd8fk0PbaCsP0ahHDO7w-1
Received: by mail-vk1-f198.google.com with SMTP id
 n131-20020a1f2789000000b003d93a6e6162so4893910vkn.21
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:17:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rH0KvBXUNksZmkR7CZj76LFS40TYV5pw7RL2bJPPbA4=;
 b=RIGxUKEApwjUJaytudPOcPOwWeRst3/PkYczatanQ15w733cNwkNnvkKng9Y67pS3M
 QXpyoblcNLTFH2zVDuBO+FMbggZpQZCSJmV/ly/doaNNCwkPJRHa+hmhNwHcbX5gn/ng
 Z4fkh23I8gFJqD/SGYlbgNejRby+2ULHHr7R4+psTdA3B10dtFw+a38eO48jwNQ9AAz5
 Kf8R5Z51WLB4Pa2mCAX+CiKRWzlwRN60Y/MQT/WH731UnmkA/0f5U32gydQhnZgZ2SSK
 irVQKIn1eXzZ1c3JFY7UOSRaBDccSFETudLEniLYfD6Ptv+Sd4uw204Wa/xK8Ipm4jR1
 nA5Q==
X-Gm-Message-State: AFqh2kp3hvtM+kc9o740Xg27oq2dkxv95sQpMAVwhMZRbgFgCnR2NWUZ
 98S4HbqSSOkpaG9fGcPUjjCzGKsewHFwjetbTTGtOSQUvtSsxiokDpRDaiCch0vvCNKMhnQ8XWG
 9liw/+oFOsh7l8sA=
X-Received: by 2002:a05:6102:356e:b0:3c5:60eb:5a90 with SMTP id
 bh14-20020a056102356e00b003c560eb5a90mr13200070vsb.25.1674479857029; 
 Mon, 23 Jan 2023 05:17:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvIHbX+Dvvl/5f1XgRtPT5rMhwPeHxFvJMdD9A9kZIrSArYMNqw16BHEdVV/1wkjzIlD0ySaw==
X-Received: by 2002:a05:6102:356e:b0:3c5:60eb:5a90 with SMTP id
 bh14-20020a056102356e00b003c560eb5a90mr13200044vsb.25.1674479856713; 
 Mon, 23 Jan 2023 05:17:36 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a05620a0d8500b006eee3a09ff3sm31816933qkl.69.2023.01.23.05.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 05:17:36 -0800 (PST)
Message-ID: <d8f21135-968e-055d-0fd9-5a23c6d04b86@redhat.com>
Date: Mon, 23 Jan 2023 14:17:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, mst@redhat.com
Cc: elic@nvidia.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, leiyang@redhat.com
References: <20230117105308.1337120-1-eperezma@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20230117105308.1337120-1-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
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

On 1/17/23 11:53, Eugenio Pérez wrote:
> VHOST_BACKEND_F_IOTLB_ASID is the feature bit, not the bitmask. Since
> the device under test also provided VHOST_BACKEND_F_IOTLB_MSG_V2 and
> VHOST_BACKEND_F_IOTLB_BATCH, this went unnoticed.
> 
> Fixes: c1a1008685 ("vdpa: always start CVQ in SVQ mode if possible")
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> Acked-by: Jason Wang <jasowang@redhat.com>
> ---
> Originally on SUSPEND series, but it is a fix that it is worth to send
> and apply individually:
> https://lists.nongnu.org/archive/html/qemu-devel/2023-01/msg02574.html
> 
> ---
>   net/vhost-vdpa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 1a13a34d35..de5ed8ff22 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -384,7 +384,7 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>               g_strerror(errno), errno);
>           return -1;
>       }
> -    if (!(backend_features & VHOST_BACKEND_F_IOTLB_ASID) ||
> +    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) ||
>           !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
>           return 0;
>       }
> --
> 2.31.1

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


