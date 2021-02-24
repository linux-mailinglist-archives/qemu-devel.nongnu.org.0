Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6393532431E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:24:59 +0100 (CET)
Received: from localhost ([::1]:50158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lExuE-0001Yt-8P
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lExY4-0005aP-Fw
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:02:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lExXy-0008JZ-H3
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614186117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qf8EsFHjvorI6cWHRuDw/8EY61NQ254qB814sg0D6vg=;
 b=dSmntsbuBeQl7F8xoT+R8Vbg/nr8oFcRsXy7qav+0rdygKp7XuZsnkZzFygy/yPOmt6C9w
 Z5WHjDyPv6iireFJiHbcmHVjSfSTMrV8yqESdhFroOC3sV+YFkdGxP5l5rC3tn1UWtAQtE
 uKqxowj2WWIuD2t9SJwYWzPAbWHAAhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-GBQrXatxPgKps_gQEeX_vQ-1; Wed, 24 Feb 2021 12:01:55 -0500
X-MC-Unique: GBQrXatxPgKps_gQEeX_vQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D980A100A67C;
 Wed, 24 Feb 2021 17:01:53 +0000 (UTC)
Received: from [10.36.114.83] (ovpn-114-83.ams2.redhat.com [10.36.114.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBEA019C71;
 Wed, 24 Feb 2021 17:01:45 +0000 (UTC)
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, Peter Xu <peterx@redhat.com>
References: <20210219224719.GN6669@xz-x1>
 <68564940-6276-465D-9945-A50A900B90BF@redhat.com>
 <20210222172923.GS6669@xz-x1>
 <79ce6a7e-c40b-b64e-757e-1ec6e4177310@redhat.com>
 <20210222175440.GT6669@xz-x1>
 <5471ac12-0dc5-1435-8fba-fad7b37bbcf1@redhat.com>
 <29fff27e-b2df-83a8-2649-581949a216de@virtuozzo.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <39a30875-4424-8437-47a8-1043252159f5@redhat.com>
Date: Wed, 24 Feb 2021 18:01:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <29fff27e-b2df-83a8-2649-581949a216de@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, qemu-devel@nongnu.org,
 David Hildenbrand <dhildenb@redhat.com>, Den Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.02.21 17:56, Andrey Gruzdev wrote:
> On 22.02.2021 21:11, David Hildenbrand wrote:
>> On 22.02.21 18:54, Peter Xu wrote:
>>> On Mon, Feb 22, 2021 at 06:33:27PM +0100, David Hildenbrand wrote:
>>>> On 22.02.21 18:29, Peter Xu wrote:
>>>>> On Sat, Feb 20, 2021 at 02:59:42AM -0500, David Hildenbrand wrote:
>>>>>> Live snapshotting ends up reading all guest memory (dirty bitmap
>>>>>> starts with all 1s), which is not what we want for virtio-mem - we
>>>>>> don’t want to read and migrate memory that has been discarded and
>>>>>> has no stable content.
>>>>>>
>>>>>> For ordinary migration we use the guest page hint API to clear
>>>>>> bits in the dirty bitmap after dirty bitmap sync. Well, if we
>>>>>> don‘t do bitmap syncs we‘ll never clear any dirty bits. That‘s the
>>>>>> problem.
>>>>>
>>>>> Using dirty bitmap for that information is less efficient, becase it's
>>>>> definitely a larger granularity information than PAGE_SIZE. If the
>>>>> disgarded
>>>>> ranges are always continuous and at the end of a memory region, we
>>>>> should have
>>>>> some parameter in the ramblock showing that where we got shrinked
>>>>> then we don't
>>>>> check dirty bitmap at all, rather than always assuming used_length
>>>>> is the one.
>>>>
>>>> They are randomly scattered across the whole RAMBlock.
>>>> Shrinking/growing
>>>> will be done to some degree in the future (but it won't get rid of the
>>>> general sparse layout we can produce).
>>>
>>> OK. Btw I think currently live snapshot should still be reading dirty
>>> bitmap,
>>> so maybe it's still fine.  It's just that it's still not very clear
>>> to hide
>>> virtio-mem information into dirty bitmap, imho, since that's not how we
>>> interpret dirty bitmap - which is only for the sake of tracking page
>>> changes.
>>
>> Well, currently it is "what do we have to migrate".
>>
> Using dirty bitmap can prohibit unexpected (overwritten) content of
> pre-discarded pages, but they'll appear as zeroed on destination.

To be precise, they'll usually appear as discarded (no pages in the 
migration stream).

> What about other virtio-baloon features like HW_POISON when poisoned
> pages should also be retained on population filled with certain pattern?

In case of free page reporting, we skip discarding if poisoning is set 
to != 0 because of that reason:

if (virtio_balloon_inhibited() || dev->poison_val) {
	goto skip_element;
}

-- 
Thanks,

David / dhildenb


