Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DF83BC7AB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 10:12:33 +0200 (CEST)
Received: from localhost ([::1]:50492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0gC0-0000pz-0R
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 04:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0gB1-00008d-VG
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:11:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0gAx-00075S-TT
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625559085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yPdt4S3kqO3imrwuXDsgtlK7gIU+WHQHdf5vPrYFaR4=;
 b=aNTenW8+9FPBfRlwv7f+/JbIHkg16FfDxjDRmsFtbAvuePy7rfIgZbxo8NcxbHpB3/UzJH
 4SDTRNXw51n1BTctxQ6PfbN2RIQON63mVtE3mXekeiO+/z4Z/CGD/KDFbvH21/Sv231+u1
 7pBDKngkdWd6owBnQIrgU4czZWnz1wY=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-W4Q6aVSsPsibRuMAyaszmA-1; Tue, 06 Jul 2021 04:11:24 -0400
X-MC-Unique: W4Q6aVSsPsibRuMAyaszmA-1
Received: by mail-pj1-f72.google.com with SMTP id
 x1-20020a17090ab001b02901726198443cso1114667pjq.8
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 01:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=yPdt4S3kqO3imrwuXDsgtlK7gIU+WHQHdf5vPrYFaR4=;
 b=kpMiLdd9YhYoGOASXk01fyYooSrmG8Nu9okc8WTyIiR0olvvMJQ07xcuXCdf5UD5ka
 YVMKVlvsaDa05bCfw4cDId1lQ2lUgauuRJLNsA7sW/tMzXHOgaKyFYQ1oA+HrtTtxqa2
 hrs5kzKNySBtbhCAhKaGRIf8OcFd+b1oXQA1TeMpdkakIEve3Zeda8y4jPK7kCIzpUID
 svmoQm1Uigm7Sq0RY4AhxTxqybBKL8UKEC+lLOncJryX38VESzvJdYTdZay5cvRjlQNi
 cmXbdljtnN301PKFso/4MPw3uNXoo9/dXptvX/It1e17q/PvclM7Rzz80APZDk0tDuEz
 0q5w==
X-Gm-Message-State: AOAM531sH0FeyKuziNKIJc0uN0mLBCPbFf5M5k9lnsv7C/hgXOzhA73m
 +wst85XxHclbW4UlV/g7wIX8sFvziL7vi4cmONYnf7z1TsQsMsWwHUjBY0cqi1uSEfjSv2UFYnc
 98nHi5tDISuVj1VU=
X-Received: by 2002:a17:90a:ee8e:: with SMTP id
 i14mr3161651pjz.29.1625559030860; 
 Tue, 06 Jul 2021 01:10:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrGc7QPW+BQvkue49FPYzQgiukVrElV9tgtPcQh7Q++Q8+AcHM8rLaNoLpdFhvjzZOLDYT9w==
X-Received: by 2002:a17:90a:ee8e:: with SMTP id
 i14mr3161623pjz.29.1625559030552; 
 Tue, 06 Jul 2021 01:10:30 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id n47sm7577032pfv.55.2021.07.06.01.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 01:10:30 -0700 (PDT)
Subject: Re: [PATCH 07/18] vhost-vdpa: tweak the error label in
 vhost_vdpa_add()
From: Jason Wang <jasowang@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-8-jasowang@redhat.com>
 <20210623150312.7g43l5qjwacxhw43@steredhat>
 <208edb63-a0d1-6d6b-e451-b17cb24708ed@redhat.com>
Message-ID: <12f1b265-3dd0-9c9e-cfbe-e004e08ec7f1@redhat.com>
Date: Tue, 6 Jul 2021 16:10:22 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <208edb63-a0d1-6d6b-e451-b17cb24708ed@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: lulu@redhat.com, mst@redhat.com, qemu-devel@nongnu.org, eperezma@redhat.com,
 elic@nvidia.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/6 下午4:03, Jason Wang 写道:
>
> 在 2021/6/23 下午11:03, Stefano Garzarella 写道:
>> On Mon, Jun 21, 2021 at 12:16:39PM +0800, Jason Wang wrote:
>>> Introduce new error label to avoid the unnecessary checking of net
>>> pointer.
>>>
>>> Fixes: 1e0a84ea49b68 ("vhost-vdpa: introduce vhost-vdpa net client")
>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>> ---
>>> net/vhost-vdpa.c | 13 ++++++-------
>>> 1 file changed, 6 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>> index 21f09c546f..0da7bc347a 100644
>>> --- a/net/vhost-vdpa.c
>>> +++ b/net/vhost-vdpa.c
>>> @@ -100,19 +100,18 @@ static int vhost_vdpa_add(NetClientState *ncs, 
>>> void *be)
>>>     net = vhost_net_init(&options);
>>>     if (!net) {
>>>         error_report("failed to init vhost_net for queue");
>>> -        goto err;
>>> +        goto err_init;
>>>     }
>>>     s->vhost_net = net;
>>>     ret = vhost_vdpa_net_check_device_id(net);
>>>     if (ret) {
>>> -        goto err;
>>> +        goto err_check;
>>>     }
>>>     return 0;
>>> -err:
>>> -    if (net) {
>>> -        vhost_net_cleanup(net);
>>> -        g_free(net);
>>> -    }
>>> +err_check:
>>> +    vhost_net_cleanup(net);
>>> +    g_free(net);
>>
>> Should we set s->vhost_net to NULL to avoid use after free?
>>
>> Then we should also remove the `assert(s->vhost_net)` in 
>> net_vhost_vdpa_init() since we can fail.
>
>
> Right, will do this in a separate patch.


I just forget the job has been done in the next patch :)

So we are fine here.

Thanks


>
> Thanks
>
>
>>
>>> +err_init:
>>>     return -1;
>>> }
>>>
>>> -- 
>>> 2.25.1
>>>
>>>
>>


