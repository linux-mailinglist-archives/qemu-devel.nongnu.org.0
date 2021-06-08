Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2CB39EC2A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 04:35:23 +0200 (CEST)
Received: from localhost ([::1]:47988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqRaJ-0004xg-HR
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 22:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lqRZY-0004HZ-V5
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 22:34:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lqRZV-0005oe-Or
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 22:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623119668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MwtJaweUmneJvWUsxUuYodH/V2t8Vlr4ljuDQ/DMNpg=;
 b=RePHGEXGAuY7kaJHTy2JoXpOhR03Z8SyqffN4TvyNRvLIxmU3d+wHXkufnxFQTIp3yMeBp
 n0TK8r7VMSf7pKq1y+BF/fv+ma59awN1iYMVux+mRiIZ+Tmtv3T3eVh2K5ya7bGamou9Xv
 jEqZnk7vcBWw+fHUCxfHp/wW+u+hMCw=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-Ubbl_1QuN36x5hconzUwpQ-1; Mon, 07 Jun 2021 22:34:27 -0400
X-MC-Unique: Ubbl_1QuN36x5hconzUwpQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 u7-20020a6345470000b02902211e79e4c1so3889043pgk.18
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 19:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=MwtJaweUmneJvWUsxUuYodH/V2t8Vlr4ljuDQ/DMNpg=;
 b=g7cpsgOo+Hv1GlBm7iUn/N8J8fVfZglYiAcQ2J9XSlWROPaDAjeDvXcxZnQEhyfmFS
 iddMPYR6ijzR732l20EP9mAvBL2L+N/fJhg/8jZsjEdRSP26MfmHOsS6xx+wsSMn/jjV
 T/Bqf5DXT2PQp6MZrkf1wXGXFGIkaTp+UQ3DX858Q2eUKM8dtxMRHLGToR27hygZn25r
 cioNxWiQmvfIibi0s0Jg1KplvcUsBH4vZR6C9+HVbA08RPYBwRzDEK8j5alTNRte9i71
 Snur1nDMXQImNBGNvtUXNdI5reoYs97eAdKLQeKHC0CMYor26qjFvWxWRFSnsoWAPg10
 fMoQ==
X-Gm-Message-State: AOAM5326Ru4ZgCcALizSm0HYEbFNfxRYKrZ5wmSJ+KTHD9FAfKT43ffS
 UMRIxVSJckFJKyTrd9BZavjUizpHCh25TIfl6h3L89EHH5NRwd/eVN6twwug6eZWN4WB8zyx5+x
 MuEDhLgZ1YH9bF7I=
X-Received: by 2002:a63:b043:: with SMTP id z3mr7098884pgo.89.1623119665560;
 Mon, 07 Jun 2021 19:34:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0TNvUnUG76i0R/3//nMyA6jTLonK6cov9Bjrr5swEKKQew8CvOqemtAFerLZE5gS/acVZMA==
X-Received: by 2002:a63:b043:: with SMTP id z3mr7098859pgo.89.1623119665233;
 Mon, 07 Jun 2021 19:34:25 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id v7sm5365288pfi.187.2021.06.07.19.34.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 19:34:24 -0700 (PDT)
Subject: Re: [PATCH 1/2] vhost-vdpa: don't initialize backend_features
To: Gautam Dawar <gdawar@xilinx.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210602033127.40149-1-jasowang@redhat.com>
 <BY5PR02MB69805AC4C88DFE9E5172D8BDB13D9@BY5PR02MB6980.namprd02.prod.outlook.com>
 <af3abe28-69e3-326a-4867-4afc42856f43@redhat.com>
 <BY5PR02MB6980EE8C39C9369F5BD3CD0AB13B9@BY5PR02MB6980.namprd02.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c1c417b9-097a-016a-f07d-0be1c3aae796@redhat.com>
Date: Tue, 8 Jun 2021 10:34:21 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <BY5PR02MB6980EE8C39C9369F5BD3CD0AB13B9@BY5PR02MB6980.namprd02.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 "lulu@redhat.com" <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/6/4 下午5:10, Gautam Dawar 写道:
> Hi Jason,
>
> -----Original Message-----
> From: Jason Wang <jasowang@redhat.com>
> Sent: Wednesday, June 2, 2021 2:18 PM
> To: Gautam Dawar <gdawar@xilinx.com>; mst@redhat.com; qemu-devel@nongnu.org
> Cc: lulu@redhat.com; qemu-stable@nongnu.org
> Subject: Re: [PATCH 1/2] vhost-vdpa: don't initialize backend_features
>
> Hi Gautam:
>
> 在 2021/6/2 下午3:38, Gautam Dawar 写道:
>> Hi Jason,
>>
>> Pls see my comments inline marked by GD>>
>>
>> Regards,
>> Gautam
>>
>> -----Original Message-----
>> From: Jason Wang <jasowang@redhat.com>
>> Sent: Wednesday, June 2, 2021 9:01 AM
>> To: mst@redhat.com; qemu-devel@nongnu.org
>> Cc: Gautam Dawar <gdawar@xilinx.com>; lulu@redhat.com; Jason Wang
>> <jasowang@redhat.com>; qemu-stable@nongnu.org
>> Subject: [PATCH 1/2] vhost-vdpa: don't initialize backend_features
>>
>> We used to initialize backend_features during vhost_vdpa_init() regardless whether or not it was supported by vhost. This will lead the unsupported features like VIRTIO_F_IN_ORDER to be included and set to the vhost-vdpa during vhost_dev_start. Because the VIRTIO_F_IN_ORDER is not supported by vhost-vdpa so it won't be advertised to guest which will break the datapath.
>>
>> Fix this by not initializing the backend_features, so the acked_features could be built only from guest features via vhost_net_ack_features().
>>
>> Fixes: 108a64818e69b ("vhost-vdpa: introduce vhost-vdpa backend")
>> Cc: qemu-stable@nongnu.org
>> Cc: Gautam Dawar <gdawar@xilinx.com>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>    hw/virtio/vhost-vdpa.c | 3 ---
>>    1 file changed, 3 deletions(-)
>>
>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c index
>> 01d2101d09..5fe43a4eb5 100644
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -275,15 +275,12 @@ static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)  static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)  {
>>        struct vhost_vdpa *v;
>> -    uint64_t features;
>>        assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
>>        trace_vhost_vdpa_init(dev, opaque);
>>    
>>        v = opaque;
>>        v->dev = dev;
>>        dev->opaque =  opaque ;
>> -    vhost_vdpa_call(dev, VHOST_GET_FEATURES, &features);
>> -    dev->backend_features = features;
>> [GD>>] Should this be initialized with 0 here? I am not sure if  memory allocated for struct vhost_dev is initialized with 0.
>
> See vhost_net_init:
>
>       struct vhost_net *net = g_new0(struct vhost_net, 1);
>
> vhost_dev is embedded in the vhost_net structure. So I think it should be zero.
>
> [GD>>]  That's correct. The embedded vhost_dev structure is indeed getting cleared to 0 in vhost_net_init().
> Thanks


Ok, I've queued this patch.

Thanks


>
>
>>        v->listener = vhost_vdpa_memory_listener;
>>        v->msg_type = VHOST_IOTLB_MSG_V2;
>>    
>> --
>> 2.25.1
>>
> [GD>>]
> Signed-off-by: Gautam Dawar <gdawar@xilinx.com>
> Acked-by: Gautam Dawar <gdawar@xilinx.com>
>


