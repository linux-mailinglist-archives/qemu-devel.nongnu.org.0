Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762253E8A3A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:31:22 +0200 (CEST)
Received: from localhost ([::1]:36432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDhlp-0001Z5-Ib
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mDhjm-0000Gj-Gg
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:29:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mDhjk-0004Ex-SS
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628663351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i5RdSjZ3rPzGK7cxtmS+usW1wl/5nMvyipt1WaUanJM=;
 b=NDVr4M3oRWg+pnAFw3HTYUswKxvAMEakBMJQO3o1cXcGStBQ/agSsB9OHd3Ct07GpWv+k+
 GGoTMgKtQGr5MKtf9/Be9B88C5fC86yCsEoME1xh58OGIMEPwCvBgW9StRpHkyG1GeAEm8
 S7zT1OOv3BgxQwO9/Esw/u7EN5zdo0A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-K5jFkAR2Mrm4A7IKdunLNw-1; Wed, 11 Aug 2021 02:29:10 -0400
X-MC-Unique: K5jFkAR2Mrm4A7IKdunLNw-1
Received: by mail-wr1-f72.google.com with SMTP id
 n6-20020a5d67c60000b0290153b1422916so371792wrw.2
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 23:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i5RdSjZ3rPzGK7cxtmS+usW1wl/5nMvyipt1WaUanJM=;
 b=likuibIAQ1yJPt7LXgm2l5YHV9GxB1meijUXQ5ahQ6iFt5e0FIfzyIVmsVhLzV2eTf
 GxlfdU+XjUU6Y0pLiXGp0XwaXk0MBdEGw7iwHK3C3CfCfyPXpyQUUrs/fbTOOYs2fVtc
 MseyUi9VKbzYfDKAkTZws82AKxBP8vr8HLNBHz1+zlfSdGziAiNyXUnkO+ofOjG7u7zn
 6eH45VooLjAaxTsWERigbbflK2GrWhayA+crrstzWqJWSewx7ObeGNn1mi+k2YG87pWZ
 nNfTURKkajaOlaq3Tkwbr/6yKNAlqkDZvRB+UT/iO0S5yRVAhajX7Oqo/rr4iszBfjAC
 Ed/w==
X-Gm-Message-State: AOAM533Zg0tKOA7ieKVTizj7JCR9B6Hi80eFNk4rszVcyzVFVclRK7ir
 l3anjfAF0sMPTNFdkcYr1uigFWD43jRUvfZI0unEuqN71QuyhXFdtnePX0/IRnDiEU+Q8JUcj2/
 Y+4z4sIXDSwCW3cE=
X-Received: by 2002:a05:600c:a05:: with SMTP id
 z5mr26438498wmp.73.1628663349405; 
 Tue, 10 Aug 2021 23:29:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0300QCqNurUbkXWdDAOj5b9hjBNwCzoVW13Q1MHrNJJ67oBu9sl+x8dTy/kC9pLmkd2WqZw==
X-Received: by 2002:a05:600c:a05:: with SMTP id
 z5mr26438467wmp.73.1628663349081; 
 Tue, 10 Aug 2021 23:29:09 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.5.86])
 by smtp.gmail.com with ESMTPSA id d8sm26080186wrv.20.2021.08.10.23.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 23:29:08 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] virtio: failover: define the default device to use
 in case of error
To: Jason Wang <jasowang@redhat.com>
References: <20210809171342.18146-1-lvivier@redhat.com>
 <20210809171342.18146-2-lvivier@redhat.com>
 <CACGkMEtmCDjUQUf_FXUFzNNtKeNojsj-+6zdHdLo=5rzi2zWsA@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <486b140d-73f6-802a-136f-bc38789551ca@redhat.com>
Date: Wed, 11 Aug 2021 08:29:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACGkMEtmCDjUQUf_FXUFzNNtKeNojsj-+6zdHdLo=5rzi2zWsA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/08/2021 06:18, Jason Wang wrote:
> On Tue, Aug 10, 2021 at 1:14 AM Laurent Vivier <lvivier@redhat.com> wrote:
>>
>> If the guest driver doesn't support the STANDBY feature, by default
>> we keep the virtio-net device and don't hotplug the VFIO device,
>> but in some cases, user can prefer to use the VFIO device rather
>> than the virtio-net one. We can't unplug the virtio-net device
>> (because on migration it is expected on the destination side)
>> but we can force the guest driver to be disabled. Then, we can
>> hotplug the VFIO device that will be unplugged before the migration
>> like in the normal failover migration but without the failover device.
>>
>> This patch adds a new property to virtio-net device: "failover-default".
>>
>> By default, "failover-default" is set to true and thus the default NIC
>> to use if the failover cannot be enabled is the virtio-net device
>> (this is what is done until now with the virtio-net failover).
>>
>> If "failover-default" is set to false, in case of error, the virtio-net
>> device is not the default anymore and the failover primary device
>> is used instead.
>>
>> If the STANDBY feature is supported by guest and host, the virtio-net
>> failover acts as usual.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>  include/hw/virtio/virtio-net.h |  1 +
>>  hw/net/virtio-net.c            | 49 +++++++++++++++++++++++++++++-----
>>  2 files changed, 44 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
>> index 824a69c23f06..ab77930a327e 100644
>> --- a/include/hw/virtio/virtio-net.h
>> +++ b/include/hw/virtio/virtio-net.h
>> @@ -208,6 +208,7 @@ struct VirtIONet {
>>      /* primary failover device is hidden*/
>>      bool failover_primary_hidden;
>>      bool failover;
>> +    bool failover_default;
>>      DeviceListener primary_listener;
>>      Notifier migration_state;
>>      VirtioNetRssData rss_data;
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index 16d20cdee52a..972c03232a96 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -935,12 +935,23 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>>          memset(n->vlans, 0xff, MAX_VLAN >> 3);
>>      }
>>
>> -    if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
>> -        qapi_event_send_failover_negotiated(n->netclient_name);
>> -        qatomic_set(&n->failover_primary_hidden, false);
>> -        failover_add_primary(n, &err);
>> -        if (err) {
>> -            warn_report_err(err);
>> +    /*
>> +     * if the virtio-net driver has the STANDBY feature, we can plug the primary
>> +     * if not but is not the default failover device,
>> +     * we need to plug the primary alone and the virtio-net driver will
>> +     * be disabled in the validate_features() function but validate_features()
>> +     * is only available with virtio 1.0 spec
>> +     */
>> +    if (n->failover) {
>> +        if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY) ||
>> +           (virtio_has_feature(features, VIRTIO_F_VERSION_1) &&
> 
> I think STANDY implies VERSION_1.
> 
> And if we do this, it means it doesn't work for legacy drivers.
> 
> Not sure if it's an issue.

Yes, you're right. In case of a kernel driver that doesn't support STANDBY and that is not
version 1, the virtio-net device is disabled (and the VFIO device is not plugged).

Thanks,
Laurent


