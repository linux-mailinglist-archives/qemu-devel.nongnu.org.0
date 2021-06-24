Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA713B2999
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 09:43:47 +0200 (CEST)
Received: from localhost ([::1]:36626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwK1a-0006hP-CF
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 03:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lwK0J-0005MK-58
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:42:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lwK0H-0001wM-IT
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624520544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKh57oMdBSsw19vse6Qz5at2aLpYFxnMQrMiN0A993M=;
 b=H7XQnxdLKntFVcFEQcgn9VV/s9J9sg8Vi042ZPqK1yriW+aY37x+h9UMirr9A8eEj5K794
 a9Ld0pA+7GZ8Z1CgVf61HWilpmHPSJu+wgU7Pzc8PZJV8t3qEU5RGSzpzJAz3A24z0oFHt
 o4wyHl0i+9RE6J6D5CaXoHKynwikyV4=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-rnpXKW1qNZq9j4xvahoOjg-1; Thu, 24 Jun 2021 03:42:23 -0400
X-MC-Unique: rnpXKW1qNZq9j4xvahoOjg-1
Received: by mail-pf1-f199.google.com with SMTP id
 b8-20020a056a000a88b02902e97a71383dso3441935pfl.13
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 00:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UKh57oMdBSsw19vse6Qz5at2aLpYFxnMQrMiN0A993M=;
 b=oM8tEuhoE7HuP5guQLHl1M9+Prlo+20MCHjwKy9u8VC1m20/6GO0vipg9EsPRcO+Gn
 HuF+v4YUDQGLCQgONgoJ9mVDMg/+Ea8ugmYiLrbfhr5dQodWKT0MAD0IcUu9ypFj3+Wk
 EX/iW0H5u10mbS3GEqypT8xU4PInpm6G+GoRVv0ayIQSGhf72PL6cfiSpG+3EtopH3yF
 qSParhGnzT8E6EdVHEaEUyRVTHzdZs3Z+oLAhe84tlbRdZ0hisj/PCglXcu95l2+vIPk
 ggXhz2cmtDUZewrqhyMUKjKIZWYBuy7iSDrIU9uiYsJQCVTZoZuYe0tM3U9QOnBrqhls
 pugA==
X-Gm-Message-State: AOAM531ywIAVcFB3pC3TLVEA8XKOzulP8bkVyv043r/VtVA9gU7tmJzK
 3TYWBV5PCx3/EeZi+C9GSoOA73guloKLvtLEZvWz2KebA+4lVEJgNdQZceojOSynnFjSXKqpKU1
 omZJfxvicOJeAtNw=
X-Received: by 2002:a17:90a:6394:: with SMTP id
 f20mr13743834pjj.80.1624520542677; 
 Thu, 24 Jun 2021 00:42:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMBb+8u0GAsS+m1R4+Kz3oMX89SweznJP+W4kvrpNGMNWtEVvB2FQ8A6QMDv6s23LY9T/URA==
X-Received: by 2002:a17:90a:6394:: with SMTP id
 f20mr13743810pjj.80.1624520542441; 
 Thu, 24 Jun 2021 00:42:22 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id a197sm1991283pfa.220.2021.06.24.00.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 00:42:22 -0700 (PDT)
Subject: Re: [PATCH 03/18] vhost_net: do not assume nvqs is always 2
To: Eli Cohen <elic@nvidia.com>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-4-jasowang@redhat.com>
 <20210624062214.GA38401@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5d10a21a-49b7-6cca-c6b2-69b7a907c305@redhat.com>
Date: Thu, 24 Jun 2021 15:42:17 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624062214.GA38401@mtl-vdi-166.wap.labs.mlnx>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eperezma@redhat.com, lingshan.zhu@intel.com, qemu-devel@nongnu.org,
 lulu@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/6/24 ÏÂÎç2:22, Eli Cohen Ð´µÀ:
> On Mon, Jun 21, 2021 at 12:16:35PM +0800, Jason Wang wrote:
>> This patch switches to initialize dev.nvqs from the VhostNetOptions
>> instead of assuming it was 2. This is useful for implementing control
>> virtqueue support which will be a single vhost_net structure with a
>> single cvq.
> Maybe worth mentioning in the changelog that nvqs is still set to 2 for
> all users and this patch does not change functionality.
>
> Reviewed-by: Eli Cohen <elic@nvidia.com>


Ok, will do that in V2.

Thanks


>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>   hw/net/vhost_net.c      | 2 +-
>>   include/net/vhost_net.h | 1 +
>>   net/tap.c               | 1 +
>>   net/vhost-user.c        | 1 +
>>   net/vhost-vdpa.c        | 1 +
>>   5 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> index 6bd4184f96..ef1370bd92 100644
>> --- a/hw/net/vhost_net.c
>> +++ b/hw/net/vhost_net.c
>> @@ -163,9 +163,9 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
>>           goto fail;
>>       }
>>       net->nc = options->net_backend;
>> +    net->dev.nvqs = options->nvqs;
>>   
>>       net->dev.max_queues = 1;
>> -    net->dev.nvqs = 2;
>>       net->dev.vqs = net->vqs;
>>   
>>       if (backend_kernel) {
>> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
>> index 172b0051d8..fba40cf695 100644
>> --- a/include/net/vhost_net.h
>> +++ b/include/net/vhost_net.h
>> @@ -14,6 +14,7 @@ typedef struct VhostNetOptions {
>>       VhostBackendType backend_type;
>>       NetClientState *net_backend;
>>       uint32_t busyloop_timeout;
>> +    unsigned int nvqs;
>>       void *opaque;
>>   } VhostNetOptions;
>>   
>> diff --git a/net/tap.c b/net/tap.c
>> index f5686bbf77..f716be3e3f 100644
>> --- a/net/tap.c
>> +++ b/net/tap.c
>> @@ -749,6 +749,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
>>               qemu_set_nonblock(vhostfd);
>>           }
>>           options.opaque = (void *)(uintptr_t)vhostfd;
>> +        options.nvqs = 2;
>>   
>>           s->vhost_net = vhost_net_init(&options);
>>           if (!s->vhost_net) {
>> diff --git a/net/vhost-user.c b/net/vhost-user.c
>> index ffbd94d944..b93918c5a4 100644
>> --- a/net/vhost-user.c
>> +++ b/net/vhost-user.c
>> @@ -85,6 +85,7 @@ static int vhost_user_start(int queues, NetClientState *ncs[],
>>           options.net_backend = ncs[i];
>>           options.opaque      = be;
>>           options.busyloop_timeout = 0;
>> +        options.nvqs = 2;
>>           net = vhost_net_init(&options);
>>           if (!net) {
>>               error_report("failed to init vhost_net for queue %d", i);
>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>> index 19187dce8c..18b45ad777 100644
>> --- a/net/vhost-vdpa.c
>> +++ b/net/vhost-vdpa.c
>> @@ -105,6 +105,7 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
>>       options.net_backend = ncs;
>>       options.opaque      = be;
>>       options.busyloop_timeout = 0;
>> +    options.nvqs = 2;
>>   
>>       net = vhost_net_init(&options);
>>       if (!net) {
>> -- 
>> 2.25.1
>>


