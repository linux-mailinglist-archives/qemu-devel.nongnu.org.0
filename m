Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D163F8B5F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 17:57:14 +0200 (CEST)
Received: from localhost ([::1]:58368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJHke-0000v6-Us
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 11:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mJHjr-0000Ea-OU
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:56:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mJHjo-00044r-Nu
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:56:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629993378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0cHfkLqb7qMxSBupGyhUMNOXrTmYIPneaHTEWzNZQGg=;
 b=ZupeqJUMnG9EgqYhVjXbmtspKmWkcv/RVyUr75tWIZQhLEDr4AZ2K2rd+QYvoeaIHTLv66
 Epn0thseaOtUtZSz7ZcHFyBNcNtYCL/M66Udd8ZmUFyFfqkr2PSsI7Qcd+Mp7rIrgK8vs7
 X7FZpNTbVJv/pa27PDoVeI77QEz2ynU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-XW3W0CkaMJuRPlIt-t7SRQ-1; Thu, 26 Aug 2021 11:56:17 -0400
X-MC-Unique: XW3W0CkaMJuRPlIt-t7SRQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 o3-20020a05600c510300b002e6dd64e896so1831974wms.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 08:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0cHfkLqb7qMxSBupGyhUMNOXrTmYIPneaHTEWzNZQGg=;
 b=bQxoAskSOTVb9hpnoLuHgi7dJygSE4bvvZQ0STyHi3yLhTXcLh+piy6vF/CjkMa1vK
 uewC5L7yBLXgBhUb1EbxLfSCyKjjOsktGrwNPcHBRHtsoPXSoNVzwxx1iJHMF+L98VSD
 6NTl7PzLKNPPrs9AluVLV4ZBvyzlGWSm68H7zMy8BUgnfx7RJeABlVv3DXjhk0hbq4am
 ehj0GHGFURYayGjh0tFqhDDkQhNx2BjwIQC/a28xfjxbsLY59Gv7fdM+4XkvKdNHnuG5
 x0wiv9XQR24d6xihxstMZKiumtKwdAD3PMZjZZH/tHKQKHGdon+KSGJ19yVQ22OCW7jO
 OLiA==
X-Gm-Message-State: AOAM531qEcLRGPOWVW9106AOwZiC3EGNssVPLDbgwo/+wkQGXxw1jdXI
 0LGfs3PWV1HBKiJARq7cFsXTt5Wjg1oms/Yc/v6nn64Qj0VvCJMmC8r86gUqjC87oIjNxLX8m0k
 9hTa+tIqtnVUBXCI=
X-Received: by 2002:a5d:58e9:: with SMTP id f9mr5002687wrd.154.1629993372554; 
 Thu, 26 Aug 2021 08:56:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw58cB8fCT5p4T9UedzXf+VVZBmEOV9E/vBlZxvoS8ZtOB2qA+RhHtuETF15/1g3ecoRGABxQ==
X-Received: by 2002:a5d:58e9:: with SMTP id f9mr5002656wrd.154.1629993372242; 
 Thu, 26 Aug 2021 08:56:12 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.3.22])
 by smtp.gmail.com with ESMTPSA id 129sm3009026wmz.26.2021.08.26.08.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 08:56:11 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] virtio: failover: define the default device to use
 in case of error
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210809171342.18146-1-lvivier@redhat.com>
 <20210809171342.18146-2-lvivier@redhat.com>
 <20210823192119-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <a7a5b135-418d-0367-9f6d-638c42a523ab@redhat.com>
Date: Thu, 26 Aug 2021 17:56:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823192119-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/08/2021 01:25, Michael S. Tsirkin wrote:
> On Mon, Aug 09, 2021 at 07:13:42PM +0200, Laurent Vivier wrote:
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
> 
> Three things I dislike here. First this is limited to 1.0.
> OTOH this is all about legacy guests without STANDBY,
> would be nicer to support legacy.

So for that we could use my first approach to disable the driver by triggering an error in
the driver probe function. It was done in v1 by setting vring.num to 0.

> Second: the reason we don't want both
> virtio and VFIO is because their mac addresses match.
> This tends to confuse guest tools.
> I don't see this solved here.

If the driver is not loaded I don't think any guest tool can read the MAC address of the
virtio-net device.

In fact what we want is to use VFIO device when failover is not available. I think keeping
both can confuse the guest tools.

> 
> Proposal: management supplies an extra dummy mac.
> This mac is used with virtio and its link it down.
> Link state reporting is also optional but
> it has been there for many years.
> If link state reporting is disabled then maybe do not
> expose VFIO after all.

The problem by keeping both interfaces (vfio and virtio-net) outside the failover
configuration is the networking configuration (ifcfg) will be applied to the virtio-net
device as it's PCI address is used to identify the failover_net interface. So the guest
kernel will continue to configure and use the virtio-net device even if the vfio device is
not hidden. Of course, we also need to define an ifcfg for the vfio device if failover is
disabled.

> Third thing is option name. Does not hint at the fact that
> for legacy guests we do not get failover at all.
> Let's try to be more explicit please.

ok, but I think this is a minor problem we can discuss once the two previous ones are solved.

I can also try to implement a POC with your proposition: a different MAC address and the
link down state.

Thanks,
Laurent

> 
> 
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
>> +            !n->failover_default)) {
>> +            qapi_event_send_failover_negotiated(n->netclient_name);
>> +            qatomic_set(&n->failover_primary_hidden, false);
>> +            failover_add_primary(n, &err);
>> +            if (err) {
>> +                warn_report_err(err);
>> +            }
>>          }
>>      }
>>  }
>> @@ -3625,9 +3636,34 @@ static Property virtio_net_properties[] = {
>>      DEFINE_PROP_INT32("speed", VirtIONet, net_conf.speed, SPEED_UNKNOWN),
>>      DEFINE_PROP_STRING("duplex", VirtIONet, net_conf.duplex_str),
>>      DEFINE_PROP_BOOL("failover", VirtIONet, failover, false),
>> +    DEFINE_PROP_BOOL("failover-default", VirtIONet, failover_default, true),
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>  
>> +/* validate_features() is only available with VIRTIO_F_VERSION_1 */
>> +static int failover_validate_features(VirtIODevice *vdev)
>> +{
>> +    VirtIONet *n = VIRTIO_NET(vdev);
>> +
>> +    /*
>> +     * If the guest driver doesn't support the STANDBY feature, by default
>> +     * we keep the virtio-net device and don't hotplug the VFIO device,
>> +     * but in some cases, user can prefer to use the VFIO device rather
>> +     * than the virtio-net one. We can't unplug the virtio-net device
>> +     * (because on migration it is expected on the destination side)
>> +     * but we can force the guest driver to be disabled. In this case, We can
>> +     * hotplug the VFIO device that will be unplugged before the migration
>> +     * like in the normal failover migration but without the failover device.
>> +     */
>> +    if (n->failover && !n->failover_default &&
>> +        !virtio_vdev_has_feature(vdev, VIRTIO_NET_F_STANDBY)) {
>> +        /* disable virtio-net */
>> +        return -ENODEV;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>  static void virtio_net_class_init(ObjectClass *klass, void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(klass);
>> @@ -3651,6 +3687,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
>>      vdc->post_load = virtio_net_post_load_virtio;
>>      vdc->vmsd = &vmstate_virtio_net_device;
>>      vdc->primary_unplug_pending = primary_unplug_pending;
>> +    vdc->validate_features = failover_validate_features;
>>  }
>>  
>>  static const TypeInfo virtio_net_info = {
>> -- 
>> 2.31.1
> 


