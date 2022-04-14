Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91C45004AF
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 05:36:18 +0200 (CEST)
Received: from localhost ([::1]:56322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neqHK-0001SS-2v
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 23:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqFf-0008RY-KG
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:34:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqFe-0002Tb-7O
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:34:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649907273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvf+vfuRXG8gTyEe3X3EWHc2wZNRi3M0GomEGH1imnQ=;
 b=dWoG428l/TDRO1MFqf8iaaakASg1WFQivx50DCXsQ6rLq4qlgdjHBYSRGWRFNGJVc+MwGl
 ZQ27SVOVbtBs/ICPWkKim6ctxn3Tj8AyMjGka/ztYtbCJeuZwgVvibroaqWPDpFMSVufT2
 j1tvCJwvsNxa9TC13AD1Vb7QZ3bIiOc=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655--aq2i9J_ORyGXoXBIrlKJA-1; Wed, 13 Apr 2022 23:34:32 -0400
X-MC-Unique: -aq2i9J_ORyGXoXBIrlKJA-1
Received: by mail-pj1-f70.google.com with SMTP id
 r15-20020a17090a4dcf00b001cb7ea0b0bdso2396268pjl.1
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 20:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nvf+vfuRXG8gTyEe3X3EWHc2wZNRi3M0GomEGH1imnQ=;
 b=pm7P/RJaHrBzGIQsGV5N2a+6prEb+DVf1/lXhDbd2hB7oaE+9PUQ6Fpf3J1SUjF1wd
 U1N4u3BHXgwvIxqj+WrNFPS+biI72xleSzEz6z6hZ06j/ekF/oONJrvN0SmE7XoqAzSS
 iBjaSAksibtO7y3OLp3SjZuF0FycSGc72kAq9jNi08mopFEASndoKup4F6biAsE6O+rY
 4UGQ+iyVvwrxaY8gXS/dOZqHv1clgRBHfZ1YNCV90u7+i9xuRZ+iZNothcJIcI2OGgza
 gztlv3fJnTMRJrmaBE1eO4y7ToRcIoppS0EEyf6W17LLsr/GQ3hxbDvB86D6AcH3V5/O
 yrpg==
X-Gm-Message-State: AOAM530Rbp2vORwDWBNi0Jos4FBcKy7AM93QM/GYQCQZn+uoyQoPyHho
 q2ulcFqA4VW+ye6/X6jpLUmK+g7Aa0bD59esYo8NytGx+GMl3ixUfOfOnFWXm6xRXZx5StwfA0/
 jFR3J/QYKFbH6Vkc=
X-Received: by 2002:a65:6d0c:0:b0:382:a4b1:c93 with SMTP id
 bf12-20020a656d0c000000b00382a4b10c93mr676788pgb.237.1649907271331; 
 Wed, 13 Apr 2022 20:34:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf2Bgk39mKaTJFncNWrM85sYyPH84moR2u9ntSvhAsf4x0Thzc2DNT1np52vSG06ytBFX6ow==
X-Received: by 2002:a65:6d0c:0:b0:382:a4b1:c93 with SMTP id
 bf12-20020a656d0c000000b00382a4b10c93mr676768pgb.237.1649907271032; 
 Wed, 13 Apr 2022 20:34:31 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a17090a0e4100b001ce188720e5sm230705pja.53.2022.04.13.20.34.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 20:34:30 -0700 (PDT)
Message-ID: <da439f38-00dc-e75e-63ee-3d9db15ba30b@redhat.com>
Date: Thu, 14 Apr 2022 11:34:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v5 02/23] vdpa: Fix bad index calculus at
 vhost_vdpa_get_vring_base
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220408133415.1371760-1-eperezma@redhat.com>
 <20220408133415.1371760-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220408133415.1371760-3-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Peter Xu <peterx@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/8 21:33, Eugenio Pérez 写道:
> Fixes: 6d0b222666 ("vdpa: Adapt vhost_vdpa_get_vring_base to SVQ")
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---


Acked-by: Jason Wang <jasowang@redhat.com>

I think we need to use a separate patch for this.


>   hw/virtio/vhost-vdpa.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 9e5fe15d03..1f229ff4cb 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1172,11 +1172,11 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
>                                          struct vhost_vring_state *ring)
>   {
>       struct vhost_vdpa *v = dev->opaque;
> +    int vdpa_idx = ring->index - dev->vq_index;
>       int ret;
>   
>       if (v->shadow_vqs_enabled) {
> -        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs,
> -                                                      ring->index);
> +        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
>   
>           /*
>            * Setting base as last used idx, so destination will see as available


