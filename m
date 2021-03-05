Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4DE32E536
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:48:18 +0100 (CET)
Received: from localhost ([::1]:49692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI74D-00059i-Vl
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:48:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lI72A-0003uV-PN
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lI727-0000BA-Px
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614937567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rVbO874GilxRkyuwQVgcWF7Lf3IVGiHuFhJJjpt/8VE=;
 b=MrAG5I2BCBE6R6a464WMOsdWz8jNyKU5jewKS5SFF9dBNlhWjFSqriiNDdUvsDUTZyQT4d
 sZwzgHurT6jYe/m0tYudzx7xyCYS673ES6nd8AgP3hq251JU2Zj39FdlkoDKo7X0vZcPPS
 oHlKP35EhMWTovPi43oI6svIOaCcqhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-7YVrw_NAN4uARoZ70gTHKg-1; Fri, 05 Mar 2021 04:46:04 -0500
X-MC-Unique: 7YVrw_NAN4uARoZ70gTHKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44EAB1842142;
 Fri,  5 Mar 2021 09:46:03 +0000 (UTC)
Received: from [10.36.112.194] (ovpn-112-194.ams2.redhat.com [10.36.112.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DD426F987;
 Fri,  5 Mar 2021 09:45:46 +0000 (UTC)
Subject: Re: [PATCH v7 00/13] virtio-mem: vfio support
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
References: <20210224094910.44986-1-david@redhat.com>
 <4c44dd6b-0490-8b70-490a-e456e8e96039@redhat.com>
Organization: Red Hat GmbH
Message-ID: <ab276160-84b3-454f-216b-56335e3b43dd@redhat.com>
Date: Fri, 5 Mar 2021 10:45:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <4c44dd6b-0490-8b70-490a-e456e8e96039@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.03.21 17:46, David Hildenbrand wrote:
> On 24.02.21 10:48, David Hildenbrand wrote:
>> A virtio-mem device manages a memory region in guest physical address
>> space, represented as a single (currently large) memory region in QEMU,
>> mapped into system memory address space. Before the guest is allowed to use
>> memory blocks, it must coordinate with the hypervisor (plug blocks). After
>> a reboot, all memory is usually unplugged - when the guest comes up, it
>> detects the virtio-mem device and selects memory blocks to plug (based on
>> resize requests from the hypervisor).
>>
>> Memory hot(un)plug consists of (un)plugging memory blocks via a virtio-mem
>> device (triggered by the guest). When unplugging blocks, we discard the
>> memory - similar to memory balloon inflation. In contrast to memory
>> ballooning, we always know which memory blocks a guest may actually use -
>> especially during a reboot, after a crash, or after kexec (and during
>> hibernation as well). Guests agreed to not access unplugged memory again,
>> especially not via DMA.
>>
>> The issue with vfio is, that it cannot deal with random discards - for this
>> reason, virtio-mem and vfio can currently only run mutually exclusive.
>> Especially, vfio would currently map the whole memory region (with possible
>> only little/no plugged blocks), resulting in all pages getting pinned and
>> therefore resulting in a higher memory consumption than expected (turning
>> virtio-mem basically useless in these environments).
>>
>> To make vfio work nicely with virtio-mem, we have to map only the plugged
>> blocks, and map/unmap properly when plugging/unplugging blocks (including
>> discarding of RAM when unplugging). We achieve that by using a new notifier
>> mechanism that communicates changes.
>>
>> It's important to map memory in the granularity in which we could see
>> unmaps again (-> virtio-mem block size) - so when e.g., plugging
>> consecutive 100 MB with a block size of 2 MB, we need 50 mappings. When
>> unmapping, we can use a single vfio_unmap call for the applicable range.
>> We expect that the block size of virtio-mem devices will be fairly large
>> in the future (to not run out of mappings and to improve hot(un)plug
>> performance), configured by the user, when used with vfio (e.g., 128MB,
>> 1G, ...), but it will depend on the setup.
>>
>> More info regarding virtio-mem can be found at:
>>       https://virtio-mem.gitlab.io/
>>
>> v7 is located at:
>>     git@github.com:davidhildenbrand/qemu.git virtio-mem-vfio-v7
>>
> 
> Gentle ping.

@Paolo, can you have another look? thanks.

-- 
Thanks,

David / dhildenb


