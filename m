Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDEB2D7E1C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:32:57 +0100 (CET)
Received: from localhost ([::1]:49986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnDr-0000DB-8f
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knmca-0000zk-9y
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:54:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knmcT-0001L1-In
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:54:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607709256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Lan+bdclk4Ee6KrwvHR+E6eVvW3lcgyp43WBLKPFR0=;
 b=BzFLeUYGseczDXYCK0bYSrQEgKiMlyHXJWyPHMsK6wdAtZXtTXJQuuzaD0Wsb3lH/P7hoE
 W8LdZRj1L+o/tU80dxESYaTzlGnaQ58m7v4I1znOiGo5bFB34G8Wb3BOFsB4UI62bYHx5q
 IqivVTv3micJ8iNgkPM7lZRYLzhrn0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-9ueEn0BLP7CVlLDLtJwh2Q-1; Fri, 11 Dec 2020 12:54:11 -0500
X-MC-Unique: 9ueEn0BLP7CVlLDLtJwh2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74C0CCF98C;
 Fri, 11 Dec 2020 17:52:49 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-98.ams2.redhat.com
 [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF8C65F70B;
 Fri, 11 Dec 2020 17:52:46 +0000 (UTC)
Subject: Re: [PATCH v14 10/13] qapi: block-stream: add "bottom" argument
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-11-vsementsov@virtuozzo.com>
 <79993af7-1993-5af1-d343-04f208b03d73@redhat.com>
 <9e131589-84b5-761b-3e26-c4e8eb32ec09@virtuozzo.com>
 <ef0cc817-69c0-017c-bf94-cc19a66d9dc5@redhat.com>
 <45365012-aae5-8c0e-0e46-fe4ae56199fc@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <342646e7-798e-4d91-d613-729996cdddda@redhat.com>
Date: Fri, 11 Dec 2020 18:52:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <45365012-aae5-8c0e-0e46-fe4ae56199fc@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.12.20 18:42, Vladimir Sementsov-Ogievskiy wrote:
> 11.12.2020 20:24, Max Reitz wrote:
>> On 11.12.20 17:50, Vladimir Sementsov-Ogievskiy wrote:
>>> 11.12.2020 19:05, Max Reitz wrote:
>>>> On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
>>>>> The code already don't freeze base node and we try to make it prepared
>>>>> for the situation when base node is changed during the operation. In
>>>>> other words, block-stream doesn't own base node.
>>>>>
>>>>> Let's introduce a new interface which should replace the current one,
>>>>> which will in better relations with the code. Specifying bottom node
>>>>> instead of base, and requiring it to be non-filter gives us the
>>>>> following benefits:
>>>>>
>>>>>   - drop difference between above_base and base_overlay, which will be
>>>>>     renamed to just bottom, when old interface dropped
>>>>>
>>>>>   - clean way to work with parallel streams/commits on the same 
>>>>> backing
>>>>>     chain, which otherwise become a problem when we introduce a filter
>>>>>     for stream job
>>>>>
>>>>>   - cleaner interface. Nobody will surprised the fact that base 
>>>>> node may
>>>>>     disappear during block-stream, when there is no word about 
>>>>> "base" in
>>>>>     the interface.
>>>>>
>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>>> ---
>>>>>   qapi/block-core.json           |  8 +++--
>>>>>   include/block/block_int.h      |  1 +
>>>>>   block/monitor/block-hmp-cmds.c |  3 +-
>>>>>   block/stream.c                 | 50 +++++++++++++++++++---------
>>>>>   blockdev.c                     | 61 
>>>>> ++++++++++++++++++++++++++++------
>>>>>   5 files changed, 94 insertions(+), 29 deletions(-)
>>>>>
>>>>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>>>>> index 04055ef50c..5d6681a35d 100644
>>>>> --- a/qapi/block-core.json
>>>>> +++ b/qapi/block-core.json
>>>>> @@ -2522,6 +2522,10 @@
>>>>>   # @base-node: the node name of the backing file.
>>>>>   #             It cannot be set if @base is also set. (Since 2.8)
>>>>>   #
>>>>> +# @bottom: the last node in the chain that should be streamed into
>>>>> +#          top. It cannot be set any of @base, @base-node or 
>>>>> @backing-file
>>>>
>>>> s/set any/set if any/
>>>>
>>>> But what’s the problem with backing-file?  The fact that specifying 
>>>> backing-file means that stream will look for that filename in the 
>>>> backing chain when the job is done (so if you use @bottom, we 
>>>> generally don’t want to rely on the presence of any nodes below it)?
>>>
>>> I just wanted to deprecate 'backing-file' together with base and 
>>> base-node as a next step. If user wants to set backing file unrelated 
>>> to current backing-chain, is it correct at all? It's a direct 
>>> violation of what's going on, and I doubt that other parts of Qemu 
>>> working with backing-file are prepared for such situation. User can 
>>> do it by hand later.. Anyway, we'll have three releases deprecation 
>>> period for people to come and cry that this is a really needed 
>>> option, so we can support it later on demand.
>>>
>>>>
>>>> (If so, I would have thought that we actually want the user to 
>>>> specify backing-file so we don’t have to look down below @bottom to 
>>>> look for a filename.  Perhaps a @backing-fmt parameter would help.)
>>>
>>> If we decide that 'backing-file' is really needed, than yes we should 
>>> require backing-fmt to be specified together with backing-file when 
>>> using new "bottom" interface.
>> Before I can agree on removing backing-file (or deprecating it), I 
>> need to know what it’s actually used for.  I actually don’t, though.  
>> The only reason I could imagine was because the user wanted to write 
>> some string into there that is different from base.filename.
>>
>> (The original commit 13d8cc515df does mention cases like FD passing, 
>> where qemu has no idea what an appropriate filename would be (it can 
>> only see /dev/fd/*).  From that, it does appear to me that it’ll be 
>> needed even with @bottom.)
>>
> 
> I should have checked it myself.. That's one more reason for my "RFC: 
> don't store backing filename in qcow2 image"..
> 
> OK, do you think we can require backing-fmt to be specified if 
> backing-file and bottom are specified?

Sure.

> Or allow omitting it and 
> deprecate this thing? We actually already have deprecation message in 
> bdrv_change_backing_file(), and how we are trying to workaround it in 
> block-stream will not work with file descriptors anyway (hmm, and old 
> code works, so, actually 09 is a regression?)

I think requiring backing-fmt for bottom + backing-file would be the 
most simple and clean way, hopefully saving us some headaches.

Max


