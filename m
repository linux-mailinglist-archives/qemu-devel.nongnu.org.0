Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0288232A6AE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 17:49:33 +0100 (CET)
Received: from localhost ([::1]:34108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8DE-0005VP-2j
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 11:49:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lH8BL-00052S-5q
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:47:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lH8BD-0004Tr-Mn
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614703645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7+Cnj72EFgMeG41Jciu4GkH0owfj2O7qO2bnixyI16Y=;
 b=i6kh51pl2qtvNP7iUuuTDUcaXqL/NBu104KE2Z6EqtWN0fuucWHP0lgQIcqgoIfsf149ZO
 YKEByZwz+ieRrG251qcMhvICno4OY/+yYvCDxfXJ370SOsONEjp7a6xKSGIkpmrlLzER2Q
 /+tILpgbb2/PGF91hlYNQ0C4RQF+NfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-Ony0wVYNPnqKVszHo2mBcw-1; Tue, 02 Mar 2021 11:47:16 -0500
X-MC-Unique: Ony0wVYNPnqKVszHo2mBcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C296818B614E;
 Tue,  2 Mar 2021 16:47:14 +0000 (UTC)
Received: from [10.36.114.189] (ovpn-114-189.ams2.redhat.com [10.36.114.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EA2560C47;
 Tue,  2 Mar 2021 16:46:56 +0000 (UTC)
Subject: Re: [PATCH v7 00/13] virtio-mem: vfio support
To: qemu-devel@nongnu.org
References: <20210224094910.44986-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <4c44dd6b-0490-8b70-490a-e456e8e96039@redhat.com>
Date: Tue, 2 Mar 2021 17:46:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210224094910.44986-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On 24.02.21 10:48, David Hildenbrand wrote:
> A virtio-mem device manages a memory region in guest physical address
> space, represented as a single (currently large) memory region in QEMU,
> mapped into system memory address space. Before the guest is allowed to use
> memory blocks, it must coordinate with the hypervisor (plug blocks). After
> a reboot, all memory is usually unplugged - when the guest comes up, it
> detects the virtio-mem device and selects memory blocks to plug (based on
> resize requests from the hypervisor).
> 
> Memory hot(un)plug consists of (un)plugging memory blocks via a virtio-mem
> device (triggered by the guest). When unplugging blocks, we discard the
> memory - similar to memory balloon inflation. In contrast to memory
> ballooning, we always know which memory blocks a guest may actually use -
> especially during a reboot, after a crash, or after kexec (and during
> hibernation as well). Guests agreed to not access unplugged memory again,
> especially not via DMA.
> 
> The issue with vfio is, that it cannot deal with random discards - for this
> reason, virtio-mem and vfio can currently only run mutually exclusive.
> Especially, vfio would currently map the whole memory region (with possible
> only little/no plugged blocks), resulting in all pages getting pinned and
> therefore resulting in a higher memory consumption than expected (turning
> virtio-mem basically useless in these environments).
> 
> To make vfio work nicely with virtio-mem, we have to map only the plugged
> blocks, and map/unmap properly when plugging/unplugging blocks (including
> discarding of RAM when unplugging). We achieve that by using a new notifier
> mechanism that communicates changes.
> 
> It's important to map memory in the granularity in which we could see
> unmaps again (-> virtio-mem block size) - so when e.g., plugging
> consecutive 100 MB with a block size of 2 MB, we need 50 mappings. When
> unmapping, we can use a single vfio_unmap call for the applicable range.
> We expect that the block size of virtio-mem devices will be fairly large
> in the future (to not run out of mappings and to improve hot(un)plug
> performance), configured by the user, when used with vfio (e.g., 128MB,
> 1G, ...), but it will depend on the setup.
> 
> More info regarding virtio-mem can be found at:
>      https://virtio-mem.gitlab.io/
> 
> v7 is located at:
>    git@github.com:davidhildenbrand/qemu.git virtio-mem-vfio-v7
> 

Gentle ping.


-- 
Thanks,

David / dhildenb


