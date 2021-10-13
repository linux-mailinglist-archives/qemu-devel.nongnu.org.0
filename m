Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52BF42B3CD
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:46:32 +0200 (CEST)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maVDr-0002FE-PH
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maVBN-0000A3-LE
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 23:43:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maVBM-0007Qs-3l
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 23:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634096635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sSCqxNxpX/YZBqwU8uADxkt0zdoagZQctWpdDAVcwO0=;
 b=HkPXqA4+mIZbYuJ5cAgomK2z0zQUUPScE9bhUcBytUhQrAOtHcCIsKkBrpM3xHniqfINJ5
 UUN2PW5PJpQXnpJqt/a3j5mfKrybOG8OFAH5if4MXPMwOx+kOwBbtt2GIIhKWZsV+0Cg2X
 ZoDRE6ej5qKqYCn9RPzT7qE6+MS0I4A=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-S_vTrxekP2umc0Ar5LQvXw-1; Tue, 12 Oct 2021 23:43:54 -0400
X-MC-Unique: S_vTrxekP2umc0Ar5LQvXw-1
Received: by mail-pf1-f198.google.com with SMTP id
 j12-20020aa783cc000000b0044b702424b7so792100pfn.6
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 20:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=sSCqxNxpX/YZBqwU8uADxkt0zdoagZQctWpdDAVcwO0=;
 b=4V62rAU7t2MiTxFOq0kmjBXYI+qCf0xIt1Z7RtFyMp70jv4VPBivQbvt41VaJQSAWV
 gefhIxdlVCegiY4dvOJgohQLnIyPlKkj0VFUO+F9KHE7MJVDhqNGKLUwbL2u0x7gJHlz
 Q5Hcntx0JRcKPF0BaSIY8rYbhck6+E5dX6tXh+bwdmJxmD2+nfzl+HzHMdtThUS5de7h
 fvIcvNkqJFFv9opAMc+ueC2NEeSFrmbQgHZ7xD5hqy8Ca9NSto50zdc+n+bNzm4l2nMX
 t9fUOFzAST76vjqAEXjY+nlU9WTw98JCHLolNTPTcnA8Lh83HutmIjGk43uGk4Hie26i
 J5Mw==
X-Gm-Message-State: AOAM533cEhxZMddFb+HgJOsJ9xaKvK6MKKrjWr4IthYG48fh7QZMd2+m
 GOANO5cttrGBhxuvvQ583jURheZ+PsSj4/GOrNUEpttjc1Vzu6SJlIbeJOo0CC2hwjRdzh+bcEv
 VORd00eJ4kN9Yo8s=
X-Received: by 2002:a17:902:d904:b0:13f:398e:a0df with SMTP id
 c4-20020a170902d90400b0013f398ea0dfmr14953804plz.47.1634096633195; 
 Tue, 12 Oct 2021 20:43:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcy0GT6RbympZLyR3HYopD/EFVo5KeOXXj7adcUcmNAiJI5fQwyNGWLlFtHkaiffUVY9jRbg==
X-Received: by 2002:a17:902:d904:b0:13f:398e:a0df with SMTP id
 c4-20020a170902d90400b0013f398ea0dfmr14953791plz.47.1634096632991; 
 Tue, 12 Oct 2021 20:43:52 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w11sm12687552pgf.5.2021.10.12.20.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 20:43:52 -0700 (PDT)
Subject: Re: [RFC PATCH v4 10/20] vhost-vdpa: Take into account SVQ in
 vhost_vdpa_set_vring_call
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-11-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6f10e27f-b40b-8c79-f829-3073f226eb6c@redhat.com>
Date: Wed, 13 Oct 2021 11:43:46 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001070603.307037-11-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/1 下午3:05, Eugenio Pérez 写道:
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 57a857444a..bc34de2439 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -649,16 +649,27 @@ static int vhost_vdpa_set_vring_kick(struct vhost_dev *dev,
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_KICK, file);
>   }
>   
> +static int vhost_vdpa_set_vring_dev_call(struct vhost_dev *dev,
> +                                         struct vhost_vring_file *file)
> +{
> +    trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
> +    return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
> +}
> +
>   static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>                                          struct vhost_vring_file *file)
>   {
>       struct vhost_vdpa *v = dev->opaque;
>       int vdpa_idx = vhost_vdpa_get_vq_index(dev, file->index);
>   
> -    trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
> -
>       v->call_fd[vdpa_idx] = file->fd;
> -    return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
> +    if (v->shadow_vqs_enabled) {
> +        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
> +        vhost_svq_set_guest_call_notifier(svq, file->fd);
> +        return 0;
> +    } else {
> +        return vhost_vdpa_set_vring_dev_call(dev, file);
> +    }


I feel like we should do the same for kick fd.

Thanks


>   }
>   
>   static int vhost_vdpa_get_features(struct vhost_dev *dev,


