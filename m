Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2AE6A013F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 03:43:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV1YN-0000Fy-79; Wed, 22 Feb 2023 21:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pV1YI-0000Fg-Op
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 21:41:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pV1YF-0002tT-N6
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 21:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677120102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ziz5MxFU0ZrUNvw6PLY1Gqtxr/ofFXWOuihWXRLcoBI=;
 b=Mp65G9O7SDMXbg0KxlYMG3Q77yGZWqdDuX1yZUBLbSXNsr+KEk+Yj1pL3iLEcJk8fQSEnX
 9O/f0rj98IlffRQDHJB6iq64NcGaO/Sypcd2sU8mKL870TivtEVzTFeq2BekaAuN7SI2mz
 ZRQLkvDl3RQqMYcHb9jXb0HTnUf8d9Y=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-504-nJ-I1E80MfeKTgH2xptEXw-1; Wed, 22 Feb 2023 21:41:40 -0500
X-MC-Unique: nJ-I1E80MfeKTgH2xptEXw-1
Received: by mail-pg1-f200.google.com with SMTP id
 g13-20020a63f40d000000b005015be7b9faso4175188pgi.15
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 18:41:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ziz5MxFU0ZrUNvw6PLY1Gqtxr/ofFXWOuihWXRLcoBI=;
 b=UOQZtBC7BbuSx/fi348kB0Vdirmt8l1zoC9kkxgWF6WV8SRzb2lcPxTmiMlNQVQOhA
 UwgpuNpoxwNIAKH0sScAGow8FjgDgZWy109QIwG6T8JnYEjdxghZ37M3avzp7xDuPW/x
 xbnN/gPim76uo+nlP1GeoIb3ViuMC3JbwkE6z0he718pELyqTXIf48koPWBjmyP3bDSh
 SQK76cWKON8xkNpxBouX5A86nCDUJy1Xf272qZhty6gErmjLHWF/2EotapNDDfjua/vj
 i47u5cbx+m23eKX6qmalaUMutMJEMlZpsCadyQWfLFly37K6tG0b8270o3hbzEndVSIH
 zjug==
X-Gm-Message-State: AO0yUKV09ma8EEKdXuFWpQ7JQ7kMryDa4Zkb5w2/LOsv5FGxmsROXISG
 htZvGnoPGnv1l8Wk/QZbObGSUGXYcjWVuQLj2f1H0w1nDAvqfvAB79ME/BMh7kZHUMZvahKap5Q
 oTfVHgGq9Sp95vys=
X-Received: by 2002:a17:903:1205:b0:19a:b151:bf68 with SMTP id
 l5-20020a170903120500b0019ab151bf68mr11723315plh.38.1677120099773; 
 Wed, 22 Feb 2023 18:41:39 -0800 (PST)
X-Google-Smtp-Source: AK7set91CxZzolnqQ10iVScbBV52Sq6CkIbngY8R4svNhYX2VR5X3w7K4p6fC8Ue2grKjZB35HdVmw==
X-Received: by 2002:a17:903:1205:b0:19a:b151:bf68 with SMTP id
 l5-20020a170903120500b0019ab151bf68mr11723289plh.38.1677120099501; 
 Wed, 22 Feb 2023 18:41:39 -0800 (PST)
Received: from [10.72.13.176] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a170902a41600b001966d94cb2esm7911505plq.288.2023.02.22.18.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 18:41:39 -0800 (PST)
Message-ID: <c0505c7c-c3d1-372f-c8df-2a4b84ec7fce@redhat.com>
Date: Thu, 23 Feb 2023 10:41:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 09/13] vdpa net: block migration if the device has CVQ
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Lei Yang <leiyang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-10-eperezma@redhat.com>
 <de141eaa-6cc4-e942-9fff-de4dcee8625f@redhat.com>
 <CAJaqyWerBtkw1KxiAThXza0htxV=PkJZGtoAxeHKKd5p_Dq55g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWerBtkw1KxiAThXza0htxV=PkJZGtoAxeHKKd5p_Dq55g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.102, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


在 2023/2/22 15:28, Eugenio Perez Martin 写道:
> On Wed, Feb 22, 2023 at 5:01 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2023/2/8 17:42, Eugenio Pérez 写道:
>>> Devices with CVQ needs to migrate state beyond vq state.  Leaving this
>>> to future series.
>>
>> I may miss something but what is missed to support CVQ/MQ?
>>
> To restore all the device state set by CVQ in the migration source
> (MAC, MQ, ...) before data vqs start. We don't have a reliable way to
> not start data vqs until the device [1].
>
> Thanks!
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02652.html


Right. It might be mention this defect in either the change log or 
somewhere in the code as a comment.

(Btw, I think we should fix those vDPA drivers).

Thanks


>
>> Thanks
>>
>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    net/vhost-vdpa.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>> index bca13f97fd..309861e56c 100644
>>> --- a/net/vhost-vdpa.c
>>> +++ b/net/vhost-vdpa.c
>>> @@ -955,11 +955,17 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>        }
>>>
>>>        if (has_cvq) {
>>> +        VhostVDPAState *s;
>>> +
>>>            nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>>>                                     vdpa_device_fd, i, 1, false,
>>>                                     opts->x_svq, iova_range);
>>>            if (!nc)
>>>                goto err;
>>> +
>>> +        s = DO_UPCAST(VhostVDPAState, nc, nc);
>>> +        error_setg(&s->vhost_vdpa.dev->migration_blocker,
>>> +                   "net vdpa cannot migrate with MQ feature");
>>>        }
>>>
>>>        return 0;


