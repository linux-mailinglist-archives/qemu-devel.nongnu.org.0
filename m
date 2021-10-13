Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75CA42B3CC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:45:11 +0200 (CEST)
Received: from localhost ([::1]:55368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maVCY-0000cD-6t
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maVAl-0007Rc-Ol
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 23:43:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maVAi-0006tj-Ba
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 23:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634096594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=viNFpeHUzGfzCjmB9yRefzHm78IOUsLSu1zbF0ytupY=;
 b=PDFWm5kipcm+SDOx1l7X+Xozw0BxMLAomXarOKqZnks2hOynhnLDdjtVXSdksZXBIXCm5z
 ePgyRYX5xqlXnpJPh+4YXuPbhh3Wap3Zc96EomzsYcEHuJdnzQgvxusFcpxIKW/2YDxP88
 W8A8x3/zRsKrmptW+HqSF7wOOFTzVg4=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-tCYgGk3pPN2MCHQW57wY1Q-1; Tue, 12 Oct 2021 23:43:13 -0400
X-MC-Unique: tCYgGk3pPN2MCHQW57wY1Q-1
Received: by mail-pg1-f198.google.com with SMTP id
 a16-20020a63d410000000b00268ebc7f4faso699980pgh.17
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 20:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=viNFpeHUzGfzCjmB9yRefzHm78IOUsLSu1zbF0ytupY=;
 b=DT2hb8+Xck5LqWhxsWH3F2h3PmifTmQ6R5WuFUXY0Um4+agCy3xbao1hkZST0RzNqW
 qfPQKIvPEA4ZUSU4hp8WF/f+R+A4G3RfAH6SDpo9aK5MrvIsnsY8/It8p5tkjhiedCwp
 oxkRurVDboancaSFpfBrOchnBSWEpC83yFA2wGmdg34nsgxElaFZ1CReM4gczmTXkNDw
 JowYOTr0S/GBeMy7YYfAZGBD4xH6tDa/DB1IkztNXOk627jaiVXoBPkdw26heBBA6YKd
 h5VRdh+b0sYfDRykOsnRMw4mgxKwZXi/V7BHBx6McxDbC8dsUjsl/KwyoZj+qYIB8NC6
 bmpA==
X-Gm-Message-State: AOAM531qGMyrtQCpw3jATM/DXdpXzOVlTLP8Zr7yO/+xEwszY+Nji869
 aWyW0YVr132nW/X2AWl5e5sivM9g8mEF3A+YfQiDMI2Enhlp6GBWTfgVDihUVw2wAfGqG1l8xdw
 H9ElgKQBU0yZBv1g=
X-Received: by 2002:a63:fe41:: with SMTP id x1mr25959368pgj.272.1634096592028; 
 Tue, 12 Oct 2021 20:43:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2pd81zis2PSX9uBg+qZtuoSWTKUrks0MjxebPhb/fQXmwGqhUME9gYkJdg+QhcG8rw6onOQ==
X-Received: by 2002:a63:fe41:: with SMTP id x1mr25959348pgj.272.1634096591746; 
 Tue, 12 Oct 2021 20:43:11 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w185sm11845546pfd.113.2021.10.12.20.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 20:43:11 -0700 (PDT)
Subject: Re: [RFC PATCH v4 09/20] vdpa: Save call_fd in vhost-vdpa
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-10-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <607201ea-db7f-0264-7dd7-fa19143b3abf@redhat.com>
Date: Wed, 13 Oct 2021 11:43:02 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001070603.307037-10-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
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
> We need to know it to switch to Shadow VirtQueue.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   include/hw/virtio/vhost-vdpa.h | 2 ++
>   hw/virtio/vhost-vdpa.c         | 5 +++++
>   2 files changed, 7 insertions(+)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index 48aae59d8e..fddac248b3 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -30,6 +30,8 @@ typedef struct vhost_vdpa {
>       GPtrArray *shadow_vqs;
>       struct vhost_dev *dev;
>       QLIST_ENTRY(vhost_vdpa) entry;
> +    /* File descriptor the device uses to call VM/SVQ */
> +    int call_fd[VIRTIO_QUEUE_MAX];


Any reason we don't do this for kick_fd or why 
virtio_queue_get_guest_notifier() can't work here? Need a comment or 
commit log.

I think we need to have a consistent way to handle both kick and call fd.

Thanks


>       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>   } VhostVDPA;
>   
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 36c954a779..57a857444a 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -652,7 +652,12 @@ static int vhost_vdpa_set_vring_kick(struct vhost_dev *dev,
>   static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>                                          struct vhost_vring_file *file)
>   {
> +    struct vhost_vdpa *v = dev->opaque;
> +    int vdpa_idx = vhost_vdpa_get_vq_index(dev, file->index);
> +
>       trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
> +
> +    v->call_fd[vdpa_idx] = file->fd;
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
>   }
>   


