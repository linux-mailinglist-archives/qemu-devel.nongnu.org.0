Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A673321A84
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:47:57 +0100 (CET)
Received: from localhost ([::1]:55902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECV4-0002HZ-UR
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:47:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lECRn-0008P6-Fy
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:44:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lECRl-0005CA-1y
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:44:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614005063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hP8V7muqa5yYaywx1a0sUTrOyMU6kQARv1hg7Ixd5E0=;
 b=DVdfIJnhD138GFMQib7Zjhd7ULtYbUqyaMppFg+gSpTZLQgJYyqAF3jqlLSy98yAMi3RJV
 21gQUVEZQi51ZuS2Yiv/2nAQBhd2/v5wTjI3GmOFD/wqu+yNP5IMenwxHrc7WMPxSikByZ
 5QGdBgWXc/dmFIfTJsFmGe7PNElHgKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-zPBjaoozODezVPPQ6Tqk9g-1; Mon, 22 Feb 2021 09:44:19 -0500
X-MC-Unique: zPBjaoozODezVPPQ6Tqk9g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F5A76D4F9;
 Mon, 22 Feb 2021 14:44:18 +0000 (UTC)
Received: from [10.36.115.16] (ovpn-115-16.ams2.redhat.com [10.36.115.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA6711002391;
 Mon, 22 Feb 2021 14:43:58 +0000 (UTC)
Subject: Re: [PATCH v6 05/12] vfio: Support for RamDiscardMgr in the !vIOMMU
 case
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-6-david@redhat.com>
 <5920c566-6f4b-8935-bf4c-b941a67152aa@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <0aaa0fe2-9fac-5cbb-59f8-e087b2397a55@redhat.com>
Date: Mon, 22 Feb 2021 15:43:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <5920c566-6f4b-8935-bf4c-b941a67152aa@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.02.21 14:20, Paolo Bonzini wrote:
> On 22/02/21 12:57, David Hildenbrand wrote:
>>
>> +static int vfio_sync_ram_discard_listener_dirty_bitmap(VFIOContainer *container,
>> +                                                   MemoryRegionSection *section)
>> +{
>> +    RamDiscardMgr *rdm = memory_region_get_ram_discard_mgr(section->mr);
>> +    RamDiscardMgrClass *rdmc = RAM_DISCARD_MGR_GET_CLASS(rdm);
>> +    VFIORamDiscardListener tmp_vrdl, *vrdl = NULL;
>> +
>> +    QLIST_FOREACH(vrdl, &container->vrdl_list, next) {
>> +        if (vrdl->mr == section->mr &&
>> +            vrdl->offset_within_region == section->offset_within_region) {
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (!vrdl) {
>> +        hw_error("vfio: Trying to sync missing RAM discard listener");
>> +    }
>> +
>> +    tmp_vrdl = *vrdl;
>> +    ram_discard_listener_init(&tmp_vrdl.listener,
>> +                              vfio_ram_discard_notify_dirty_bitmap, NULL, NULL);
>> +    return rdmc->replay_populated(rdm, section->mr, &tmp_vrdl.listener);
>> +}
>> +
> 
> Can you explain why this is related to the sync_dirty_bitmap call?  This
> needs a comment in vfio_sync_dirty_bitmap.

We can only synchronize the parts that actually got mapped via VFIO. So 
I have to walk all parts that are populated (and thus, were mapped via 
VFIO). This is similar to the IOMMU notifier handling.

> 
> Also, why can't you just pass vrdl to the call?

I have to modify the callbacks. Similarly done for 
memory_region_iommu_replay().

-- 
Thanks,

David / dhildenb


