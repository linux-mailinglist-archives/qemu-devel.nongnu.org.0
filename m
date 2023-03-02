Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDB66A7D0C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:49:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXecf-00082x-FY; Thu, 02 Mar 2023 03:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pXecd-00081B-I6
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:49:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pXecb-0005dI-V2
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677746944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YrjY3HvTwxurk/roPFaqJx5J4r/z7Kt/Nkh5Er5DkZg=;
 b=IReEscgouF3zyRIgw23GLcRo3hBxxnkQgeHi23EGH4tVsZw3M1t1eQrrgMSlJOFDqT9UCA
 sEIky+Kbek+G//tWyR/WGt+hMsKxp0BzAyYnzspDybifzOMWilryX9B3jaM0yE+i5U3FiQ
 2datVf+GpyU5R0NlFGHne1An5jIC+3Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-ux-KgC1WO--igpCMgVFE2A-1; Thu, 02 Mar 2023 03:48:58 -0500
X-MC-Unique: ux-KgC1WO--igpCMgVFE2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6BE0380450E
 for <qemu-devel@nongnu.org>; Thu,  2 Mar 2023 08:48:58 +0000 (UTC)
Received: from [10.39.208.28] (unknown [10.39.208.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 067A840C83B6;
 Thu,  2 Mar 2023 08:48:55 +0000 (UTC)
Message-ID: <3a4853a7-43a6-035a-2231-e333d2294424@redhat.com>
Date: Thu, 2 Mar 2023 09:48:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
 <6684066f-452d-a8b3-58b2-b0db2a3c2015@redhat.com>
 <CAJaqyWdkC26qasL8ofc6_v90nGtkD1xUm9ES=yqOXDFkuyunnw@mail.gmail.com>
From: Maxime Coquelin <maxime.coquelin@redhat.com>
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
In-Reply-To: <CAJaqyWdkC26qasL8ofc6_v90nGtkD1xUm9ES=yqOXDFkuyunnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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



On 2/1/23 12:19, Eugenio Perez Martin wrote:
> On Wed, Feb 1, 2023 at 12:14 PM Maxime Coquelin
> <maxime.coquelin@redhat.com> wrote:
>>
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
> 
> Can you expand on this? I think my proposal does not require modifying
> anything in the device. Or you mean hw/virtio/vhost-user.c and
> similar?

I had deeper look, and both proposals should not be very different in
term of rework on DPDK side.

Maxime

> Thanks!
> 
>> I am currently working on a PoC adding support for VDUSE in the DPDK
>> Vhost library, and recently added control queue support. We can reuse it
>> if we want to prototype your proposal.
>>
> 
> Sure, that would be great.
> 
> Thanks!
> 


