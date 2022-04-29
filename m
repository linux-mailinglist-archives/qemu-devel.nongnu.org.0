Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025D251408A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 04:15:32 +0200 (CEST)
Received: from localhost ([::1]:42674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkGAM-0001hH-J7
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 22:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nkG9A-0000as-TP
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 22:14:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nkG97-0007vJ-7B
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 22:14:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651198449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IweAk/tWzGrz5d75z1iW462tzhCUEKGa8v40S/9zYe4=;
 b=Ly++23VZUSrdhddr5nwBzYXBNgPzdceimdSg9H5g14pzmnwjoubR14MzVWe55GTSwxuyJV
 Q5q70rajet+pMRahBUMGXnDiDKc8ZnWQPscJcirDdcP3MTRybc3id1/T1sI1XG+Qt8Z2oz
 RtI+bOVP7uKY82yGivRuCX/2BpSmL+4=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-ekXMDOdKMtSzneE51QZkpA-1; Thu, 28 Apr 2022 22:14:08 -0400
X-MC-Unique: ekXMDOdKMtSzneE51QZkpA-1
Received: by mail-pj1-f71.google.com with SMTP id
 oo16-20020a17090b1c9000b001c6d21e8c04so6136633pjb.4
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 19:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IweAk/tWzGrz5d75z1iW462tzhCUEKGa8v40S/9zYe4=;
 b=N4CnraRgg0MSdZWyPQ0+aUGV1zdHS4FCK6snNsLg2GRrxpue0W8JtqYf0QDRgmodSx
 N36XAjmqGNa/C4oX7Qqf1gCUkjAtVX57BtvYsCmgZLDE41VO6U64Qtq971RkHxf7lkhK
 vcQMXQvHY/nU05lBVgx4WmmWXk0DOLs3JA6xq9v0z0EZVO0bDLajeB7qFGKG7q47XSZu
 PJu0MiitTyih+N2VWWDjhVzAESl4J3e9HYlemwC0YVHUp5iaDNvafkOMaXO0c1BtGJFV
 PwuLybR/F2mjO2cGtygRRYnk0DQZFN31RjW+ZGczf9Biyeno72LuLHn9Irw1Eapx6kd5
 xP/Q==
X-Gm-Message-State: AOAM532rE7Lxaql6jJ1yAAfOxa/nnt7LenAJmpaWIrxubvufVMPpy/ic
 kfk+NjCITVvkKvlNzVP2GYmf82xNDjSw0dOi9Y/ijE5oJRtJgnm3tZJRmTIpFhO7gRQ40Rz1qvu
 z+LntMspsU9HVrJM=
X-Received: by 2002:a63:441f:0:b0:3ab:6ae4:fc32 with SMTP id
 r31-20020a63441f000000b003ab6ae4fc32mr16873562pga.261.1651198446900; 
 Thu, 28 Apr 2022 19:14:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIpWf7prQT55EmqYuNczawS26/62M96Krt2MsCxI1z9eFCTWPa6JJgp0Tb6QlV9zof92hitg==
X-Received: by 2002:a63:441f:0:b0:3ab:6ae4:fc32 with SMTP id
 r31-20020a63441f000000b003ab6ae4fc32mr16873543pga.261.1651198446622; 
 Thu, 28 Apr 2022 19:14:06 -0700 (PDT)
Received: from [10.72.13.163] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a62b801000000b0050d9180622esm1062867pfe.75.2022.04.28.19.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 19:14:06 -0700 (PDT)
Message-ID: <198abd64-9c55-1f96-bf4b-0e56ad1e8edb@redhat.com>
Date: Fri, 29 Apr 2022 10:14:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/5] virtio-net: setup vhost_dev and notifiers for cvq
 only when feature is negotiated
Content-Language: en-US
To: Si-Wei Liu <si-wei.liu@oracle.com>, qemu-devel@nongnu.org
References: <1651048216-3365-1-git-send-email-si-wei.liu@oracle.com>
 <1651048216-3365-2-git-send-email-si-wei.liu@oracle.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <1651048216-3365-2-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eperezma@redhat.com, sgarzare@redhat.com, eli@mellanox.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/27 16:30, Si-Wei Liu 写道:
> When the control virtqueue feature is absent or not negotiated,
> vhost_net_start() still tries to set up vhost_dev and install
> vhost notifiers for the control virtqueue, which results in
> erroneous ioctl calls with incorrect queue index sending down
> to driver. Do that only when needed.
>
> Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/net/virtio-net.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 1067e72..ffb3475 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -245,7 +245,8 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
>       VirtIODevice *vdev = VIRTIO_DEVICE(n);
>       NetClientState *nc = qemu_get_queue(n->nic);
>       int queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
> -    int cvq = n->max_ncs - n->max_queue_pairs;
> +    int cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
> +              n->max_ncs - n->max_queue_pairs : 0;
>   
>       if (!get_vhost_net(nc->peer)) {
>           return;


