Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B992F660B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:36:25 +0100 (CET)
Received: from localhost ([::1]:49612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05bk-0001LB-Ba
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:36:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l05LK-000377-My
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:19:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l05LI-0008S2-J1
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:19:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610641163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lVN3ipCxEMnAIof+8Lzo50Ao9LErZ/Z05KNGc522DBI=;
 b=c1KNHHXHyAesRvBMeSNN9NwKWEav+8ulxhvVlAmItET2XbWF8dPchqhtqsDPJKf9zm163P
 HzXTjWIrzA/sNFahObwPqOuw4XWwlE/8C96TtC4mg0xKHf0d+I+IgG6Kl6XWhWzPV65fr3
 tncrQHggGXCyt058DLMDjLHojWjtVxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-UPoULZ9-MtaEv1o04Q7zkA-1; Thu, 14 Jan 2021 11:19:22 -0500
X-MC-Unique: UPoULZ9-MtaEv1o04Q7zkA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FADE8030A1;
 Thu, 14 Jan 2021 16:19:20 +0000 (UTC)
Received: from [10.36.115.75] (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E2875D719;
 Thu, 14 Jan 2021 16:19:03 +0000 (UTC)
Subject: Re: [PATCH v4 11/11] vfio: Disable only uncoordinated discards
To: Alex Williamson <alex.williamson@redhat.com>
References: <20210107133423.44964-1-david@redhat.com>
 <20210107133423.44964-12-david@redhat.com>
 <20210113165708.45a8701c@omen.home.shazbot.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <fce51f31-6cba-681c-e61e-2ff0c018c7bf@redhat.com>
Date: Thu, 14 Jan 2021 17:19:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210113165708.45a8701c@omen.home.shazbot.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Marek Kedzierski <mkedzier@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.01.21 00:57, Alex Williamson wrote:
> On Thu,  7 Jan 2021 14:34:23 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>> We support coordinated discarding of RAM using the RamDiscardMgr. Let's
>> unlock support for coordinated discards, keeping uncoordinated discards
>> (e.g., via virtio-balloon) disabled.
>>
>> This unlocks virtio-mem + vfio. Note that vfio used via "nvme://" by the
>> block layer has to be implemented/unlocked separately. For now,
>> virtio-mem only supports x86-64 - spapr IOMMUs are not tested/affected.
> 
> I think SPAPR always uses a vIOMMU, but I won't claim to understand it.

I heard about that, but I also know that they are using virtio-balloon.
Theoretically, virtio-balloon does currently not support vIOMMUs
(iommu=on results in the balloon device essentially being disable).

> Is there anything other than testing that restricts it to x86-64?  ARM

I am not aware, but well, I guess we'll learn as we go/unlock virtio-mem
on these architectures.

Jonathan is trying to enable arm64 support for virtio-mem. I asked him
to test vfio.

I'll have to cleanup my s390x prototype and find a machine to test with
vfio.

> and S390 will use the same type1 IOMMU backend as far as vfio support
> is concerned.  Should we do something more than put it in a commit log
> if we really want to prevent it elsewhere?  Thanks,

I think it should be sufficient to have it in the logs for now. I'll be
involved when unlocking virtio-mem on other archs and will request to
test vfio. In case we find issues, we should try fixing them first
(instead of fencing it / bailing out).

Obviously, this won't stop other RamDiscardMgr users from popping up,
but I guess we'll stumble over that as well.

-- 
Thanks,

David / dhildenb


