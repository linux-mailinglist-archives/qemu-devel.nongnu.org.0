Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64996A8FF8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:50:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXwPP-0005s9-TN; Thu, 02 Mar 2023 22:48:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pXwPO-0005rr-5X
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 22:48:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pXwPM-0002dC-Dq
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 22:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677815312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TPoRGCO9F+Mb1fqiwYhnTqHxbVsWXc4MVsuC2U9dcQ8=;
 b=BAPHK7gWo5CppmIe5YEko4DzTKBx2FNBCREpSpFka95f3JIqa3sf/RD31CwGXsHFw0H4aH
 Dw32xIJb1OvwHgj0A44Hj/WhaKT1UoYUiMX1J7b9ewLn3rAfJJtvO7FBS79TH//C7Xx4pq
 Y9wsU96mWMrJcKxEm3jFFnEiis66q+g=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-WN3iC9XUNgeH8J3AtECnZA-1; Thu, 02 Mar 2023 22:48:31 -0500
X-MC-Unique: WN3iC9XUNgeH8J3AtECnZA-1
Received: by mail-pf1-f197.google.com with SMTP id
 cj27-20020a056a00299b00b005f1ef2e4e1aso661802pfb.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 19:48:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677815310;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TPoRGCO9F+Mb1fqiwYhnTqHxbVsWXc4MVsuC2U9dcQ8=;
 b=4XgYXtkG9V3Y1Ig2nGtxLOL/HpjiIj6MRxoobRKA7wNuXJZrHxxIBeOOObvxP/4xrn
 ObJhNZmwn+mnDJLAQe7mqGC5+JXth2KJIpbklUfsKjztTeTA1/UNZIL/X5xPHV+jnkkt
 Sdjxkm9m+jUoSn/cDNvqU+gRRUoXQ5GwJg/S30Tu58pXsUYsh1/pheXTekSAvY2tmqdo
 5AEPlzLG4RfKvfLNaV5d9xgRo/mHK0SYoxrhkrRHodC7RQ+EttnRQHkRNU7QJlu7TeRY
 ezjo+/DCAOe7XEYtswAc7pXEvSfpG6XxejIoDSpNE2GHCid0Wyy8+iGQt/QqTrUxKZP+
 P95w==
X-Gm-Message-State: AO0yUKXQrabbW4X7tdIXPE7++6JfdvtnOIlJt197YDCmOxrJ6aGTVnr/
 iOyFmZs24csGud0FhZ+hsqd9pFml/MVp6Ntr0yskhjgCmRgQNCL0qmhameJ2kj17SETEEss/4bs
 5uNXjnV/OjLRR1QI=
X-Received: by 2002:a62:1758:0:b0:5dd:3f84:7d7d with SMTP id
 85-20020a621758000000b005dd3f847d7dmr843024pfx.15.1677815310354; 
 Thu, 02 Mar 2023 19:48:30 -0800 (PST)
X-Google-Smtp-Source: AK7set8XQryonWDRBifVPxSrRhnUPMqUr1YcNpRc1DjbG/IUoSnjOSIx2F9wtlc+qhs2t6bkLVqhxw==
X-Received: by 2002:a62:1758:0:b0:5dd:3f84:7d7d with SMTP id
 85-20020a621758000000b005dd3f847d7dmr842989pfx.15.1677815310031; 
 Thu, 02 Mar 2023 19:48:30 -0800 (PST)
Received: from [10.72.13.180] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 m21-20020aa78a15000000b00571cdbd0771sm447069pfa.102.2023.03.02.19.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 19:48:29 -0800 (PST)
Message-ID: <69983de5-7cb7-02a1-8869-0977ff2928b2@redhat.com>
Date: Fri, 3 Mar 2023 11:48:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 12/15] vdpa: block migration if device has unsupported
 features
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>,
 Shannon Nelson <snelson@pensando.io>, Gautam Dawar <gdawar@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, alvaro.karsz@solid-run.com,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-13-eperezma@redhat.com>
 <2367dcff-e8c3-c3ca-378a-e9e67e10710a@redhat.com>
 <CACGkMEs13RdzLfU8nZwHT0YsZ_hXy47or4t9jkHCoJ1EVa3q9w@mail.gmail.com>
 <CAJaqyWcUMwchHZ66=o+aayVvsAT78iOnWo0g3jbg4A1TiAupfQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWcUMwchHZ66=o+aayVvsAT78iOnWo0g3jbg4A1TiAupfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


在 2023/3/2 03:32, Eugenio Perez Martin 写道:
> On Mon, Feb 27, 2023 at 9:20 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Mon, Feb 27, 2023 at 4:15 PM Jason Wang <jasowang@redhat.com> wrote:
>>>
>>> 在 2023/2/24 23:54, Eugenio Pérez 写道:
>>>> A vdpa net device must initialize with SVQ in order to be migratable at
>>>> this moment, and initialization code verifies some conditions.  If the
>>>> device is not initialized with the x-svq parameter, it will not expose
>>>> _F_LOG so the vhost subsystem will block VM migration from its
>>>> initialization.
>>>>
>>>> Next patches change this, so we need to verify migration conditions
>>>> differently.
>>>>
>>>> QEMU only supports a subset of net features in SVQ, and it cannot
>>>> migrate state that cannot track or restore in the destination.  Add a
>>>> migration blocker if the device offer an unsupported feature.
>>>>
>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>> ---
>>>> v3: add mirgation blocker properly so vhost_dev can handle it.
>>>> ---
>>>>    net/vhost-vdpa.c | 12 ++++++++----
>>>>    1 file changed, 8 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>>> index 4f983df000..094dc1c2d0 100644
>>>> --- a/net/vhost-vdpa.c
>>>> +++ b/net/vhost-vdpa.c
>>>> @@ -795,7 +795,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>>                                           int nvqs,
>>>>                                           bool is_datapath,
>>>>                                           bool svq,
>>>> -                                       struct vhost_vdpa_iova_range iova_range)
>>>> +                                       struct vhost_vdpa_iova_range iova_range,
>>>> +                                       uint64_t features)
>>>>    {
>>>>        NetClientState *nc = NULL;
>>>>        VhostVDPAState *s;
>>>> @@ -818,7 +819,10 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>>        s->vhost_vdpa.shadow_vqs_enabled = svq;
>>>>        s->vhost_vdpa.iova_range = iova_range;
>>>>        s->vhost_vdpa.shadow_data = svq;
>>>> -    if (!is_datapath) {
>>>> +    if (queue_pair_index == 0) {
>>>> +        vhost_vdpa_net_valid_svq_features(features,
>>>> +                                          &s->vhost_vdpa.migration_blocker);
>>>
>>> Since we do validation at initialization, is this necessary to valid
>>> once again in other places?
>> Ok, after reading patch 13, I think the question is:
>>
>> The validation seems to be independent to net, can we valid it once
>> during vhost_vdpa_init()?
>>
> vhost_vdpa_net_valid_svq_features also checks for net features. In
> particular, all the non transport features must be in
> vdpa_svq_device_features.
>
> This is how we protect that the device / guest will never negotiate
> things like VLAN filtering support, as SVQ still does not know how to
> restore at the destination.
>
> In the VLAN filtering case CVQ is needed to restore VLAN, so it is
> covered by patch 11/15. But other future features may need support for
> restoring it in the destination.


I wonder how hard to have a general validation code let net specific 
code to advertise a blacklist to avoid code duplication.

Thanks


>
> Thanks!
>
>> Thanks
>>
>>> Thanks
>>>
>>>
>>>> +    } else if (!is_datapath) {
>>>>            s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
>>>>                                                vhost_vdpa_net_cvq_cmd_page_len());
>>>>            memset(s->cvq_cmd_out_buffer, 0, vhost_vdpa_net_cvq_cmd_page_len());
>>>> @@ -956,7 +960,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>>        for (i = 0; i < queue_pairs; i++) {
>>>>            ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>>>>                                         vdpa_device_fd, i, 2, true, opts->x_svq,
>>>> -                                     iova_range);
>>>> +                                     iova_range, features);
>>>>            if (!ncs[i])
>>>>                goto err;
>>>>        }
>>>> @@ -964,7 +968,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>>        if (has_cvq) {
>>>>            nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>>>>                                     vdpa_device_fd, i, 1, false,
>>>> -                                 opts->x_svq, iova_range);
>>>> +                                 opts->x_svq, iova_range, features);
>>>>            if (!nc)
>>>>                goto err;
>>>>        }


