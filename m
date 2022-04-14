Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00885005BE
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 08:03:51 +0200 (CEST)
Received: from localhost ([::1]:51238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nesa6-00015S-Ff
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 02:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nesVy-0007nM-LP
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 01:59:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nesVv-0007wI-J5
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 01:59:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649915969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hbXcenyM+SPg4wxWIkVOeoSvwu1zefiSl7PyTBVdP/M=;
 b=S+9F5spMr6DW8H5lwuQ2FIAq5hJagkHv1hAxyTX9AVGcLhYURPMyOWbar13GKBL0OQw5TS
 HiErxRDO+qddViRes1vKPV3iD+eLelKNpLagT0Rb51dGwoAhy/iZIgz0Tc8GzWgd/U5CEc
 TtbQf6wdegTErmcHOJPQbW5w2Yg2TvY=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-7XA2P34EO6S-wux9dx3kzA-1; Thu, 14 Apr 2022 01:59:28 -0400
X-MC-Unique: 7XA2P34EO6S-wux9dx3kzA-1
Received: by mail-pf1-f198.google.com with SMTP id
 w187-20020a6282c4000000b00505dfdb4613so2605701pfd.0
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 22:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hbXcenyM+SPg4wxWIkVOeoSvwu1zefiSl7PyTBVdP/M=;
 b=Zkf9rLfv6bFKCPOKKR/bgQ7L0bayBa0l7SsBXnWwF3IMmbDlGB7qk8APY9rMz8d14A
 8ZACMUTpwEzZvrPWGGlO5RbfK8DTljYBpU+TQNlnFXlWJlMKWqYECO74Inw+yJJ7QK/X
 FPTcwipndPFkm9orbletzP6L4PL58w1vlPD/rYxKM40OxIsq9Ft/w8FGbhq59wQU2hPi
 Xgzc+4gTw7MJTH6wWKH4X+2dAPr1kVHcJA5w3sxYR6bvg2fxxh5BxaoxawOeKV6G1L5b
 EJQIY5M0L3i/uqzsPGlCcDIjKxnp4Ujt9Sf1/9+zkyrlc+y4Kx67+EM8S2W4zgKNwA2v
 YO5g==
X-Gm-Message-State: AOAM530KyFbGVnilF7crrFzjXrWtpXUWa+1ljV9VqE4OuI7g5NDsiile
 yGeLLSUwcmWdQto3eQ3lOUhnEfzf+XoCQr/HHxJ8LQCvLCZ7D0QsCbkqpIuGIE8CZwTDhfaRle/
 uAbF7mZzcy1wdXU8=
X-Received: by 2002:a17:902:aa07:b0:158:6d3e:7c54 with SMTP id
 be7-20020a170902aa0700b001586d3e7c54mr11482154plb.91.1649915967423; 
 Wed, 13 Apr 2022 22:59:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSg8XJLRU/DqN6Qev8Ev4u3l60V0WXCiR79ZYjupTwU+wT4dEr2SgwgWhwwgdbosg+geIeoQ==
X-Received: by 2002:a17:902:aa07:b0:158:6d3e:7c54 with SMTP id
 be7-20020a170902aa0700b001586d3e7c54mr11482134plb.91.1649915967153; 
 Wed, 13 Apr 2022 22:59:27 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 t184-20020a625fc1000000b004fa3bd9bef0sm894085pfb.110.2022.04.13.22.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 22:59:26 -0700 (PDT)
Message-ID: <fd309928-b59a-7a86-27a5-f330f13b995f@redhat.com>
Date: Thu, 14 Apr 2022 13:59:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v7 10/25] vdpa: Fix index calculus at
 vhost_vdpa_svqs_start
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-11-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220413163206.1958254-11-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/14 00:31, Eugenio Pérez 写道:
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---


Acked-by: Jason Wang <jasowang@redhat.com>

(Need some changelog anyhow).

Thanks


>   hw/virtio/vhost-vdpa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 27ee678dc9..6b370c918c 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1019,7 +1019,7 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev *dev)
>           VirtQueue *vq = virtio_get_queue(dev->vdev, dev->vq_index + i);
>           VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
>           struct vhost_vring_addr addr = {
> -            .index = i,
> +            .index = dev->vq_index + i,
>           };
>           int r;
>           bool ok = vhost_vdpa_svq_setup(dev, svq, i, &err);


