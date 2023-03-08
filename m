Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D4F6B0491
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 11:35:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZr7O-0005tp-S7; Wed, 08 Mar 2023 05:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pZr7L-0005hV-T2
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 05:33:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pZr7J-0006AY-UQ
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 05:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678271632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQ0+tbndmrSeJ2MRCzJFtDElBjLmEsE81eiEtKiIYOA=;
 b=hxw/Bbo+0huDpWcmtVb9qWuyoSG9ZQbUY14TBpZqv2GYx0l5SrchYtgZGdhiB5XuAAzJkU
 YwSqrM2TuUoYI8Xgtx5GtBxUkGRqOZRO0RSxifklW2vW+oQ6461MJWazQy6UpsVTrav0o3
 mLW4BNxtjQQ284a5UpEG4Jpy4mKcQns=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-TeEmy72MOmCqrogFGB3q8w-1; Wed, 08 Mar 2023 05:33:51 -0500
X-MC-Unique: TeEmy72MOmCqrogFGB3q8w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3A57802D2A
 for <qemu-devel@nongnu.org>; Wed,  8 Mar 2023 10:33:48 +0000 (UTC)
Received: from [10.39.208.18] (unknown [10.39.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DD06492B04;
 Wed,  8 Mar 2023 10:33:46 +0000 (UTC)
Message-ID: <6e98c7a2-bab8-e91f-1718-cc8d5d6e8ddf@redhat.com>
Date: Wed, 8 Mar 2023 11:33:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-level
 <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
 <6684066f-452d-a8b3-58b2-b0db2a3c2015@redhat.com>
 <20230201061709-mutt-send-email-mst@kernel.org>
From: Maxime Coquelin <maxime.coquelin@redhat.com>
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
In-Reply-To: <20230201061709-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hello Michael,

On 2/1/23 12:20, Michael S. Tsirkin wrote:
> On Wed, Feb 01, 2023 at 12:14:18PM +0100, Maxime Coquelin wrote:
>> Thanks Eugenio for working on this.
>>
>> On 1/31/23 20:10, Eugenio Perez Martin wrote:
>>> Hi,
>>>
>>> The current approach of offering an emulated CVQ to the guest and map
>>> the commands to vhost-user is not scaling well:
>>> * Some devices already offer it, so the transformation is redundant.
>>> * There is no support for commands with variable length (RSS?)
>>>
>>> We can solve both of them by offering it through vhost-user the same
>>> way as vhost-vdpa do. With this approach qemu needs to track the
>>> commands, for similar reasons as vhost-vdpa: qemu needs to track the
>>> device status for live migration. vhost-user should use the same SVQ
>>> code for this, so we avoid duplications.
>>>
>>> One of the challenges here is to know what virtqueue to shadow /
>>> isolate. The vhost-user device may not have the same queues as the
>>> device frontend:
>>> * The first depends on the actual vhost-user device, and qemu fetches
>>> it with VHOST_USER_GET_QUEUE_NUM at the moment.
>>> * The qemu device frontend's is set by netdev queues= cmdline parameter in qemu
>>>
>>> For the device, the CVQ is the last one it offers, but for the guest
>>> it is the last one offered in config space.
>>>
>>> To create a new vhost-user command to decrease that maximum number of
>>> queues may be an option. But we can do it without adding more
>>> commands, remapping the CVQ index at virtqueue setup. I think it
>>> should be doable using (struct vhost_dev).vq_index and maybe a few
>>> adjustments here and there.
>>>
>>> Thoughts?
>>
>> I am fine with both proposals.
>> I think index remapping will require a bit more rework in the DPDK
>> Vhost-user library, but nothing insurmountable.
>>
>> I am currently working on a PoC adding support for VDUSE in the DPDK
>> Vhost library, and recently added control queue support. We can reuse it
>> if we want to prototype your proposal.
>>
>> Maxime
>>
>>> Thanks!
>>>
> 
> 
> technically backend knows how many vqs are there, last one is cvq...
> not sure we need full blown remapping ...
> 

Before VHOST_USER_PROTOCOL_F_STATUS was supported by qemu (very
recently, v7.2.0), we had no way for the backend to be sure the
frontend won't configure new queue pairs, this not not defined in the
spec AFAICT [0]. In DPDK Vhost library, we notify the application it can
start to use the device once the first queue pair is setup and enabled,
then we notify the application when new queues are ready to be
processed. In this case, I think we cannot deduce whether the queue is a
data or a control queue when it is setup.

When VHOST_USER_PROTOCOL_F_STATUS is supported, we know no more queues
will be configured once the DRIVER_OK status is set. In this case, we
can deduce the last queue setup will be the control queue at DRIVER_OK
time if the number of queues is odd.

Using index remapping, we would know directly at queue setup time
whether this is a data or control queue based on its index value,
i.e. if the index equals to max queue index supported by the backend.
But thinking at it again, we may at least back this with a protocol
feature to avoid issues with legacy backends.

I hope it clarifies, let me know if anything unclear.

Thanks,
Maxime

[0]: 
https://elixir.bootlin.com/qemu/latest/source/docs/interop/vhost-user.rst


