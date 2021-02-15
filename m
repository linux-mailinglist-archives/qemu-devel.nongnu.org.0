Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C274A31BAB6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 15:06:53 +0100 (CET)
Received: from localhost ([::1]:47786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBeWa-0008TR-9H
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 09:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lBeU2-0006sU-Hz
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:04:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lBeTy-0000DH-4R
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:04:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613397845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSYVgQC5K2BEBdHvQ5odX1akuFfq1PXvblf/csbeS1s=;
 b=F8oV1DaIMJIUxrpaohnNRzeZD1DnBhJMvYJwyHTje04P/1yZCEKXMouoZM2AwI9Ab1zqyP
 u8z5ppbrl3gIGi1QVMy6lowN8VXqaONltea6Y1Qf5ZfhPerOr353e+/gNFNy4K8Xx6tdaI
 TSUj76OF5msoWXRGKqkAxuXvKyq13F0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-_pEY-ZKKMhqhh9h9yQHrZw-1; Mon, 15 Feb 2021 09:04:02 -0500
X-MC-Unique: _pEY-ZKKMhqhh9h9yQHrZw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1C061020C21;
 Mon, 15 Feb 2021 14:03:59 +0000 (UTC)
Received: from [10.36.114.89] (ovpn-114-89.ams2.redhat.com [10.36.114.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41ABF104FB;
 Mon, 15 Feb 2021 14:03:43 +0000 (UTC)
Subject: Re: [PATCH v5 00/11] virtio-mem: vfio support
From: David Hildenbrand <david@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20210121110540.33704-1-david@redhat.com>
 <20210127074407-mutt-send-email-mst@kernel.org>
 <0c34a461-bdfe-3512-b9f6-69bdb2b34f19@redhat.com>
Organization: Red Hat GmbH
Message-ID: <f9025da1-a8da-a281-514e-9f56e3bda04e@redhat.com>
Date: Mon, 15 Feb 2021 15:03:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0c34a461-bdfe-3512-b9f6-69bdb2b34f19@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Paolo Bonzini <pbonzini@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.02.21 09:28, David Hildenbrand wrote:
> On 27.01.21 13:45, Michael S. Tsirkin wrote:
>> On Thu, Jan 21, 2021 at 12:05:29PM +0100, David Hildenbrand wrote:
>>> A virtio-mem device manages a memory region in guest physical address
>>> space, represented as a single (currently large) memory region in QEMU,
>>> mapped into system memory address space. Before the guest is allowed to use
>>> memory blocks, it must coordinate with the hypervisor (plug blocks). After
>>> a reboot, all memory is usually unplugged - when the guest comes up, it
>>> detects the virtio-mem device and selects memory blocks to plug (based on
>>> resize requests from the hypervisor).
>>>
>>> Memory hot(un)plug consists of (un)plugging memory blocks via a virtio-mem
>>> device (triggered by the guest). When unplugging blocks, we discard the
>>> memory - similar to memory balloon inflation. In contrast to memory
>>> ballooning, we always know which memory blocks a guest may actually use -
>>> especially during a reboot, after a crash, or after kexec (and during
>>> hibernation as well). Guests agreed to not access unplugged memory again,
>>> especially not via DMA.
>>>
>>> The issue with vfio is, that it cannot deal with random discards - for this
>>> reason, virtio-mem and vfio can currently only run mutually exclusive.
>>> Especially, vfio would currently map the whole memory region (with possible
>>> only little/no plugged blocks), resulting in all pages getting pinned and
>>> therefore resulting in a higher memory consumption than expected (turning
>>> virtio-mem basically useless in these environments).
>>>
>>> To make vfio work nicely with virtio-mem, we have to map only the plugged
>>> blocks, and map/unmap properly when plugging/unplugging blocks (including
>>> discarding of RAM when unplugging). We achieve that by using a new notifier
>>> mechanism that communicates changes.
>>
>> series
>>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>
>> virtio bits
>>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>
>> This needs to go through vfio tree I assume.
> 
> Thanks Michael.
> 
> @Alex, what are your suggestions?

Gentle ping.


-- 
Thanks,

David / dhildenb


