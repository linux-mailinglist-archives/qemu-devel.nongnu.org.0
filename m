Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE0F50057F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 07:34:49 +0200 (CEST)
Received: from localhost ([::1]:42862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nes80-0002Mw-Jm
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 01:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nes4T-0001HZ-6F
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 01:31:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nes4H-0003tp-Ud
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 01:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649914256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OjafKi4GUprOUupyOLS4fCExMV8LPMoULi9zaqd2RY4=;
 b=Vr4Lqi6fpBjDS8MUnYRZrVrSmaJXY+/bekbVUY4k+a/9t5V1GBeqC3vf4/VUnXdr+YXFNj
 sO0kcMaDA18qNKOUbxNC/x19ri2+iZxEf6uVhTh7+UcPQhXs4wylUoaNMIOyCpbBJmst9T
 iMsq6X7EW57xNbVJfucpY20KHvfgadA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-0nkcp_ilO9OTZhwc9qFOdw-1; Thu, 14 Apr 2022 01:30:53 -0400
X-MC-Unique: 0nkcp_ilO9OTZhwc9qFOdw-1
Received: by mail-pj1-f71.google.com with SMTP id
 r12-20020a17090a690c00b001cb9bce2284so2325995pjj.8
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 22:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OjafKi4GUprOUupyOLS4fCExMV8LPMoULi9zaqd2RY4=;
 b=VrkPHUvRa/MvA6hJ4LYivrhXGKkc/in09GnkQX+aRvDws8Jmmm0rBenDmM0WMwlE48
 IrP1CgitYmDWRUjTt7Lw5BUeAM2Zbd9ZzIbIMJGum88eJay376OyFffCw8h3L8xnI/rD
 0HuPy7uCPiAGLwyJ8CgkDTaVzxrFfVdZo60V4bJGSSaDRTE1Y90FCRABS6MbkKn156sZ
 1KF6NCL4G+f2rQPRcHu0zOpwpF87zEZaqoYPnNiYPVfA1y3RzS6Z7fA8kmVbzoMIJ1mm
 rjgq5dneVYWgx9oJq8KPlDH9JnSK80cMjQaE0iGLfrqF/J3Q7ck0MRyb/UW6odKiNzk1
 F0HQ==
X-Gm-Message-State: AOAM533AhahyCa+laQlPPvONTOT/OIsZb8W547L3EB0tsJ3eZH1Wh0//
 TejOA8Ku/aNCJkP3aiQoc9srKDz7qAovq/sBXQV+OY4Dg7l2wYG8pizSb1EoJ1PCCJXT7PaUhgN
 5xxC2wN+wJunnENY=
X-Received: by 2002:a17:90b:1e01:b0:1cb:bc00:2828 with SMTP id
 pg1-20020a17090b1e0100b001cbbc002828mr2444751pjb.91.1649914251973; 
 Wed, 13 Apr 2022 22:30:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSBPEGHt4Q3dF88omjYZ9F4nfyxeKDxtRQZw7mD78H9NIiCrlkV+4115ennoHHvJanKGPxYQ==
X-Received: by 2002:a17:90b:1e01:b0:1cb:bc00:2828 with SMTP id
 pg1-20020a17090b1e0100b001cbbc002828mr2444723pjb.91.1649914251671; 
 Wed, 13 Apr 2022 22:30:51 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a056a0016c200b004f7e3181a41sm833175pfc.98.2022.04.13.22.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 22:30:51 -0700 (PDT)
Message-ID: <140a478e-fadb-1cc7-c806-ae390c9c25ce@redhat.com>
Date: Thu, 14 Apr 2022 13:30:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v7 07/25] vhost: Add reference counting to
 vhost_iova_tree
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-8-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220413163206.1958254-8-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/14 00:31, Eugenio Pérez 写道:
> Now that different vqs can have different ASIDs its easier to track them
> using reference counters.
>
> QEMU's glib version still does not have them so we've copied g_rc_box,
> so the implementation can be converted to glib's one when the minimum
> version is raised.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---


I'm not sure if it's too early to introduce things like this since we 
have at most 2 ASIDs. This is probably only needed when we want to 
expose ASIDs to guest.

Let's see how it goes for the following patch anyhow.

Thanks


>   hw/virtio/vhost-iova-tree.h |  5 +++--
>   hw/virtio/vhost-iova-tree.c | 21 +++++++++++++++++++--
>   2 files changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
> index 6a4f24e0f9..2fc825d7b1 100644
> --- a/hw/virtio/vhost-iova-tree.h
> +++ b/hw/virtio/vhost-iova-tree.h
> @@ -16,8 +16,9 @@
>   typedef struct VhostIOVATree VhostIOVATree;
>   
>   VhostIOVATree *vhost_iova_tree_new(uint64_t iova_first, uint64_t iova_last);
> -void vhost_iova_tree_delete(VhostIOVATree *iova_tree);
> -G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostIOVATree, vhost_iova_tree_delete);
> +VhostIOVATree *vhost_iova_tree_acquire(VhostIOVATree *iova_tree);
> +void vhost_iova_tree_release(VhostIOVATree *iova_tree);
> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostIOVATree, vhost_iova_tree_release);
>   
>   const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *iova_tree,
>                                           const DMAMap *map);
> diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
> index 55fed1fefb..31445cbdfc 100644
> --- a/hw/virtio/vhost-iova-tree.c
> +++ b/hw/virtio/vhost-iova-tree.c
> @@ -28,6 +28,9 @@ struct VhostIOVATree {
>   
>       /* IOVA address to qemu memory maps. */
>       IOVATree *iova_taddr_map;
> +
> +    /* Reference count */
> +    size_t refcnt;
>   };
>   
>   /**
> @@ -44,14 +47,28 @@ VhostIOVATree *vhost_iova_tree_new(hwaddr iova_first, hwaddr iova_last)
>       tree->iova_last = iova_last;
>   
>       tree->iova_taddr_map = iova_tree_new();
> +    tree->refcnt = 1;
>       return tree;
>   }
>   
>   /**
> - * Delete an iova tree
> + * Increases the reference count of the iova tree
> + */
> +VhostIOVATree *vhost_iova_tree_acquire(VhostIOVATree *iova_tree)
> +{
> +    ++iova_tree->refcnt;
> +    return iova_tree;
> +}
> +
> +/**
> + * Decrease reference counter of iova tree, freeing if it reaches 0
>    */
> -void vhost_iova_tree_delete(VhostIOVATree *iova_tree)
> +void vhost_iova_tree_release(VhostIOVATree *iova_tree)
>   {
> +    if (--iova_tree->refcnt) {
> +        return;
> +    }
> +
>       iova_tree_destroy(iova_tree->iova_taddr_map);
>       g_free(iova_tree);
>   }


