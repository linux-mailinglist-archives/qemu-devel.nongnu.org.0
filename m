Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F17A3B8C86
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 05:04:36 +0200 (CEST)
Received: from localhost ([::1]:49878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyn0E-0001HC-Qa
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 23:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lymzP-0000bN-Vk
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 23:03:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lymzM-00033W-9s
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 23:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625108618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJUbfYGk5142qC4S3KlxI8ZlvgFIiTTlZfQSJN2IOuk=;
 b=HPGY43hW4h29j8qL45aM2CijjtgWx3lfFxc2QcPwg4ZYvUqYLkPFtX5pDSP4JiFsa5XClZ
 pTPEpbBVJvoGIDtIBYslUdqELzHttHh7vVDjE0eZk7Nhhrwu2SkaWq/U69n4r3x6nqaOqY
 Aqc6yBHDOPLl5MZWEsFA+uyM7kugVSQ=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-tLQigNStOsenA_o2V-KRLw-1; Wed, 30 Jun 2021 23:03:36 -0400
X-MC-Unique: tLQigNStOsenA_o2V-KRLw-1
Received: by mail-pf1-f197.google.com with SMTP id
 k196-20020a6284cd0000b0290301abd2c063so3060466pfd.14
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 20:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LJUbfYGk5142qC4S3KlxI8ZlvgFIiTTlZfQSJN2IOuk=;
 b=TZDZaMeX1GzRSV3lUmwp9dn6iS/Lt69BF1LDa9G4VJcq4BukVscU8mB+VZVJwdNtYi
 zaDmM/R8TKHPx7SjrDTZUN4ROSHApIUaQOAP8L7j3uEZ7ccu8HlBGKYqkI2DTRjUAiab
 B3CAFHnkMXeJYDzQlzrgCIFhe6qWS4tKl2cNCA7ogw5nhUhcCro7BxRYfGnF4aA7A7bW
 c5P47CJp+vLA6W92mE/vsmriyv1PTCxEzkYOdSF/Su4M+bULotobf4w1U9CWsFp9ek+F
 E76JSEYy3QvFXPSOjDaEhUyNgJ9FtcobF2oViskpdLq81xorMktMqNibzgy29nE0u1vM
 8usA==
X-Gm-Message-State: AOAM533KRRD+IsHjgHuEGkfZbJ5hkNqf/8s6z5dv8qIZSKMn/+T8yhaP
 mAegdQl5+OR5iJGrsPvTS3JAf4qwpedpfKvZVzXruBPiRProxMdJyfCKh/H/veuUELzRC0/2mp2
 0VrHLERqXPBbX0Xo=
X-Received: by 2002:a17:902:dccd:b029:128:dc43:cc42 with SMTP id
 t13-20020a170902dccdb0290128dc43cc42mr17365663pll.85.1625108615686; 
 Wed, 30 Jun 2021 20:03:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3/ldJs/J5kD6G8GMth2GDIGqfyOzH5gPQ5BauJ6dIRz+0guTmMEQ3dbJdJK8LZtZfah3S2g==
X-Received: by 2002:a17:902:dccd:b029:128:dc43:cc42 with SMTP id
 t13-20020a170902dccdb0290128dc43cc42mr17365627pll.85.1625108615139; 
 Wed, 30 Jun 2021 20:03:35 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id c10sm7883731pfo.129.2021.06.30.20.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 20:03:34 -0700 (PDT)
Subject: Re: [PATCH 15/18] vhost-net: control virtqueue support
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-16-jasowang@redhat.com>
 <CAJaqyWcAbH_X_nK6FqSd4Rt7CipsHLM7=_fcmsO8EajrjOxzXQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cad91d92-0cbf-6664-66d5-4298be7f4e78@redhat.com>
Date: Thu, 1 Jul 2021 11:03:30 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWcAbH_X_nK6FqSd4Rt7CipsHLM7=_fcmsO8EajrjOxzXQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Eli Cohen <elic@nvidia.com>, Cindy Lu <lulu@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, lingshan.zhu@intel.com,
 Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/1 上午1:33, Eugenio Perez Martin 写道:
> On Mon, Jun 21, 2021 at 6:18 AM Jason Wang <jasowang@redhat.com> wrote:
>> We assume there's no cvq in the past, this is not true when we need
>> control virtqueue support for vhost-user backends. So this patch
>> implements the control virtqueue support for vhost-net. As datapath,
>> the control virtqueue is also required to be coupled with the
>> NetClientState. The vhost_net_start/stop() are tweaked to accept the
>> number of datapath queue pairs plus the the number of control
>> virtqueue for us to start and stop the vhost device.
>>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>   hw/net/vhost_net.c      | 43 ++++++++++++++++++++++++++++++-----------
>>   hw/net/virtio-net.c     |  4 ++--
>>   include/net/vhost_net.h |  6 ++++--
>>   3 files changed, 38 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> index ef1370bd92..fe2fd7e3d5 100644
>> --- a/hw/net/vhost_net.c
>> +++ b/hw/net/vhost_net.c
>> @@ -311,11 +311,14 @@ static void vhost_net_stop_one(struct vhost_net *net,
>>   }
>>
>>   int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>> -                    int total_queues)
>> +                    int data_qps, int cvq)
> I can see the convenience of being an int, but maybe it is more clear
> to use a boolean?


I tend to leave this for future extensions. E.g we may have more than 
one cvqs.


>
>>   {
>>       BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(dev)));
>>       VirtioBusState *vbus = VIRTIO_BUS(qbus);
>>       VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
>> +    int total_notifiers = data_qps * 2 + cvq;
>> +    VirtIONet *n = VIRTIO_NET(dev);
>> +    int nvhosts = data_qps + cvq;
>>       struct vhost_net *net;
>>       int r, e, i;
>>       NetClientState *peer;
>> @@ -325,9 +328,14 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>           return -ENOSYS;
>>       }
>>
>> -    for (i = 0; i < total_queues; i++) {
>> +    for (i = 0; i < nvhosts; i++) {
>> +
>> +        if (i < data_qps) {
>> +            peer = qemu_get_peer(ncs, i);
>> +        } else { /* Control Virtqueue */
>> +            peer = qemu_get_peer(ncs, n->max_qps);
> The field max_qps should be max_queues until the next patch, or maybe
> we can reorder the commits and then rename the field before this
> commit?


You're right, let me re-order the patches.

Thanks


>
> Same comment later on this function and in vhost_net_stop.
>
> Thanks!
>
>> +        }
>>
>> -        peer = qemu_get_peer(ncs, i);
>>           net = get_vhost_net(peer);
>>           vhost_net_set_vq_index(net, i * 2);
>>
>> @@ -340,14 +348,18 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>           }
>>        }
>>
>> -    r = k->set_guest_notifiers(qbus->parent, total_queues * 2, true);
>> +    r = k->set_guest_notifiers(qbus->parent, total_notifiers, true);
>>       if (r < 0) {
>>           error_report("Error binding guest notifier: %d", -r);
>>           goto err;
>>       }
>>
>> -    for (i = 0; i < total_queues; i++) {
>> -        peer = qemu_get_peer(ncs, i);
>> +    for (i = 0; i < nvhosts; i++) {
>> +        if (i < data_qps) {
>> +            peer = qemu_get_peer(ncs, i);
>> +        } else {
>> +            peer = qemu_get_peer(ncs, n->max_qps);
>> +        }
>>           r = vhost_net_start_one(get_vhost_net(peer), dev);
>>
>>           if (r < 0) {
>> @@ -371,7 +383,7 @@ err_start:
>>           peer = qemu_get_peer(ncs , i);
>>           vhost_net_stop_one(get_vhost_net(peer), dev);
>>       }
>> -    e = k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
>> +    e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>>       if (e < 0) {
>>           fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", e);
>>           fflush(stderr);
>> @@ -381,18 +393,27 @@ err:
>>   }
>>
>>   void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>> -                    int total_queues)
>> +                    int data_qps, int cvq)
>>   {
>>       BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(dev)));
>>       VirtioBusState *vbus = VIRTIO_BUS(qbus);
>>       VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
>> +    VirtIONet *n = VIRTIO_NET(dev);
>> +    NetClientState *peer;
>> +    int total_notifiers = data_qps * 2 + cvq;
>> +    int nvhosts = data_qps + cvq;
>>       int i, r;
>>
>> -    for (i = 0; i < total_queues; i++) {
>> -        vhost_net_stop_one(get_vhost_net(ncs[i].peer), dev);
>> +    for (i = 0; i < nvhosts; i++) {
>> +        if (i < data_qps) {
>> +            peer = qemu_get_peer(ncs, i);
>> +        } else {
>> +            peer = qemu_get_peer(ncs, n->max_qps);
>> +        }
>> +        vhost_net_stop_one(get_vhost_net(peer), dev);
>>       }
>>
>> -    r = k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
>> +    r = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>>       if (r < 0) {
>>           fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", r);
>>           fflush(stderr);
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index bd7958b9f0..614660274c 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -285,14 +285,14 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
>>           }
>>
>>           n->vhost_started = 1;
>> -        r = vhost_net_start(vdev, n->nic->ncs, queues);
>> +        r = vhost_net_start(vdev, n->nic->ncs, queues, 0);
>>           if (r < 0) {
>>               error_report("unable to start vhost net: %d: "
>>                            "falling back on userspace virtio", -r);
>>               n->vhost_started = 0;
>>           }
>>       } else {
>> -        vhost_net_stop(vdev, n->nic->ncs, queues);
>> +        vhost_net_stop(vdev, n->nic->ncs, queues, 0);
>>           n->vhost_started = 0;
>>       }
>>   }
>> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
>> index fba40cf695..e656e38af9 100644
>> --- a/include/net/vhost_net.h
>> +++ b/include/net/vhost_net.h
>> @@ -21,8 +21,10 @@ typedef struct VhostNetOptions {
>>   uint64_t vhost_net_get_max_queues(VHostNetState *net);
>>   struct vhost_net *vhost_net_init(VhostNetOptions *options);
>>
>> -int vhost_net_start(VirtIODevice *dev, NetClientState *ncs, int total_queues);
>> -void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs, int total_queues);
>> +int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>> +                    int data_qps, int cvq);
>> +void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>> +                    int data_qps, int cvq);
>>
>>   void vhost_net_cleanup(VHostNetState *net);
>>
>> --
>> 2.25.1
>>


