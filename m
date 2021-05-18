Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D8D387503
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:24:45 +0200 (CEST)
Received: from localhost ([::1]:45962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livy0-0002VT-Oa
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1livjF-0003fc-GN
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:09:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1livjD-0006Ot-F5
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621328966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ctt+fpNaJ1hKC/MN4NRGaU3gWj/0wg0pAkF9M+b/2dw=;
 b=SHiDYBaGe1vFSAkRCHP8AODoHFU2Ds1Nnz+2PnUFjLclI1TO7cWHkG8F7PeL0WeeWIjH5z
 HKA88gnPEafdfMVDPOtdcbjIukT1Ax7NW9X6Tr3mnnHgS0MOgoPvihNgdBUXX/oenTSiwp
 i1CaNNQ7OiezJqiEcww2QUsgOE276fw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-T-xWYje7O_yPBY6Jg6sEbg-1; Tue, 18 May 2021 05:09:25 -0400
X-MC-Unique: T-xWYje7O_yPBY6Jg6sEbg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F403102C869;
 Tue, 18 May 2021 09:09:24 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-121.ams2.redhat.com
 [10.36.115.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C10E62ED61;
 Tue, 18 May 2021 09:09:21 +0000 (UTC)
Subject: Re: [PATCH 04/21] qdev: allow setting drive property for realized
 device
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-6-vsementsov@virtuozzo.com>
 <90135147-4b08-3af2-cfde-aaa3dd397c17@redhat.com>
 <c0c45ac4-46a1-bf33-f563-634a7fd5670a@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <58f8166b-88f0-b300-71a1-ff7b20a339e5@redhat.com>
Date: Tue, 18 May 2021 11:09:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c0c45ac4-46a1-bf33-f563-634a7fd5670a@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.05.21 20:09, Vladimir Sementsov-Ogievskiy wrote:
> 17.05.2021 18:48, Max Reitz wrote:
>> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>>> We need an ability to insert filters above top block node, attached to
>>> block device. It can't be achieved with blockdev-reopen command. So, we
>>> want do it with help of qom-set.
>>>
>>> Intended usage:
>>>
>>> 1. blockdev-add, creating the filter, which child is at top node A,
>>>     attached to some guest block device.
>>
>> Is a “not” missing here, i.e. “not attached to any guest block 
>> device”?  I would have thought one would create a filtered tree that 
>> is not in use by any frontend, so that the filter need not take any 
>> permissions.
> 
> node A is attached.
> 
> So, we have [blk] --root->  [A}
> 
> And want to insert a filter between blk and A.
> 
> We do
> 
> 1.
> 
> [filter] --file--\
>                   v
> [blk] --root-->  [A]

Oh, so you mean node A is attached to a guest device.  The sentence 
sounded to me like the newly created filter tree were attached to it.

Yes, that’s how I expected it to be.  I just find the sentence not quite 
clear, because I found it ambiguous which node the “attached to some 
guest block device” refers to.

Perhaps:
“Intended usage:

Assume there is a node A that is attached to some guest device.
1. blockdev-add to create a filter node B that has A as its child.
2. qom-set to change the node attached to the guest device’s 
BlockBackend from A to B.”

?

> 
> 2.
> 
> [blk] --root--> [filer] --file--> [A]
> 
>>
>>> 2. qom-set, to change bs attached to root blk from original node to
>>>     newly create filter.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   hw/core/qdev-properties-system.c | 30 ++++++++++++++++++++++--------
>>>   1 file changed, 22 insertions(+), 8 deletions(-)
>>
>> Looks good, just one question: (well, two, one was above)
>>
>>> diff --git a/hw/core/qdev-properties-system.c 
>>> b/hw/core/qdev-properties-system.c
>>> index 2760c21f11..7d97562654 100644
>>> --- a/hw/core/qdev-properties-system.c
>>> +++ b/hw/core/qdev-properties-system.c
>>
>> [...]
>>
>>> @@ -196,6 +209,7 @@ static void release_drive(Object *obj, const char 
>>> *name, void *opaque)
>>>   const PropertyInfo qdev_prop_drive = {
>>>       .name  = "str",
>>>       .description = "Node name or ID of a block device to use as a 
>>> backend",
>>> +    .realized_set_allowed = true,
>>>       .get   = get_drive,
>>>       .set   = set_drive,
>>>       .release = release_drive,
>>
>> Why not for qdev_prop_drive_iothread?
>>
> 
> Hmm, the only reason is that I missed that part of architecture around 
> here, I'm new to qdev code. Will add with next version

OK.  (I just saw it because it was right below this structure, too, it 
isn’t like I actually know what I’m saying.)

Max


