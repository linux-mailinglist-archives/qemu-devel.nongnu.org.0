Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F5F5005AC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 07:51:42 +0200 (CEST)
Received: from localhost ([::1]:47440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nesOK-0006HW-RM
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 01:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nesLU-0005WU-0G
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 01:48:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nesLO-0006DX-Rx
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 01:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649915317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/jKf1vQQsIv9n88stsW0LlXZCzDtItBeDwf4B6wWOA=;
 b=ipeoqhwMZqBanHYqa9dwcdF/8kVrHpDzOO0whaytaHY25YCvybF0QIgK/0Zre0kZlsRSF4
 5LGSCHtUNsTHfRJSbh6i+CdVyK6Oupyh/KFC/76eF47ZrimHsxA5mee1ZOfHEn82pDWc3x
 Mizzo79mpVJjb9khRFLzklHtQZqq55M=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-5BcU3ke7OPSPpIyT_CyBxA-1; Thu, 14 Apr 2022 01:48:36 -0400
X-MC-Unique: 5BcU3ke7OPSPpIyT_CyBxA-1
Received: by mail-pl1-f197.google.com with SMTP id
 i10-20020a170902e48a00b00153f493fa9aso2225850ple.17
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 22:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V/jKf1vQQsIv9n88stsW0LlXZCzDtItBeDwf4B6wWOA=;
 b=VM7SlrsgPfecFaFQ9JX53GsgZaK0jRQ2gDGy61UTGDtKWlqIocd+HvvMzmvM8VfOLI
 XHqKaexjGBQgpqFUw+SFrlEg7H5R5y+s+mECMHW8qNnft1x74it6k8fu+ww969z5kSnM
 hpqpT4+LS2P5GLVF4zduTOoRFGgjfEsQpiN+ofJXZ16I+kU/z3BDmtA+by90/ILanSVL
 q12kdYkkHNueWANuCjsxz8BsMpnrn4mzF3vXy/ZVqvWYKEf3dLi1BaVILdMfHOVDlqgY
 ks4Je0usT4eYdyl35VPVEj3pi2U21VSn//QX5Cqu8MWigCYMuG/fY27yDSzyHH+8IvtF
 J7Ww==
X-Gm-Message-State: AOAM533rU384C5/Vmo0kWDwWZPIGiOQCK3QKuhSGDbRbMKTvBKXuN1Q6
 o1N7Btq2Zoiolxy2miAIWdCmP/XTH3JCeeIYgv1TLIDPWnhKfrq8tebTHhOirBEQg5/P34aN2st
 HnYyd2JW/tVYe0xg=
X-Received: by 2002:a05:6a00:b8e:b0:505:8d7e:cb02 with SMTP id
 g14-20020a056a000b8e00b005058d7ecb02mr2305048pfj.68.1649915315463; 
 Wed, 13 Apr 2022 22:48:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRxepvHxt/igsQ0xk6la+bFdiZWRZx+CRRuvG7bNe5xi7nStesTLJaRTz2XAZc812TTa/gLQ==
X-Received: by 2002:a05:6a00:b8e:b0:505:8d7e:cb02 with SMTP id
 g14-20020a056a000b8e00b005058d7ecb02mr2305022pfj.68.1649915315165; 
 Wed, 13 Apr 2022 22:48:35 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 w123-20020a623081000000b005056a4d71e3sm865588pfw.77.2022.04.13.22.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 22:48:34 -0700 (PDT)
Message-ID: <1aa26d35-f1fc-9724-de6c-b71216cf189c@redhat.com>
Date: Thu, 14 Apr 2022 13:48:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v7 09/25] vhost: move descriptor translation to
 vhost_svq_vring_write_descs
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-10-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220413163206.1958254-10-eperezma@redhat.com>
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
> It's done for both in and out descriptors so it's better placed here.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.c | 26 +++++++++++++++-----------
>   1 file changed, 15 insertions(+), 11 deletions(-)


Acked-by: Jason Wang <jasowang@redhat.com>


>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index a2531d5874..f874374651 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -122,17 +122,23 @@ static bool vhost_svq_translate_addr(const VhostShadowVirtqueue *svq,
>       return true;
>   }
>   
> -static void vhost_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
> -                                    const struct iovec *iovec, size_t num,
> -                                    bool more_descs, bool write)
> +static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
> +                                        const struct iovec *iovec, size_t num,
> +                                        bool more_descs, bool write)
>   {
>       uint16_t i = svq->free_head, last = svq->free_head;
>       unsigned n;
>       uint16_t flags = write ? cpu_to_le16(VRING_DESC_F_WRITE) : 0;
>       vring_desc_t *descs = svq->vring.desc;
> +    bool ok;
>   
>       if (num == 0) {
> -        return;
> +        return true;
> +    }
> +
> +    ok = vhost_svq_translate_addr(svq, sg, iovec, num);
> +    if (unlikely(!ok)) {
> +        return false;
>       }
>   
>       for (n = 0; n < num; n++) {
> @@ -150,6 +156,7 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
>       }
>   
>       svq->free_head = le16_to_cpu(svq->desc_next[last]);
> +    return true;
>   }
>   
>   static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
> @@ -169,21 +176,18 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
>           return false;
>       }
>   
> -    ok = vhost_svq_translate_addr(svq, sgs, elem->out_sg, elem->out_num);
> +    ok = vhost_svq_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
> +                                     elem->in_num > 0, false);
>       if (unlikely(!ok)) {
>           return false;
>       }
> -    vhost_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
> -                            elem->in_num > 0, false);
>   
> -
> -    ok = vhost_svq_translate_addr(svq, sgs, elem->in_sg, elem->in_num);
> +    ok = vhost_svq_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, false,
> +                                     true);
>       if (unlikely(!ok)) {
>           return false;
>       }
>   
> -    vhost_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, false, true);
> -
>       /*
>        * Put the entry in the available array (but don't update avail->idx until
>        * they do sync).


