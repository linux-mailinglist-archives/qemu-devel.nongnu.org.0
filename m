Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E46832B6B7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:38:57 +0100 (CET)
Received: from localhost ([::1]:46010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHOu8-0004ZL-72
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHOt6-000487-V0
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:37:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHOt4-0008BF-Qh
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:37:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614767869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WFxysC1GPNkeSufoyNXz35wgGu2xS+sVZ1+vtbr7msg=;
 b=TsOVbNIpPUwCmNmlhWFWNwddbxLoTye5O8Jb9xwRaR2WsOtK/PSwXK3q+2N/D0JoJbQM5k
 JWkKrTLoQmV79b8MjrTxVjog+/jPsNI33zFv5GS7Ov4sNh8RTdtAIsrhvNqLTww53QHTa5
 Q+GAVhxQbn9+ucZbiBjb+RRniQvHWTU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-OM5yhWPlPziOh8u_2ja9eg-1; Wed, 03 Mar 2021 05:37:47 -0500
X-MC-Unique: OM5yhWPlPziOh8u_2ja9eg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C840804043;
 Wed,  3 Mar 2021 10:37:46 +0000 (UTC)
Received: from [10.36.112.28] (ovpn-112-28.ams2.redhat.com [10.36.112.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 440E019CBE;
 Wed,  3 Mar 2021 10:37:41 +0000 (UTC)
Subject: Re: [PATCH v1] vhost-vdpa: Set discarding of RAM broken when
 initializing the backend
From: David Hildenbrand <david@redhat.com>
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Xie Yongji <xieyongji@bytedance.com>
References: <20210302162129.52912-1-david@redhat.com>
 <81c675cd-1573-7555-7d20-07b0ed950ebb@redhat.com>
 <886ed3b7-e48c-7200-e5e6-ce8b0adc589c@redhat.com>
Organization: Red Hat GmbH
Message-ID: <d6e8c353-72af-25ae-a18d-7a1ab7be5775@redhat.com>
Date: Wed, 3 Mar 2021 11:37:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <886ed3b7-e48c-7200-e5e6-ce8b0adc589c@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Cindy Lu <lulu@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.03.21 11:26, David Hildenbrand wrote:
> On 03.03.21 03:53, Jason Wang wrote:
>>
>> On 2021/3/3 12:21 上午, David Hildenbrand wrote:
>>> Similar to VFIO, vDPA will go ahead an map+pin all guest memory. Memory
>>> that used to be discarded will get re-populated and if we
>>> discard+re-access memory after mapping+pinning, the pages mapped into the
>>> vDPA IOMMU will go out of sync with the actual pages mapped into the user
>>> space page tables.
>>>
>>> Set discarding of RAM broken such that:
>>> - virtio-mem and vhost-vdpa run mutually exclusive
>>> - virtio-balloon is inhibited and no memory discards will get issued
>>>
>>> In the future, we might be able to support coordinated discarding of RAM
>>> as used by virtio-mem and as planned for VFIO.
>>>
>>> Cc: Jason Wang <jasowang@redhat.com>
>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>> Cc: Cindy Lu <lulu@redhat.com>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>
>>
>> Acked-by: Jason Wang <jasowang@redhat.com>
>>
>>
>>> ---
>>>
>>> Note: I was not actually able to reproduce/test as I fail to get the
>>> vdpa_sim/vdpa_sim_net running on upstream Linux (whetever vdpa, vhost_vdpa,
>>> vdpa_sim, vdpa_sim_net modules I probe, and in which order, no vdpa devices
>>> appear under /sys/bus/vdpa/devices/ or /dev/).
>>
>>
>> The device creation was switched to use vdpa tool that is integrated
>> with iproue2[1].
>>
>> [1]
>> https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=143610383da51e1f868c6d5a2a5e2fb552293d18
> 
> It would be great to document that somewhere if not already done. I only
> found older RH documentations that were not aware of that. I'll give it
> a try - thanks!

Seems to work just fine:


$ sudo ./build/qemu-system-x86_64 -m 2G,maxmem=4G --enable-kvm -object memory-backend-ram,id=mem0,size=2G  -device virtio-mem-pci,id=vmem0,memdev=mem0,node=0,requested-size=0G  -netdev type=vhost-vdpa,vhostdev=/dev/vhost-vdpa-0,id=vhost-vdpa1 -device virtio-net-pci,netdev=vhost-vdpa1,mac=00:e8:ca:33:ba:05,disable-modern=off,page-per-vq=on -nographic
qemu-system-x86_64: -device virtio-mem-pci,id=vmem0,memdev=mem0,node=0,requested-size=0G: Discarding RAM is disabled

I think the -netdev is always processed/initialized before the
"-device virtio-mem-pci", which is why we always fail from virtio-mem code
right now and not from vhost-vdpa code.

-- 
Thanks,

David / dhildenb


