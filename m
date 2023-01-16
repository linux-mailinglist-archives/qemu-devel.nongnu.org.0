Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723CE66B5D2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 04:03:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHFlD-0002Km-JI; Sun, 15 Jan 2023 22:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHFl4-0002Is-2K
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 22:02:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHFl2-00028h-48
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 22:02:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673838118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CL8zM2YSAbh8AZ7sNipJ2W6fGgzFgS2z/kN0WjOSOqA=;
 b=RMk2UgAU/0VnZHdzuFs5nTmaFvmbU0vyNADbQEukDymEbIyo66CuAugCSJLiQUvTYpWmI5
 +zNTy1S1TLy/S8r1AUkp8NpxZNRxliFbrfccNj1fmyVxhpnF6VBcqTCtLYkdf1bsdzfGLQ
 uartOV4+pru552rrwVwpwnDRAKl3qFw=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-19-zQCZ3oiBOjqW9rErhFd-hw-1; Sun, 15 Jan 2023 22:01:57 -0500
X-MC-Unique: zQCZ3oiBOjqW9rErhFd-hw-1
Received: by mail-pg1-f200.google.com with SMTP id
 g31-20020a63111f000000b004bbc748ca63so5031780pgl.3
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 19:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CL8zM2YSAbh8AZ7sNipJ2W6fGgzFgS2z/kN0WjOSOqA=;
 b=EtLgI4cP8aDVRKMWj/BE6HSQZsqai9vMZpcTTUdTsqNAbahaaWPcMa9e+cpkmmGDyz
 Z0JBKpAZGOvYxXSvzobXdY9W9VEkvNBEGc+K58e1QJhI82WcYqCxe8fb9vyZzTM2XlJ3
 iyejZyCQ6CRZgAjpTLRu0EKGUHBKUz2220tytseMN7PsMRGnknRyUTJjgTnIE/YlMxuv
 OZMF3EVJM7OkJB0YPaJqIU+Akhe6dcOPQd6ONcqijlsinHsB5cZr5IS7Fj421bS0Ijil
 hjmIFSGKonF+hmnycE2ZnpckOIodyRn50mJtpkS91LnLhEjChyqadFkRlUE1DQlL4LiI
 JZuw==
X-Gm-Message-State: AFqh2kqkyF8IRCJpLQ6gWxeGzIXE4PJXZBH5woBvZ0H3/jqxEqfHyLkj
 FfjsND2hOy51ZPgovK2POQGUqekUaS2KayrFx5PNEoQyaPfk8mERezET0zytKBWpJ5akdG3zPhC
 jlC5LvNgwXKT/bKg=
X-Received: by 2002:a05:6a20:94c7:b0:b8:84e2:6290 with SMTP id
 ht7-20020a056a2094c700b000b884e26290mr2269725pzb.37.1673838116220; 
 Sun, 15 Jan 2023 19:01:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuf2o0mRCo5uoFWgDV04Y0wxVYYVPNknOZUAjubVIP1zwXNv77+xTI7TUOzNJhTselhmsK4YA==
X-Received: by 2002:a05:6a20:94c7:b0:b8:84e2:6290 with SMTP id
 ht7-20020a056a2094c700b000b884e26290mr2269691pzb.37.1673838115960; 
 Sun, 15 Jan 2023 19:01:55 -0800 (PST)
Received: from [10.72.13.117] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a170903234a00b00188f6cbd950sm18036194plh.226.2023.01.15.19.01.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jan 2023 19:01:55 -0800 (PST)
Message-ID: <cebaaa04-7b40-ddaf-c9c0-71bf8d26ef27@redhat.com>
Date: Mon, 16 Jan 2023 11:01:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v2 01/13] vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-2-eperezma@redhat.com>
 <CACGkMEs2UaDFSn=_bvZ+6xXJCUAd71wVhBbp9r5mJLN=e_mG2A@mail.gmail.com>
 <CAJaqyWd3Lpq1+metjajg7C3v0FbdhAnH1AM=BxZs5eFwhn3sWg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWd3Lpq1+metjajg7C3v0FbdhAnH1AM=BxZs5eFwhn3sWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2023/1/13 14:42, Eugenio Perez Martin 写道:
> On Fri, Jan 13, 2023 at 4:12 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Fri, Jan 13, 2023 at 1:24 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>> VHOST_BACKEND_F_IOTLB_ASID is the feature bit, not the bitmask. Since
>>> the device under test also provided VHOST_BACKEND_F_IOTLB_MSG_V2 and
>>> VHOST_BACKEND_F_IOTLB_BATCH, this went unnoticed.
>>>
>>> Fixes: c1a1008685 ("vdpa: always start CVQ in SVQ mode if possible")
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>> Acked-by: Jason Wang <jasowang@redhat.com>
>>
>> Do we need this for -stable?
>>
> The commit c1a1008685 was introduced in this development window so
> there is no stable version of qemu with that patch. But I'm ok to CC
> stable just in case for sure.


Right, just have a check and it doesn't there for 7.2 so there should be 
no need for that.

Thanks


>
> Thanks!
>
>> Thanks
>>
>>> ---
>>>   net/vhost-vdpa.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>> index 1a13a34d35..de5ed8ff22 100644
>>> --- a/net/vhost-vdpa.c
>>> +++ b/net/vhost-vdpa.c
>>> @@ -384,7 +384,7 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>>>               g_strerror(errno), errno);
>>>           return -1;
>>>       }
>>> -    if (!(backend_features & VHOST_BACKEND_F_IOTLB_ASID) ||
>>> +    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) ||
>>>           !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
>>>           return 0;
>>>       }
>>> --
>>> 2.31.1
>>>


