Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1FE40D535
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 10:59:33 +0200 (CEST)
Received: from localhost ([::1]:50042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQnEw-0005o9-7o
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 04:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mQnDS-0004NG-IW
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:57:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mQnDJ-0001XT-7e
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:57:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631782668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=alRkbF6WyMecQbHB0CZbNp5qNi/eD/X7Uwv4JQfemIo=;
 b=DqTdq7toI2wZVmuulxSEeZ7/EYKy1AULRWTFACKngY3gCtZX8Vg9s49WnOniFW2YF4+GzH
 eJUXwVmyeRpSjxT6Q78cO1znTGeMogjGwzjwNFO4NAfwdVUk2Aqb+AdYpWY6PZwSzYlsT+
 OdYVwEti5BaMUE6Z3+nkKhCbt5kGx6o=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-Oc78GfU5MoKe-RZQTxruaA-1; Thu, 16 Sep 2021 04:57:45 -0400
X-MC-Unique: Oc78GfU5MoKe-RZQTxruaA-1
Received: by mail-ed1-f70.google.com with SMTP id
 r7-20020aa7c147000000b003d1f18329dcso4680377edp.13
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 01:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=alRkbF6WyMecQbHB0CZbNp5qNi/eD/X7Uwv4JQfemIo=;
 b=LTV6SiMoF1EbT4DivJrxar4kjpjUpmfVqcnS420XcTDJ6jfVuNvMtiBS5QjUzttkTX
 z5CQHTFM2M4h55a72Xn8VpRTIc3escOSlUb3Pu6SDI8TwJ/PTCcplF//2CJ7qApi+SDk
 1Q0OUFtOo4TcpGEweGG9CI+ZWiErnCbIg8L6abZUBfd1vfA8VeCmcB6IbVQGvrD+C5t2
 D7K8ymU3rHQhn+8eAVTlNvCqzzX9e3FYjJ3LiEVG1Lh4G1kvok30HITYrZQNhgCRb+3G
 sRzlpWiLoLnS216cjMx4sE22E9vnc1an4WNJ3L2xwbHhnDPNjf8zIAJnfAsrsL1BYsLz
 d8mw==
X-Gm-Message-State: AOAM53387JinsH6Q3xnLBluxTKEago9OloIjD6lwrXDIIAEFnG4s4rVg
 XylQkNQUEFWyrdMfNBE5nyC3NuI7i51iyi5bbpjDMWLHiC4dFDvCh8kYaz9UvKrnK7A0AdPkkS9
 MSWNWkkqX+ngdzEQ=
X-Received: by 2002:a17:906:a382:: with SMTP id
 k2mr5187103ejz.454.1631782664341; 
 Thu, 16 Sep 2021 01:57:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyESoWWVJkMRlZBd/1ICCk9iLw92p9LUaSUuRg17Qw+T3kUAZC4DF0LqjLk9kUdCODOH2hRIQ==
X-Received: by 2002:a17:906:a382:: with SMTP id
 k2mr5187090ejz.454.1631782664133; 
 Thu, 16 Sep 2021 01:57:44 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id bj10sm958746ejb.17.2021.09.16.01.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 01:57:43 -0700 (PDT)
Date: Thu, 16 Sep 2021 10:57:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: [RFC v6] virtio/vsock: add two more queues for datagram types
Message-ID: <20210916085741.6xqh3pdlrnkapfkv@steredhat>
References: <CAP_N_Z8vJF7F=mhpRpcFwQarFH_uLWBmahi0jb1q6yj=j7YSXg@mail.gmail.com>
 <20210916062615.uxqzujbdceblmy7e@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210916062615.uxqzujbdceblmy7e@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 Jason Wang <jasowang@redhat.com>, qemu devel list <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 16, 2021 at 08:26:15AM +0200, Stefano Garzarella wrote:
>On Wed, Sep 15, 2021 at 08:59:17PM -0700, Jiang Wang . wrote:
>>On Tue, Sep 14, 2021 at 5:46 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>>
>>>On Mon, Sep 13, 2021 at 10:18:43PM +0000, Jiang Wang wrote:
>>>> Datagram sockets are connectionless and unreliable.
>>>> The sender does not know the capacity of the receiver
>>>> and may send more packets than the receiver can handle.
>>>>
>>>> Add two more dedicate virtqueues for datagram sockets,
>>>> so that it will not unfairly steal resources from
>>>> stream and future connection-oriented sockets.
>>>>
>>>> Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
>>>> ---
>>>> v1 -> v2: use qemu cmd option to control number of queues,
>>>>         removed configuration settings for dgram.
>>>> v2 -> v3: use ioctl to get features and decide number of
>>>>         virt queues, instead of qemu cmd option.
>>>> v3 -> v4: change DGRAM feature bit value to 2. Add an argument
>>>>         in vhost_vsock_common_realize to indicate dgram is supported or not.
>>>> v4 -> v5: don't open dev to get vhostfd. Removed leftover definition of
>>>>         enable_dgram
>>>> v5 -> v6: fix style errors. Imporve error handling of
>>>>         vhost_vsock_dgram_supported. Rename MAX_VQS_WITH_DGRAM and another one.
>>>>
>>>>  hw/virtio/vhost-user-vsock.c                  |  2 +-
>>>>  hw/virtio/vhost-vsock-common.c                | 25 ++++++++++++--
>>>>  hw/virtio/vhost-vsock.c                       | 34 ++++++++++++++++++-
>>>>  include/hw/virtio/vhost-vsock-common.h        |  6 ++--
>>>>  include/hw/virtio/vhost-vsock.h               |  3 ++
>>>>  include/standard-headers/linux/virtio_vsock.h |  1 +
>>>>  6 files changed, 64 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
>>>> index 6095ed7349..e9ec0e1c00 100644
>>>> --- a/hw/virtio/vhost-user-vsock.c
>>>> +++ b/hw/virtio/vhost-user-vsock.c
>>>> @@ -105,7 +105,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
>>>>          return;
>>>>      }
>>>>
>>>> -    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
>>>> +    vhost_vsock_common_realize(vdev, "vhost-user-vsock", false);
>>>
>>>VIRTIO_VSOCK_F_DGRAM support should work equally well for
>>>vhost-user-vsock. I don't think there is a need to disable it here.
>>>
>>Stefano mentioned in previous email ( V3 ) that I can disable dgram
>>for vhost-user-vsock for now. I think we need some extra changes to
>>fully support vhost-vsock-user, like feature discovery?
>
>I think Stefan is suggesting something similar of what we discussed 
>here:
>https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg06689.html
>
>We can allocate all the queues, and choose at runtime which queue to 
>use for events, that is the only queue used by QEMU.
>
>We can check that in vhost_vsock_common_start(), just before starting 
>the device, where we know the features acked by the guest 
>(vdev->guest_features).
>
>And I agree that would be the best approach, since we don't need 
>discovery anymore, and the same code works also for vhost-user-vsock 
>as is.
>

In second thought, I think we really need to know whether the guest has 
acked the feature or not.

Otherwise if QEMU and host kernel support dgram, but guest kernel 
doesn't, QEMU will use fifth queue instead of third for events, but 
guest doesn't support it.

Thanks,
Stefano


