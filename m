Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AE42EAB45
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 13:54:54 +0100 (CET)
Received: from localhost ([::1]:56396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwlrR-0003Te-Or
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 07:54:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kwlol-0001S4-BV
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 07:52:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kwloj-00053o-L2
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 07:52:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609851125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nizhV6y2Te2uQs2B0KqdeSBngp1K7NSERI32b3e3Cbs=;
 b=DR+MccppXZOvgTEoQrd87RP+z0qH8mne/2MW/hQepSjzZ+HBruRbeU79ziYg9y+Sug61+f
 BDVFXBqkJvGHBBVS7HTOLtMSWX3G+TGWaC4jXSuoomUQt1fo9NE8fzribgatWwrwgClpb5
 W9Ox6mV8mZiKZs1vMIhj3qTykcpKlm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-vtPl9N03ORyzjrUOeAHnqw-1; Tue, 05 Jan 2021 07:52:01 -0500
X-MC-Unique: vtPl9N03ORyzjrUOeAHnqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCF35801817;
 Tue,  5 Jan 2021 12:51:59 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-1.ams2.redhat.com
 [10.36.113.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69FF25C1C2;
 Tue,  5 Jan 2021 12:51:54 +0000 (UTC)
Subject: Re: [PATCH v15 10/13] qapi: block-stream: add "bottom" argument
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
 <20201216061703.70908-11-vsementsov@virtuozzo.com>
 <d7d127a1-e70b-4e1f-acc8-eaf9230dd70a@redhat.com>
 <4039f38e-e519-fe51-45c8-ce761587961b@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <aaf988d7-8ec9-8ac5-b885-378d70aed42a@redhat.com>
Date: Tue, 5 Jan 2021 13:51:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <4039f38e-e519-fe51-45c8-ce761587961b@virtuozzo.com>
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
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 stefanha@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.12.20 19:00, Vladimir Sementsov-Ogievskiy wrote:
> 22.12.2020 19:07, Max Reitz wrote:
>> On 16.12.20 07:17, Vladimir Sementsov-Ogievskiy wrote:
>>> The code already don't freeze base node and we try to make it prepared
>>> for the situation when base node is changed during the operation. In
>>> other words, block-stream doesn't own base node.
>>>
>>> Let's introduce a new interface which should replace the current one,
>>> which will in better relations with the code. Specifying bottom node
>>> instead of base, and requiring it to be non-filter gives us the
>>> following benefits:
>>>
>>>   - drop difference between above_base and base_overlay, which will be
>>>     renamed to just bottom, when old interface dropped
>>>
>>>   - clean way to work with parallel streams/commits on the same backing
>>>     chain, which otherwise become a problem when we introduce a filter
>>>     for stream job
>>>
>>>   - cleaner interface. Nobody will surprised the fact that base node may
>>>     disappear during block-stream, when there is no word about "base" in
>>>     the interface.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   qapi/block-core.json           | 12 ++++---
>>>   include/block/block_int.h      |  1 +
>>>   block/monitor/block-hmp-cmds.c |  3 +-
>>>   block/stream.c                 | 50 +++++++++++++++++++---------
>>>   blockdev.c                     | 59 ++++++++++++++++++++++++++++------
>>>   5 files changed, 94 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>>> index b8094a5ec7..cb0066fd5c 100644
>>> --- a/qapi/block-core.json
>>> +++ b/qapi/block-core.json
>>> @@ -2517,10 +2517,14 @@
>>>   # @device: the device or node name of the top image
>>>   #
>>>   # @base: the common backing file name.
>>> -#        It cannot be set if @base-node is also set.
>>> +#        It cannot be set if @base-node or @bottom is also set.
>>>   #
>>>   # @base-node: the node name of the backing file.
>>> -#             It cannot be set if @base is also set. (Since 2.8)
>>> +#             It cannot be set if @base or @bottom is also set. 
>>> (Since 2.8)
>>> +#
>>> +# @bottom: the last node in the chain that should be streamed into
>>> +#          top. It cannot be set if @base or @base-node is also set.
>>> +#          It cannot be filter node. (Since 6.0)
>>
>> As far as I can make out, one of the results of our discussion on v14 
>> was that when using backing-file + bottom, we want to require the user 
>> to specify backing-fmt as well.  Now, backing-fmt isn’t present yet. 
>> Doesn’t that mean we have to make bottom + backing-file an error until 
>> we have backing-fmt (like it was in v14)?
> 
> See my answer on 09. I just have some doubts around backing-fmt and 
> decided to keep it as is.
> 
> I don't think that we really need backing-fmt. We shouldn't have 
> use-cases when backing-fmt is set to something another than final base 
> node. Therefore, using format_name of final base node is a correct thing 
> to do. So, I don't see the reason now for introducing new option.

Yup, yup, all good.

Reviewed-by: Max Reitz <mreitz@redhat.com>


